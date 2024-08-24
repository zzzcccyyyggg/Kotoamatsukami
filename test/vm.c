#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Define the number of registers and the instruction set
#define NUM_REGS 16
#define HALT 0
#define LOAD 1
#define MOVE 2
#define ADD 3
#define SUB 4
#define MUL 5
#define DIV 6
#define XOR 7
#define JMP 8
#define IN 9
#define CMP 10
#define JNE 11
#define LOADM 12
#define OUT 13

// Define the virtual machine structure
typedef struct {
    int regs[NUM_REGS]; // The register array
    int *instr; // The instruction array
    int pc; // The program counter
    int flag; // The flag register
    unsigned char *mem; // The stack
} VM;

unsigned char cmps[]={171, 188, 168, 168, 170, 189, 175, 146, 216, 154, 182, 191, 164, 182, 139, 140, 136, 156, 157, 216, 143, 156, 216, 182, 143, 134, 155, 182, 187, 172, 172, 187, 214, 148};

// Create a new virtual machine with a given instruction array and mem size
VM *new_vm(int *instr, int instr_size, int mem_size) {
    VM *vm = malloc(sizeof(VM)); // Allocate memory for the VM
    vm->instr = instr; // Set the instruction array
    vm->pc = 0; // Set the program counter to 0
    vm->flag = 0; // Set the flag register to 0
    vm->mem = malloc(sizeof(int) * mem_size); // Allocate memory for the mem
    memset(vm->mem, 0, mem_size);
    memcpy(vm->mem + 128, cmps, 34);
    return vm;
}

void run_vm(VM *vm) {
    int opcode, reg1, reg2, reg3, imm, addr; // Declare variables for the opcode and the operands
    int running = 1; // Declare a variable for the running state
    while (running) { // Loop while running
        opcode = vm->instr[vm->pc]; // Fetch the opcode from the instruction array
        switch (opcode) { // Switch on the opcode
            case HALT: // If the opcode is HALT
                running = 0; // Set the running state to 0
                break; // Break the switch
            case LOAD: // If the opcode is LOAD
                reg1 = vm->instr[vm->pc + 1]; // Fetch the first register from the instruction array
                imm = vm->instr[vm->pc + 2]; // Fetch the immediate value from the instruction array
                vm->regs[reg1] = imm; // Load the immediate value into the first register
                vm->pc += 3; // Increment the program counter by 3
                break; // Break the switch
            case MOVE: // If the opcode is MOVE
                reg1 = vm->instr[vm->pc + 1]; // Fetch the first register from the instruction array
                reg2 = vm->instr[vm->pc + 2]; // Fetch the second register from the instruction array
                vm->regs[reg2] = vm->regs[reg1]; // MOVE the value of the first register into the second register
                vm->pc += 3; // Increment the program counter by 3
                break; // Break the switch
            case ADD: // If the opcode is ADD
                reg1 = vm->instr[vm->pc + 3]; // Fetch the first register from the instruction array
                reg2 = vm->instr[vm->pc + 2]; // Fetch the second register from the instruction array
                reg3 = vm->instr[vm->pc + 1]; // Fetch the third register from the instruction array
                vm->regs[reg3] = vm->regs[reg1] + vm->regs[reg2]; // Add the values of the first and second registers and store the result in the third register
                vm->pc += 4; // Increment the program counter by 4
                break; // Break the switch
            case SUB: // If the opcode is SUB
                reg1 = vm->instr[vm->pc + 3]; // Fetch the first register from the instruction array
                reg2 = vm->instr[vm->pc + 2]; // Fetch the second register from the instruction array
                reg3 = vm->instr[vm->pc + 1]; // Fetch the third register from the instruction array
                vm->regs[reg3] = vm->regs[reg1] - vm->regs[reg2]; // Subtract the value of the second register from the first register and store the result in the third register
                vm->pc += 4; // Increment the program counter by 4
                break; // Break the switch
            case MUL: // If the opcode is MUL
                reg1 = vm->instr[vm->pc + 3]; // Fetch the first register from the instruction array
                reg2 = vm->instr[vm->pc + 2]; // Fetch the second register from the instruction array
                reg3 = vm->instr[vm->pc + 1]; // Fetch the third register from the instruction array
                vm->regs[reg3] = vm->regs[reg1] * vm->regs[reg2]; // Multiply the values of the first and second registers and store the result in the third register
                vm->pc += 4; // Increment the program counter by 4
                break; // Break the switch
            case DIV: // If the opcode is DIV
                reg1 = vm->instr[vm->pc + 3]; // Fetch the first register from the instruction array
                reg2 = vm->instr[vm->pc + 2]; // Fetch the second register from the instruction array
                reg3 = vm->instr[vm->pc + 1]; // Fetch the third register from the instruction array
                vm->regs[reg3] = vm->regs[reg1] / vm->regs[reg2]; // Divide the value of the first register by the value of the second register and store the result in the third register
                vm->pc += 4; // Increment the program counter by 4
                break; // Break the switch
            case XOR: // If the opcode is XOR
                reg1 = vm->instr[vm->pc + 3]; // Fetch the first register from the instruction array
                reg2 = vm->instr[vm->pc + 2]; // Fetch the second register from the instruction array
                reg3 = vm->instr[vm->pc + 1]; // Fetch the third register from the instruction array
                vm->regs[reg3] = vm->regs[reg1] ^ vm->regs[reg2]; // XOR the values of the first and second registers and store the result in the third register
                vm->pc += 4; // Increment the program counter by 4
                break; // Break the switch
            case JMP: // If the opcode is JMP
                imm = vm->instr[vm->pc + 1]; // Fetch the immediate value from the instruction array
                vm->pc = imm; // Set the program counter to the immediate value
                break; // Break the switch
            case IN: // If the opcode is IN
                addr = vm->instr[vm->pc + 1]; // Fetch the memory address from the instruction array
                fgets(vm->mem + addr, 256, stdin); // Read a string from the standard input and store it in the memory starting from the address
                vm->pc += 2; // Increment the program counter by 2
                break; // Break the switch
            case CMP: // If the opcode is CMP
                reg1 = vm->instr[vm->pc + 1]; // Fetch the first register from the instruction array
                reg2 = vm->instr[vm->pc + 2]; // Fetch the second register from the instruction array
                vm->flag = vm->regs[reg1] == vm->regs[reg2]; // Compare the values of the first and second registers and store the result in the flag register
                vm->pc += 3; // Increment the program counter by 3
                break; // Break the switch
            case JNE:
                if(!vm->flag) 
                    vm->pc = vm->instr[vm->pc + 1];
                else vm->pc += 2;
                break;
            case LOADM:  // ld r1,[r2]
                reg1 = vm->instr[vm->pc + 1];
                reg2 = vm->instr[vm->pc + 2];
                addr = vm->regs[reg2];
                vm->regs[reg1] = vm->mem[addr];
                vm->pc += 3;
                break;
            case OUT:
                if(vm->instr[vm->pc + 1]){
                    printf("righhhhhhhhht!\n");
                }
                else{
                    printf("wronnnnnnnnng!\n");
                }
                vm->pc+=1;
                break;
            default: // If the opcode is invalid
                printf("Invalid opcode: %d\n", opcode); // Print an error message
                exit(1); // Exit the program with an error code
        }
    }
}

int prog[] = {
    IN, 0,
    LOAD, 0, 0,
    LOAD, 1, 128,
    LOAD, 13, 34,
    LOAD, 14, 1,
    LOAD, 15, 233,
    LOADM, 2, 0,
    XOR, 3, 2, 15,
    LOADM, 4, 1,
    CMP, 4, 3,
    JNE, 48,
    ADD, 0, 0, 14,
    ADD, 1, 1, 14,
    CMP, 0, 13,
    JNE, 17,
    OUT, 1,
    HALT,
    OUT, 0,
    HALT
};

int main()
{
    VM* vm=new_vm(prog,sizeof(prog)/4,256);
    run_vm(vm);
}