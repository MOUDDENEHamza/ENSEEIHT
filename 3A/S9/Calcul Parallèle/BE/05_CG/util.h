#include <ctype.h>

#define MM_MAX_LINE_LENGTH 1025
#define MatrixMarketBanner "%%MatrixMarket"
#define MM_MAX_TOKEN_LENGTH 64
#define MM_PREMATURE_EOF		12

void multAv(double x[], double *A, double y[], int m, int n);

void copy_v(double x[], double y[], int n);

double dot(double x[], double y[], int n);

void axpy(double a, double x[], double y[], int n);

void xpay(double a, double x[], double y[], int n);

int read_A(FILE *f, double *A, int M, int N, int nz);

int mm_read_mtx_crd_size(FILE *f, int *M, int *N, int *nz);

