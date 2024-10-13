#include "../include/X86IndirectJmpPass.h"
/*
创建变量 按照自己定义的规则定义变量 后续使用变量
相应的完成相关操作即可
这里还是需要注意函数跳转时的栈的维护
*/
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/InlineAsm.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/GlobalVariable.h"
#include "llvm/IR/Module.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"
#include "llvm/Transforms/Utils/ModuleUtils.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Transforms/Utils/Cloning.h"
#include <random>
#include <set>
#include <sstream>
#include <iomanip>
#include "../utils/config.h"
using namespace llvm;
#define MaxBlockNumber 4096
namespace
{
    int maxBlockNumber = 0;
    int BBNumberingCount = 0;
    int block_count = 0;
    std::map<BasicBlock *, unsigned> BBNumbering; // 基本块编号映射
    std::vector<BasicBlock *> BBTargets;
    std::set<BasicBlock *> JumpedBBTargets;
    std::random_device RandomDevice;
    std::mt19937 RandomEngine(RandomDevice()); // 随机数引擎
    std::set<BasicBlock *> processedBlocks;
    std::set<BasicBlock *> unreachableBlocks;
    GlobalVariable *AllFunctions_IndirectBrTargets = nullptr;
    std::vector<Constant *> ExistingFunctionArrays;
    int processedCount = 0;
    ArrayType *OuterArrayTy = nullptr;
    ArrayType *ATy = nullptr;
    BasicBlock *TMPBlock = nullptr;
    int functionCount = 0;
    // 维护一个全局变量引用，用于存储函数的基本块地址数组
    static std::map<Function *, unsigned> FunctionIndexMap;
    // 为函数的基本块编号
    void NumberBasicBlock(Function &F)
    {
        for (auto &BB : F)
        {
            if (auto *BI = dyn_cast<BranchInst>(BB.getTerminator()))
            {
                if (BI)
                {
                    unsigned N = BI->getNumSuccessors();
                    for (unsigned I = 0; I < N; I++)
                    {
                        BasicBlock *Succ = BI->getSuccessor(I);
                        if (BBNumbering.count(Succ) == 0)
                        {
                            BBTargets.push_back(Succ);
                            BBNumbering[Succ] = BBNumberingCount++;
                        }
                    }
                }
            }
        }
    }
    bool containsPHI(BasicBlock *BB)
    {
        for (Instruction &I : *BB)
        {
            if (isa<PHINode>(&I))
            {
                return true;
            }
        }
        return false;
    }

    long long int ComputeRegisterValue(unsigned FunctionID, unsigned ID1, unsigned TrueID, unsigned FalseID)
    {
        // 确保输入的 ID 都是 16 位的值
        assert(FunctionID < (1 << 16) && "FunctionID exceeds 16 bits");
        assert(ID1 < (1 << 16) && "ID1 exceeds 16 bits");
        assert(TrueID < (1 << 16) && "TrueID exceeds 16 bits");
        assert(FalseID < (1 << 16) && "FalseID exceeds 16 bits");

        // 将各个部分移位并组合成最终的 64 位值
        long long int X9Value = 0;
        X9Value |= ((long long int)FunctionID << 48); // 前16位
        X9Value |= ((long long int)ID1 << 32);        // 这里好像没啥用 保留之后可作为加密密钥啥的
        X9Value |= ((long long int)TrueID << 16);     // 再接下来的16位
        X9Value |= (long long int)FalseID;            // 最后16位

        return X9Value;
    }
    // 将基本块的前驱块处理并插入对func1和处理函数的调用
    GlobalVariable *getIndirectTargetsMap(Module &M, Function *F, GlobalVariable *&GV)
    {
        // 构造全局变量的名称
        std::string GVName = "AllFunctions_IndirectBrTargets";
        // 初始化全局变量，如果尚未创建
        if (!GV)
        {
            GV = M.getNamedGlobal(GVName);
        }
        // 将函数指针与其索引关联
        unsigned NewIndex;
        //
        if (ExistingFunctionArrays.size() == 0)
        {
            for (int k = 0; k < functionCount; k++)
            {
                ExistingFunctionArrays.push_back(ConstantArray::get(
                    ArrayType::get(Type::getInt8PtrTy(F->getContext()), maxBlockNumber),
                    Constant::getNullValue(Type::getInt8PtrTy(F->getContext()))));
            }
        }
        BBNumbering.clear();
        // 收集当前函数的基本块地址
        std::vector<Constant *> Elements;
        for (auto &BB : *F)
        {
            // 跳过入口块
            if (&BB == &F->getEntryBlock())
            {
                continue;
            }
            // 获取基本块的地址并存储
            Constant *CE = ConstantExpr::getBitCast(BlockAddress::get(F, &BB), Type::getInt8PtrTy(F->getContext()));
            Elements.push_back(CE);
            BBNumbering[&BB] = BBNumberingCount++;
        }

        // 如果基本块数量不足 4096，填充空值
        while (Elements.size() < maxBlockNumber)
        {
            Elements.push_back(Constant::getNullValue(Type::getInt8PtrTy(F->getContext())));
        }

        // 创建固定大小的数组类型并替换现有数组中的该函数部分
        ATy = ArrayType::get(Type::getInt8PtrTy(F->getContext()), maxBlockNumber);
        Constant *CA = ConstantArray::get(ATy, ArrayRef<Constant *>(Elements));
        ExistingFunctionArrays[FunctionIndexMap[F]] = CA; // 更新相应函数的基本块信息
        // 创建固定大小的二维数组类型，大小为 functionCount x 4096
        OuterArrayTy = ArrayType::get(ArrayType::get(Type::getInt8PtrTy(F->getContext()), maxBlockNumber), functionCount);
        // 如果当前已有的函数数量不足 functionCount，填充空值
        while (ExistingFunctionArrays.size() < functionCount)
        {
            ExistingFunctionArrays.push_back(ConstantArray::get(
                ArrayType::get(Type::getInt8PtrTy(F->getContext()), MaxBlockNumber),
                Constant::getNullValue(Type::getInt8PtrTy(F->getContext()))));
        }
        Constant *OuterArray = ConstantArray::get(OuterArrayTy, ArrayRef<Constant *>(ExistingFunctionArrays));
        // 更新或创建全局变量，仅在需要时更新
        if (!GV)
        {
            GV = new GlobalVariable(M, OuterArrayTy, false, GlobalValue::LinkageTypes::PrivateLinkage, OuterArray, GVName);
        }
        else
        {
            // llvm::outs() << "ExistingFunctionArrays :" << ExistingFunctionArrays.size();
            // 如果全局变量存在，先删除它
            GV->eraseFromParent();
            // 重新创建全局变量
            GV = new GlobalVariable(M, OuterArrayTy, false, GlobalValue::LinkageTypes::PrivateLinkage, OuterArray, GVName);
        }
        appendToCompilerUsed(M, {GV});
        return GV;
    }
    bool hasUniquePredecessor(llvm::BasicBlock *BB)
    {
        // 获取前驱块的数量
        int numPredecessors = std::distance(pred_begin(BB), pred_end(BB));

        // 判断是否只有一个前驱块
        return numPredecessors == 1;
    }
    int ProcessPredecessorsAndInsertFuncCall(Function &F, BasicBlock &BB, unsigned FunctionID, Function *Func1, Function *ConditionalJumpFunc_byX10)
    {
        LLVMContext &Ctx = F.getContext();
        if (processedBlocks.count(&BB))
        {
            return 0; // 已经处理过的基本块，跳过
        }
        // 获取当前基本块的终结指令
        BranchInst *terminator = dyn_cast<BranchInst>(BB.getTerminator());
        if (llvm::BranchInst *BI = llvm::dyn_cast<llvm::BranchInst>(terminator))
        {
            // 是分支指令，进一步检查是否为有条件的分支
            if (BI->isConditional())
            {
                if (hasUniquePredecessor(BI->getSuccessor(0)) && hasUniquePredecessor(BI->getSuccessor(1)))
                {
                    Value *Cond = BI->getCondition();
                    IRBuilder<> Builder(F.getContext());
                    Builder.SetInsertPoint(BI); // 设置插入点为 BI
                    long long int x9 = ComputeRegisterValue(FunctionID, BBNumbering[&BB], BBNumbering[BI->getSuccessor(0)], BBNumbering[BI->getSuccessor(1)]);
                    Value *X9Value = ConstantInt::get(Type::getInt64Ty(Ctx), x9);
                    std::stringstream ss;
                    ss << std::hex << x9; // 将值转换为十六进制格式
                    std::string hexValue = ss.str();
                    InlineAsm *Asm = InlineAsm::get(
                        FunctionType::get(Type::getVoidTy(Ctx), {Type::getInt64Ty(Ctx), Type::getInt64Ty(Ctx)}, false),
                        "push %rax\n"
                        "push %rbx\n"
                        "push %rcx\n"
                        "push %rdx\n"
                        "mov $$0x" +
                            hexValue + ", %rax\n" // 将第一个参数（X9Value）移到 rax
                                       "xor %rbx, %rbx\n"
                                       "mov $1, %bl\n"                       // 将第二个参数（Cond）移到 rbx
                                       "call IndirectConditionalJumpFunc\n", // 调用 IndirectConditionalJumpFunc
                        "r, r",                                              // 指定参数的约束
                        true);
                    std::vector<Value *> Args = {X9Value, Cond};
                    Builder.CreateCall(Asm, Args);
                    llvm::InlineAsm *Asm2 = llvm::InlineAsm::get(
                        llvm::FunctionType::get(llvm::Type::getVoidTy(Ctx), {}, false), // 返回类型为 void，没有参数
                        "pop %rax\n"
                        "pop %rdx\n"
                        "pop %rcx\n"
                        "pop %rbx\n"
                        "pop %rax\n", // 内联汇编指令
                        "",           // 不需要输入参数
                        true          // 为 true 表示不对外部调用
                    );
                    Builder.SetInsertPoint(BI->getSuccessor(0), BI->getSuccessor(0)->getFirstInsertionPt());
                    Builder.CreateCall(Asm2);
                    Builder.SetInsertPoint(BI->getSuccessor(1), BI->getSuccessor(1)->getFirstInsertionPt());
                    Builder.CreateCall(Asm2);
                }
            }
            else
            {
                IRBuilder<> Builder(F.getContext());
                if (hasUniquePredecessor(BI->getSuccessor(0)))
                {
                    Builder.SetInsertPoint(BI); // 设置插入点为 BI
                    // 计算 X9 的值
                    long long int x9 = ComputeRegisterValue(FunctionID, BBNumbering[&BB], BBNumbering[BI->getSuccessor(0)], 0);
                    // 将 X9 的值作为常量传递给内联汇编
                    Value *X9Value = ConstantInt::get(Type::getInt64Ty(Ctx), x9);
                    std::stringstream ss;
                    ss << std::hex << x9; // 将值转换为十六进制格式
                    std::string hexValue = ss.str();
                    // 创建内联汇编，添加参数约束
                    InlineAsm *Asm = InlineAsm::get(
                        FunctionType::get(Type::getVoidTy(Ctx), {Type::getInt64Ty(Ctx)}, false),
                        "push %rax\n" // 保存 rax 的当前值
                        "push %rbx\n"
                        "push %rcx\n"
                        "push %rdx\n"
                        "mov $$0x" +
                            hexValue + ", %rax\n"                 // 将第一个参数（X9Value）移到 rax
                                       "call IndirectCallFunc\n", // 调用 IndirectCallFunc
                        "r",                                      // 参数约束
                        true);

                    // 创建参数向量，按顺序添加参数
                    std::vector<Value *> Args = {X9Value};

                    // 创建内联汇编调用
                    Builder.CreateCall(Asm, Args);
                    llvm::InlineAsm *Asm2 = llvm::InlineAsm::get(
                        llvm::FunctionType::get(llvm::Type::getVoidTy(Ctx), {}, false), // 返回类型为 void，没有参数
                        "pop %rax\n"
                        "pop %rdx\n"
                        "pop %rcx\n"
                        "pop %rbx\n"
                        "pop %rax\n", // 内联汇编指令
                        "",           // 不需要输入参数
                        true          // 为 true 表示不对外部调用
                    );
                    Builder.SetInsertPoint(BI->getSuccessor(0), BI->getSuccessor(0)->getFirstInsertionPt());
                    Builder.CreateCall(Asm2);
                }
            }
        }

        return 1; // 表示成功处理
    }
    Value *getBasicBlockAddress(Value *FunctionID, Value *BlockID, IRBuilder<> &Builder, Module &M)
    {
        LLVMContext &Ctx = M.getContext();

        // 获取全局变量 AllFunctions_IndirectBrTargets，它是一个指向多个数组的指针，每个数组存储 ptr 类型（指向基本块的指针）
        GlobalVariable *GlobalBlockArray = M.getNamedGlobal("AllFunctions_IndirectBrTargets");

        if (!GlobalBlockArray)
        {
            errs() << "Global block array not initialized!\n";
            return nullptr;
        }

        // 获取函数数组的指针，索引第一个维度（我们假设此处 FunctionID 是 0）
        Value *FuncArrayPtr = Builder.CreateGEP(OuterArrayTy, GlobalBlockArray,
                                                {ConstantInt::get(Type::getInt32Ty(Ctx), 0), FunctionID});

        // 获取基本块地址的指针，索引第二个维度
        Value *BlockAddrPtr = Builder.CreateGEP(ATy, FuncArrayPtr,
                                                {ConstantInt::get(Type::getInt32Ty(Ctx), 0), BlockID});

        // 从 BlockAddrPtr 中加载基本块的地址
        Value *LoadedBlockAddr = Builder.CreateLoad(Type::getInt8PtrTy(Ctx), BlockAddrPtr);

        // 将加载的地址转换为指向基本块的指针类型
        Value *BlockAddr = Builder.CreateBitCast(LoadedBlockAddr, Type::getInt8PtrTy(Ctx));

        return BlockAddr;
    }

    void createIndirectCallFunc(Module &M)
    {
        LLVMContext &Ctx = M.getContext();
        // 检查函数 "func1" 是否已经存在
        if (M.getFunction("IndirectCallFunc"))
        {
            return;
        }
        // 创建 "IndirectCallFunc" 函数
        FunctionType *IndirectCallFuncTy = FunctionType::get(Type::getVoidTy(Ctx), {}, false);
        Function *IndirectCallFunc = Function::Create(IndirectCallFuncTy, Function::ExternalLinkage, "IndirectCallFunc", &M);
        BasicBlock *EntryBB = BasicBlock::Create(Ctx, "entry", IndirectCallFunc);
        IRBuilder<> Builder(EntryBB);
        IndirectCallFunc->addFnAttr(Attribute::Naked); // 裸函数属性，不生成栈帧
        // 从 rax 中获取值
        FunctionType *AsmFuncTy = FunctionType::get(Type::getInt64Ty(Ctx), {}, false);
        InlineAsm *LoadRax = InlineAsm::get(AsmFuncTy, "mov %rax, $0", "=r", true);
        Value *RaxValue = Builder.CreateCall(LoadRax);

        // 提取 FunctionID 和 ID1
        Value *FunctionID = Builder.CreateTrunc(Builder.CreateLShr(RaxValue, 48), Type::getInt16Ty(Ctx));
        Value *ID1 = Builder.CreateTrunc(Builder.CreateLShr(RaxValue, 16), Type::getInt16Ty(Ctx));

        // 调用 getBasicBlockAddress 来获取 BasicBlock 地址
        Value *BBAddr = getBasicBlockAddress(FunctionID, ID1, Builder, M);

        // 使用内联汇编跳转到 BasicBlock 地址
        InlineAsm *BranchAsm = InlineAsm::get(
            FunctionType::get(Type::getVoidTy(Ctx), {Type::getInt8PtrTy(Ctx)}, false),
            "push $0", // 使用 * 符号指示间接跳转
            "r",       // 参数约束
            true);

        // 通过 CreateCall 调用内联汇编
        Builder.CreateCall(BranchAsm, {BBAddr});

        // 5. 结束函数
        Builder.CreateRetVoid();
    }
    void createIndirectConditionalJumpFunc(Module &M)
    {
        LLVMContext &Ctx = M.getContext();
        if (M.getFunction("IndirectConditionalJumpFunc"))
        {
            return;
        }
        std::string funcName = "IndirectConditionalJumpFunc";
        FunctionType *IndirectConditionalJumpFuncTy = FunctionType::get(Type::getVoidTy(Ctx), {}, false);
        Function *IndirectConditionalJumpFunc = Function::Create(IndirectConditionalJumpFuncTy, Function::ExternalLinkage, funcName, &M);
        BasicBlock *EntryBB = BasicBlock::Create(Ctx, "entry", IndirectConditionalJumpFunc);
        IRBuilder<> Builder(EntryBB);

        InlineAsm *LoadRax = InlineAsm::get(FunctionType::get(Type::getInt64Ty(Ctx), {}, false),
                                            "mov %rax, $0", "=r", true);
        Value *RaxValue = Builder.CreateCall(LoadRax);

        // 2. 提取 FunctionID 和 BasicBlock IDs
        Value *FunctionID = Builder.CreateTrunc(Builder.CreateLShr(RaxValue, 48), Type::getInt16Ty(Ctx));
        Value *TrueBlockID = Builder.CreateTrunc(Builder.CreateLShr(RaxValue, 16), Type::getInt16Ty(Ctx));
        Value *FalseBlockID = Builder.CreateTrunc(RaxValue, Type::getInt16Ty(Ctx));

        InlineAsm *LoadRbx = InlineAsm::get(FunctionType::get(Type::getInt64Ty(Ctx), {}, false),
                                            "mov %rbx, $0", "=r", true);
        Value *RbxValue = Builder.CreateCall(LoadRbx);

        // 4. 获取 TrueBlock 和 FalseBlock 的地址
        Value *TrueBBAddr = getBasicBlockAddress(FunctionID, TrueBlockID, Builder, M);
        Value *FalseBBAddr = getBasicBlockAddress(FunctionID, FalseBlockID, Builder, M);

        // 5. 使用条件选择语句，根据寄存器的值选择跳转目标
        Value *Cond = Builder.CreateICmpEQ(RbxValue, ConstantInt::get(Type::getInt64Ty(Ctx), 1));
        Value *TargetAddr = Builder.CreateSelect(Cond, TrueBBAddr, FalseBBAddr);

        // 6. 使用内联汇编跳转到选择的基本块地址
        InlineAsm *BranchAsm = InlineAsm::get(
            FunctionType::get(Type::getVoidTy(Ctx), {Type::getInt8PtrTy(Ctx)}, false),
            "push $0", // 使用 * 符号指示间接跳转
            "r",       // 参数约束
            true);

        // 通过 CreateCall 调用内联汇编
        Builder.CreateCall(BranchAsm, {TargetAddr});

        // 7. 结束函数
        Builder.CreateRetVoid();
    }
    int getBasicBlockCountIfNotSkipped(const Function &F)
    {
        // 跳过自创建函数函数
        std::string functionName = F.getName().str();

        if (functionName == "func1" || functionName == "ConditionalJumpFunc_byRAX" || functionName == "ConditionalJumpFunc_byRAX")
        {
            return -1; // -1 表示跳过该函数
        }

        if (F.empty() || F.hasLinkOnceLinkage() || F.getSection() == ".text.startup")
        {
            return -1; // -1 表示跳过该函数
        }

        if (x86IndirectJmpPass.model == 2)
        {
            if (std::find(x86IndirectJmpPass.enable_function.begin(), x86IndirectJmpPass.enable_function.end(), functionName) == x86IndirectJmpPass.enable_function.end())
            {
                return -1; // -1 表示跳过该函数
            }
        }
        else if (x86IndirectJmpPass.model == 3)
        {
            if (std::find(x86IndirectJmpPass.disable_function.begin(), x86IndirectJmpPass.disable_function.end(), functionName) != x86IndirectJmpPass.disable_function.end())
            {
                return -1; // -1 表示跳过该函数
            }
        }

        // 返回该函数的基本块数量
        return F.size(); // F.size() 返回基本块的数量
    }

}

PreservedAnalyses X86IndirectJmpPass::run(Module &M, ModuleAnalysisManager &AM)
{
    LLVMContext &Ctx = M.getContext();
    readConfig("/home/zzzccc/cxzz/Kotoamatsukami/config/config.json");
    if (x86IndirectJmpPass.model)
    {
        // 统计有效的函数数量
        for (llvm::Function &F : M)
        {
            if (getBasicBlockCountIfNotSkipped(F) != -1)
            {
                if (maxBlockNumber < getBasicBlockCountIfNotSkipped(F) && getBasicBlockCountIfNotSkipped(F) < MaxBlockNumber)
                {
                    maxBlockNumber = getBasicBlockCountIfNotSkipped(F);
                }
                functionCount += 1;
            }
            llvm::outs() << "Final function count: " << functionCount << "\n";
        }
        for (llvm::Function &F : M)
        {
            BBNumbering.clear();
            BBTargets.clear();

            // 跳过自创建函数函数
            if (getBasicBlockCountIfNotSkipped(F) == -1 || getBasicBlockCountIfNotSkipped(F) > maxBlockNumber)
            {
                continue;
            }
            AllFunctions_IndirectBrTargets = getIndirectTargetsMap(*F.getParent(), &F, AllFunctions_IndirectBrTargets);
            for (auto &BB : F)
            {
                auto *Terminator = BB.getTerminator();
                if (!Terminator)
                {
                    llvm::errs() << "Terminator is null for basic block: " << BB.getName() << "\n";
                    F.print(llvm::outs());
                    continue; // 或者返回
                }
                auto *BI = dyn_cast<BranchInst>(Terminator);

                if (BI)
                {
                    unsigned FunctionID = FunctionIndexMap[&F];
                    createIndirectCallFunc(M);
                    createIndirectConditionalJumpFunc(M);
                    // 插入对前驱块的处理并插入 `Func1` 和 `HandlerFunc` 的调用
                    ProcessPredecessorsAndInsertFuncCall(F, BB, FunctionID, F.getParent()->getFunction("IndirectCallFunc"), F.getParent()->getFunction("IndirectConditionalJumpFunc"));
                    ++block_count;
                }
            }
        }
    }

    return block_count > 0 ? PreservedAnalyses::none() : PreservedAnalyses::all();
}