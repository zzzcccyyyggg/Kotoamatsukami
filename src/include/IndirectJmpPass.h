#ifndef LLVM_Kotoamatsukami_IndirectJmpPass_H
#define LLVM_Kotoamatsukami_IndirectJmpPass_H
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
  class IndirectJmpPass : public PassInfoMixin<IndirectJmpPass>
  {
  public:
    PreservedAnalyses run(Function &F, FunctionAnalysisManager &AM);
    // 保证不被跳过
    static bool isRequired() { return true; }
  };
} // namespace llvm
void NumberBasicBlock(Function &F);
GlobalVariable *getIndirectTargets(Function &F, ConstantInt *EncKey);
void createInlineAsm_MovAddr2X9(Function &F, IRBuilder<> &Builder, Value *DestAddr);
void createInlineAsm_MovAddr2X10(Function &F, IRBuilder<> &Builder, Value *DestAddr);
void createInlineAsm_IndirectJumpByX9X10(Function &F, IRBuilder<> &Builder, Value *Cond);
#endif