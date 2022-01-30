#ifndef UTILS_H
#define UTILS_H

#include <stdlib.h>

float error(float *C1, float *C2, size_t N);
void rand_mat(size_t m, size_t n, float* mat, float max);
int max(size_t arr[], size_t size);

#endif
