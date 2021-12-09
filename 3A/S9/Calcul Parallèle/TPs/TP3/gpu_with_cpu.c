#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <omp.h>
#include "gemm_collection.h"
#include "utils.h"

int main(int argc, char** argv) 
{
    size_t N = 12000;
    int pers[] = {10, 20, 30, 40, 50, 60, 70, 80, 90, 100};
    int per;
    size_t i, size;
    struct timeval timecheck;
    long start, end;
    float *A, *B, *C;
    FILE *fpt;
    int nb_th;

    nb_th = 4;
    omp_set_num_threads(nb_th);

    size = sizeof(pers)/sizeof(pers[0]);

    A = (float*) calloc(N*N, sizeof(float));
    rand_mat(N, N, A, 1);
    B = (float*) calloc(N*N, sizeof(float));
    rand_mat(N, N, B, 1);
    C = (float*) calloc(N*N, sizeof(float));

    fpt = fopen("gpu_with_cpu.csv", "w+");
    
    // One first call to remove the overcost or init and data transfer
    gemm_gpu_cpu(N,N,N,1.,A,N,B,N,0.,nb_th,pers[size-1],C,N);

    for (i=0; i<size; i++) {
        per = pers[i];
        fprintf(fpt, "%i, ", per);

        gettimeofday(&timecheck, NULL);
        start = (long)timecheck.tv_sec * 1000 + (long)timecheck.tv_usec / 1000;
        gemm_gpu_cpu(N,N,N,1.,A,N,B,N,0.,nb_th,per,C,N);
        gettimeofday(&timecheck, NULL);
        end = (long)timecheck.tv_sec * 1000 + (long)timecheck.tv_usec / 1000;
        fprintf(fpt, "%ld\n", (end - start));
    }

    fclose(fpt);

    system("python3 gpu_with_cpu.py");

    return 0;
}
