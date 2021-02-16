#define MAXELEMS 1000
#include <sys/time.h>
#include <stdio.h>
#include <stdlib.h>

typedef struct stackstruct{
  int cnt;
  int *elems;
} stack_t;


void init_stacks(stack_t **stacks, int n);

void free_stacks(stack_t **stacks, int n);


int get_random_stack();
int process();
void check_result(stack_t *stacks, int n);


long usecs ();
void mysleep(double sec);
