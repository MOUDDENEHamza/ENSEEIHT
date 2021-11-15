#include <stdio.h>
#include <stdlib.h>
#include <mpi.h>
#include <cblas.h>
#include "utils.h"
#include "dsmat.h"
#include "gemms.h"

void p2p_transmit_A(int p, int q, Matrix *A, int i, int l) {
    int j;
    int me, my_row, my_col;
    MPI_Status status;

    MPI_Comm_rank(MPI_COMM_WORLD, &me);
    node_coordinates_2i(p,q,me,&my_row,&my_col);

    Block *Ail;
    int node, tag, b;
    Ail =  & A->blocks[i][l];
    b = A->b;
    /* TODO : transmit A[i,l] using MPI_Ssend & MPI_Recv */
    if (1 /* I own A[i,l]*/) {
      /* MPI_Ssend A[i,l] to my row */
    } else if (0 /* A[i,l] is stored on my row */) {
      Ail->c = malloc(b*b*sizeof(float));
      /* MPI_Recv A[i,l] */
    }
    /* end TODO */
}

void p2p_transmit_B(int p, int q, Matrix *B, int l, int j) {
    int i;
    int me, my_row, my_col;
    MPI_Status status;

    MPI_Comm_rank(MPI_COMM_WORLD, &me);
    node_coordinates_2i(p,q,me,&my_row,&my_col);

    int node, tag, b;
    Block *Blj;
    Blj =  & B->blocks[l][j];
    b = B->b;
    /* TODO : transmit B[l,j] using MPI_Ssend & MPI_Recv */
    if (1 /* I owned B[l,j]*/) { 
      /* MPI_Ssend B[l,j] to my column */
    } else if (0 /* B[l,j] is stored on my column */) {
      Blj->c = malloc(b*b*sizeof(float));
      /* MPI_Recv B[l,j] */
    }
    /* end TODO */
}
