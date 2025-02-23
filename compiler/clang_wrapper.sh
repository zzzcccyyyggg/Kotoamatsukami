#!/bin/bash
# arguments
# set -eux

Kotoamatsukami_so=/home/zzzccc/cxzz/Kotoamatsukami/build/Kotoamatsukami.so
CLANG=clang-17
OPT=opt-17
current_dir=$(pwd)
BRANCH2CALL_PROCESS="$current_dir/branch2call_process.py"
ANTIDEBUG_SOURCEFILE="$current_dir/Kotoamatsukami_Antidebug.c"
obfuscate_args=()
source_files=""
output_file=""
branch2call_enable=false
kotoamatsukami_args=()  # 用于存储 kotoamatsukami 的参数
in_kotoamatsukami_args=false # 标志是否正在读取 kotoamatsukami 的参数
in_output_arg=false
old_args=""
clang_args=""

# $CLANG $ANTIDEBUG_SOURCEFILE -O0 -emit-llvm -S -o ${ANTIDEBUG_SOURCEFILE%.c}.ll
for arg in "$@"; do
    old_args+=("$arg")
    if [[ "$arg" == "split-basic-block" ]]; then
        echo "识别到 split-basic-block"
        kotoamatsukami_args+=("$arg")
    elif [[ "$arg" == "anti-debug" ]]; then
        echo "识别到 anti-debug"
        kotoamatsukami_args+=("$arg")
    elif [[ "$arg" == "gv-encrypt" ]]; then
        echo "识别到 gv-encrypt"
        kotoamatsukami_args+=("$arg")
    elif [[ "$arg" == "bogus-control-flow" ]]; then
        echo "识别到 bogus-control-flow"
        kotoamatsukami_args+=("$arg")
    elif [[ "$arg" == "add-junk-code" ]]; then
        echo "识别到 add-junk-code"
        kotoamatsukami_args+=("$arg")
    elif [[ "$arg" == "loopen" ]]; then
        echo "识别到 loopen"
        kotoamatsukami_args+=("$arg")
    elif [[ "$arg" == "for-obs" ]]; then
        echo "识别到 for-obs"
        kotoamatsukami_args+=("$arg")
    elif [[ "$arg" == "branch2call-32" ]]; then
        echo "识别到 branch2call-32"
        branch2call_enable=true
    elif [[ "$arg" == "branch2call" ]]; then
        echo "识别到 branch2call"
        branch2call_enable=true
    elif [[ "$arg" == "indirect-call" ]]; then
        echo "识别到 indirect-call"
        kotoamatsukami_args+=("$arg")
    elif [[ "$arg" == "indirect-branch" ]]; then
        echo "识别到 indirect-branch"
        kotoamatsukami_args+=("$arg")
    elif [[ "$arg" == "flatten" ]]; then
        echo "识别到 flatten"
        kotoamatsukami_args+=("$arg")
    elif [[ "$arg" == "substitution" ]]; then
        echo "识别到 substitution"
        kotoamatsukami_args+=("$arg")
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
        $CLANG -S -emit-llvm "${clang_args[@]}" $source_files -o "${source_files%.c}.ll"
        ll_file="${source_files%.c}.ll"
        $OPT --load-pass-plugin=$Kotoamatsukami_so $ll_file --passes=""${kotoamatsukami_args[@]}"" -S -o "${ll_file%.ll}.obfuscated.ll"
        obfuscated_ll_file="${ll_file%.ll}.obfuscated.ll"
        asm_file="${ll_file%.ll}.s"
        $CLANG "$obfuscated_ll_file" "${clang_args[@]}"  -Wno-unused-command-line-argument -S -o $asm_file
        echo python3 $BRANCH2CALL_PROCESS $asm_file $asm_file
        python3 $BRANCH2CALL_PROCESS $asm_file $asm_file
        $CLANG "$asm_file" "${clang_args[@]}"  -Wno-unused-command-line-argument -o "$output_file"
        
         # Delete intermediate files
         if [[ -z "$DEBUG" || "$DEBUG" != "1" ]]; then
            rm "$ll_file" "$obfuscated_ll_file" "$asm_file"
         fi

    else
        $CLANG -S -emit-llvm "${clang_args[@]}" $source_files -o "${source_files%.c}.ll"
        ll_file="${source_files%.c}.ll"
        # 使用 IFS 设置分隔符为逗号
        IFS=','
        $OPT --load-pass-plugin=$Kotoamatsukami_so $ll_file --passes=""${kotoamatsukami_args[@]}"" -S -o "${ll_file%.ll}.obfuscated.ll" --print-pipeline-passes 
        unset IFS
        obfuscated_ll_file="${ll_file%.ll}.obfuscated.ll"
        $CLANG "$obfuscated_ll_file" "${clang_args[@]}"  -Wno-unused-command-line-argument -o "$output_file"

    fi
else
    echo "Not a valid .c file. Passing to clang directly."
    $CLANG "$@"
fi