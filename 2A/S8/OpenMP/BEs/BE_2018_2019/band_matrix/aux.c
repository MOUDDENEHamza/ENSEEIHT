#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <string.h>
#include <math.h>
#include "aux.h"

int     ISEED[4] = {0,0,0,1};
int     IONE=1;
char    NoTran = 'N';
double  DONE=1.0, DMONE=-1.0;
double alpha=1.0, beta=1.0;

void init_data(double **A, double **Ac, double *x, int n, int b){

  int i, j, k, nbnb;


  for(i=0; i<n; i++)
    x[i] = ((double)rand())/((double)RAND_MAX);
  
  for(i=0; i<n; i++)
    for(j=0; j<n; j++){
      if(abs(i-j)<=b){
        A[i][j] = ((double)rand())/((double)RAND_MAX);
      } else {
        A[i][j] = 0.0;
      }
    }
  
  for(j=0; j<n; j++){
    for(i=j-b; i<j+b+1; i++){
      if(i<0 || i>=n) {
        Ac[i-j+b][j] = 0.0;
      } else {
        Ac[i-j+b][j] = A[i][j];
      }
    }
  }

  /* for(i=0; i<n; i++){ */
  /*   for(j=0; j<n; j++){ */
  /*     printf("%.6f ",A[i][j]); */
  /*   } */
  /*   printf("\n"); */
  /* } */
  
  /* printf("\n"); */
  /* for(i=0; i<2*b+1; i++){ */
  /*   for(j=0; j<n; j++){ */
  /*     printf("%.6f ",Ac[i][j]); */
  /*   } */
  /*   printf("\n"); */
  /* } */
  /* printf("\n"); */
  
  /* for(i=0; i<n; i++) */
  /*   printf("%.6f\n",x[i]); */
  /* printf("\n"); */

}






void check_result(double *y1, double *y2, int n){

  int i;
  double mxdif, mx;

  mx = 0.0;
  mxdif = 0.0;
  
  for(i=0; i<n; i++){
    if(abs(y1[i])>mx)
      mx = abs(y1[i]);
    if(abs(y1[i]-y2[i])>mxdif)
      mxdif = abs(y1[i]-y2[i]);
  }

  if(mxdif/mx>1e-10){
    printf("!!! Result is wrong !!!\n");
  } else {
    printf("Result is correct\n");
  }
  
  return;

  
}



long usecs (){
  struct timeval t;

  gettimeofday(&t,NULL);
  return t.tv_sec*1000000+t.tv_usec;
}
