#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <omp.h>
#include "gemm_collection.h"
#include "utils.h"


int main(int argc, char** argv) 
{ 
    size_t Ns[] = {10, 50, 100, 500, 1000, 5000, 10000, 12000};
    size_t Nmax, N;
    size_t i, size;
    struct timeval timecheck;
    long start, end;
    float *A, *B, *C;
    FILE *fpt;
    int nb_th;

    nb_th = 4;
    omp_set_num_threads(nb_th);

    size = sizeof(Ns)/sizeof(Ns[0]);
    Nmax = max(Ns, size);

    A = (float*) calloc(Nmax*Nmax, sizeof(float));
    rand_mat(Nmax, Nmax, A, 1);
    B = (float*) calloc(Nmax*Nmax, sizeof(float));
    rand_mat(Nmax, Nmax, B, 1);
    C = (float*) calloc(Nmax*Nmax, sizeof(float));

    fpt = fopen("gpu_vs_cpu.csv", "w+");

    for (i=0; i<size; i++) {
        N = Ns[i];
        fprintf(fpt, "%i, ", N);

        gettimeofday(&timecheck, NULL);
        start = (long)timecheck.tv_sec * 1000 + (long)timecheck.tv_usec / 1000;
        gemm_cpu(N,N,N,1.,A,Nmax,B,Nmax,0.,nb_th,C,Nmax);
        gettimeofday(&timecheck, NULL);
        end = (long)timecheck.tv_sec * 1000 + (long)timecheck.tv_usec / 1000;
        fprintf(fpt, "%ld, ", (end - start));

        gettimeofday(&timecheck, NULL);
        start = (long)timecheck.tv_sec * 1000 + (long)timecheck.tv_usec / 1000;
        gemm_gpu(N,N,N,1.,A,Nmax,B,Nmax,0.,C,Nmax);
        gettimeofday(&timecheck, NULL);
        end = (long)timecheck.tv_sec * 1000 + (long)timecheck.tv_usec / 1000;
        fprintf(fpt, "%ld\n", (end - start));
    }

    fclose(fpt);

    system("python3 gpu_vs_cpu.py");

    return 0;
}
