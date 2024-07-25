cmake_minimum_required(VERSION 3.10)
project(MyJITProject)

# Set the C++ standard
set(CMAKE_CXX_STANDARD 14 CACHE STRING "C++ standard to conform to")

# Find LLVM package
#set(LLVM_DIR "/home/zzzccc/llvm-17/llvm-project/build/lib/cmake/llvm")
find_package(LLVM REQUIRED CONFIG)

# Print LLVM information
message(STATUS "Found LLVM ${LLVM_PACKAGE_VERSION}")
message(STATUS "Using LLVMConfig.cmake in: ${LLVM_DIR}")

# Include LLVM directories
include_directories(${LLVM_INCLUDE_DIRS})
include_directories("${WORKING_DIRECTORY}/src/include")
link_directories(${LLVM_LIBRARY_DIRS})

# Define the executable
add_executable(jit_asm src/jitter.cpp)

# Link against LLVM libraries
# 链接LLVM库
llvm_map_components_to_libnames(llvm_libs 
  ExecutionEngine
  MCJIT
  OrcJIT
  Core
  Support
  nativecodegen
  X86AsmParser
  X86CodeGen
  X86Desc
  X86Disassembler
  X86Info
  native
  irreader 
)

# Use LLVM's target link libraries
target_link_libraries(jit_asm ${llvm_libs} ${LLVM_LIBRARIES})
