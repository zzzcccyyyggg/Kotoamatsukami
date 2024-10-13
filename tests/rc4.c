#include <stdio.h>
#include <string.h>
 
int main()
{
    unsigned char s[256] = {0};
    unsigned char k[256] = {0};
    unsigned char temp = 0;
    char key[256] = "X0nB@D";
    char data[512] = {-28,21,-60,-19,-90,47,86,16,-69,19,-21,-83,117,86,-57,-69,-69,-23,-71,-52,2,58,80,-97,54,-112,105,-66,124,66,68,-54,-58,-44,36,92,-46,-71,36,-63,24,-109,-77,-22};
    unsigned long len = strlen(data);
    int i = 0, j = 0, t = 0;
    unsigned long k_len = 0;

    // KSA 算法
    for (i = 0; i < 256; i++) {
        s[i] = i;
        k[i] = key[i % strlen(key)];
    }
    for (i = 0, j = 0; i < 256; i++) {
        j = (j + s[i] + k[i]) % 256;
        temp = s[i];
        s[i] = s[j];
        s[j] = temp;
    }

    // PRNG_XOR 算法
    for (k_len = 0, i = 0, j = 0; k_len < len; k_len++) {
        i = (i + 1) % 256;
        j = (j + s[i]) % 256;
        temp = s[i];
        s[i] = s[j];
        s[j] = temp;
        t = (s[i] + s[j]) % 256;
        data[k_len] ^= s[t];  // XOR操作
    }
    return 0;
}
