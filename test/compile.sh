#!/bin/bash

# 设置 clang、opt 和插件路径
CLANG=/home/zzzccc/llvm-17/llvm-project/build/bin/clang-17
OPT=/home/zzzccc/llvm-17/llvm-project/build/bin/opt
Kotoamatsukami_so=/home/zzzccc/cxzz/Kotoamatsukami/build/Kotoamatsukami.so

# 初始化前端和后端选项数组
FRONTEND_ARGS=()
BACKEND_ARGS=()
ALL_ARGS=()

# 初始化输出文件变量
OUTPUT_FILE=""

# 遍历所有传入的参数
while [[ $# -gt 0 ]]; do
  case "$1" in
    # 前端选项
    -I*|-D*|-std=*|-emit-llvm|-O0|-fuse-ld=*|--target=*)
      echo $1
      FRONTEND_ARGS+=("$1")
      ALL_ARGS+=("$1")
      ;;
    
    # 后端选项
    -mllvm|-O[1-3s]|-march=*|--target=*|-static)
      echo $1
      BACKEND_ARGS+=("$1")
      ALL_ARGS+=("$1")
      ;;
    
    # 识别输出文件标志
    -o)
      OUTPUT_FILE="$2"
      shift # 跳过下一个参数，因为它是输出文件名
      ;;
    
    # 默认情况下，添加到前端选项
    *)
      FRONTEND_ARGS+=("$1")
      ;;
  esac
  shift
done

# 如果没有显式指定输出文件，则设定默认输出文件名
if [ -z "$OUTPUT_FILE" ]; then
  OUTPUT_FILE="a.out"
fi

# 提取源文件名（假设前端选项中的最后一个参数是源文件）
SRC_FILE="${FRONTEND_ARGS[-1]}"
BASENAME=$(basename "$SRC_FILE" .c)

# 生成中间 LLVM IR 文件
BC_FILE="${BASENAME}_frontend.ll"

# 第一步：使用 clang 生成 LLVM IR 文件（前端选项）
$CLANG -emit-llvm -S -o $BC_FILE "${FRONTEND_ARGS[@]}"

# 生成优化后的 LLVM IR 文件
OPT_BC_FILE="${BASENAME}_optimized.ll"

# 第二步：使用 opt 工具处理 LLVM IR 文件（加载插件和后端选项）
echo $OPT -load-pass-plugin $Kotoamatsukami_so -passes="for-obs-pass" -passes="indirect-jmp-pass" -S -o $OPT_BC_FILE $BC_FILE 

$OPT -load-pass-plugin $Kotoamatsukami_so -passes="switch-2-if" -S -o $OPT_BC_FILE $BC_FILE
$OPT -load-pass-plugin $Kotoamatsukami_so -passes="indirect-jmp-pass" -S -o $OPT_BC_FILE $OPT_BC_FILE  
$OPT -load-pass-plugin $Kotoamatsukami_so -passes="for-obs-pass" -S -o $OPT_BC_FILE $OPT_BC_FILE 
 
# 第三步：使用 clang 将处理后的 LLVM IR 文件生成最终目标文件或可执行文件（后端选项）
echo $CLANG $OPT_BC_FILE -o $OUTPUT_FILE -Wno-int-conversion -Wno-implicit-function-declaration -Wl,--unresolved-symbols=ignore-all -Wl,--allow-shlib-undefined "${ALL_ARGS[@]}"
$CLANG $OPT_BC_FILE -o $OUTPUT_FILE -Wno-int-conversion -Wno-implicit-function-declaration -Wl,--unresolved-symbols=ignore-all -Wl,--allow-shlib-undefined "${ALL_ARGS[@]}"

# 输出保留的中间文件
echo "Intermediate files retained:"
echo "Frontend LLVM IR: $BC_FILE"
echo "Optimized LLVM IR: $OPT_BC_FILE"
echo "Final output file: $OUTPUT_FILE"
