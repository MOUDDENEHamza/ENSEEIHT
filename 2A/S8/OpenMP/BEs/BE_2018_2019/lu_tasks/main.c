#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <string.h>
#include <math.h>
#include "common.h"




int main(int argc, char **argv){

  int       N, NB, B, NN;
  double    flops, nrm2, nrmf;
  double    *Acpy1, *Acpy2, *x, *b;
  Matrix    A;
  info_type info;
  long      t_start,t_end;
  int       err, nth, i, j;
  int       ISEED[4] = {0,0,0,1};
  int       IONE=1;
  char      NoTran = 'N', *nt;
  double    DONE=1.0, DMONE=-1.0;


  if(argc != 3){
    printf("Usage:\n\n./main B NB\n\nwhere B is the size of block-columns and \n\
NB is the number of block-columns the matrix is made of.\n");
    return 1;
  }
  
  
  B      = atoi(argv[1]);    /* block size */
  NB     = atoi(argv[2]);    /* dimension in blocks */
  N      = B*NB;
  NN     = N*N;

  nt     = getenv("OMP_NUM_THREADS");

  flops  = ((double)2.0*(double) N)*((double) N)*((double) N)/3.0;

  Acpy1  = (double *)malloc(NN*sizeof(double));
  Acpy2  = (double *)malloc(NN*sizeof(double));
  info.ipiv = (int *)malloc(N*sizeof(int));

  dlarnv_(&IONE, ISEED, &NN, Acpy1);
  
  info.B  = B;
  info.NB = NB;
  info.N  = N;
  
  printf("Matrix size: %d\n",N);

  A = (double **)malloc(info.NB*sizeof(double*));
  /* get pointers to block-columns */
  for (j=0; j<info.NB; j+=1)
    A[j] = Acpy2+j*info.B*info.N;
  

  
  printf("\n========== Sequential    (1 threads) ==========\n" );
  memcpy( Acpy2, Acpy1, N*N*sizeof(double) ); 
  t_start = usecs();
  lu_seq(A, info);
  t_end = usecs();
  printf("Time (msec.) : %7.1f\n",(t_end-t_start)/1e3);
  printf("Gflop/s      : %7.1f\n",flops/(t_end-t_start)/1e3);
  checkres(Acpy2, Acpy1, info);



  printf("\n========== Tasks  Parallel (%1s threads) ==========\n",nt);
  memcpy( Acpy2, Acpy1, N*N*sizeof(double) );
  t_start = usecs();
  lu_par_tasks(A, info);
  t_end = usecs();
  printf("Time (msec.) : %7.1f\n",(t_end-t_start)/1e3);
  printf("Gflop/s      : %7.1f\n",flops/(t_end-t_start)/1e3);
  checkres(Acpy2, Acpy1, info);


  
  return 0;


}
