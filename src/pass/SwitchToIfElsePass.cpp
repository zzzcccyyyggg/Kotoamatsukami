#include "../include/SwitchToIfElsePass.h"
using namespace llvm;

PreservedAnalyses SwitchToIfElsePass::run(Function &F, FunctionAnalysisManager &AM)
{
    bool modified = false;

    for (auto &BB : F)
    {
        for (auto &I : BB)
        {
            // 找到 switch 指令
            if (auto *SI = dyn_cast<SwitchInst>(&I))
            {
                IRBuilder<> Builder(SI);

                Value *Cond = SI->getCondition();
                BasicBlock *DefaultBB = SI->getDefaultDest();

                // 起始基本块
                BasicBlock *CurrentBB = SI->getParent();

                // 遍历每个 case
                for (auto &Case : SI->cases())
                {
                    ConstantInt *CaseValue = Case.getCaseValue();
                    BasicBlock *CaseBB = Case.getCaseSuccessor();

                    // 创建 if-else 语句： if (Cond == CaseValue) { br CaseBB }
                    BasicBlock *NewBB = CurrentBB->splitBasicBlock(SI);

                    // 插入比较指令和条件跳转
                    Builder.SetInsertPoint(CurrentBB->getTerminator());
                    Value *Cmp = Builder.CreateICmpEQ(Cond, CaseValue);
                    Builder.CreateCondBr(Cmp, CaseBB, NewBB);

                    // 删除旧的无条件跳转
                    CurrentBB->getTerminator()->eraseFromParent();

                    // 将当前基本块设置为新创建的基本块
                    CurrentBB = NewBB;
                }

                // 最终处理 default 分支
                Builder.SetInsertPoint(CurrentBB->getTerminator());
                Builder.CreateBr(DefaultBB);

                // 删除 switch 指令
                SI->eraseFromParent();

                modified = true;
                break; // 停止遍历，因为我们已经修改了当前基本块
            }
        }
    }

    if (modified)
        return PreservedAnalyses::none();
    return PreservedAnalyses::all();
}
