#include <stdio.h>
#include <signal.h>
#include <stdlib.h>
#include <unistd.h> 
void alarmHandler(int sig)
{
    printf("don't debug me\n");
    exit(1);
}

void __attribute__((constructor)) setupSig(void)  // 添加了空格
{
    signal(SIGALRM, alarmHandler);
    alarm(3);  // 设置定时器 3秒
}

int main(int argc, char *argv[])
{
    getchar();  // 等待用户输入
    puts("hello!");
    puts("hello!");
    puts("hello!");
    return 0;
}
