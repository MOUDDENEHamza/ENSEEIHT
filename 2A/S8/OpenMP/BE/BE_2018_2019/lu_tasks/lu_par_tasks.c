#include "trace.h"
#include "common.h"
#include <omp.h>

/* This is a sequential routine for the LU factorization of a square
   matrix in block-columns */
void lu_par_tasks(Matrix A, info_type info){


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
  /* This operation can be ignored and should be left out of the parallel region */
  backperm(A, info);

  trace_dump("trace_par_tasks.svg");

  return;

}

