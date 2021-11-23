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
  if (Ail->owner == me /* I own A[i,l] */) {
    // MPI_Isend Ail to my row
    for (j = 0; j < q; j++) {
      node = get_node(p, q, i, j);
      if (node != me) {
        MPI_Issend(Ail->c, b * b, MPI_FLOAT, node, tag, MPI_COMM_WORLD, &Ail->request);
      }
    }
  } else if (my_row == Ail->row /* A[i,l] is stored on my row */) {
    Ail->c = calloc(b*b,sizeof(float));
    // MPI_Irecv Ail
    MPI_Irecv(Ail->c, b * b, MPI_FLOAT, Ail->owner, tag, MPI_COMM_WORLD, &Ail->request);
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
  if (Blj->owner == me /* I own B[l,j] */) {
    // MPI_Isend Blj to my column
    for (i = 0; i < p; i++) {
        node = get_node(p, q, i, j);
        if (node != me) {
          MPI_Issend(Blj->c, b * b, MPI_FLOAT, node, tag, MPI_COMM_WORLD, &Blj->request);
        }
      }
  } else if (my_col == Blj->col /* B[l,j] is stored on my column */) {
    Blj->c = calloc(b*b,sizeof(float));
    // MPI_Irecv B[l,j]
    MPI_Irecv(Blj->c, b * b, MPI_FLOAT, Blj->owner, tag, MPI_COMM_WORLD, &Blj->request);
  }
  /* end TODO */
}

void p2p_i_wait_AB(int p, int q, Matrix *A, Matrix* B, int l) {
  int me, my_row, my_col;
  MPI_Comm_rank(MPI_COMM_WORLD, &me);
  node_coordinates_2i(p,q,me,&my_row,&my_col);

  MPI_Status status;

  int i, j;
  Block *Ail, *Blj;
  /* TODO : wait for A[:,l] and B[l,:] where they are needed */
  for (i = 0; i < A->mb ; i++) {
    Ail = & A->blocks[i][l];
    if (Ail->owner != me && Ail->row == my_row/* I need A[i,l] for my computation */) {
      // MPI_Wait Ail
      MPI_Wait(&Ail->request, &status);
    }
  }
  for (j =0; j < B->nb; j++) {
    Blj = & B->blocks[l][j];
    if (Blj->owner != me && Blj->col == my_col/* I need B[l,j] for my computation */) {
      // MPI_Wait Blj
      MPI_Wait(&Blj->request, &status);
    }
  }
  /* end TODO */
}
