#ifndef DENSE_MAT_FNCT_H
#define DENSE_MAT_FNCT_H

typedef struct Blocks {
	float* c; 	     // The Content of the block stored in an array.
			     // This pointer is only meaningful to the owner 
			     // otherwise it is NULL.
			     // Element x_i,j of a given block of size b
 			     // can be accessed as x->c[b*i+j].
	int owner;           // The MPI rank of the owner of this block.
			     // This information is available to all the nodes.
	int row, col;        // owner = row * q + col in a p x q grid.
	MPI_Request request; // The Request can be used when sending the block 
			     // through Immediate Return routines of MPI such as MPI_Irecv
} Block;

typedef struct Matrices {
	int mb, nb, b;       // A given Matrix is of size mb*b x nb*b, b being the
			     // dimension of every of its square blocks i.e.
			     // nb is the number of column blocks, mb the one of row blocks -- oof
	Block** blocks;      // This 2D array describes each block of a given Matrix.
			     // This is meaningful to all the nodes : information on a block A_i,j
			     // from a matrix A can be accessed through the block A->blocks[i][j] from every MPI rank.
} Matrix;

/* dense matrices routines */
// fill matrix a with random values between 0.0 and 10.0
int dsmat_fill(Matrix* a, int m, int n, int b, int p, int q, char* name);
// fill matrix a with values matching the position of the block in the matrix
// i.e. block a_i,j is full of n*(i+1)+(j+1) with a of size m x n
int dsmat_fill_s(Matrix* a, int m, int n, int b, int p, int q, char* name);
// fill matrix a with value value
int dsmat_fill_v(Matrix* a, int m, int n, int b, int p, int q, char* name, float value);
// destroy matrix a
int dsmat_destroy(Matrix* a, char* name);
// scale matrix a by alpha
int dsmat_scal(Matrix* a, float alpha);

/* dense matrices copy */
// copy a[0:m-1,0:n-1] into b[0:m-1,0:n-1]
int block_copy(float * a, float * b, int m, int n);
// print a[0:m-1,0:n-1]
int block_print(float * a, int m, int n, char* name);
// copy matrix B into matrix A
int dsmat_copy(Matrix * A, Matrix * B);
// copy matrix B into matrix A owned only by rank rcv
int dsmat_copy_to(Matrix * A, Matrix * B, int rcv, char* copy, char* copied);

/* gemm generic routines */
// computing C += A:l * Bl: for all blocks of C I own using compute_local_op
// matrices A and B that I do not own are freed from memory using free_local_op
int local_outer_product(float alpha, Matrix* A, Matrix* B, Matrix* C, int l, int p, int q);
// compute C_i,j += A_i,l * B_l,j
// if a given block is missing, the corresponding computation is skipped
int compute_local_op(float alpha, Matrix* A, Matrix* B, Matrix* C, int i, int j, int l);
// free A:l and Bl: from memory is I do not own them
int free_local_op(Matrix* A, Matrix* B, int l, int p, int q);

#endif
