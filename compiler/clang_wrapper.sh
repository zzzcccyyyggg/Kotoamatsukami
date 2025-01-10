#!/bin/bash
# arguments
Kotoamatsukami_so=/home/zzzccc/cxzz/Kotoamatsukami/build/Kotoamatsukami.so
CLANG=/home/zzzccc/llvm-17/llvm-project/build/bin/clang
OPT=/home/zzzccc/llvm-17/llvm-project/build/bin/opt
LD=/home/zzzccc/llvm-17/llvm-project/build/bin/lld
LLVM_DIS=/home/zzzccc/llvm-17/llvm-project/build/bin/llvm-dis
current_dir=$(pwd)
BRANCH2CALL_PROCESS="$current_dir/branch2call_process.py"

obfuscate_args=()
source_files=""
output_file=""
branch2call_enable=false
kotoamatsukami_args=()  # 用于存储 kotoamatsukami 的参数
in_kotoamatsukami_args=false # 标志是否正在读取 kotoamatsukami 的参数
in_output_arg=false
old_args=""
clang_args=""

for arg in "$@"; do
    old_args+=("$arg")
    if [[ "$in_kotoamatsukami_args" == true ]]; then
        # 如果在读取 kotoamatsukami 的参数
        if [[ "$arg" == "}" ]]; then
          in_kotoamatsukami_args=false
        elif [[ "$arg" == "{" ]]; then
          continue
        elif [[ "$arg" == "branch2call" || "$arg" == "branch2call-32" ]]; then
            branch2call_enable=true
            kotoamatsukami_args+=("$arg")
        else
          kotoamatsukami_args+=("$arg")
        fi
    elif [[ "$arg" == "-kotoamatsukami" ]]; then
        in_kotoamatsukami_args=true
        continue  # skip "kotoamatsukami"
    elif [[ "$arg" == *".c" ]]; then
        source_files="$arg"
    elif [[ "$arg" == '-o' ]]; then
        in_output_arg=true
    elif [[ "$in_output_arg" == true ]]; then
        output_file="$arg"
        in_output_arg=false
    else
      clang_args+=("$arg")
      continue
    fi
done

# 检查是否找到了 kotoamatsukami 及其参数
if [[ -z "$source_files" || ${#kotoamatsukami_args[@]} -eq 0 ]]; then
    $CLANG "$@"
    exit
fi

echo "Source file: $source_files"
echo "kotoamatsukami args: ${kotoamatsukami_args[@]}"

# 如果源文件存在且是 .c 文件，获取源文件所在的目录
if [[ -f "$source_files" && "$source_files" == *".c" ]]; then
    if [[ "$branch2call_enable" == true ]]; then
        echo $branch2call_enable
        $CLANG -S -emit-llvm "${clang_args[@]}" $source_files -o "${source_files%.c}.ll"
        ll_file="${source_files%.c}.ll"
        $OPT --load-pass-plugin=$Kotoamatsukami_so $ll_file --passes=""${kotoamatsukami_args[@]}"" -S -o "${ll_file%.ll}.obfuscated.ll"
        obfuscated_ll_file="${ll_file%.ll}.obfuscated.ll"
        asm_file="${ll_file%.ll}.s"
        $CLANG "$obfuscated_ll_file" "${clang_args[@]}"  -Wno-unused-command-line-argument -S -o $asm_file
        echo python3 $BRANCH2CALL_PROCESS $asm_file $asm_file
        python3 $BRANCH2CALL_PROCESS $asm_file $asm_file
        $CLANG "$asm_file" "${clang_args[@]}"  -Wno-unused-command-line-argument -o "$output_file"
        echo $CLANG "$asm_file" "${clang_args[@]}"  -Wno-unused-command-line-argument -o "$output_file"
    else
        $CLANG -S -emit-llvm "${clang_args[@]}" $source_files -o "${source_files%.c}.ll"
        ll_file="${source_files%.c}.ll"
        $OPT --load-pass-plugin=$Kotoamatsukami_so $ll_file --passes=""${kotoamatsukami_args[@]}"" -S -o "${ll_file%.ll}.obfuscated.ll"
        # echo $OPT --load-pass-plugin=$Kotoamatsukami_so $ll_file --passes=""${kotoamatsukami_args[@]}"" -S -o "${ll_file%.ll}.obfuscated.ll"
        obfuscated_ll_file="${ll_file%.ll}.obfuscated.ll"
        # echo $CLANG "$obfuscated_ll_file" "${clang_args[@]}"  -Wno-unused-command-line-argument -o $output_file
        $CLANG "$obfuscated_ll_file" "${clang_args[@]}"  -Wno-unused-command-line-argument -o $output_file
    fi
else
    echo "Not a valid .c file. Passing to clang directly."
    $CLANG "$@"
fi