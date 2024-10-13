#include "../include/IndirectJmpPass.h"
#include "../utils/config.h"
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
using namespace llvm;
#define MaxBlockNumber 4096
int block_count = 0;
std::map<BasicBlock *, unsigned> BBNumbering; // 基本块编号映射
int BBNumberingCount = 0;
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

void createInlineAsm_MovCond2X10(Function &F, IRBuilder<> &Builder, Value *Cond)
{
  LLVMContext &Ctx = F.getContext();
  std::string AsmString;
  AsmString += "mov x10, $0\n"; // 如果条件为0，跳转到.Lfalse
  InlineAsm *IA = InlineAsm::get(FunctionType::get(Type::getVoidTy(Ctx), {Type::getInt1Ty(Ctx)}, false), AsmString, "r", true);
  Builder.CreateCall(IA, Cond);
}
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
long long int ComputeX9Value(unsigned FunctionID, unsigned ID1, unsigned TrueID, unsigned FalseID)
{
  // 确保输入的 ID 都是 16 位的值
  assert(FunctionID < (1 << 16) && "FunctionID exceeds 16 bits");
  assert(ID1 < (1 << 16) && "ID1 exceeds 16 bits");
  assert(TrueID < (1 << 16) && "TrueID exceeds 16 bits");
  assert(FalseID < (1 << 16) && "FalseID exceeds 16 bits");

  // 将各个部分移位并组合成最终的 64 位值
  long long int X9Value = 0;
  X9Value |= ((long long int)FunctionID << 48); // 前16位
  X9Value |= ((long long int)ID1 << 32);        // 接下来的16位
  X9Value |= ((long long int)TrueID << 16);     // 再接下来的16位
  X9Value |= (long long int)FalseID;            // 最后16位

  return X9Value;
}
// 将基本块的前驱块处理并插入对func1和处理函数的调用
GlobalVariable *getIndirectTargetsWithMap(Module &M, Function *F, GlobalVariable *&GV, bool updateBasicBlocks)
{
  std::string GVName = "AllFunctions_IndirectBrTargets";
  if (!GV)
  {
    GV = M.getNamedGlobal(GVName);
  }
  unsigned NewIndex;
  if (ExistingFunctionArrays.size() == 0)
  {
    for (int k = 0; k < functionCount; k++)
    {
      ExistingFunctionArrays.push_back(ConstantArray::get(
          ArrayType::get(Type::getInt8PtrTy(F->getContext()), MaxBlockNumber),
          Constant::getNullValue(Type::getInt8PtrTy(F->getContext()))));
    }
  }
  NewIndex = FunctionIndexMap[F];
  llvm::outs() << "func index is : " << NewIndex;
  llvm::outs() << "ExistingFunctionArrays :" << ExistingFunctionArrays.size();
  if (true)
  {
    BBNumbering.clear();
    BBNumberingCount = 0;
    // 收集当前函数的基本块地址，最多 4096 个
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
      // 限制最多 4096 个基本块
      if (Elements.size() >= MaxBlockNumber)
      {
        break;
      }
    }

    // 如果基本块数量不足 4096，填充空值
    while (Elements.size() < MaxBlockNumber)
    {
      Elements.push_back(Constant::getNullValue(Type::getInt8PtrTy(F->getContext())));
    }

    // 创建固定大小的数组类型并替换现有数组中的该函数部分
    ATy = ArrayType::get(Type::getInt8PtrTy(F->getContext()), MaxBlockNumber);
    Constant *CA = ConstantArray::get(ATy, ArrayRef<Constant *>(Elements));
    llvm::outs() << "update successful: " << NewIndex;
    ExistingFunctionArrays[NewIndex] = CA; // 更新相应函数的基本块信息
  }

  // 创建固定大小的二维数组类型，大小为 functionCount x 4096
  OuterArrayTy = ArrayType::get(ArrayType::get(Type::getInt8PtrTy(F->getContext()), MaxBlockNumber), functionCount);
  llvm::outs() << "ExistingFunctionArrays :" << functionCount << '\n';
  // 如果当前已有的函数数量不足 functionCount，填充空值
  llvm::outs() << "ExistingFunctionArrays :" << ExistingFunctionArrays.size();
  while (ExistingFunctionArrays.size() < functionCount)
  {
    ExistingFunctionArrays.push_back(ConstantArray::get(
        ArrayType::get(Type::getInt8PtrTy(F->getContext()), MaxBlockNumber),
        Constant::getNullValue(Type::getInt8PtrTy(F->getContext()))));
  }
  llvm::outs() << "ExistingFunctionArrays :" << ExistingFunctionArrays.size();
  Constant *OuterArray = ConstantArray::get(OuterArrayTy, ArrayRef<Constant *>(ExistingFunctionArrays));

  // 更新或创建全局变量，仅在需要时更新
  if (!GV)
  {
    GV = new GlobalVariable(M, OuterArrayTy, false, GlobalValue::LinkageTypes::PrivateLinkage, OuterArray, GVName);
  }
  else
  {
    llvm::outs() << "ExistingFunctionArrays :" << ExistingFunctionArrays.size();

    // 如果全局变量存在，先删除它
    GV->eraseFromParent();

    // 重新创建全局变量
    GV = new GlobalVariable(M, OuterArrayTy, false, GlobalValue::LinkageTypes::PrivateLinkage, OuterArray, GVName);
  }

  appendToCompilerUsed(M, {GV});
  return GV;
}

int ProcessPredecessorsAndInsertFuncCall(Function &F, BasicBlock &BB, unsigned FunctionID, Function *Func1, Function *ConditionalJumpFunc_byX10)
{
  LLVMContext &Ctx = F.getContext();
  IRBuilder<> Builder(Ctx);

  // 检查当前基本块是否已经被处理过
  if (processedBlocks.count(&BB))
  {
    return 0; // 已经处理过的基本块，跳过
  }

  // 获取基本块的前驱块
  SmallVector<BasicBlock *, 8> Predecessors(predecessors(&BB));
  bool shouldSplit = Predecessors.empty(); // 如果没有前驱块，则标记为需要拆分

  // 获取当前基本块的终结指令
  BranchInst *BI = dyn_cast<BranchInst>(BB.getTerminator());

  // 检查前驱块是否包含终结点指令为 branch 的情况
  for (BasicBlock *PredBB : Predecessors)
  {
    if (BranchInst *PBI = dyn_cast<BranchInst>(PredBB->getTerminator()))
    {
      shouldSplit = true; // 如果前驱块的终结点是 branch，则标记为需要拆分
    }
    else if (IndirectBrInst *IBI = dyn_cast<IndirectBrInst>(PredBB->getTerminator()))
    {
      shouldSplit = true; // 如果前驱块的终结点是 indirect branch，则标记为需要拆分
    }
  }

  if (true)
  {
    llvm::outs() << "aa";
    // 如果没有前驱块，则对 BB 进行拆分
    if (BB.size() < 2 || containsPHI(&BB))
    {
      return 0;
    }

    // 将基本块 BB 拆分为 BB1 和 BB2
    BasicBlock::iterator insertPoint = BB.begin(); // 默认插入点为开头
    bool callFound = false;                        // 用于记录是否找到call指令

    for (BasicBlock::iterator it = BB.begin(); it != BB.end(); ++it)
    {
      // 检查指令是否为call指令
      if (isa<CallInst>(&*it))
      {
        insertPoint = std::next(it); // 将插入点设定为call指令之后
        callFound = true;
      }
    }

    // BasicBlock *NewBB = BB.splitBasicBlock(splitPoint, BB.getName() + ".split");
    // AllFunctions_IndirectBrTargets = getIndirectTargetsWithMap(*F.getParent(), &F, AllFunctions_IndirectBrTargets, 1);
    // 在拆分后的前半部分（BB）中插入对 Func1 的调用
    // Instruction *FunctionInsertPt = &*(BB.getFirstInsertionPt());
    Builder.SetInsertPoint(&*insertPoint);

    // 计算 X9 的值
    long long int x9 = ComputeX9Value(FunctionID, BBNumbering[&BB], BBNumbering[BI->getSuccessor(0)], BBNumbering[BI->getSuccessor(1)]);

    // 将 X9 的值作为常量传递给内联汇编
    Value *X9Value = ConstantInt::get(Type::getInt64Ty(Ctx), x9);
    // Instruction *Terminator = BB.getTerminator();
    // Builder.SetInsertPoint(Terminator);
    // std::string X9ASM = "mov x9
    // 将 x9 的值转换为字符串
    std::stringstream ss;
    ss << std::hex << x9;         // 将值转换为十六进制格式
    std::string x9Str = ss.str(); // 获取字符串
    llvm::outs() << "the func" << F.getName().str() << x9Str << "\n";
    InlineAsm *Asm = InlineAsm::get(FunctionType::get(Type::getVoidTy(Ctx), {Type::getInt64Ty(Ctx)}, false), "mov x9, $0", "r", true);

    // 插入内联汇编调用，将 X9Value 设置到 X9 寄存器
    Builder.CreateCall(Asm, X9Value);
    processedBlocks.insert(&BB);
    // processedBlocks.insert(NewBB);

    auto *Terminator2 = dyn_cast<BranchInst>(BB.getTerminator());
    Value *Cond = Terminator2->getCondition();
    // 首先删除终结指令
    Builder.SetInsertPoint(Terminator2);
    createInlineAsm_MovCond2X10(F, Builder, Cond);
    std::string asmString = "b ConditionalJumpFunc_byX10";
    // 构造汇编指令的约束：没有输入参数和输出参数
    std::string constraints = "";
    // 创建内联汇编对象
    InlineAsm *inlineAsm = InlineAsm::get(FunctionType::get(Type::getVoidTy(Builder.getContext()), false),
                                          asmString, constraints, /*hasSideEffects=*/true);
                               Builder.CreateCall(inlineAsm);
    return 1; // 表示成功处理
  }

  // 遍历前驱块
  for (BasicBlock *PredBB : Predecessors)
  {
    // 如果前驱块合法，插入对 Func1 的调用
    if (PredBB->size() > 1 && !containsPHI(PredBB))
    {
      Instruction *FunctionInsertPt = &*(PredBB->getFirstInsertionPt());
      Builder.SetInsertPoint(FunctionInsertPt);

      // 计算 X9 的值并插入内联汇编指令
      long long int x9 = ComputeX9Value(FunctionID, BBNumbering[PredBB], BBNumbering[BI->getSuccessor(0)], BBNumbering[BI->getSuccessor(1)]);
      Value *X9Value = ConstantInt::get(Type::getInt64Ty(Ctx), x9);
      InlineAsm *Asm = InlineAsm::get(FunctionType::get(Type::getVoidTy(Ctx), {Type::getInt64Ty(Ctx)}, false),
                                      "mov x9, $0", "r", true);
      Builder.CreateCall(Asm, X9Value);
      Instruction *Terminator = PredBB->getTerminator();
      Builder.SetInsertPoint(Terminator);
      // Builder.CreateCall(Func1);
      std::string asmString = "b func1";

      // 构造汇编指令的约束：没有输入参数和输出参数
      std::string constraints = "";

      // 创建内联汇编对象
      InlineAsm *inlineAsm = InlineAsm::get(FunctionType::get(Type::getVoidTy(Builder.getContext()), false),
                                            asmString, constraints, /*hasSideEffects=*/true);
      // ReplaceInstWithInst(Terminator, Builder.CreateUnreachable());
      // unreachableBlocks.insert(NewBB);
      // 记录处理成功的块
      Builder.CreateCall(inlineAsm);
      ReplaceInstWithInst(Terminator, Builder.CreateUnreachable());
      unreachableBlocks.insert(&BB);
      // 记录处理成功的前驱块
      processedBlocks.insert(&BB);

      auto *Terminator2 = dyn_cast<BranchInst>(BB.getTerminator());
      Value *Cond = Terminator2->getCondition();
      Builder.SetInsertPoint(Terminator2);
      // F.getParent()->print(llvm::outs(), nullptr);
      createInlineAsm_MovCond2X10(F, Builder, Cond);
      // Builder.CreateCall(ConditionalJumpFunc_byX10);
      asmString = "b ConditionalJumpFunc_byX10";

      // 构造汇编指令的约束：没有输入参数和输出参数
      constraints = "";

      // 创建内联汇编对象
      inlineAsm = InlineAsm::get(FunctionType::get(Type::getVoidTy(Builder.getContext()), false),
                                 asmString, constraints, /*hasSideEffects=*/true);
      // ReplaceInstWithInst(Terminator, Builder.CreateUnreachable());
      // unreachableBlocks.insert(NewBB);
      // 记录处理成功的块
      Builder.CreateCall(inlineAsm);
      Value *CE = ConstantExpr::getBitCast(BlockAddress::get(Terminator2->getSuccessor(0)), Type::getInt8PtrTy(F.getContext()));
      IndirectBrInst *IBI = IndirectBrInst::Create(CE, 2);
      // F.getParent()->print(llvm::outs(), nullptr);
      IBI->addDestination(Terminator2->getSuccessor(0));
      IBI->addDestination(Terminator2->getSuccessor(1));
      // IBI->addDestination(TMPBlock);
      unreachableBlocks.insert(Terminator2->getSuccessor(0));
      unreachableBlocks.insert(Terminator2->getSuccessor(1));
      ReplaceInstWithInst(Terminator2, IBI);
      // ReplaceInstWithInst(Terminator2, Builder.CreateUnreachable());
      return 1; // 表示成功处理
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

void createFunc1(Module &M)
{
  LLVMContext &Ctx = M.getContext();

  // 检查函数 "func1" 是否已经存在
  if (M.getFunction("func1"))
  {
    llvm::errs() << "Function func1 already exists, skipping creation.\n";
    return;
  }

  // 创建 "func1" 函数
  FunctionType *Func1Ty = FunctionType::get(Type::getVoidTy(Ctx), {}, false);
  Function *Func1 = Function::Create(Func1Ty, Function::ExternalLinkage, "func1", &M);
  BasicBlock *EntryBB = BasicBlock::Create(Ctx, "entry", Func1);
  IRBuilder<> Builder(EntryBB);
  Func1->addFnAttr(Attribute::Naked); // 裸函数属性，不生成栈帧
  // 1. 从 X9 中获取值
  FunctionType *AsmFuncTy = FunctionType::get(Type::getInt64Ty(Ctx), {}, false);
  InlineAsm *LoadX9 = InlineAsm::get(AsmFuncTy, "mov $0, x9", "=r", true);
  Value *X9Value = Builder.CreateCall(LoadX9);

  // 2. 提取 FunctionID 和 ID1
  Value *FunctionID = Builder.CreateTrunc(Builder.CreateLShr(X9Value, 48), Type::getInt16Ty(Ctx));
  Value *ID1 = Builder.CreateTrunc(Builder.CreateLShr(X9Value, 32), Type::getInt16Ty(Ctx));

  // 3. 调用 getBasicBlockAddress 来获取 BasicBlock 地址
  Value *BBAddr = getBasicBlockAddress(FunctionID, ID1, Builder, M);

  // 4. 使用内联汇编跳转到 BasicBlock 地址
  InlineAsm *BranchAsm = InlineAsm::get(FunctionType::get(Type::getVoidTy(Ctx), {Type::getInt8PtrTy(Ctx)}, false),
                                        "br $0", "r", true);
  Builder.CreateCall(BranchAsm, BBAddr);

  // 5. 结束函数
  Builder.CreateRetVoid();
}
void createConditionalJumpFuncs(Module &M)
{
  LLVMContext &Ctx = M.getContext();

  // 批量生成 ConditionalJumpFunc_byX8 到 ConditionalJumpFunc_byX21
  for (int regNum = 10; regNum <= 10; ++regNum)
  {
    // 生成函数名称，比如 "ConditionalJumpFunc_byX10"
    std::string funcName = "ConditionalJumpFunc_byX" + std::to_string(regNum);

    // 检查函数是否已经存在
    if (M.getFunction(funcName))
    {
      // llvm::errs() << "Function " << funcName << " already exists, skipping creation.\n";
      continue;
    }

    // 创建函数类型和函数本体
    FunctionType *ConditionalJumpFuncTy = FunctionType::get(Type::getVoidTy(Ctx), {}, false);
    Function *ConditionalJumpFunc = Function::Create(ConditionalJumpFuncTy, Function::ExternalLinkage, funcName, &M);
    BasicBlock *EntryBB = BasicBlock::Create(Ctx, "entry", ConditionalJumpFunc);
    IRBuilder<> Builder(EntryBB);

    // 1. 从 x9 中获取值
    InlineAsm *LoadX9 = InlineAsm::get(FunctionType::get(Type::getInt64Ty(Ctx), {}, false),
                                       "mov $0, x9", "=r", true);
    Value *X9Value = Builder.CreateCall(LoadX9);

    // 2. 提取 FunctionID 和 BasicBlock IDs
    Value *FunctionID = Builder.CreateTrunc(Builder.CreateLShr(X9Value, 48), Type::getInt16Ty(Ctx));
    Value *TrueBlockID = Builder.CreateTrunc(Builder.CreateLShr(X9Value, 16), Type::getInt16Ty(Ctx));
    Value *FalseBlockID = Builder.CreateTrunc(X9Value, Type::getInt16Ty(Ctx));

    // 3. 从对应的寄存器中获取值，例如 "mov $0, x10" 会根据 regNum 变化
    std::string loadXRegAsm = "mov $0, x" + std::to_string(regNum);
    InlineAsm *LoadXReg = InlineAsm::get(FunctionType::get(Type::getInt64Ty(Ctx), {}, false),
                                         loadXRegAsm, "=r", true);
    Value *XRegValue = Builder.CreateCall(LoadXReg);

    // 4. 获取 TrueBlock 和 FalseBlock 的地址
    Value *TrueBBAddr = getBasicBlockAddress(FunctionID, TrueBlockID, Builder, M);
    Value *FalseBBAddr = getBasicBlockAddress(FunctionID, FalseBlockID, Builder, M);

    // 5. 使用条件选择语句，根据寄存器的值选择跳转目标
    Value *Cond = Builder.CreateICmpEQ(XRegValue, ConstantInt::get(Type::getInt64Ty(Ctx), 1));
    Value *TargetAddr = Builder.CreateSelect(Cond, TrueBBAddr, FalseBBAddr);

    // 6. 使用内联汇编跳转到选择的基本块地址
    InlineAsm *BrAsm = InlineAsm::get(FunctionType::get(Type::getVoidTy(Ctx), {Type::getInt8PtrTy(Ctx)}, false),
                                      "br $0", "r", true);
    Builder.CreateCall(BrAsm, TargetAddr);

    // 7. 结束函数
    Builder.CreateRetVoid();
  }
}
int getBasicBlockCountIfNotSkipped(const Function &F)
{
  // 跳过自创建函数函数
  std::string functionName = F.getName().str();
  for (int regNum = 8; regNum <= 21; ++regNum)
  {
    std::string conditionalJumpFuncName = "ConditionalJumpFunc_byX" + std::to_string(regNum);
    if (functionName == conditionalJumpFuncName)
    {
      return -1;
    }
  }
  if (functionName == "func1" || functionName == "ConditionalJumpFunc_byRAX" || functionName == "ConditionalJumpFunc_byRAX")
  {
    return -1; // -1 表示跳过该函数
  }

  if (F.empty() || F.hasLinkOnceLinkage() || F.getSection() == ".text.startup")
  {
    return -1; // -1 表示跳过该函数
  }

  if (IndirectJmp.model == 2)
  {
    if (std::find(IndirectJmp.enable_function.begin(), IndirectJmp.enable_function.end(), functionName) == IndirectJmp.enable_function.end())
    {
      return -1; // -1 表示跳过该函数
    }
  }
  else if (IndirectJmp.model == 3)
  {
    if (std::find(IndirectJmp.disable_function.begin(), IndirectJmp.disable_function.end(), functionName) != IndirectJmp.disable_function.end())
    {
      return -1; // -1 表示跳过该函数
    }
  }

  // 返回该函数的基本块数量
  return F.size(); // F.size() 返回基本块的数量
}
PreservedAnalyses IndirectJmpPass::run(Module &M, ModuleAnalysisManager &AM)
{
  LLVMContext &Ctx = M.getContext();
  readConfig("/home/zzzccc/cxzz/Kotoamatsukami/config/config.json");
  if (IndirectJmp.model)
  {
    // 统计有效的函数数量
    for (llvm::Function &F : M)
    {
      if (getBasicBlockCountIfNotSkipped(F) != -1)
      {
        if (getBasicBlockCountIfNotSkipped(F) < MaxBlockNumber)
        {
          functionCount += 1;
        }
      }
      llvm::outs() << "Final function count: " << functionCount << "\n";
    }
    for (llvm::Function &F : M)
    {
      BBNumbering.clear();
      BBTargets.clear();
      if (getBasicBlockCountIfNotSkipped(F) == -1 || getBasicBlockCountIfNotSkipped(F) > MaxBlockNumber)
      {
        continue;
      }
      // 添加一个标记属性，表示禁用特定寄存器
      F.addFnAttr("disable-x9");
      F.addFnAttr("disable-x10");
      AllFunctions_IndirectBrTargets = getIndirectTargetsWithMap(*F.getParent(), &F, AllFunctions_IndirectBrTargets, 0);
      for (auto &BB : F)
      {
        auto *BI = dyn_cast<BranchInst>(BB.getTerminator());

        if (BI && BI->isConditional())
        {
          llvm::errs() << "Found conditional branch in block: " << BB.getName() << "\n";
          // 创建 `Func1` 和条件跳转函数
          createFunc1(*F.getParent());
          createConditionalJumpFuncs(*F.getParent());
          llvm::errs() << "Found conditional branch in block: " << BB.getName() << "\n";
          // 获取函数的 ID
          unsigned FunctionID = FunctionIndexMap[&F];
          llvm::errs() << "Found conditional branch in block: " << BB.getName() << "\n";
          // 插入对前驱块的处理并插入 `Func1` 和 `HandlerFunc` 的调用
          ProcessPredecessorsAndInsertFuncCall(F, BB, FunctionID, F.getParent()->getFunction("func1"), F.getParent()->getFunction("ConditionalJumpFunc_byX10"));

          ++block_count;
        }
      }
    }
  }
  return block_count > 0 ? PreservedAnalyses::none() : PreservedAnalyses::all();
}