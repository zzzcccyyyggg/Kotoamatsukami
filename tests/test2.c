#include <stdio.h>

// 函数声明
int calculateSum(int x, int y);
void printResult(int result);

int main() {
    int a = 0;
    int b = 4;
    int c = 2;
    int sum = 0;

    // 将b的值赋给a
    a = b;

    // 检查a的值并根据不同的情况输出不同的信息
    if (a > 0) {
        printf("Node 1: a is greater than 0\n");

        // 使用循环来增加sum的值
        for (int i = 1; i <= a; i++) {
            sum += i;
            printf("Adding %d to sum, current sum: %d\n", i, sum);
        }

        // 计算另一个数值并进行条件判断
        if (sum > 10) {
            printf("Node 2: Sum is greater than 10\n");
        } else {
            printf("Node 3: Sum is less than or equal to 10\n");
        }
    } else {
        printf("Node 4: a is not greater than 0\n");
    }

    // 调用函数计算另一个值
    int result = calculateSum(a, c);
    printResult(result);

    return 0;
}

// 计算两个整数的和
int calculateSum(int x, int y) {
    return x + y;
}

// 打印结果
void printResult(int result) {
    printf("The result of the calculation is: %d\n", result);
}
