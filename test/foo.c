#include <stdio.h>

typedef struct {
    int some_data;
    // Add other fields as necessary
} gd_t;

#define DECLARE_GLOBAL_DATA_PTR register volatile gd_t *gd asm ("rax")

int main() {
    DECLARE_GLOBAL_DATA_PTR;
    // Initialize gd and use it in your code
    gd_t global_data;
    gd = &global_data;
    gd->some_data = 42;
    for(int i = 0;i<=10;i++){
        gd->some_data += 1;
    }
    
    printf("Global data: %d\n", gd->some_data);
    return 0;
}
