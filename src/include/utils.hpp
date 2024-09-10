// 参考 https://github.com/DreamSoule/ollvm17
#ifndef Kotoamatsukami_UTILS_H
#define Kotoamatsukami_UTILS_H
// LLVM libs
#include "llvm/IR/Module.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/NoFolder.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/InstIterator.h"
#include "llvm/IR/Instructions.h"
#include "llvm/Transforms/Utils/Local.h"
#include "llvm/Transforms/Utils/Cloning.h"
#include "llvm/Transforms/Utils/ValueMapper.h"
#include <llvm/Transforms/Utils/BasicBlockUtils.h>
#include <llvm/Transforms/Utils/Local.h>
// #include "llvm/Support/CFGPrinter.h" 
// System libs
#include <map>
#include <set>
#include <vector>
#include <stdio.h>
#include <sstream>
using namespace std;

void fixStack(llvm::Function &F); // 修复PHI指令和逃逸变量
llvm::Function *createFuncFromGenerated(llvm::Module *M, std::string funcName, std::string moduleName);
size_t reg2mem(llvm::Function& F);
#endif // LLVM_UTILS_H