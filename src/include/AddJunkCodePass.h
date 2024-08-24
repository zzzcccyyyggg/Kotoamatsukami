#ifndef LLVM_Kotoamatsukami_AddJunkCodePass_H
#define LLVM_Kotoamatsukami_AddJunkCodePass_H

#include "llvm/IR/PassManager.h"

namespace llvm {
class AddJunkCodePass : public PassInfoMixin<AddJunkCodePass> {
public:
  PreservedAnalyses run(Function &F, FunctionAnalysisManager &AM);
  //保证不被跳过
  static bool isRequired() { return true; }
  
};
} // namespace llvm

#endif