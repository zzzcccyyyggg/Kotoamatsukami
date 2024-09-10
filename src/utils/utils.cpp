/**
 * @file Utils.cpp
 * @author SsageParuders
 * @brief 本代码参考原OLLVM项目:https://github.com/obfuscator-llvm/obfuscator
 *        感谢地球人前辈的指点
 * @version 0.1
 * @date 2022-07-14
 *
 * @copyright Copyright (c) 2022
 *
 */
#include "utils.hpp"
#include "llvm/IR/IntrinsicInst.h"
#include "llvm/Support/SourceMgr.h" // For SMDiagnostic
#include "llvm/IRReader/IRReader.h" // For parseIRFile

using namespace llvm;
using std::vector;

static bool valueEscapes(const Instruction &Inst) {
  const BasicBlock *BB = Inst.getParent();
  for (const User *U : Inst.users()) {
    const Instruction *UI = cast<Instruction>(U);
    if (UI->getParent() != BB || isa<PHINode>(UI))
      return true;
  }
  return false;
}

void fixStack(Function &F)
{
    vector<PHINode *> origPHI;
    vector<Instruction *> origReg;
    BasicBlock &entryBB = F.getEntryBlock();
    for (BasicBlock &BB : F)
    {
        for (Instruction &I : BB)
        {
            if (PHINode *PN = dyn_cast<PHINode>(&I))
            {
                origPHI.push_back(PN);
            }
            else if (!(isa<AllocaInst>(&I) && I.getParent() == &entryBB) && I.isUsedOutsideOfBlock(&BB))
            {
                origReg.push_back(&I);
            }
        }
    }
    for (PHINode *PN : origPHI)
    {
        DemotePHIToStack(PN, entryBB.getTerminator());
    }
    for (Instruction *I : origReg)
    {
        DemoteRegToStack(*I, entryBB.getTerminator());
    }
}

Function *createFuncFromGenerated(Module *M, std::string funcName, std::string moduleName)
{
    // 创建一个新的LLVM上下文
    LLVMContext &Context = M->getContext();

    // 读取模块文件并加载它
    SMDiagnostic Err;
    llvm::outs() << "[utils]: start createFuncFromGenerated " << moduleName << " " << funcName << "\n";
    std::unique_ptr<Module> SrcModule = parseIRFile(moduleName, Err, Context);

    // 错误处理，检查模块是否正确加载
    if (!SrcModule)
    {
        Err.print("createFuncFromGenerated", errs());
        return nullptr;
    }
    // SrcModule->print(llvm::outs(),nullptr);
    // 在加载的模块中查找指定的函数
    Function *SrcFunc = SrcModule->getFunction(funcName);
    if (!SrcFunc)
    {
        errs() << "Function " << funcName << " not found in " << moduleName << "\n";
        return nullptr;
    }

    auto *NewF =
        Function::Create(SrcFunc->getFunctionType(), GlobalValue::PrivateLinkage,
                         funcName, M);

    ValueToValueMapTy VMap;
    auto NewFArgsIt = NewF->arg_begin();
    auto FArgsIt = SrcFunc->arg_begin();

    // 将参数映射到新函数
    for (auto FArgsEnd = SrcFunc->arg_end(); FArgsIt != FArgsEnd;
         ++NewFArgsIt, ++FArgsIt)
    {
        VMap[&*FArgsIt] = &*NewFArgsIt;
    }

    SmallVector<ReturnInst *, 8> Returns;
    CloneFunctionInto(NewF, SrcFunc, VMap, CloneFunctionChangeType::DifferentModule, Returns);

    // 保留函数属性
    NewF->setCallingConv(SrcFunc->getCallingConv());
    NewF->setAttributes(SrcFunc->getAttributes());
    NewF->setDSOLocal(true);
    llvm::outs() << "[utils]: Function " << funcName << " successfully cloned into the target module.\n";

    return NewF;
}

size_t reg2mem(Function& F) {
  /* The code of this function comes from the pass Reg2Mem.cpp
   * Note(Romain): I tried to run this pass using the PassManager with the following code:
   *
   *    FunctionAnalysisManager FAM;
   *    FAM.registerPass([&] { return DominatorTreeAnalysis(); });
   *    FAM.registerPass([&] { return LoopAnalysis(); });
   *
   *    FunctionPassManager FPM;
   *    FPM.addPass(Reg2MemPass())
   *
   *    FPM.run(F, FAM);
   * but it fails on Xcode (crash in AnalysisManager::getResultImp).
   * It might be worth investigating why it crashes.
   */
  SplitAllCriticalEdges(F, CriticalEdgeSplittingOptions());
  size_t count = 0;
  // Insert all new allocas into entry block.
  BasicBlock *BBEntry = &F.getEntryBlock();
//   F.viewCFG();
  assert(pred_empty(BBEntry) &&
         "Entry block to function must not have predecessors!");

  // Find first non-alloca instruction and create insertion point. This is
  // safe if block is well-formed: it always have terminator, otherwise
  // we'll get and assertion.
  BasicBlock::iterator I = BBEntry->begin();
  while (isa<AllocaInst>(I)) ++I;

  CastInst *AllocaInsertionPoint = new BitCastInst(
      Constant::getNullValue(Type::getInt32Ty(F.getContext())),
      Type::getInt32Ty(F.getContext()), "reg2mem alloca point", &*I);

  // Find the escaped instructions. But don't create stack slots for
  // allocas in entry block.
  std::list<Instruction*> WorkList;
  for (Instruction &I : instructions(F))
    if (!(isa<AllocaInst>(I) && I.getParent() == BBEntry) && valueEscapes(I))
      WorkList.push_front(&I);

  // Demote escaped instructions
  count += WorkList.size();
  for (Instruction *I : WorkList)
    DemoteRegToStack(*I, false, AllocaInsertionPoint);

  WorkList.clear();

  // Find all phi's
  for (BasicBlock &BB : F)
    for (auto &Phi : BB.phis())
      WorkList.push_front(&Phi);

  // Demote phi nodes
  count += WorkList.size();
  for (Instruction *I : WorkList)
    DemotePHIToStack(cast<PHINode>(I), AllocaInsertionPoint);

  return count;
}