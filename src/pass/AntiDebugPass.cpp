#include "AntiDebugPass.h"
#include "config.h"
#include "utils.hpp"
#include "llvm/IR/Verifier.h"
#include <vector>
using namespace llvm;
/*
void Kotoamatsukami_Antidebug1() {
    if (ptrace(PTRACE_TRACEME, 0, 0, 0) < 0) {
        printf("Debugger detected!\n");
        _exit(1);
    }
    printf("No debugger detected, continuing...\n");
}
*/
llvm::Function* createAntiDebugFunc1(llvm::Module* M)
{
    auto& context = M->getContext();
    FunctionType* funcType = FunctionType::get(Type::getVoidTy(context), false);

    // 3. Create the function
    Function* antiDebugFunc = Function::Create(funcType, Function::ExternalLinkage, "Kotoamatsukami_Antidebug1", M);
    if (!antiDebugFunc) {
        std::cerr << "Error creating function!" << std::endl;
        return nullptr;
    }

    // 4. Create a basic block
    BasicBlock* entryBlock = BasicBlock::Create(context, "entry", antiDebugFunc);

    // 5. Create IRBuilder
    IRBuilder<> builder(entryBlock);

    // 6. Create the function body
    //  Declare ptrace function
    FunctionType* ptraceType = FunctionType::get(Type::getInt32Ty(context), { Type::getInt32Ty(context), Type::getInt64Ty(context), Type::getInt64Ty(context), Type::getInt64Ty(context) }, false);
    FunctionCallee ptraceFunc = M->getOrInsertFunction("ptrace", ptraceType);

    // Declare printf function
    FunctionType* printfType = FunctionType::get(Type::getInt32Ty(context), { Type::getInt8PtrTy(context) }, true);
    FunctionCallee printfFunc = M->getOrInsertFunction("printf", printfType);

    // Declare exit function
    FunctionType* exitType = FunctionType::get(Type::getVoidTy(context), { Type::getInt32Ty(context) }, false);
    FunctionCallee exitFunc = M->getOrInsertFunction("_exit", exitType);

    // Get string constants
    Constant* debuggerDetectedStr = builder.CreateGlobalStringPtr("Debugger detected!\n");
    // Constant* noDebuggerDetectedStr = builder.CreateGlobalStringPtr("No debugger detected, continuing...\n");

    // Create ptrace call
    Value* ptraceCall = builder.CreateCall(ptraceFunc, { ConstantInt::get(Type::getInt32Ty(context), 0), ConstantInt::get(Type::getInt64Ty(context), 0), ConstantInt::get(Type::getInt64Ty(context), 0), ConstantInt::get(Type::getInt64Ty(context), 0) });

    // compare with 0
    Value* cmp = builder.CreateICmpSLT(ptraceCall, ConstantInt::get(Type::getInt32Ty(context), 0));

    // Create if condition
    BasicBlock* ifBlock = BasicBlock::Create(context, "if", antiDebugFunc);
    BasicBlock* elseBlock = BasicBlock::Create(context, "else", antiDebugFunc);

    builder.CreateCondBr(cmp, ifBlock, elseBlock);

    // if block
    builder.SetInsertPoint(ifBlock);
    builder.CreateCall(printfFunc, { debuggerDetectedStr });
    builder.CreateCall(exitFunc, { ConstantInt::get(Type::getInt32Ty(context), 1) });
    builder.CreateUnreachable();

    // else block
    builder.SetInsertPoint(elseBlock);
    // builder.CreateCall(printfFunc, { noDebuggerDetectedStr });
    builder.CreateRetVoid();
    return antiDebugFunc;
}
/*
void Kotoamatsukami_Antidebug2() {
    pid_t ppid = getppid();
    pid_t sid = getsid(getpid());

    if (sid != ppid) {
        printf("Debugger detected based on session and parent PID mismatch!\n");
        _exit(1);
    } else {
        printf("No debugger detected, continuing...\n");
    }
}
*/
Function* createAntiDebugFunc2(Module *module) {
    LLVMContext& context = module->getContext();
    FunctionType *funcType = FunctionType::get(Type::getVoidTy(context), false);
    Function *antiDebugFunc = Function::Create(funcType, Function::ExternalLinkage, "Kotoamatsukami_Antidebug2", module);
    BasicBlock *entryBlock = BasicBlock::Create(context, "entry", antiDebugFunc);
    IRBuilder<> builder(entryBlock);

     // Declare getppid, getsid, and getpid functions
    FunctionType* getpidType = FunctionType::get(Type::getInt32Ty(context), {}, false);
    FunctionCallee getpidFunc = module->getOrInsertFunction("getpid", getpidType);

    FunctionType* getppidType = FunctionType::get(Type::getInt32Ty(context), {}, false);
    FunctionCallee getppidFunc = module->getOrInsertFunction("getppid", getppidType);

     FunctionType* getsidType = FunctionType::get(Type::getInt32Ty(context), {Type::getInt32Ty(context)}, false);
     FunctionCallee getsidFunc = module->getOrInsertFunction("getsid", getsidType);


    // Declare printf function
    FunctionType* printfType = FunctionType::get(Type::getInt32Ty(context), { Type::getInt8PtrTy(context) }, true);
    FunctionCallee printfFunc = module->getOrInsertFunction("printf", printfType);

      // Declare exit function
    FunctionType* exitType = FunctionType::get(Type::getVoidTy(context), { Type::getInt32Ty(context) }, false);
    FunctionCallee exitFunc = module->getOrInsertFunction("_exit", exitType);


    // Get string constants
    Constant *debuggerDetectedStr = builder.CreateGlobalStringPtr("Debugger detected based on session and parent PID mismatch!\n");
    Constant *noDebuggerDetectedStr = builder.CreateGlobalStringPtr("No debugger detected, continuing...\n");

    // Call getppid and getpid
    Value* ppid = builder.CreateCall(getppidFunc, {});
    Value* pid = builder.CreateCall(getpidFunc, {});

    // Call getsid
    Value* sid = builder.CreateCall(getsidFunc, {pid});

    // Compare sid and ppid
    Value* cmp = builder.CreateICmpNE(sid, ppid);

    // Create if-else blocks
     BasicBlock* ifBlock = BasicBlock::Create(context, "if", antiDebugFunc);
    BasicBlock* elseBlock = BasicBlock::Create(context, "else", antiDebugFunc);
     builder.CreateCondBr(cmp, ifBlock, elseBlock);


    // if block
     builder.SetInsertPoint(ifBlock);
    builder.CreateCall(printfFunc, {debuggerDetectedStr});
    builder.CreateCall(exitFunc,{ConstantInt::get(Type::getInt32Ty(context), 1)});
    builder.CreateUnreachable();

    // else block
    builder.SetInsertPoint(elseBlock);
    // builder.CreateCall(printfFunc, {noDebuggerDetectedStr});
    builder.CreateRetVoid();
    return antiDebugFunc;
}

void insertConstructorFunctions(llvm::Module& module, llvm::Function* antiDebugFunc)
{
    llvm::LLVMContext& context = module.getContext();

    // 创建结构体类型，存储（优先级, 函数指针）
    llvm::StructType* ctorStructType = llvm::StructType::get(
        context, { llvm::Type::getInt32Ty(context), llvm::Type::getInt8PtrTy(context) });

    // 创建全局的 llvm.global_ctors 数组，用来存储构造函数
    llvm::ArrayType* globalCtorType = llvm::ArrayType::get(ctorStructType, 1);
    llvm::GlobalVariable* globalCtor = new llvm::GlobalVariable(
        module, globalCtorType, false, llvm::GlobalValue::AppendingLinkage, nullptr, "llvm.global_ctors");

    // 创建每个构造函数条目的常量
    std::vector<llvm::Constant*> elements;
    llvm::Constant* ctorStruct = llvm::ConstantStruct::get(
        ctorStructType, {
                            llvm::ConstantInt::get(llvm::Type::getInt32Ty(context), 65535), // 优先级，65535是默认值
                            llvm::ConstantExpr::getBitCast(antiDebugFunc, llvm::Type::getInt8PtrTy(context)) // 函数指针
                        });
    elements.push_back(ctorStruct);

    // 将所有条目加入到全局变量 llvm.global_ctors 中
    globalCtor->setInitializer(llvm::ConstantArray::get(globalCtorType, elements));
}

bool shouldSkip(const Function& F)
{
    std::string functionName = F.getName().str();
    if (F.size() == 1) {
        return 1;
    }
    if (functionName.find("Kotoamatsukami") != std::string::npos) {
        return true;
    }
    if (F.empty() || F.hasLinkOnceLinkage() || F.getSection() == ".text.startup") {
        return 1;
    }

    if (antidebug.model == 2) {
        if (std::find(antidebug.enable_function.begin(),
                antidebug.enable_function.end(),
                functionName)
            == antidebug.enable_function.end()) {
            return 1;
        }
    } else if (antidebug.model == 3) {
        if (std::find(antidebug.disable_function.begin(),
                antidebug.disable_function.end(),
                functionName)
            != antidebug.disable_function.end()) {
            return 1;
        }
    }
    return 0;
}

PreservedAnalyses AntiDebugPass::run(Module& M, ModuleAnalysisManager& AM)
{
    bool isChanged = false;
    readConfig("/home/zzzccc/cxzz/Kotoamatsukami/config/config.json");
    if (antidebug.model) {
        std::vector<llvm::Function*> antiDebugFuncs;
        antiDebugFuncs.push_back(createAntiDebugFunc1(&M));
        antiDebugFuncs.push_back(createAntiDebugFunc2(&M));
        for (auto& F : M) {
            if (shouldSkip(F))
                continue;
            double random_value = static_cast<double>(rand()) / RAND_MAX;
            if (random_value < 0.5) {
                if (antiDebugFuncs.size() > 0) {
                    Function* antiDebugFunc = antiDebugFuncs[rand() % antiDebugFuncs.size()];
                    if (F.size() > 0) {
                        BasicBlock& entryBlock = F.getEntryBlock();
                        IRBuilder<> builder(&*entryBlock.getFirstInsertionPt());
                        builder.CreateCall(antiDebugFunc);
                        isChanged = true;
                    }
                }
            }
        }
        // insertConstructorFunctions(M, antiDebugFunc);  只能在O0下成功编译 不知道为啥
        isChanged = true;
    }

    if (isChanged)
        return PreservedAnalyses::none();
    else
        return PreservedAnalyses::all();
}