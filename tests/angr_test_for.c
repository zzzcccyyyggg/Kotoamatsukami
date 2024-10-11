#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define USERDEF "SBWLFPIFCZWT"
#define LEN_USERDEF 12

char msg[] =
  "Welcome to the secure system.";

void print_msg() {
  printf("%s", msg);
}

int complex_function(int value, int i) {
#define LAMBDA 3
  if (!('A' <= value && value <= 'Z')) {
    printf("Try again.\n");
    exit(1);
  }
  return ((value - 'A' + (LAMBDA * i)) % ('Z' - 'A' + 1)) + 'A';
}

int main(int argc, char* argv[]) {
  char buffer[13];

  //print_msg();

  printf("Enter the password: ");
  scanf("%12s", buffer);

  for (int i = 0; i < LEN_USERDEF; ++i) {
    buffer[i] = complex_function(buffer[i], i);
  }

  if (strcmp(buffer, USERDEF)) {
    printf("Try again.\n");
  } else {
    printf("Good Job.\n");
  }

  return 0;
}
