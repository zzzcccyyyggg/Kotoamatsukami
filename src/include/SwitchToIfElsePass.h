#ifndef LLVM_Kotoamatsukami_SwitchToIfElsePass_H
#define LLVM_Kotoamatsukami_SwitchToIfElsePass_H

#include "llvm/IR/PassManager.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Instructions.h"
#include "llvm/Pass.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/Passes/PassBuilder.h"

namespace llvm {
class SwitchToIfElsePass : public PassInfoMixin<SwitchToIfElsePass> {
public:
  PreservedAnalyses run(Function &F, FunctionAnalysisManager &AM);
  //保证不被跳过
  static bool isRequired() { return true; }
  
};
} // namespace llvm

#endif