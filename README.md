# Kotoamatsukami

Kotoamatsukami is an obfuscator based on LLVM-17, utilizing LLVM's new pass to implement plug-in features, for obfuscating multiple languages and platforms.

The name "Kotoamatsukami" is derived from my favorite anime, **Naruto**, which features the best genjutsu in my heart.

I will provide a complete set of related documentation in the future,now you can find the dynamically link files-Kotoamatsukami.so in /bin/build,and the /bin/test contains the different files obsfucated by different methods.

PS:This project is written by myself out of interest, it may not be complete, if you have any questions about this project, please feel free to contact me.

## Obfuscation

The following test file is rc4 encryption algorithm(source file in the end of this readme),the ida view of the original file is as follows:

![image-20241220160418783](https://zzzcccimage1.oss-cn-beijing.aliyuncs.com/img/image-20241220160418783.png)

Currently open obfuscation functions include:

### Loopen

A method to obfuscate control flow of the program

The performance of using Loopen only:

![image-20241220163919762](https://zzzcccimage1.oss-cn-beijing.aliyuncs.com/img/image-20241220163919762.png)

### branch2call

Transform the br to call some function in assembly level,curently only supported X86 and X64.

The performance of using branch2call only:

![image-20241220165753884](https://zzzcccimage1.oss-cn-beijing.aliyuncs.com/img/image-20241220165753884.png)

![image-20241220165741070](https://zzzcccimage1.oss-cn-beijing.aliyuncs.com/img/image-20241220165741070.png)

### ForObs

Add for loop for combating dynamic execution projects such as angr.

The performance of using ForObs only:

![image-20241220170246504](https://zzzcccimage1.oss-cn-beijing.aliyuncs.com/img/image-20241220170246504.png)

![image-20241220170303720](https://zzzcccimage1.oss-cn-beijing.aliyuncs.com/img/image-20241220170303720.png)

### BogusControlFlow

My bogus-control-flow is based on the version of rimao (source code: https://github.com/za233/Polaris-Obfuscator/blob/main/src/llvm/lib/Transforms/Obfuscation/BogusControlFlow2.cpp)
What i have done is to modify the judging conditions from certain to possible , but it's probability
of occurrence is so liitle that it can't happen when the actual program running .And I add a local
viriables to reinforces the illusion that it can be run.

But what I want to do is that make the false block can be real excute on a very low probability.And  if the false block have excuted ,the program will find it and re-execute the true block.But the fake variable in my false block is un-alloced so that it will corrupt.Hope I will have time to finish this in the future.

The performance of using BogusControlFlow only:

![image-20241220205919801](https://zzzcccimage1.oss-cn-beijing.aliyuncs.com/img/image-20241220205919801.png)

### Indirect_branch

This obfuscation method can turn the branch jump to an indirect jump through the register,and each block has a unique key to increase the difficulty crackers' attacks.

The performance of using Indirect_branch only:

![image-20241220205450343](https://zzzcccimage1.oss-cn-beijing.aliyuncs.com/img/image-20241220205450343.png)

### Indirect_call

As the indirect_branch method,this method will turn partial func call to indirect call through register with different keys.

The performance of using Indirect_call only:

![image-20241220205641931](https://zzzcccimage1.oss-cn-beijing.aliyuncs.com/img/image-20241220205641931.png)

### SplitBasicBlock

This is an easy method to split a basic block to multiple.Its purpose is to strengthen other obfuscation algorithms.

For example , the performance of using it and the Loopen:

![image-20241220205724495](https://zzzcccimage1.oss-cn-beijing.aliyuncs.com/img/image-20241220205724495.png)

### AddJunkCode

Add assembly level junk code , currently only support X86 and X64.
The performance of using AddJunkCode only:

![image-20241220164639032](https://zzzcccimage1.oss-cn-beijing.aliyuncs.com/img/image-20241220164639032.png)

### Flatten

This code is adapted from the Pluto project (https://github.com/DreamSoule/ollvm17)
Thanks to the contributions of our predecessors!
The performance of using Flatten only:

![image-20241220211100256](https://zzzcccimage1.oss-cn-beijing.aliyuncs.com/img/image-20241220211100256.png)

### Substitution

This code is adapted from the Pluto project (https://github.com/bluesadi/Pluto)
source file: https://github.com/bluesadi/Pluto/blob/kanxue/Transforms/src/Substitution.cpp
I just adapted it to the LLVM-17 and the LLVM New Pass
Thanks to the contributions of our predecessors!
The performance of using Substitution only:

![image-20241220210934072](https://zzzcccimage1.oss-cn-beijing.aliyuncs.com/img/image-20241220210934072.png)

### GVEncrypt

The method will encrypt partial global virable or global constant with inserting the func-relative dec func in the head of the func,and guard the dec func only excute once through a global virable.May I will add the relative func in the end of the func to enhance secrecy.

The performance of using GVEncrypt only:

![image-20241220212030685](https://zzzcccimage1.oss-cn-beijing.aliyuncs.com/img/image-20241220212030685.png)

### AntiDebug

The method will insert some anti-debugging functions into the program's constructor list to be called when the program starts running:
And I try to make the anti-debugging functions configurable,see code for details.

The performance of using AntiDebug only:

![image-20241220214513409](https://zzzcccimage1.oss-cn-beijing.aliyuncs.com/img/image-20241220214513409.png)

## Test

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

