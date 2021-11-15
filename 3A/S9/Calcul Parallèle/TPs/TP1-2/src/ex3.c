#include <stdio.h>
#include <stdlib.h>
#include <mpi.h>
#include <cblas.h>
#include "utils.h"
#include "dsmat.h"
#include "gemms.h"

void p2p_i_transmit_A(int p, int q, Matrix *A, int i, int l) {
  int j, b;
  int me, my_row, my_col;
  MPI_Comm_rank(MPI_COMM_WORLD, &me);
  node_coordinates_2i(p,q,me,&my_row,&my_col);

  int node, tag;
  Block * Ail;
  Ail =  & A->blocks[i][l];
  b = A->b;
  /* TODO : transmit A[i,l] using MPI_Isend/recv */
  if (1 /* I own A[i,l] */) {
    // MPI_Isend Ail to my row
  } else if (0 /* A[i,l] is stored on my row */) {
    Ail->c = calloc(b*b,sizeof(float));
    // MPI_Irecv Ail
  }
  /* end TODO */
}

void p2p_i_transmit_B(int p, int q, Matrix *B, int l, int j) {
  int i,b;
  int me, my_row, my_col;
  MPI_Comm_rank(MPI_COMM_WORLD, &me);
  node_coordinates_2i(p,q,me,&my_row,&my_col);

  int node, tag;
  Block * Blj;
  Blj =  & B->blocks[l][j];
  b = B->b;
  /* TODO : transmit B[l,j] using MPI_Isend/recv */
  if (1 /* I own B[l,j] */) {
    // MPI_Isend Blj to my column
  } else if (0 /* B[l,j] is stored on my column */) {
    Blj->c = calloc(b*b,sizeof(float));
    // MPI_Irecv B[l,j]
  }
  /* end TODO */
}

void p2p_i_wait_AB(int p, int q, Matrix *A, Matrix* B, int l) {
  int me, my_row, my_col;
  MPI_Comm_rank(MPI_COMM_WORLD, &me);
  node_coordinates_2i(p,q,me,&my_row,&my_col);

  int i, j;
  Block *Ail, *Blj;
  /* TODO : wait for A[:,l] and B[l,:] where they are needed */
  for (i = 0; i < A->mb ; i++) {
    Ail = & A->blocks[i][l];
    if (0/* I need A[i,l] for my computation */) {
      // MPI_Wait Ail
    }
  }
  for (j =0; j < B->nb; j++) {
    Blj = & B->blocks[l][j];
    if (0/* I need B[l,j] for my computation */) {
      // MPI_Wait Blj
    }
  }
  /* end TODO */
}
