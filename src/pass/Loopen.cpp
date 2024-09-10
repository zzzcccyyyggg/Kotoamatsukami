#include "utils.hpp"
#include "Loopen.hpp"
// #include "llvm/Transforms/Utils/LowerSwitch.h"
//  namespace
#define QUICK_POW 123456789
using namespace llvm;
std::vector<BasicBlock *> origBB;
std::map<BasicBlock *, int> BB2X;
std::map<BasicBlock *, int> BB2Y;
std::set<int> resultSet;
int x[] = {2, 3, 5, 8, 11, 12, 13, 14, 18, 20, 21, 27, 30, 31, 32, 34, 35, 37, 38, 41, 43, 44, 45, 46, 48, 50, 51, 52, 56, 57, 66, 69, 71, 72, 73, 75, 77, 78, 80, 84, 85, 89, 91, 94, 95, 97, 98, 99, 103, 106, 108, 110, 113, 115, 116, 120, 124, 125, 126, 128, 130, 134, 136, 137, 140, 141, 147, 148, 152, 157, 158, 159, 162, 163, 164, 165, 167, 172, 173, 174, 176, 180, 184, 187, 189, 192, 195, 197, 199, 200, 201, 202, 204, 209, 210, 214, 217, 218, 221, 222, 224, 227, 228, 233, 235, 236, 237, 238, 239, 241, 242, 243, 244, 245, 246, 247, 249, 253, 254, 257, 258, 259, 261, 262, 263, 264, 266, 270, 275, 276, 278, 279, 284, 286, 287, 288, 290, 292, 293, 298, 299, 300, 301, 303, 306, 307, 308, 310, 311, 312, 315, 320, 322, 325, 327, 333, 335, 336, 337, 338, 340, 342, 347, 350, 353, 354, 356, 357, 363, 364, 366, 369, 370, 373, 376, 379, 380, 382, 386, 387, 388, 392, 393, 395, 396, 397, 399, 405, 410, 412, 414, 415, 417, 421, 422, 424, 426, 429, 430, 432, 433, 435, 438, 440, 443, 446, 447, 450, 453, 458, 459, 460, 462, 464, 465, 467, 468, 479, 480, 483, 493, 496, 497, 499, 500, 502, 504, 505, 507, 509, 510, 511, 512};
int xCount = 0;
unsigned int quick_pow(unsigned int base, unsigned int exp, unsigned int mod)
{
    unsigned int result = 1;
    base = base % mod;

    while (exp > 0)
    {
        if (exp % 2 == 1)
        {
            result = (result * base) % mod;
        }
        base = (base * base) % mod;
        exp /= 2;
    }

    return result;
}

llvm::Function *createQuickPow(llvm::Module *M)
{
    // 定义模块名称和函数名称
    std::string moduleName = "/home/zzzccc/cxzz/Kotoamatsukami/config/quick_pow.ll";
    std::string funcName = "quick_pow";

    // 在模块中检查是否已经存在同名的函数
    llvm::Function *existingFunc = M->getFunction(funcName);
    if (existingFunc)
    {
        // 如果函数已存在，直接返回该函数
        return existingFunc;
    }
    llvm::outs() << "[Loopen]: start createFuncFromGenerated " << "\n";
    llvm::Function *newFunc = createFuncFromGenerated(M, funcName, moduleName);
    llvm::outs() << "[Loopen]: createFuncFromGenerated successfully " << "\n";
    // 返回新创建的函数
    return newFunc;
}

// 在指定的基本块中插入二重循环的函数
void funcLoopen(IRBuilder<> &builder, LLVMContext &context, Function &F, Function *quickPowFunc, Value *xmax, Value *ymax, BasicBlock *EntryBB)
{
    // ReplaceInstWithInst(BB->getTerminator(), BR2innerLoopEnd);
    IntegerType *intType = llvm::Type::getInt32Ty(context);

    // 创建外循环基本块
    BasicBlock *outerLoopCond = BasicBlock::Create(context, "outer.loop.cond", &F);
    BasicBlock *outerLoopBody = BasicBlock::Create(context, "outer.loop.body", &F);
    BasicBlock *outerLoopEnd = BasicBlock::Create(context, "outer.loop.end", &F);

    // 创建循环初始值
    BasicBlock *NewEntry = BasicBlock::Create(context, "new_entry", &F, EntryBB);
    builder.SetInsertPoint(NewEntry);
    Value *outerLoopVar = builder.CreateAlloca(intType, nullptr, "outerLoopVar");
    builder.CreateStore(ConstantInt::get(intType, 1), outerLoopVar);
    // y
    Value *innerLoopVar = builder.CreateAlloca(intType, nullptr, "innerLoopVar");
    builder.CreateStore(ConstantInt::get(intType, 0), innerLoopVar);
    Value *quick_pow_mod = builder.CreateAlloca(intType, nullptr, "quick_pow_mod");
    builder.CreateStore(ConstantInt::get(intType, QUICK_POW), quick_pow_mod);
    Value *quick_pow_result = builder.CreateAlloca(intType, nullptr, "quick_pow_result");
    builder.CreateStore(ConstantInt::get(intType, 0), quick_pow_result);
    builder.CreateBr(outerLoopCond);
    for (auto it = EntryBB->begin(), end = std::prev(EntryBB->end()); it != end;)
    {
        Instruction &Inst = *it++;
        Inst.moveBefore(NewEntry->getTerminator()); // 将指令移动到 NewEntry 中
    }
    // ReplaceInstWithInst(BB->getTerminator(), BR2innerLoopEnd);

    // BranchInst *IBI = BranchInst::Create(NewEntry);
    // ReplaceInstWithInst(EntryBB->getTerminator(), IBI);
    // 创建内循环基本块
    BasicBlock *innerLoopCond = BasicBlock::Create(context, "inner.loop.cond", &F);
    BasicBlock *innerLoopBody = BasicBlock::Create(context, "inner.loop.body", &F);
    BasicBlock *innerLoopEnd = BasicBlock::Create(context, "inner.loop.end", &F);

    // // 更改entryblock 跳转
    // EntryBB->moveBefore(outerLoopCond);
    // EntryBB->moveBefore(outerLoopBody);
    // EntryBB->moveBefore(outerLoopEnd);
    // EntryBB->moveBefore(innerLoopCond);
    // EntryBB->moveBefore(innerLoopBody);
    // EntryBB->moveBefore(innerLoopEnd);
    // EntryBB->getTerminator()->eraseFromParent();
    // builder.SetInsertPoint(EntryBB);
    // builder.CreateBr(outerLoopCond);
    // EntryBB->print(llvm::outs());
    // outerLoopCond
    builder.SetInsertPoint(outerLoopCond);
    Value *outerLoad = builder.CreateLoad(intType, outerLoopVar);
    Value *outerCond = builder.CreateICmpULT(outerLoad, xmax);
    builder.CreateCondBr(outerCond, outerLoopBody, outerLoopEnd);

    // outerLoopBody
    builder.SetInsertPoint(outerLoopBody);
    Value *outerNext = builder.CreateAdd(outerLoad, ConstantInt::get(intType, 1));
    builder.CreateStore(outerNext, outerLoopVar);
    builder.CreateStore(ConstantInt::get(intType, 0), innerLoopVar);
    builder.CreateBr(innerLoopCond);

    //// outerLoopCond
    builder.SetInsertPoint(outerLoopEnd);
    builder.CreateStore(ConstantInt::get(intType, 2), outerLoopVar);
    builder.CreateStore(ConstantInt::get(intType, 0), innerLoopVar);
    builder.CreateBr(outerLoopEnd);

    // innerLoopCond
    builder.SetInsertPoint(innerLoopCond);
    Value *innerLoad = builder.CreateLoad(intType, innerLoopVar);
    Value *innerCond = builder.CreateICmpULT(innerLoad, ymax);
    builder.CreateCondBr(innerCond, innerLoopBody, innerLoopEnd);
    // ReplaceInstWithInst(BB->getTerminator(), BR2innerLoopEnd);
    // innerLoopBody
    builder.SetInsertPoint(innerLoopBody);
    Value *innerNext = builder.CreateAdd(innerLoad, ConstantInt::get(intType, 1));
    builder.CreateStore(innerNext, innerLoopVar);
    Value *outerLoopVarValue = builder.CreateLoad(intType, outerLoopVar);
    Value *innerLoopVarValue = builder.CreateLoad(intType, innerLoopVar);
    Value *quickPowModValue = builder.CreateLoad(intType, quick_pow_mod);
    llvm::Value *callResult = builder.CreateCall(quickPowFunc, {outerLoopVarValue, innerLoopVarValue, quickPowModValue});

    // 在入口块插入alloca和store指令创建并初始化switch变量，初始值为随机值
    SwitchInst *swInst = SwitchInst::Create(callResult, innerLoopCond, 0, innerLoopBody);
    // 将原基本块插入到返回块之前，并分配case值
    for (BasicBlock *BB : origBB)
    {
        int randY = std::rand() % 4;
        if (randY == 0)
        {
            randY = 1;
        }
        while (resultSet.count(quick_pow(x[xCount], randY, QUICK_POW)) != 0)
        {
            randY = std::rand() % 4;
            if (randY == 0)
            {
                randY = 1;
            }
        }
        // BB->moveBefore(innerLoopEnd);
        swInst->addCase(ConstantInt::get(intType, quick_pow(x[xCount], randY, QUICK_POW)), BB);
        resultSet.insert(quick_pow(x[xCount], randY, QUICK_POW));
        BB2X[BB] = x[xCount];
        BB2Y[BB] = randY;
        xCount += 1;
    }
    // ReplaceInstWithInst(BB->getTerminator(), BR2innerLoopEnd);
    // 在每个基本块最后添加修改switch变量的指令和跳转到返回块的指令
    for (BasicBlock *BB : origBB)
    {
        // retn BB
        if (BB->getTerminator()->getNumSuccessors() == 0)
        {
            continue;
        }
        // 非条件跳转
        else if (BB->getTerminator()->getNumSuccessors() == 1)
        {
            BasicBlock *sucBB = BB->getTerminator()->getSuccessor(0);
            int _x = BB2X[sucBB] - 1;
            int _y = BB2Y[sucBB];
            builder.SetInsertPoint(&*BB->getFirstInsertionPt());

            // Value *XLoad = builder.CreateLoad(intType, outerLoopVar);
            // Value *YLoad = builder.CreateLoad(intType, innerLoopVar);
            builder.CreateStore(ConstantInt::get(intType, _x), outerLoopVar);
            builder.CreateStore(ConstantInt::get(intType, _y), innerLoopVar);
            BranchInst *BR2innerLoopEnd = BranchInst::Create(innerLoopEnd);
            ReplaceInstWithInst(BB->getTerminator(), BR2innerLoopEnd);
            // ReplaceInstWithInst(BB->getTerminator(), BR2innerLoopEnd);
        }
        // 条件跳转
        else if (BB->getTerminator()->getNumSuccessors() == 2)
        {
            builder.SetInsertPoint(&*BB->getTerminator());
            BasicBlock *sucBBTrue = BB->getTerminator()->getSuccessor(0);
            BasicBlock *sucBBFalse = BB->getTerminator()->getSuccessor(1);
            int xTrue = BB2X[sucBBTrue] - 1;
            int yTrue = BB2Y[sucBBTrue];
            int xFalse = BB2X[sucBBFalse] - 1;
            int yFalse = BB2Y[sucBBFalse];
            BranchInst *br = cast<BranchInst>(BB->getTerminator());
            Value *selX = builder.CreateSelect(br->getCondition(), ConstantInt::get(intType, xTrue), ConstantInt::get(intType, xFalse), "");
            Value *selY = builder.CreateSelect(br->getCondition(), ConstantInt::get(intType, yTrue), ConstantInt::get(intType, yFalse), "");
            builder.CreateStore(selX, outerLoopVar);
            builder.CreateStore(selY, innerLoopVar);
            BranchInst *BR2innerLoopEnd = BranchInst::Create(innerLoopEnd);
            ReplaceInstWithInst(BB->getTerminator(), BR2innerLoopEnd);
            // ReplaceInstWithInst(BB->getTerminator(), BR2innerLoopEnd);
        }
    }
    // innerLoopEnd
    // ReplaceInstWithInst(BB->getTerminator(), BR2innerLoopEnd);
    builder.SetInsertPoint(innerLoopEnd);
    builder.CreateBr(outerLoopCond);
}

PreservedAnalyses Loopen::run(Function &F, FunctionAnalysisManager &AM)
{
    xCount = 0;
    origBB.clear();
    BB2X.clear();
    BB2Y.clear();
    resultSet.clear();
    int blockCount = 0;
    // 遍历函数中的所有基本块
    for (BasicBlock &BB : F)
    {
        blockCount++;
    }

    llvm::Module *M = F.getParent();
    llvm::LLVMContext &context = M->getContext();
    IntegerType *intType = llvm::Type::getInt32Ty(context);
    IRBuilder<> Builder(context);
    Value *xMax = ConstantInt::get(intType, 123456789); // 外循环边界
    Value *yMax = ConstantInt::get(intType, 4);     // 内循环边界
    std::srand(static_cast<unsigned int>(std::time(nullptr)));
    // 基本块数量不超过1则无需处理
    if (F.getName().contains("quick_pow"))
    {
        return PreservedAnalyses::all();
    }
    // // ReplaceInstWithInst(BB->getTerminator(), BR2innerLoopEnd);
    if (F.size() <= 1)
    {
        return PreservedAnalyses::all();
    }
    llvm::outs() << "[Loopen]: start process Function: " << F.getName().str() << "\n";
    llvm::outs() << "[Loopen]: the blocknumber is : " << blockCount << "\n";
    // 将除入口块（第一个基本块）以外的基本块保存到一个 vector 容器中，便于后续处理
    // 首先保存所有基本块
    for (BasicBlock &BB : F)
    {
        origBB.push_back(&BB);
    }
    // 从vector中去除第一个基本块
    origBB.erase(origBB.begin());
    BasicBlock &entryBB = F.getEntryBlock();
    // 如果第一个基本块的末尾是条件跳转，单独分离
    if (BranchInst *br = dyn_cast<BranchInst>(entryBB.getTerminator()))
    {
        if (br->isConditional())
        {
            BasicBlock *newBB = entryBB.splitBasicBlock(br, "newBB");
            origBB.insert(origBB.begin(), newBB);
        }
        // else
        // {
        //     BasicBlock *succ = br->getSuccessor(0);
        //     // 找到 succ 在 origBB 中的位置
        //     auto succIt = std::find(origBB.begin(), origBB.end(), succ);

        //     if (succIt != origBB.end())
        //     {
        //         // 将 succ 移动到 origBB 的第一位
        //         std::rotate(origBB.begin(), succIt, std::next(succIt));
        //     }
        // }
    }
    std::random_device rd;              // 随机数种子生成器
    std::default_random_engine e(rd()); // 随机数引擎
    // 使用 std::shuffle 随机打乱从第二个到最后一个元素
    // std::shuffle(origBB.begin() + 1, origBB.end(), e);
    llvm::outs() << "[Loopen]: start createQuickPow " << "\n";
    llvm::Function *quickPowFunc = createQuickPow(M);
    // entryBB.print(llvm::outs());
    // 检查基本块中是否至少有两条指令
    if (std::distance(entryBB.begin(), entryBB.end()) >= 2)
    {
        // 获取基本块中最后一条指令的迭代器
        llvm::BasicBlock::iterator I = entryBB.end();
        --I; // 现在 I 指向最后一条指令
        --I; // 再向前移动一条，指向倒数第二条指令
        Builder.SetInsertPoint(&*I);
    }
    else
    {
        llvm::errs() << "Not enough instructions to insert before the second last one.\n";
    }
    llvm::outs() << "[Loopen]: start funcLoopen " << "\n";
    funcLoopen(Builder, context, F, quickPowFunc, xMax, yMax, &entryBB);
    // BasicBlock &entryBB2 = F.getEntryBlock();
    // entryBB2.print(llvm::outs());
    llvm::outs() << "[Loopen]: start fixStack " << "\n";
    // // ReplaceInstWithInst(BB->getTerminator(), BR2innerLoopEnd);
    fixStack(F); // 修复逃逸变量和PHI指令
    // reg2mem(F);
    return PreservedAnalyses::none();
}