#include <stdio.h>
#include <unistd.h>
#include <sys/ptrace.h>
#include <stdlib.h>
#include <string.h>
#include <signal.h>

void Kotoamatsukami_Antidebug1() {
    if (ptrace(PTRACE_TRACEME, 0, 0, 0) < 0) {
        printf("Debugger detected!\n");
        _exit(1);
    }
    printf("No debugger detected, continuing...\n");
}

void Kotoamatsukami_Antidebug2() {
    pid_t ppid = getppid();
    pid_t sid = getsid(getpid());

    if (sid != ppid) {
        printf("Debugger detected based on session and parent PID mismatch!\n");
        _exit(1);
    } else {
        printf("No debugger detected, continuing...\n");
    }
}

void Kotoamatsukami_Antidebug3() {
    signal(SIGTRAP, SIG_IGN);
    __asm__("nop\n\t"
            "int3\n\t");
    printf("No debugger detected, continuing...\n");
}

void Kotoamatsukami_Antidebug4() {
    const char *last_cmd = getenv("_");
    if (last_cmd == NULL) {
        printf("No previous command found, continuing...\n");
        return;
    }

    if (strcmp(last_cmd, "gdb") == 0 || strcmp(last_cmd, "strace") == 0 || strcmp(last_cmd, "ltrace") == 0) {
        printf("Debugger detected by environment variable!\n");
        _exit(1);
    }

    printf("No debugger detected, continuing...\n");
}

void Kotoamatsukami_Antidebug5() {
    signal(SIGTRAP, SIG_IGN);
    __asm__("nop\n\t"
            "int3\n\t");
    printf("No debugger detected, continuing...\n");
}

void Kotoamatsukami_Antidebug6() {
    if (ptrace(PTRACE_TRACEME, 0, 0, 0) < 0) {
        printf("Debugger detected by ptrace!\n");
        _exit(1);
    }
    printf("No debugger detected, continuing...\n");
}

void Kotoamatsukami_Antidebug7() {
    pid_t ppid = getppid();
    char name[1024];
    char path[256];
    snprintf(path, sizeof(path), "/proc/%d/cmdline", ppid);

    FILE *fp = fopen(path, "r");
    if (fp) {
        fgets(name, sizeof(name), fp);
        fclose(fp);
    }

    if (strstr(name, "gdb") || strstr(name, "strace") || strstr(name, "ltrace")) {
        printf("Debugger detected by parent process!\n");
        _exit(1);
    }

    printf("No debugger detected, continuing...\n");
}
