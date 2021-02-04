#include "trace.h"
#include "common.h"

/* This is a sequential routine for the LU factorization of a square
   matrix in block-columns */
void lu_seq(Matrix A, info_type info){


  int i, j;

  trace_init();

  for(i=0; i<info.NB; i++){
    /* Do the panel */
    panel(A[i], i, info);
    
    for(j=i+1; j<info.NB; j++){
      /* Do all the correspondint updates */
      update(A[i], A[j], i, j, info);
    }    
  }
  
  /* Do row permutations resulting from the numerical pivoting */
  backperm(A, info);

  trace_dump("trace_seq.svg");

  return;

}

