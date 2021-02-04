#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <string.h>
#include <math.h>
#include "omp.h"
#include "treetrav.h"

long usecs (){
  struct timeval t;

  gettimeofday(&t,NULL);
  return t.tv_sec*1000000+t.tv_usec;
}



int main(int argc, char **argv){

  int l, nth, i;
  TreeNode *root;
  long    t_start, t_end, save;


  if(argc!=3){
    printf("Wrong number of arguments.\n Usage:\n\n\
./main l nthreads\n\n where l is the number of levels\n\
and nthreads is the number of threads to use in the parallel code.\n");
    return 1;
  }


  l     = atoi(argv[1]);    /* levels in the tree    */
  nth   = atoi(argv[2]);    /* the number of threads */


  treeinit(&root, l, 0);
  printf("\n\nSequential tree traversal\n");
  t_start = usecs();
  /* Do the sequential tree traversal */
  treetraverse_seq(root);
  t_end = usecs();
  printf("root->v : %ld\n",root->v);
  printf("time    : %8.2f msec.\n",((double)t_end-t_start)/1000.0);
  printf("counts: ");
  for(i=0; i<nth; i++){
    printf("%d  ",countnodes[i]);
  }
  save = root->v;
  
  /* Destroy and reinit the tree */
  treedestroy(root);
  treeinit(&root, l, 0);

  printf("\n\nParallel tree traversal with %2d threads\n",nth);
  t_start = usecs();
  /* Do the parallel tree traversal */
  treetraverse_par(root, nth);
  t_end = usecs();
  printf("root->v : %ld\n",root->v);
  printf("time    : %8.2f msec.\n",((double)t_end-t_start)/1000.0);
  printf("counts: ");
  for(i=0; i<nth; i++){
    printf("%d  ",countnodes[i]);
  }
  printf("\n");

  /* Destroy the tree */
  treedestroy(root);

  /* Check correctness */
  if(root->v != save){
    printf("\nERROR: The computed value is not correct!!!  Seq=%ld != Par=%ld\n",
           save,root->v);
  } else {
    printf("\nThe result is correct\n");
  }

  return 0;
}
