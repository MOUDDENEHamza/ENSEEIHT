#include "trace.h"
#include "common.h"
#include <math.h>
#include <omp.h>
#include <stdlib.h>

void panel(double *P, int k, info_type info){

  int m, ld, err, np, i;

  i   = k*info.B;
  np  = info.B;
  m   = info.N-i;
  ld  = info.N;
#if defined(DBG)
  printf("%2d -- panel : %d\n",omp_get_thread_num(),k);
#endif
  trace_event_start(PNL);
  dgetrf_(&m, &np, P+i, &ld, info.ipiv+i, &err);
  trace_event_stop(PNL);
}


void update(double *P, double *U, int k, int j, info_type info){

  int m, mu, nu, np, ld, err, i;
  char NoTran = 'N', Lower='L', Unit='U', Left='L';
  int IONE=1, IMONE=-1, IZERO=0;
  double DONE=(double)1.0, DMONE=-1.0, DZERO=0.0;

  i  = k*info.B;
  np = info.B;
  nu = info.B;

  m   = info.N-i;
  mu  = m-np;
  ld  = info.N;
  
#if defined(DBG)
  printf("%2d -- update: %d %d\n",omp_get_thread_num(),k,j);
#endif
  trace_event_start(UPD);
  dlaswp_(&nu, U+i, &ld, &IONE, &np, info.ipiv+i, &IONE);
  dtrsm_ (&Left, &Lower, &NoTran, &Unit, 
          &np, &nu, 
          &DONE, 
          P+i, &ld,
          U+i, &ld);
  dgemm_ (&NoTran, &NoTran,
          &mu, &nu, &np,
          &DMONE, 
          P+i+np, &ld,
          U+i, &ld,
          &DONE,
          U+i+np, &ld);
  trace_event_stop(UPD);

  return;
}


void backperm(Matrix A, info_type info){

  int i, j, ld, ipb, ipo;
  int IONE=1;

  ld  = info.N;

  trace_event_start(END);
  for(i=info.B; i<info.N; i+=info.B){
    for(j=i; j<info.N; j++)
      info.ipiv[j]+=info.B;
    ipo = i+1;
    ipb = i+info.B;
#pragma omp parallel for
      for(j=0; j<i/info.B; j+=1)
        dlaswp_(&info.B, A[j], &ld, &ipo, &ipb, info.ipiv, &IONE);
  }
  trace_event_stop(END);

  return;
}


void checkres(double *A, double *Acpy, info_type info){

  int     ISEED[4] = {0,0,0,3};
  int     IONE=1;
  char    NoTran = 'N';
  double  DONE=1.0, DMONE=-1.0;
  double  *x, *b;
  int err;
  double  flops, nrm2, nrmf;

  x      = (double *)malloc(info.N*sizeof(double));
  b      = (double *)malloc(info.N*sizeof(double));


  dlarnv_(&IONE, ISEED, &info.N,  b);
  memcpy( x, b, info.N*sizeof(double) );

  dgetrs_(&NoTran, &(info.N), &IONE, A, &(info.N), info.ipiv, x, &(info.N), &err);

  dgemv_(&NoTran, &info.N, &info.N, &DONE, Acpy, &info.N, x, &IONE, &DMONE, b, &IONE);
  nrm2 = dnrm2_c(info.N, b, IONE);
  nrmf = dnrmf_c(info.N, info.N, Acpy, info.N);
  printf("Residual norm: %e\n",sqrt(info.N)*nrm2/nrmf);

  free(x);
  free(b);

  return;

}
