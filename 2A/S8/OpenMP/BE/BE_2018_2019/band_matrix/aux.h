void init_data(double **A, double **Ac, double *x, int n, int b);
long usecs ();

void dgemm_ (char *TRANSA, char *TRANSB,
             int *M, int *N, int *K,
             double *ALPHA,
             double *A, int *LDA,
             double *B, int *LDB,
             double *BETA,
             double *C, int *LDC);

void dlarnv_(int *idist, int *iseed, int *n, double *x);

void matmul_compact_row(double **A, double *x, double *y, int n, int b);
void matmul_compact_diag(double **A, double *x, double *y, int n, int b);
void matmul(double **A, double *x, double *y, int n);
void check_result(double *y1, double *y2, int n);
