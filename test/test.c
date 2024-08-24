#include <stdio.h>

// 快速幂实现：计算 (base^exp) % mod
unsigned long long quick_pow(unsigned long long base, unsigned long long exp, unsigned long long mod) {
    unsigned long long result = 1;  // 初始结果
    base = base % mod;              // 确保 base 在 mod 范围内

    while (exp > 0) {
        // 如果 exp 是奇数，乘以 base
        if (exp % 2 == 1) {
            result = (result * base) % mod;
        }
        // exp 变成偶数，base 平方
        base = (base * base) % mod;
        exp /= 2;  // exp 减半
    }

    return result;
}

int main() {
    unsigned long long exp,base,mod;
    mod = 987654321;
    base = 2;
    // 输入底数、指数和模数
    printf("请输入底数、指数和模数：\n");
    scanf("%d", &exp);
    
    // 调用快速幂函数
    unsigned long long result = quick_pow(base, exp, mod);
    
    if(result = 4){
        printf("success!\n");
    }
    else{
        printf("wrong\n")
    }
    
    return 0;
}
