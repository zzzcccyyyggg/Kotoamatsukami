#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <time.h>

#define MAX_KEY_LENGTH 256

// 混淆函数: 用于增强 RC4 密钥流生成过程
void confuse_key(unsigned char *key, unsigned long key_len) {
    for (unsigned long i = 0; i < key_len; i++) {
        key[i] = key[i] ^(unsigned char)(i % 256);
    }
    // printf("aaaa");
}

// RC4 密钥调度算法 (KSA)
void rc4_ksa(unsigned char *s, unsigned char *key, unsigned long key_len) {
    unsigned char temp;
    unsigned long i, j = 0;
    // printf("aaaaaaaaaaaaaaa");
    // 初始化状态向量 s
    for (i = 0; i < 256; i++) {
        // printf("%d",i);
        s[i] = i;
    }
    // printf("aaaaaaaaaaaaaaa");
    // 生成密钥流
    for (i = 0; i < 256; i++) {
        // printf("%d",i);
        j = (j + s[i] + key[i % key_len]) % 256;
        temp = s[i];
        s[i] = s[j];
        s[j] = temp;
    }
}

// RC4 伪随机生成算法 (PRGA)
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
        data[k] ^= s[t];  // XOR 数据
    }
}

// 输入数据和密钥，进行 RC4 加密/解密
void rc4_encrypt_decrypt(unsigned char *data, unsigned long data_len, unsigned char *key, unsigned long key_len) {
    unsigned char s[256];
    
    // 调用 KSA 算法初始化
    rc4_ksa(s, key, key_len);
    
    // 调用 PRGA 算法加密/解密数据
    rc4_prga(s, data, data_len);
}
unsigned char data[512];
int main() {
    // srand(time(NULL));  // 用当前时间作为种子初始化随机数发生器

    unsigned char key[MAX_KEY_LENGTH];
    
    char input[512];
    unsigned long key_len, data_len;

    // 用户输入密钥
    printf("请输入密钥（最多 256 个字符）：");
    fgets(input, sizeof(input), stdin);
    
    key_len = strlen(input) - 1; // 删除最后的换行符
    memcpy(key, input, key_len);
    // 混淆密钥，增加密钥的复杂性
    confuse_key(key, key_len);
    // 用户输入数据
    printf("请输入需要加密的数据：");
    fgets(input, sizeof(input), stdin);
    
    data_len = strlen(input) - 1; // 删除最后的换行符
    memcpy(data, input, data_len);
    
    // 加密数据
    printf("\n加密前的数据：%s\n", data);
    // printf("input len %d\n",strlen(data));
    rc4_encrypt_decrypt(data, data_len, key, key_len);
    printf("加密后的数据：");
    for (unsigned long i = 0; i < data_len; i++) {
        printf("%02x ", data[i]);
    }
    printf("\n");
    
    // 解密数据
    rc4_encrypt_decrypt(data, data_len, key, key_len);
    printf("解密后的数据：%s\n", data);

    return 0;
}
