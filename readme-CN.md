# Kotoamatsukami

Kotoamatsukami 是一款基于 LLVM-17 的混淆器，利用 LLVM 的新 Pass 来实现插件功能，用于混淆多种语言和平台。

"Kotoamatsukami" 这个名字来源于我最喜欢的动漫 **火影忍者**，它是宇智波止水的幻术--别天神。

将来我会提供一整套相关的文档，现在你可以在 /bin/build 中找到动态链接文件 Kotoamatsukami.so。

PS：这个项目是我出于兴趣自己编写的，可能并不完整。如果您对这个项目有任何疑问，请随时与我联系。

**现在你可以通过我的简陋网站 http://39.102.210.108:8080/ 来体验它！**

混淆算法的详细信息请参见：https://github.com/zzzcccyyyggg/Kotoamatsukami/blob/llvm-17-plugins/docs/Obfuscation-algorithm.md

## 如何安装

您可以在自己的计算机上编译 LLVM-17 项目，然后克隆该项目并修改其 CMakeLists.txt 进行编译。

以下是我使用的命令，供您参考：

```
git clone --depth 1 -b release/17.x https://github.com/llvm/llvm-project.git
mkdir build
cmake -G Ninja -DLLVM_ENABLE_PROJECTS="clang;lld" -DLLVM_TARGETS_TO_BUILD="X86;ARM;AArch64" -DCMAKE_BUILD_TYPE=Release -DLLVM_INCLUDE_TESTS=OFF -DLLVM_ENABLE_RTTI=ON -DCMAKE_INSTALL_PREFIX=./build/ ../llvm-project/llvm
ninja -j8
ninja install
```

这些命令会将编译后的产品安装到 `<你的LLVM目录>/build`，然后你需要修改此项目的 CMakeLists.txt。

```
cd Kotoamatsukami
git submodule update --init --recursive
mkdir build
cd build
cmake ..
make -j
```

 完成 ~~

## 如何使用

现在你可以轻松地使用这个混淆器了，你只需要先安装 clang-17，然后修改 `compiler/clang_wrapper.sh` 中的 `Kotoamatsukami_so`，然后你就可以在 `compiler` 目录中使用它了，并且我会在 `/bin` 中提供编译好的 so 文件。

(PS: 如果你不在 `compiler` 目录中使用它，请确保将 `/compiler/Kotoamatsukami.config` 和 `/compiler/branch2call_process.py` 复制到你的 `工作目录` 中)

编译选项的使用方式如下：

```sh
./clang_wrapper.sh flatten branch2call …… <input_file> -o <output_file>
```

- `<input_file>`: 要混淆的源代码文件的路径 (例如，my_program.c)。
- `-o <output_file>`: 输出可执行文件的路径 (例如，my_program)。
- `{obfuscation_options}`: 这是要应用的混淆 pass 的空格分隔列表。以下是可用的选项（与提供的代码片段中的内部 pass 名称匹配）：
  - **split-basic-block**: 分割代码中的基本块。
  - **anti-debug**: 插入反调试技术。
  - **gv-encrypt**: 加密全局变量。
  - **bogus-control-flow**: 插入虚假控制流来迷惑分析。
  - **add-junk-code**: 添加垃圾代码以增加代码大小和复杂性。
  - **loopen**: 应用基于循环的混淆。
  - **for-obs**: 应用基于 for 循环的混淆
  - **branch2call-32**: 将分支转换为调用 (32 位版本)。
  - **branch2call**: 将分支转换为调用。
  - **indirect-call**: 插入间接函数调用。
  - **indirect-branch**: 插入间接分支。
  - **flatten**: 展平程序的控制流。
  - **substitution**: 用等效序列替换指令。

**示例:**

要将全局变量加密和虚假控制流应用于名为 rc4.c 的文件，并生成名为 rc4 的可执行文件，可以使用：

```sh
./clang_wrapper.sh gv-encrypt bogus-control-flow ./tests/rc4.c -o ./tests/rc4
```

只应用全局变量加密：

```sh
./clang_wrapper.sh  gv-encrypt  ./tests/rc4.c -o ./tests/rc4
```

### 细节

您可以在 `/tmp/Kotoamatsukami/Kotoamatsukami.config` 中设置配置文件，其格式如下。

**`0`**: 所有函数都已关闭（所有内容均已禁用）。

**`1`**: 所有函数都已打开（所有内容均已启用）。

**`2`**: 仅启用已启用的函数（保持已启用的函数开启，其他函数保持不变）。

**`3`**: 启用除显式禁用的函数以外的所有函数（启用未禁用的所有函数）。

您可以在 https://github.com/zzzcccyyyggg/Kotoamatsukami/blob/llvm-17-plugins/compiler/Kotoamatsukami.config 中找到 Kotoamatsukami.config 的示例

然后你可以如下使用 Kotoamatsukami.so：

```shell
<你的clang-17> -fpass-plugin=<你的Kotoamatsukami_so>
```