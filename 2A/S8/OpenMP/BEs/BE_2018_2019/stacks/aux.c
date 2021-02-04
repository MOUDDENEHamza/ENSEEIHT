#include "aux.h"

int *stacks_list;
int *stacks_cnts;
int cnt, cnt2;

long usecs (){
  struct timeval t;

  gettimeofday(&t,NULL);
  return t.tv_sec*1000000+t.tv_usec;
}


void mysleep(double sec){

  long s, e;
  s=0; e=0;
  s = usecs();
  while(((double) e-s)/1000000 < sec)
    {
      e = usecs();
    }
  return;
}




void init_stacks(stack_t **stacks, int n){

  int i;

  *stacks = (stack_t*)malloc(n*sizeof(stack_t));
  
  for(i=0; i<n; i++){
    (*stacks)[i].cnt = 0;
    (*stacks)[i].elems = (int*)malloc(MAXELEMS*sizeof(int));
  }

  stacks_list = (int*)malloc(MAXELEMS*sizeof(int));
  stacks_cnts = (int*)malloc(MAXELEMS*sizeof(int));

  for(i=0; i<MAXELEMS; i++){
    stacks_cnts[i] = 0;
    stacks_list[i] = rand()%n;    
  }

  cnt = 0;
  cnt2 = 0;
  
}



void free_stacks(stack_t **stacks, int n){

  int i;
  
  for(i=0; i<n; i++){
    (*stacks)[i].cnt = 0;
    free((*stacks)[i].elems);
  }

  free(*stacks);
  
  free(stacks_list);
  free(stacks_cnts);

  cnt = 0;
  
}


int get_random_stack(){

  int c;

#pragma omp atomic capture
  c = cnt++;
    
  if(c >= MAXELEMS){
    return -1;
  } else {  
    return stacks_list[c];
  }
}


int process(){

  int c;
  
  mysleep(0.0001);

#pragma omp atomic capture
  c = cnt2++;

  return c;

}


void check_result(stack_t *stacks, int n){

  int i, j;
  int *check;
  
  /* for(i=0; i<n; i++){ */
  /*   for(j=0; j<stacks[i].cnt; j++){ */
  /*     if(stacks[i].elems[j] != j){ */
  /*       printf("The result is false\n"); */
  /*       return; */
  /*     } */
  /*   } */

  /*   if(stacks[i].cnt != stacks_cnts[i]){ */
  /*     printf("The result is false\n"); */
  /*     return; */
  /*   } */
  /* } */

  /* for(i=0; i<MAXELEMS; i++) */
  /*   stacks_cnts[stacks_list[i]]--; */

  /* for(i=0; i<n; i++){ */
  /*   if(stacks_cnts[i] != 0){ */
  /*     printf("The result is false\n"); */
  /*     return; */
  /*   } */
  /* } */

  for(i=0; i<n; i++)
    stacks_cnts[i] = stacks[i].cnt;

  for(i=0; i<MAXELEMS; i++)
    stacks_cnts[stacks_list[i]]--;

  for(i=0; i<n; i++){
    if(stacks_cnts[i] != 0){
      printf("The result is false\n");
      return;
    }
  }

  check = (int*)malloc(MAXELEMS*sizeof(int));
  for(i=0; i<MAXELEMS; i++)
    check[i] = 0;
  
  for(i=0; i<n; i++)
    for(j=0; j<stacks[i].cnt; j++)
      check[stacks[i].elems[j]] = 1;

  for(i=0; i<MAXELEMS; i++)
    if(check[i] != 1){
      free(check);
      printf("The result is false\n");
      return;
    }

  
  free(check);
  printf("The result is correct!!!\n");
  
}

