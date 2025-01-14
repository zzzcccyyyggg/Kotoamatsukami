# Kotoamatsukami

Kotoamatsukami 是一个基于 LLVM-17 的代码混淆器，它利用 LLVM 的新 Pass 机制实现插件功能，用于混淆多种语言和平台。

名字 "Kotoamatsukami" (别天神) 来自我最喜欢的动漫 **《火影忍者》**，它拥有我心中最强的幻术。

我将在未来提供一套完整的相关文档，现在你可以在 `/bin/build` 目录下找到动态链接文件 `Kotoamatsukami.so`，并且在 `/bin/test` 目录下找到使用不同方法混淆后的文件。

PS：这个项目是我出于兴趣自己编写的，可能并不完善。如果你对这个项目有任何疑问，请随时联系我。

**现在你可以通过我简陋的网站体验一下：http://39.102.210.108:8080/**

欢迎~！

项目地址：https://github.com/zzzcccyyyggg/Kotoamatsukami

## 代码混淆

以下测试文件是 RC4 加密算法（源代码在本文档末尾），原始文件的 IDA 视图如下：

![image-20241220160418783](https://zzzcccimage1.oss-cn-beijing.aliyuncs.com/img/image-20241220160418783.png)

目前开放的代码混淆功能包括：

### Loopen

一种混淆程序控制流的方法。

仅使用 Loopen 的效果：

![image-20241220163919762](https://zzzcccimage1.oss-cn-beijing.aliyuncs.com/img/image-20241220163919762.png)

### branch2call

在汇编级别将 `br` 指令转换为对某个函数的 `call` 指令，目前仅支持 X86 和 X64 架构。

仅使用 branch2call 的效果：

![image-20241220165753884](https://zzzcccimage1.oss-cn-beijing.aliyuncs.com/img/image-20241220165753884.png)

![image-20241220165741070](https://zzzcccimage1.oss-cn-beijing.aliyuncs.com/img/image-20241220165741070.png)

### ForObs

添加 `for` 循环来对抗诸如 angr 等动态执行项目。

仅使用 ForObs 的效果：

![image-20241220170246504](https://zzzcccimage1.oss-cn-beijing.aliyuncs.com/img/image-20241220170246504.png)

![image-20241220170303720](https://zzzcccimage1.oss-cn-beijing.aliyuncs.com/img/image-20241220170303720.png)

### BogusControlFlow

我的虚假控制流基于 rimao 的版本（源代码：https://github.com/za233/Polaris-Obfuscator/blob/main/src/llvm/lib/Transforms/Obfuscation/BogusControlFlow2.cpp）。
我所做的是将判断条件从确定改为可能，但实际发生的概率很小，以至于在实际程序运行时不会发生。并且我添加了一个局部变量来加强它可能被执行的错觉。

但我想要做的是让虚假块以非常低的概率真实执行。并且如果虚假块执行了，程序会发现它并重新执行真实块。但是我的虚假块中的虚假变量没有分配内存，所以它会崩溃。 希望我以后有时间完成这个。

仅使用 BogusControlFlow 的效果：

![image-20241220205919801](https://zzzcccimage1.oss-cn-beijing.aliyuncs.com/img/image-20241220205919801.png)

### Indirect_branch

这种混淆方法可以将分支跳转转换为通过寄存器的间接跳转，并且每个块都有一个唯一的密钥，以增加破解者的攻击难度。

仅使用 Indirect_branch 的效果：

![image-20241220205450343](https://zzzcccimage1.oss-cn-beijing.aliyuncs.com/img/image-20241220205450343.png)

### Indirect_call

与 `indirect_branch` 方法类似，此方法将部分函数调用转换为通过具有不同密钥的寄存器的间接调用。

仅使用 Indirect_call 的效果：

![image-20241220205641931](https://zzzcccimage1.oss-cn-beijing.aliyuncs.com/img/image-20241220205641931.png)

### SplitBasicBlock

这是一种将基本块拆分为多个的简单方法。 它的目的是加强其他混淆算法。

例如，将它与 Loopen 结合使用的效果：

![image-20241220205724495](https://zzzcccimage1.oss-cn-beijing.aliyuncs.com/img/image-20241220205724495.png)

### AddJunkCode

添加汇编级别的垃圾代码，目前仅支持 X86 和 X64 架构。

仅使用 AddJunkCode 的效果：

![image-20241220164639032](https://zzzcccimage1.oss-cn-beijing.aliyuncs.com/img/image-20241220164639032.png)

### Flatten

这段代码改编自 Pluto 项目（https://github.com/DreamSoule/ollvm17）。
感谢前辈的贡献!

仅使用 Flatten 的效果：

![image-20241220211100256](https://zzzcccimage1.oss-cn-beijing.aliyuncs.com/img/image-20241220211100256.png)

### Substitution

这段代码改编自 Pluto 项目（https://github.com/bluesadi/Pluto）
源代码：https://github.com/bluesadi/Pluto/blob/kanxue/Transforms/src/Substitution.cpp
我只是将其适配到 LLVM-17 和 LLVM 新 Pass 机制。
感谢前辈的贡献!

仅使用 Substitution 的效果：

![image-20241220210934072](https://zzzcccimage1.oss-cn-beijing.aliyuncs.com/img/image-20241220210934072.png)

### GVEncrypt

此方法将通过在函数头部插入函数相关的解密函数来加密部分全局变量或全局常量，并通过全局变量来保护解密函数只执行一次。 我可能会在函数末尾添加相关函数以增强隐蔽性。

仅使用 GVEncrypt 的效果：

![image-20241220212030685](https://zzzcccimage1.oss-cn-beijing.aliyuncs.com/img/image-20241220212030685.png)

### AntiDebug

~~此方法会在程序的构造函数列表中插入一些反调试函数，以便在程序启动运行时调用：
并且我尝试使反调试函数可配置，详细信息请参见代码~~。

现在，该方法将随机插入一些反调试函数到程序的每个函数中，以在运行时保护程序。

## 如何安装

你可以在你的计算机上自行编译 LLVM-17 项目，然后修改此项目的 CMakeLists.txt 文件进行编译。

以下是我使用的命令，供你参考：

```
git clone --depth 1 -b release/17.x https://github.com/llvm/llvm-project.git
mkdir build
cmake -G Ninja -DLLVM_ENABLE_PROJECTS="clang;lld" -DLLVM_TARGETS_TO_BUILD="X86;ARM;AArch64" -DCMAKE_BUILD_TYPE=Release -DLLVM_INCLUDE_TESTS=OFF -DLLVM_ENABLE_RTTI=ON -DLLVM_OBFUSCATION_LINK_INTO_TOOLS=
ON -DCMAKE_INSTALL_PREFIX=./build/ ../llvm-project/llvm
ninja -j8
ninja install
```

这些命令会将编译后的产品安装到 `<your-llvmdir>/build`，然后你需要修改此项目的 `CMakeLists.txt` 文件。

```
cd Kotoamatsukami
mkdir build
cd build
cmake ..
make -j
```

 完成 ~~

## 如何使用

现在你可以轻松使用这个混淆器了。 你只需要先安装 `clang-17`，然后修改 `compiler/clang_wrapper.sh` 中的 `Kotoamatsukami_so` 变量，然后你就可以在 `compiler` 目录中使用它了。我将在 `/bin` 目录下提供编译好的 `so` 文件。

使用编译选项如下所示：

```sh
./clang_wrapper.sh -kotoamatsukami {obfuscation_options} <input_file> -o <output_file>
```

-   `<input_file>`：你要混淆的源代码文件路径（例如，`my_program.c`）。
-   `-o <output_file>`：输出可执行文件的路径（例如，`my_program`）。
-   `{obfuscation_options}`：这是你要应用的混淆 Pass 的空格分隔列表。以下是可用的选项（与提供的代码片段中的内部 Pass 名称匹配）：
    -   **`split-basic-block`**:  拆分代码中的基本块。
    -   **`anti-debug`**: 插入反调试技术。
    -   **`gv-encrypt`**: 加密全局变量。
    -   **`bogus-control-flow`**: 插入虚假控制流来迷惑分析。
    -   **`add-junk-code`**: 添加垃圾代码来增加代码大小和复杂性。
    -   **`loopen`**: 应用基于循环的混淆。
    -   **`for-obs`**: 应用基于 for 循环的混淆。
    -   **`branch2call-32`**: 将分支转换为调用（32 位版本）。
    -   **`branch2call`**: 将分支转换为调用。
    -   **`indirect-call`**: 插入间接函数调用。
    -   **`indirect-branch`**: 插入间接分支。
    -   **`flatten`**:  展平程序的控制流。
    -   **`substitution`**:  使用等效的指令序列替换原指令。

**示例：**

要对名为 `rc4.c` 的文件应用全局变量加密和虚假控制流，并生成名为 `rc4` 的可执行文件，你将使用：

```sh
./clang_wrapper.sh -kotoamatsukami { gv-encrypt bogus-control-flow } ./tests/rc4.c -o ./tests/rc4
```

要仅应用全局变量加密：

```sh
./clang_wrapper.sh -kotoamatsukami { gv-encrypt } ./tests/rc4.c -o ./tests/rc4
```

### 详细信息

你需要在 `/tmp/Kotoamatsukami/Kotoamatsukami.config` 中设置配置文件，其格式如下。

**`0`**: 关闭所有功能（全部禁用）。

**`1`**:  打开所有功能（全部启用）。

**`2`**: 仅启用已启用的功能（保持已启用的功能开启，其他功能不变）。

**`3`**:  启用所有功能，除了那些被明确禁用的功能（启用所有未禁用的功能）。

然后你可以如下使用 `Kotoamatsukami.so`：

```shell
<your-clang-17> -fpass-plugin=<your-Kotoamatsukami_so>
```

`Kotoamatsukami.config`

```json
{
    "target": "X86_64",
    "loopen": {
        "model": 0,
        "enable function": [
            ""
        ],
        "disable function": [],
        "loopen_x_list": [
            2,
            3,
            5,
            8,
            11,
            12,
            13,
            14,
            18,
            20,
            21,
            27,
            30,
            31,
            32,
            34,
            35,
            37,
            38,
            41,
            43,
            44,
            45,
            46,
            48,
            50,
            51,
            52,
            56,
            57,
            66,
            69,
            71,
            72,
            73,
            75,
            77,
            78,
            80,
            84,
            85,
            89,
            91,
            94,
            95,
            97,
            98,
            99,
            103,
            106,
            108,
            110,
            113,
            115,
            116,
            120,
            124,
            125,
            126,
            128,
            130,
            134,
            136,
            137,
            140,
            141,
            147,
            148,
            152,
            157,
            158,
            159,
            162,
            163,
            164,
            165,
            167,
            172,
            173,
            174,
            176,
            180,
            184,
            187,
            189,
            192,
            195,
            197,
            199,
            200,
            201,
            202,
            204,
            209,
            210,
            214,
            217,
            218,
            221,
            222,
            224,
            227,
            228,
            233,
            235,
            236,
            237,
            238,
            239,
            241,
            242,
            243,
            244,
            245,
            246,
            247,
            249,
            253,
            254,
            257,
            258,
            259,
            261,
            262,
            263,
            264,
            266,
            270,
            275,
            276,
            278,
            279,
            284,
            286,
            287,
            288,
            290,
            292,
            293,
            298,
            299,
            300,
            301,
            303,
            306,
            307,
            308,
            310,
            311,
            312,
            315,
            320,
            322,
            325,
            327,
            333,
            335,
            336,
            337,
            338,
            340,
            342,
            347,
            350,
            353,
            354,
            356,
            357,
            363,
            364,
            366,
            369,
            370,
            373,
            376,
            379,
            380,
            382,
            386,
            387,
            388,
            392,
            393,
            395,
            396,
            397,
            399,
            405,
            410,
            412,
            414,
            415,
            417,
            421,
            422,
            424,
            426,
            429,
            430,
            432,
            433,
            435,
            438,
            440,
            443,
            446,
            447,
            450,
            453,
            458,
            459,
            460,
            462,
            464,
            465,
            467,
            468,
            479,
            480,
            483,
            493,
            496,
            497,
            499,
            500,
            502,
            504,
            505,
            507,
            509,
            510,
            511,
            512
        ],
        "module_name": "/home/zzzccc/cxzz/Kotoamatsukami/config/quick_pow.ll"
    },
    "ForObs": {
        "model": 0,
        "enable function": [
            ""
        ],
        "disable function": [
            ""
        ]
    },
    "SplitBasicBlocks": {
        "model": 0,
        "enable function": [
            ""
        ],
        "disable function": [],
        "split number": 3
    },
    "branch2call": {
        "model": 0,
        "enable function": [
            ""

        ],
        "disable function": [
            ""
        ],
        "split number": 3
    },
    "branch2call_32": {
        "model": 0,
        "enable function": [
            ""

        ],
        "disable function": [
            ""
        ],
        "split number": 3
    },
    "Junkcode": {
        "model": 0,
        "enable function": [
            ""
        ],
        "disable function": [
            ""
        ]
    },
        "Antihook": {
        "model": 0,
        "enable function": [
            ""
        ],
        "disable function": [
            ""
        ]
    },
    "Antidebug": {
        "model": 1,
        "enable function": [
            ""
        ],
        "disable function": [
            ""
        ]
    },
    "indirect_branch": {
        "model": 0,
        "enable function": [
            ""
        ],
        "disable function": [
            ""
        ]
    },
    "indirect_call": {
        "model": 0,
        "enable function": [
            ""
        ],
        "disable function": [
            ""
        ]
    },
    "bogus_control_flow": {
        "model": 0,
        "enable function": [
            ""
        ],
        "disable function": [
            ""
        ]
    },
    "substitution": {
        "model": 0,
        "enable function": [
            ""
        ],
        "disable function": [
            ""
        ]
    },
     "flatten": {
        "model": 0,
        "enable function": [
            ""
        ],
        "disable function": [
            ""
        ]
    },
    "gv_encrypt": {
        "model": 0,
        "enable function": [
            ""
        ],
        "disable function": [
            ""
        ]
    }
}
```

## 测试

```c
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <time.h>

#define MAX_KEY_LENGTH 256

void confuse_key(unsigned char *key, unsigned long key_len) {
    for (unsigned long i = 0; i < key_len; i++) {
        key[i] = key[i] ^(unsigned char)(i % 256);
    }
}

void rc4_ksa(unsigned char *s, unsigned char *key, unsigned long key_len) {
    unsigned char temp;
    unsigned long i, j = 0;
    for (i = 0; i < 256; i++) {
        s[i] = i;
    }
    for (i = 0; i < 256; i++) {
        j = (j + s[i] + key[i % key_len]) % 256;
        temp = s[i];
        s[i] = s[j];
        s[j] = temp;
    }
}

void rc4_prga(unsigned char *s, unsigned char *data, unsigned long data_len) {
    unsigned char temp;
    unsigned long i = 0, j = 0, t;
    
    for (unsigned long k = 0; k < data_len; k++) {
        i = (i + 1) % 256;
        j = (j + s[i]) % 256;
        
        temp = s[i];
        s[i] = s[j];
        s[j] = temp;
        
        t = (s[i] + s[j]) % 256;
        data[k] ^= s[t];
    }
}

void rc4_encrypt_decrypt(unsigned char *data, unsigned long data_len, unsigned char *key, unsigned long key_len) {
    unsigned char s[256];
    rc4_ksa(s, key, key_len);
    rc4_prga(s, data, data_len);
}

unsigned char data[512];
int main() {
    unsigned char key[MAX_KEY_LENGTH];
    
    char input[512];
    unsigned long key_len, data_len;

    printf("请输入密钥（最多 256 个字符）：");
    fgets(input, sizeof(input), stdin);
    
    key_len = strlen(input) - 1;
    memcpy(key, input, key_len);
    confuse_key(key, key_len);
    printf("请输入需要加密的数据：");
    fgets(input, sizeof(input), stdin);
    data_len = strlen(input) - 1;
    memcpy(data, input, data_len);
    printf("\n加密前的数据：%s\n", data);
    rc4_encrypt_decrypt(data, data_len, key, key_len);
    printf("加密后的数据：");
    for (unsigned long i = 0; i < data_len; i++) {
        printf("%02x ", data[i]);
    }
    printf("\n");
    rc4_encrypt_decrypt(data, data_len, key, key_len);
    printf("解密后的数据：%s\n", data);

    return 0;
}
```
