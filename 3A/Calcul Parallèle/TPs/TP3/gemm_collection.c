#include <stdio.h>
#include <omp.h>
#include <cublas_v2.h>
#include <cuda.h>
#include <cuda_runtime.h>
#include <cblas.h>
#include "utils.h"

#define MIN(x, y) (((x) < (y)) ? (x) : (y))

void gemm_seq(size_t M, size_t N, size_t K, float alpha, float *A, \
              size_t lda, float *B, size_t ldb, float beta, float *C, \
              size_t ldc) {
    cblas_sgemm(CblasColMajor, CblasNoTrans, CblasNoTrans, M, \
                N, K, alpha, A, lda, B, ldb, beta, C, ldc);
}


void gemm_cpu(size_t M, size_t N, size_t K, float alpha, float *A, \
              size_t lda, float *B, size_t ldb, float beta, int nb_th, \
              float *C, size_t ldc) {

  int nb_col  ;
  int firstcol;
  int th      ;
    
#pragma omp parallel private(nb_col, firstcol, th)
  {
    th       = omp_get_thread_num();
    nb_col   = (N-1) / nb_th + 1;
    firstcol = th*nb_col;
    nb_col   = MIN(nb_col, N-firstcol);
    
    cblas_sgemm(CblasColMajor, CblasNoTrans, CblasNoTrans, M,           \
                nb_col, K, alpha, A, lda, &B[firstcol*M], ldb,  \
                beta, &C[firstcol*M], ldc);
  }
}


void gemm_gpu(size_t M, size_t N, size_t K, float alpha, float *A, \
              size_t lda, float *B, size_t ldb, float beta, float *C, \
              size_t ldc) {
    int ierr;
    cublasHandle_t handle;

    cublasCreate(&handle);
    #pragma omp target data map(to: A[0:M*K],B[0:K*N]) map(tofrom: C[0:M*N])
    {
    #pragma omp target data use_device_ptr(A,B,C)
    ierr = cublasSgemm(handle,CUBLAS_OP_N, CUBLAS_OP_N, M, N, K, &alpha, A, \
                       M, B, K, &beta, C, M);
    }
    if(ierr != CUBLAS_STATUS_SUCCESS)
    {
       printf( "failed %d %f.\n", ierr, C[0]);
       exit(1);
    } 
    //#pragma omp target exit data map(delete: A[0:M*K],B[0:K*N],C[0:M*N])

    cublasDestroy(handle);
}


void gemm_gpu_cpu(size_t M, size_t N, size_t K, float alpha, float *A, \
              size_t lda, float *B, size_t ldb, float beta, int nb_th, \
              int per, float *C, size_t ldc) {

  size_t N_gpu = N * per / 100;
  size_t N_cpu = N - N_gpu;
  size_t nb_col;
  int th, firstcol;

  
#pragma omp parallel private(th, firstcol, nb_col)
  {

    th = omp_get_thread_num();

    if(th == 0) {
      
        gemm_gpu(M, N_gpu, K, alpha, A, lda, B, ldb, beta, C, ldc);
    
    } else {

      if(N_cpu!=0 ) {
        nb_col   = (N_cpu-1) / (nb_th - 1) + 1;
        firstcol = (th-1)*nb_col;
        nb_col   = MIN(nb_col, N_cpu-firstcol);
        firstcol = firstcol + N_gpu;
         
        cblas_sgemm(CblasColMajor, CblasNoTrans, CblasNoTrans, M,   \
                    nb_col, K, alpha, A, lda,                       \
                    &B[firstcol*M], ldb, beta,                      \
                    &C[firstcol*M], ldc);
      }
    }
  }
}

