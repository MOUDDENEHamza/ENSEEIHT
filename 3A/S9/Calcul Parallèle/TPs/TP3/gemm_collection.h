#ifndef GEMM_COLLECTION_H
#define GEMM_COLLECTION_H

#include <stdlib.h>

void gemm_seq(size_t M, size_t N, size_t K, float alpha, float *A, \
              size_t lda, float *B, size_t ldb, float beta, float *C, \
              size_t ldc);
void gemm_cpu(size_t M, size_t N, size_t K, float alpha, float *A, \
              size_t lda, float *B, size_t ldb, float beta, int nb_th, \
              float *C, size_t ldc);
void gemm_gpu(size_t M, size_t N, size_t K, float alpha, float *A, \
              size_t lda, float *B, size_t ldb, float beta, float *C, \
              size_t ldc);
void gemm_gpu_cpu(size_t M, size_t N, size_t K, float alpha, float *A, \
                  size_t lda, float *B, size_t ldb, float beta, int nb_th, \
                  int per, float *C, size_t ldc);

#endif
