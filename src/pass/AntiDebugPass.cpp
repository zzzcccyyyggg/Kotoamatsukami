#include "llvm/IR/Function.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/GlobalVariable.h"
#include "llvm/IR/Constants.h"

// 创建并插入构造函数
void insertConstructorFunction(llvm::Module &module) {
    llvm::LLVMContext &context = module.getContext();
    
    // 创建一个void类型的函数
    llvm::FunctionType *funcType = llvm::FunctionType::get(llvm::Type::getVoidTy(context), false);
    llvm::Function *constructorFunction = llvm::Function::Create(funcType, llvm::Function::ExternalLinkage, "my_function", &module);

    // 在函数中插入指令 (示例)
    llvm::BasicBlock *entry = llvm::BasicBlock::Create(context, "entry", constructorFunction);
    llvm::IRBuilder<> builder(entry);
    builder.CreateRetVoid();
    
    // 创建一个全局的`llvm.global_ctors`数组，用来存储构造函数
    llvm::ArrayType *globalCtorType = llvm::ArrayType::get(llvm::StructType::get(
        llvm::Type::getInt32Ty(context), funcType->getPointerTo(), nullptr), 1);

    llvm::GlobalVariable *globalCtor = new llvm::GlobalVariable(
        module, globalCtorType, false, llvm::GlobalValue::AppendingLinkage, nullptr, "llvm.global_ctors");

    // 插入优先级为65535的构造函数 (优先级越小越早执行)
    llvm::Constant *elements[1] = {
        llvm::ConstantStruct::get(llvm::StructType::get(llvm::Type::getInt32Ty(context), funcType->getPointerTo()), {
            llvm::ConstantInt::get(llvm::Type::getInt32Ty(context), 65535),
            constructorFunction
        })
    };

    globalCtor->setInitializer(llvm::ConstantArray::get(globalCtorType, elements));
}
