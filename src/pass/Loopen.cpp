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
int x = 2;
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

    // 如果函数不存在，则创建新函数并加入到模块中
    llvm::Function *newFunc = createFuncFromGenerated(M, funcName, moduleName);

    // 返回新创建的函数
    return newFunc;
}

// 在指定的基本块中插入二重循环的函数
void funcLoopen(IRBuilder<> &builder, LLVMContext &context, Function &F, Function *quickPowFunc, Value *N, Value *M, BasicBlock *EntryBB)
{

    IntegerType *intType = llvm::Type::getInt32Ty(context);
    // 创建循环初始值
    // x
    Value *outerLoopVar = builder.CreateAlloca(intType, nullptr, "outerLoopVar");
    builder.CreateStore(ConstantInt::get(intType, 0), outerLoopVar);
    // y
    Value *innerLoopVar = builder.CreateAlloca(intType, nullptr, "innerLoopVar");
    builder.CreateStore(ConstantInt::get(intType, 0), innerLoopVar);
    Value *quick_pow_mod = builder.CreateAlloca(intType, nullptr, "quick_pow_mod");
    builder.CreateStore(ConstantInt::get(intType, QUICK_POW), quick_pow_mod);
    Value *quick_pow_result = builder.CreateAlloca(intType, nullptr, "quick_pow_result");
    builder.CreateStore(ConstantInt::get(intType, 0), quick_pow_result);

    // 创建外循环基本块
    BasicBlock *outerLoopCond = BasicBlock::Create(context, "outer.loop.cond", &F);
    BasicBlock *outerLoopBody = BasicBlock::Create(context, "outer.loop.body", &F);
    BasicBlock *outerLoopEnd = BasicBlock::Create(context, "outer.loop.end", &F);

    // 创建内循环基本块
    BasicBlock *innerLoopCond = BasicBlock::Create(context, "inner.loop.cond", &F);
    BasicBlock *innerLoopBody = BasicBlock::Create(context, "inner.loop.body", &F);
    BasicBlock *innerLoopEnd = BasicBlock::Create(context, "inner.loop.end", &F);

    // 更改entryblock 跳转
    EntryBB->moveBefore(outerLoopCond);
    EntryBB->getTerminator()->eraseFromParent();
    builder.SetInsertPoint(EntryBB);
    builder.CreateBr(outerLoopCond);

    // outerLoopCond
    builder.SetInsertPoint(outerLoopCond);
    Value *outerLoad = builder.CreateLoad(intType, outerLoopVar);
    Value *outerCond = builder.CreateICmpULT(outerLoad, N);
    builder.CreateCondBr(outerCond, outerLoopBody, outerLoopEnd);

    // outerLoopBody
    Value *outerNext = builder.CreateAdd(outerLoad, ConstantInt::get(intType, 1));
    builder.CreateStore(outerNext, outerLoopVar);
    builder.CreateBr(innerLoopCond);

    //// outerLoopEnd
    builder.SetInsertPoint(outerLoopEnd);
    builder.CreateStore(ConstantInt::get(intType, 2), outerLoopVar);
    builder.CreateStore(ConstantInt::get(intType, 0), innerLoopVar);
    builder.CreateBr(outerLoopEnd);

    // innerLoopCond
    builder.SetInsertPoint(innerLoopEnd);
    Value *innerLoad = builder.CreateLoad(intType, innerLoopVar);
    Value *innerCond = builder.CreateICmpULT(innerLoad, N);
    builder.CreateCondBr(innerCond, innerLoopBody, innerLoopEnd);

    // innerLoopBody
    builder.SetInsertPoint(innerLoopBody);
    Value *innerNext = builder.CreateAdd(innerLoad, ConstantInt::get(intType, 1));
    builder.CreateStore(innerNext, innerLoad);
    llvm::Value *callResult = builder.CreateCall(quickPowFunc, {outerLoopVar, innerLoopVar, quick_pow_mod});

    // 在入口块插入alloca和store指令创建并初始化switch变量，初始值为随机值
    SwitchInst *swInst = SwitchInst::Create(callResult, innerLoopEnd, 0, innerLoopBody);
    // 将原基本块插入到返回块之前，并分配case值
    for (BasicBlock *BB : origBB)
    {
        int randY = std::rand() % 256;
        while (resultSet.count(llvm::quick_pow(x, randY, QUICK_POW)) != 0)
        {
            randY = std::rand() % 256;
        }
        BB->moveBefore(innerLoopEnd);
        swInst->addCase(CONST_I32(llvm::quick_pow(x, randY, QUICK_POW)), BB);
        resultSet.insert(llvm::quick_pow(x, randY, QUICK_POW));
        BB2X[BB] = x;
        BB2Y[BB] = randY;
    }

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
            int X_off = std::rand() % 2;
            BasicBlock *sucBB = BB->getTerminator()->getSuccessor(0);
            int x = BB2X[sucBB] - X_off - 1;
            int y = BB2Y[sucBB];
            BB->getTerminator()->eraseFromParent();
            builder.SetInsertPoint(BB);

            // Value *XLoad = builder.CreateLoad(intType, outerLoopVar);
            // Value *YLoad = builder.CreateLoad(intType, innerLoopVar);
            builder.CreateStore(ConstantInt::get(intType, x), outerLoopVar);
            builder.CreateStore(ConstantInt::get(intType, y), innerLoopVar);
            builder.CreateBr(innerLoopEnd);
        }
        // 条件跳转
        else if (BB->getTerminator()->getNumSuccessors() == 2)
        {
            BasicBlock *sucBBTrue = BB->getTerminator()->getSuccessor(0);
            BasicBlock *sucBBFalse = BB->getTerminator()->getSuccessor(1);
            int X_off = std::rand() % 2;
            int xTrue = BB2X[sucBBTrue] - X_off - 1;
            int yTrue = BB2Y[sucBBTrue];
            int xFalse = BB2X[sucBBFalse] - X_off - 1;
            int yFalse = BB2Y[sucBBFalse];
            BranchInst *br = cast<BranchInst>(BB->getTerminator());
            SelectInst *selX = SelectInst::Create(br->getCondition(), ConstantInt::get(intType, xTrue), ConstantInt::get(intType, xFalse), "", BB->getTerminator());
            SelectInst *selY = SelectInst::Create(br->getCondition(), ConstantInt::get(intType, yTrue), ConstantInt::get(intType, yFalse), "", BB->getTerminator());
            new StoreInst(selX, outerLoopVar, BB);
            new StoreInst(selY, innerLoopVar, BB);
            BB->getTerminator()->eraseFromParent();
            BranchInst::Create(innerLoopEnd, BB);
        }
    }
    // innerLoopEnd
    builder.SetInsertPoint(innerLoopEnd);
    builder.CreateBr(outerLoopCond);
}

PreservedAnalyses Loopen::run(Function &F, FunctionAnalysisManager &AM)
{
    llvm::Module *M = F.getParent();
    llvm::LLVMContext &context = M->getContext();
    IntegerType *intType = llvm::Type::getInt32Ty(context);
    IRBuilder<> Builder(context);
    Value *xMax = ConstantInt::get(intType, 987654321); // 外循环边界
    Value *yMax = ConstantInt::get(intType, 257);       // 内循环边界
    std::srand(static_cast<unsigned int>(std::time(nullptr)));
    // 基本块数量不超过1则无需平坦化
    if (F.size() <= 1)
    {
        return PreservedAnalyses::all();
    }
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
    }
    llvm::Function *quickPowFunc = createQuickPow(M);
    Builder.SetInsertPoint(&*entryBB.getFirstInsertionPt());

    funcLoopen(Builder, context, F, quickPowFunc, xMax, yMax, &entryBB);
    fixStack(F); // 修复逃逸变量和PHI指令

    return PreservedAnalyses::none();
}