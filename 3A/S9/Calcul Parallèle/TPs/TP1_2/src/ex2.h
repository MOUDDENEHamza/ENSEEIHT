#ifndef EXO_2_H
#define EXO_2_H
void bcast_A(int p, int q, Matrix *A, int i, int l, MPI_Comm row_comm);
void bcast_B(int p, int q, Matrix *B, int l, int j, MPI_Comm col_comm);
#endif
