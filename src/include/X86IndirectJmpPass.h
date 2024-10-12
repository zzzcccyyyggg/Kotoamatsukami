#ifndef LLVM_Kotoamatsukami_X86IndirectJmpPass_H
#define LLVM_Kotoamatsukami_X86IndirectJmpPass_H
//现在仅适配了AArch64架构 因为不同架构之间汇编不一样
#include "llvm/IR/PassManager.h"
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
#include <map>
using namespace llvm;
namespace llvm
{
  class X86IndirectJmpPass : public PassInfoMixin<X86IndirectJmpPass>
  {
  public:
    PreservedAnalyses run(Module &F, ModuleAnalysisManager &AM);
    // 保证不被跳过
    static bool isRequired() { return true; }
  };
} // namespace llvm
void NumberBasicBlock(Function &F);
#endif