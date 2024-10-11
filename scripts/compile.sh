# 设置 clang、opt 和插件路径
CLANG=/home/zzzccc/llvm-17/llvm-project/build/bin/clang-17
OPT=/home/zzzccc/llvm-17/llvm-project/build/bin/opt
Kotoamatsukami_so=/home/zzzccc/cxzz/Kotoamatsukami/build/Kotoamatsukami.so
$CLANG -fpass-plugin=$Kotoamatsukami_so "$@"