typedef struct infostruct{
  int     B;     // The size of block-columns
  int     NB;    // The number of block-columns in a matrix
  int     N;     // The total size of the matrix N=B*NB
  int    *ipiv;  // Permutation vector for numerical pivoting
} info_type;


typedef double** Matrix;

/* typedef struct matstruct{ */
  /* double  **BC;  // Permutation vector for numerical pivoting */
/* } Matrix; */


typedef enum {PNL = 0, UPD, END, NONE} Type;

void dgetrf_(int *m, int *n, double *a, int *lda, int *ipiv, int *info);
void dtrsm_(char *side, char *uplo, char *transa, char *diag, 
            int *m, int *n, const double *alpha, const double *A, int *lda, 
            double *B, int *ldb);
void dlaswp_(int *n, double * a, int *lda, int *k1, int *k2, int *ipiv, int *incx);
void dlarnv_(int *idist, int *iseed, int *n, double *x);
void dgetrs_(char *t, int *n, int *nrhs, double *A, int *lda, int *ipiv, double *x, int *incx, int *info);
void dgemv_(char *t, int *m, int *n, const double *alpha, const double *A, int *lda, const double *x, int *incx, const double *beta, double *y, int *incy);
double dnrm2_c(int n, double *x, int incx);
double dnrmf_c(int m, int n, double *A, int lda);

void dgemm_(char *ta, char *tb, int *m, int *n, int *k, const double *alpha, const double *A, int *lda, const double *B, int *ldB, const double *beta,  const double *c, int *ldc);

void panel(double *P, int k, info_type info );
void update(double *P, double *U, int k, int j, info_type info);
void backperm(Matrix A, info_type info);
void checkres(double *A, double *Acpy, info_type info);

long usecs ();


void lu_seq      (Matrix A, info_type info);
void lu_par_loop (Matrix A, info_type info);
void lu_par_dag  (Matrix A, info_type info);
