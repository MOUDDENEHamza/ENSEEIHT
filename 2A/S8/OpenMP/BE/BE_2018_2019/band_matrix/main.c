#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <string.h>
#include <math.h>
#include "omp.h"
#include "aux.h"

int main(int argc, char **argv){
  int   n, b, i;
  long  t_start, t_end;
  double **A, **Ac, *x, *y1, *y2, *y3;
  double diff;
  
  // Command line argument: array length
  if ( argc == 3 ) {
    n = atoi(argv[1]);    /* the matrix size */
    b = atoi(argv[2]);    /* the band width */
  } else {
    printf("Usage:\n\n ./main n b\n\nwhere n is the number of blocks in rows and\n");
    printf("columns of the matrix and b the band width.\n");
    return 1;
  }

  printf("\n");
  
  A  = (double**)malloc(n      *sizeof(double*));
  Ac = (double**)malloc((2*b+1)*sizeof(double*));
  x  = (double*) malloc(n      *sizeof(double));
  y1 = (double*) malloc(n      *sizeof(double));
  y2 = (double*) malloc(n      *sizeof(double));
  y3 = (double*) malloc(n      *sizeof(double));

  for(i=0; i<n; i++){
    A[i]  = (double*)malloc(n*sizeof(double));
  }
  
  for(i=0; i<2*b+1; i++){
    Ac[i]  = (double*)malloc(n*sizeof(double));
  }
  
  init_data(A, Ac, x, n, b);

  
  /* Sequential version */
  t_start = usecs();
  matmul(A, x, y1, n);
  t_end = usecs();
  printf("Full matrix.              Time    : %8.2f msec.\n",((double)t_end-t_start)/1000.0);



  /* Parallel with tasks */
  t_start = usecs();
  matmul_compact_row(Ac, x, y2, n, b);
  t_end = usecs();
  printf("Compact by rows.          Time    : %8.2f msec.        ",((double)t_end-t_start)/1000.0);
  /* Comprare the two resulting vectors */
  check_result(y1, y2, n);

  
  /* Parallel with tasks */
  t_start = usecs();
  matmul_compact_diag(Ac, x, y3, n, b);
  t_end = usecs();
  printf("Compact by diagonals.     Time    : %8.2f msec.        ",((double)t_end-t_start)/1000.0);
  check_result(y1, y3, n);

  return 0;
  
}



void matmul(double **A, double *x, double *y, int n){

  int i, j;
  
  for(i=0; i<n; i++){
    y[i] = 0;
    for(j=0; j<n; j++){
      y[i] += A[i][j]*x[j];
    }
  }

  return;
  
}



void matmul_compact_row(double **Ac, double *x, double *y, int n, int b){
  
  int i, j;
  
  for(i=0; i<n; i++)
    y[i] = 0;
  
  for(j=0; j<n; j++){
    for(i=j-b; i<j+b+1; i++){
      if(i>=0 || i<n) {
        y[i] += Ac[i-j+b][j]*x[j];
      }
    }
  }
  
  return;
  
}


void matmul_compact_diag(double **Ac, double *x, double *y, int n, int b){
  
  int i, j;
  
  for(i=0; i<n; i++)
    y[i] = 0;
  
  for(i=0; i<2*b+1; i++)
    for(j=0; j<n; j++)
      if((j-b+i)>=0 && (j-b+i)<n){
        y[j-b+i] += Ac[i][j]*x[j];
      }
    
  return;
  
}



