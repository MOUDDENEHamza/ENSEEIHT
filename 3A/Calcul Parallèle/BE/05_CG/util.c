#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <ctype.h>
#include <string.h>

#include "util.h"

void multAv(double x[], double *A, double y[], int m, int n){

  for(int i = 0; i < m; i++){
    x[i] = 0.0;
    for(int j = 0; j < n; j++){
      x[i] += A[i*n + j] * y[j];
    }
  }
  return;
}

void copy_v(double x[], double y[], int n){

  for(int i = 0; i < n; i++){
    x[i] = y[i];
  }

  return;
}

double dot(double x[], double y[], int n){
  double res = 0.0;

  for(int i = 0; i < n; i++){
    res += x[i]*y[i];
  }

  return res;
}

void axpy(double a, double x[], double y[], int n){

  for(int i = 0; i < n; i++){
    x[i] = x[i] + a*y[i];
  }

  return;
}

void xpay(double a, double x[], double y[], int n){

  for(int i = 0; i < n; i++){
    y[i] = x[i] + a*y[i];
  }

  return;
}

int read_A(FILE *f, double *A, int M, int N, int nz){
  int i, j, k;
  double val;
  int error;

  for (i = 0; i < M; i++) {
    for(j = 0; j < N; j++) {
      *(A+i*N+j) = 0.0;
    }
  }

  for (k = 0; k < nz; k++) {
    error = fscanf(f, "%d %d %lg\n", &i, &j, &val);
    if(!error) exit(0);
    //printf("-- %d -- %d -- %lg\n", i, j, val);
    *(A + (i-1)*N + (j-1)) = val;
    // this is a symmetric matrix
    *(A + (j-1)*N + (i-1)) = val;
  }

  /*
  for (k = 0; k < nz; k++) {
    printf("---- %lg\n",  *(A+k));
  }
  */

  return 0;
}

int mm_read_mtx_crd_size(FILE *f, int *M, int *N, int *nz )
{
    char line[MM_MAX_LINE_LENGTH];
    int num_items_read;

    /* set return null parameter values, in case we exit with errors */
    *M = *N = *nz = 0;

    /* now continue scanning until you reach the end-of-comments */
    do 
    {
        if (fgets(line,MM_MAX_LINE_LENGTH,f) == NULL) 
            return MM_PREMATURE_EOF;
    }while (line[0] == '%');

    /* line[] is either blank or has M,N, nz */
    if (sscanf(line, "%d %d %d", M, N, nz) == 3)
        return 0;
        
    else
    do
    { 
        num_items_read = fscanf(f, "%d %d %d", M, N, nz); 
        if (num_items_read == EOF) return MM_PREMATURE_EOF;
    }
    while (num_items_read != 3);

    return 0;
}
