#include <stdlib.h>
#include <math.h>
#include <omp.h>

float error(float *C1, float *C2, size_t N)
{
    size_t i, j;
    double err = 0;
    double nrm = 0;
    
    for(i=0;i<N;i++)
    {
        for(j=0;j<N;j++)
        {
            nrm += pow(abs((double) C2[i*N + j]), 2);
            err += pow(abs(((double) C1[i*N + j]) - ((double) C2[i*N + j])), 2);
        }
    }
    return sqrt(err)/sqrt(nrm);
}

void rand_mat(size_t m, size_t n, float* mat, float max) 
{
    size_t i,j;
    #pragma omp parallel for private(i,j)
    for(i = 0; i<m; i++)
        for(j = 0; j<n; j++)
            mat[i*n+j] = ((float)rand()/RAND_MAX) * max;
}

int max(size_t arr[], size_t size) {
    size_t i;
    int maxValue = arr[0];

    for (i = 1; i < size; ++i) {
        if ( arr[i] > maxValue ) {
            maxValue = arr[i];
        }
    }
    return maxValue;
}
