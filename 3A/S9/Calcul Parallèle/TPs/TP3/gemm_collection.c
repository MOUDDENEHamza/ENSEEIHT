#include <stdio.h>
#include <omp.h>
#include <cublas_v2.h>
#include <cuda.h>
#include <cuda_runtime.h>
#include <cblas.h>
#include "utils.h"

#define MIN(x, y) (((x) < (y)) ? (x) : (y))

void gemm_seq(size_t M, size_t N, size_t K, float alpha, float *A,
              size_t lda, float *B, size_t ldb, float beta, float *C,
              size_t ldc) {
    cblas_sgemm(CblasColMajor, CblasNoTrans, CblasNoTrans, M,
                N, K, alpha, A, lda, B, ldb, beta, C, ldc);
}


void gemm_cpu(size_t M, size_t N, size_t K, float alpha, float *A,
              size_t lda, float *B, size_t ldb, float beta, int nb_th,
              float *C, size_t ldc) {

    int th;         // Thread id number
    int nb_col;     // Number of columns in a block column
    int firstcol;   // Index of the first column of the current block column
    
    #pragma omp parallel private(th, firstcol, nb_col) 
    {
      // TODO: Separate the GEMM work between the available OMP threads
      th = omp_get_thread_num();
      nb_col = ((N - 1) / nb_th) + 1;
      firstcol = nb_col * th;
      cblas_sgemm(CblasColMajor, CblasNoTrans, CblasNoTrans, M,
                  MIN(nb_col, N - firstcol), // TODO: To replace
                  K, alpha, A, lda,
                  &B[K * firstcol], // TODO: To replace
                  ldb, beta,
                  &C[K * firstcol], // TODO: To replace
                  ldc); 
    }
}


void gemm_gpu(size_t M, size_t N, size_t K, float alpha, float *A,
              size_t lda, float *B, size_t ldb, float beta, float *C,
              size_t ldc) {
    int ierr;
    cublasHandle_t handle;

    cublasCreate(&handle);

    // TODO: Send/Retrieve the data on the GPU
    ierr = cublasSgemm(handle,CUBLAS_OP_N, CUBLAS_OP_N, M, N, K, &alpha, A,
                       M, B, K, &beta, C, M);
    if(ierr != CUBLAS_STATUS_SUCCESS)
    {
       printf( "failed %d %f.\n", ierr, C[0]);
       exit(1);
    } 
    // TODO (Optional): Deallocate data on the GPU

    cublasDestroy(handle);
}


void gemm_gpu_cpu(size_t M, size_t N, size_t K, float alpha, float *A,
              size_t lda, float *B, size_t ldb, float beta, int nb_th,
              int per, float *C, size_t ldc) {

    size_t nb_col_gpu ; // = ? TODO // Number of column for the GPU block
    size_t nb_col_cpu ; // = ? TODO // Number of column for the CPU block

    // TODO: Separate the GEMM work such that the GPU compute a percentage 
    // "per" of the GEMM and the CPU threads compute the remaining 
    
    // IF (I AM THE 0th THREAD) THEN
    //      I COMPUTE THE GPU WORKLOAD
    // ELSE
    //      I COMPUTE A PART OF THE CPU WORKLOAD
    // ENDIF

    cblas_sgemm(CblasColMajor, CblasNoTrans, CblasNoTrans, M,   \
                N, K, alpha, A, lda, &B[0], ldb,           \
                beta, &C[0], ldc); 
}

