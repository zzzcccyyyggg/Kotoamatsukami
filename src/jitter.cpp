#include "include/jitter.hpp"
#include <llvm/AsmParser/Parser.h>
#include <llvm/ExecutionEngine/ExecutionEngine.h>
#include <llvm/ExecutionEngine/MCJIT.h>
#include <llvm/ExecutionEngine/Orc/LLJIT.h>
#include <llvm/ExecutionEngine/Orc/ThreadSafeModule.h>
#include <llvm/ExecutionEngine/SectionMemoryManager.h>
#include <llvm/IR/DataLayout.h>
#include <llvm/IR/IRBuilder.h>
#include <llvm/IR/InlineAsm.h>
#include <llvm/IR/LLVMContext.h>
#include <llvm/IR/PassManager.h>
#include <llvm/IRReader/IRReader.h>
#include <llvm/InitializePasses.h>
#include <llvm/Object/ELFObjectFile.h>
#include <llvm/Object/ObjectFile.h>
#include <llvm/Passes/PassBuilder.h>
#include <llvm/Support/Error.h>
#include <llvm/Support/Host.h>
#include <llvm/Support/MemoryBuffer.h>
#include <llvm/Support/TargetSelect.h>
#include <llvm/Support/raw_ostream.h>
#include <llvm/Transforms/Utils/Cloning.h>


#include <llvm/Demangle/Demangle.h>
#include <llvm/IR/Constants.h>
// #include <llvm/TargetParser/Triple.h>
// #include <llvm/TargetParser/Host.h>
using namespace llvm;

namespace Kotoamatsukami {
//构造函数
Jitter::Jitter(const std::string &Triple)
    : Triple_{Triple}, Ctx_{new LLVMContext{}} {
  InitializeNativeTarget();
  InitializeNativeTargetAsmParser();
  InitializeNativeTargetAsmPrinter();
}

std::unique_ptr<MemoryBuffer> Jitter::jitAsm(const std::string& Asm, size_t Size) {
  static constexpr const char FNAME[] = "__omvll_asm_func";

  static ExitOnError ExitOnErr;

  auto Context = std::make_unique<LLVMContext>();
  auto M = std::make_unique<llvm::Module>("__omvll_asm_jit", *Context);

  Function *F = Function::Create(llvm::FunctionType::get(llvm::Type::getVoidTy(*Context), {}, false),
                                 Function::ExternalLinkage, FNAME, M.get());

  llvm::BasicBlock *BB = llvm::BasicBlock::Create(*Context, "EntryBlock", F);
  IRBuilder<> builder(BB);

  auto* FType = llvm::FunctionType::get(builder.getVoidTy(), false);
  InlineAsm* rawAsm = InlineAsm::get(FType, Asm, "",
    /* hasSideEffects */ true,
    /* isStackAligned */ true
  );

  builder.CreateCall(FType, rawAsm);
  builder.CreateRetVoid();


  orc::LLJITBuilder Builder;
  std::string TT = Triple_;
  orc::JITTargetMachineBuilder JTMB{llvm::Triple(TT)};
  JTMB.setRelocationModel(Reloc::Model::PIC_);
  JTMB.setCodeModel(CodeModel::Large);
  JTMB.setCodeGenOptLevel(CodeGenOpt::Level::None);

  Builder.setJITTargetMachineBuilder(JTMB);

  Builder
    .setJITTargetMachineBuilder(std::move(JTMB));

  std::unique_ptr<orc::LLJIT> JITB = ExitOnErr(Builder.create());

  // if (!JITB) {
  //   fatalError("JITB is null");
  // }

  M->setDataLayout(JITB->getDataLayout());

  auto& IRC = JITB->getIRCompileLayer();
  orc::IRCompileLayer::IRCompiler& Compiler = IRC.getCompiler();
  if (auto Res = Compiler(*M)) {
    std::unique_ptr<llvm::MemoryBuffer> Buff = std::move(*Res);
    size_t FunSize = Size * /* Sizeof AArch64 inst=*/ 4;

    // if (FunSize == 0) {
    //   fatalError("Can't get the function size");
    // }

    ExitOnErr(JITB->addObjectFile(std::move(Buff)));

    if (auto L = JITB->lookup(FNAME)) {
      uint64_t Addr = L->getAddress();
      auto* ptr = reinterpret_cast<const char*>(Addr);
      return MemoryBuffer::getMemBufferCopy({ptr, FunSize});
    }
  }
  // fatalError("Can't compile: " + Asm);
}

}

int main(int argc, char *argv[]) {
    // Initialize LLVM components
    LLVMInitializeNativeTarget();

    // Parse command line options
    // llvm::cl::ParseCommandLineOptions(argc, argv);

    // Create a Jitter instance using the current platform's triple
    std::string Triple = llvm::Triple::normalize(llvm::sys::getDefaultTargetTriple());
    Kotoamatsukami::Jitter jitter(Triple);

    // Load the LLVM IR file
    LLVMContext Context;
    SMDiagnostic Error;
    std::unique_ptr<Module> M = parseIRFile("/home/zzzccc/Desktop/Kotoamatsukami/test/test1.ll", Error, Context);
    if (!M) {
        Error.print(argv[0], errs());
        return 1;
    }

    // Function name in the LLVM IR file where you want to inject the assembly code
    std::string functionName = "main";

    // Assembly code to JIT compile and inject into the function's preamble
    std::string asmCode = "movq 60, %rax; xor %rdi, %rdi; syscall";

    // Compile the assembly code and get a buffer containing the compiled machine code
    size_t codeSize = 3;  // Adjust based on the number of assembly instructions and platform
    auto insts = jitter.jitAsm(asmCode, codeSize);

    // Find the function in the LLVM IR module
    Function *F = M->getFunction(functionName);
    if (!F) {
        errs() << "Function not found: " << functionName << "\n";
        return 1;
    }

    auto* Int8Ty = Type::getInt8Ty(F->getContext());
    auto* Prologue = llvm::ConstantDataVector::get(Context, llvm::ArrayRef<uint8_t>((const uint8_t*)insts->getBuffer().bytes_begin(), insts->getBuffer().size()));

    F->setPrologueData(Prologue);

    // Print the modified LLVM IR module
    llvm::outs() << "Modified LLVM IR:\n";
    M->print(llvm::outs(), nullptr);

    // Additional validation or processing can be added here

    return 0;
}