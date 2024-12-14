#include "include/AddJunkCodePass.h"
#include "include/Branch2Call.h"
#include "include/Branch2Call_32.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "include/ForObsPass.h"
#include "include/Loopen.hpp"
#include "SplitBasicBlock.h"
#include "AntiDebugPass.h"
#include "IndirectBranch.h"
#include "IndirectCall.h"
#include "BogusControlFlow.h"
#include "Substitution.h"
using namespace llvm;

llvm::PassPluginLibraryInfo getKotoamatsukamiPluginInfo()
{
  return {
      LLVM_PLUGIN_API_VERSION, "Kotoamatsukami", LLVM_VERSION_STRING,
      [](PassBuilder &PB)
      {
        // 注册你的 Pass 并将其添加到函数 Pass 管理器中
        // PB.registerPipelineParsingCallback(
        //     [](StringRef Name, FunctionPassManager &FPM, ArrayRef<PassBuilder::PipelineElement>)
        //     {
        //       if (Name == "indirect-jmp-pass")
        //       {
        //         FPM.addPass(IndirectJmpPass());
        //         return true;
        //       }
        //       return false;
        //     });

        // 你可以按照类似的方式添加更多的 Pass 到不同的 Pass 管理器
        // PB.registerPipelineParsingCallback(
        //     [](StringRef Name, ModulePassManager &MPM, ArrayRef<PassBuilder::PipelineElement>)
        //     {
        //       if (Name == "add-junk-code-pass")
        //       {
        //         MPM.addPass(createModuleToFunctionPassAdaptor(AddJunkCodePass()));
        //         return true;
        //       }
        //       return false;
        //     });

        // PB.registerPipelineParsingCallback(
        //     [](StringRef Name, ModulePassManager &MPM, ArrayRef<PassBuilder::PipelineElement>)
        //     {
        //       if (Name == "for-obs-pass")
        //       {
        //         MPM.addPass(createModuleToFunctionPassAdaptor(ForObsPass()));
        //         return true;
        //       }
        //       return false;
        //     });

        // PB.registerPipelineParsingCallback(
        //     [](StringRef Name, ModulePassManager &MPM, ArrayRef<PassBuilder::PipelineElement>)
        //     {
        //       if (Name == "switch-2-if")
        //       {
        //         MPM.addPass(createModuleToFunctionPassAdaptor(SwitchToIfElsePass()));
        //         return true;
        //       }
        //       return false;
        //     });
        // PB.registerPipelineParsingCallback(
        //     [](StringRef Name, ModulePassManager &MPM, ArrayRef<PassBuilder::PipelineElement>)
        //     {
        //       if (Name == "loopen")
        //       {
        //         MPM.addPass(createModuleToFunctionPassAdaptor(Loopen()));
        //         return true;
        //       }
        //       return false;
        //     });
        // PB.registerPipelineParsingCallback(
        //     [](StringRef Name, ModulePassManager &MPM, ArrayRef<PassBuilder::PipelineElement>)
        //     {
        //       if (Name == "split-basic-block")
        //       {
        //         MPM.addPass(SplitBasicBlock());
        //         return true;
        //       }
        //       return false;
        //     });
        PB.registerPipelineStartEPCallback(
            [](ModulePassManager &MPM, OptimizationLevel Level) {
                MPM.addPass(SplitBasicBlock());
                MPM.addPass(BogusControlFlow());
                MPM.addPass(Loopen());
                MPM.addPass(ForObsPass());
                MPM.addPass(AddJunkCodePass());
                MPM.addPass(Branch2Call_32());
                MPM.addPass(Branch2Call());
                MPM.addPass(AntiDebugPass());
                MPM.addPass(IndirectBranch());
                MPM.addPass(IndirectCall());
                MPM.addPass(Substitution());
        });

      }};
}

__attribute__((visibility("default"))) extern "C" LLVM_ATTRIBUTE_WEAK ::llvm::PassPluginLibraryInfo
llvmGetPassPluginInfo()
{
  return getKotoamatsukamiPluginInfo();
}
