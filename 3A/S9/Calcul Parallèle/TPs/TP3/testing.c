#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <omp.h>
#include "gemm_collection.h"
#include "utils.h"

int main(int argc, char** argv) 
{
    size_t N;
    int opt, per_gpu;
    struct timeval timecheck;
    long start, end;
    float *A, *B, *C_seq, *C_cpu, *C_gpu, *C_het;
    int nb_th;

    nb_th = 4;
    omp_set_num_threads(nb_th);

    if (argc != 3 && argc != 4) {
        printf("failed: no good number of argument.\n");
        exit(1);
    } 
    opt = atoi(argv[1]);
    N = atoi(argv[2]);

    A = (float*) calloc(N*N, sizeof(float));
    rand_mat(N, N, A, 1);
    B = (float*) calloc(N*N, sizeof(float));
    rand_mat(N, N, B, 1);
    C_seq = (float*) calloc(N*N, sizeof(float));

    gettimeofday(&timecheck, NULL);
    start = (long)timecheck.tv_sec * 1000 + (long)timecheck.tv_usec / 1000;
    gemm_seq(N,N,N,1.,A,N,B,N,0.,C_seq,N);
    gettimeofday(&timecheck, NULL);
    end = (long)timecheck.tv_sec * 1000 + (long)timecheck.tv_usec / 1000;
    printf("%ld milliseconds elapsed in sequential\n", (end - start));

    if (opt == 1) {
        C_cpu = (float*) calloc(N*N, sizeof(float));

        gettimeofday(&timecheck, NULL);
        start = (long)timecheck.tv_sec * 1000 + (long)timecheck.tv_usec / 1000;
        gemm_cpu(N,N,N,1.,A,N,B,N,0.,nb_th,C_cpu,N);
        gettimeofday(&timecheck, NULL);
        end = (long)timecheck.tv_sec * 1000 + (long)timecheck.tv_usec / 1000;
        printf("%ld milliseconds elapsed in CPU\n", (end - start));

        printf("Error: %e\n", error(C_cpu, C_seq, N));
        free(C_cpu);
    }
    else if (opt == 2) {
        C_gpu = (float*) calloc(N*N, sizeof(float));

        gettimeofday(&timecheck, NULL);
        start = (long)timecheck.tv_sec * 1000 + (long)timecheck.tv_usec / 1000;
        gemm_gpu(N,N,N,1.,A,N,B,N,0.,C_gpu,N);
        gettimeofday(&timecheck, NULL);
        end = (long)timecheck.tv_sec * 1000 + (long)timecheck.tv_usec / 1000;
        printf("%ld milliseconds elapsed in GPU\n", (end - start));

        printf("Error: %e\n", error(C_gpu, C_seq, N));
        free(C_gpu);
    } else if (opt == 3) {
        if (argc != 4) {
            printf("failed: for CPU+GPU the 3rd argument is required.\n");
            exit(1);
        }
        per_gpu = atoi(argv[3]);
        if (per_gpu > 100 || per_gpu < 0) {
            printf("failed: 3rd argument should be a percentage (<100 and >0).\n");
            exit(1);
        }
        C_het = (float*) calloc(N*N, sizeof(float));

        gettimeofday(&timecheck, NULL);
        start = (long)timecheck.tv_sec * 1000 + (long)timecheck.tv_usec / 1000;
        gemm_gpu_cpu(N,N,N,1.,A,N,B,N,0.,nb_th,per_gpu,C_het,N);
        gettimeofday(&timecheck, NULL);
        end = (long)timecheck.tv_sec * 1000 + (long)timecheck.tv_usec / 1000;
        printf("%ld milliseconds elapsed in hetero\n", (end - start));

        printf("Error: %e\n", error(C_het, C_seq, N));
        free(C_het);
    }
    else {
        printf("failed: %i is not an available option \n1: CPU \n2: GPU \n3: CPU+GPU", opt);
        exit(1);
    }

    free(A);
    free(B);
    free(C_seq);

    return 0;
}
