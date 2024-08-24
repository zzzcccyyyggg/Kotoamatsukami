
#include "../include/AddJunkCodePass.h"
#include "../include/Config.h"

#include "llvm/ADT/Statistic.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Module.h"
#include "llvm/Pass.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Transforms/IPO.h"
#include "llvm/Transforms/Scalar.h"
#include "llvm/Support/FormatVariadic.h"
#include "llvm/IR/InlineAsm.h"
using namespace llvm;
#ifdef AARCH64
int is_aarch64 = 1;
#else
int is_aarch64 = 0;
#endif

PreservedAnalyses AddJunkCodePass::run(Function &F, FunctionAnalysisManager &AM)
{
    bool InsertedAtLeastOne = false;

    int bb_index = 0;
    for (auto &BB : F)
    {
        Instruction *beginInst = &*BB.getFirstInsertionPt();
        IRBuilder<> builder(beginInst);
        if(is_aarch64){
            std::string label = formatv(".Llabel_{0}", bb_index);
            // Assemble the inline assembly code
            std::string asmCode1 = llvm::formatv(
                "pushq %rax\n"
                "callq {0}f\n"
                "movq $$0xe4, %rax\n"
                "popq %rax\n"
                "popq %rax\n",
                bb_index);
            std::string asmCode2 = llvm::formatv(
                "{0}:\n",
                bb_index);
            outs() << asmCode1 << asmCode2;
            auto *FType = llvm::FunctionType::get(builder.getVoidTy(), false);
            // Create InlineAsm object
            InlineAsm *rawAsm1 = llvm::InlineAsm::get(FType, asmCode1, "",
                                                    /* hasSideEffects */ true,
                                                    /* isStackAligned */ true);
            InlineAsm *rawAsm2 = llvm::InlineAsm::get(FType, asmCode2, "",
                                                    /* hasSideEffects */ true,
                                                    /* isStackAligned */ true);
            // Create a call to the inline assembly and a return statement
            builder.CreateCall(rawAsm1);
            builder.CreateCall(rawAsm2);
            bb_index += 1;
            InsertedAtLeastOne = true;
        }
    }

    if (InsertedAtLeastOne)
        return PreservedAnalyses::none();
    else
        return PreservedAnalyses::all();
}