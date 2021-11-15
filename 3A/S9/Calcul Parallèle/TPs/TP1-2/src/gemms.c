#include <stdlib.h>
#include <stdio.h>
#include <mpi.h>
#include <cblas.h>
#include "utils.h"
#include "dsmat.h"
#include "gemms.h"

#include "ex1.h"
#include "ex2.h"
#include "ex3.h"

int pgemm_p2p(int p, int q, int m, int n, int k, Matrix* A, Matrix* B, Matrix* C) {
  int mb, nb, kb, b;
  int i, j, l;
  int me, me_coord[2], my_row, my_col;
  char name[100];
  MPI_Comm_rank(MPI_COMM_WORLD, &me);
  node_coordinates(p,q,me,me_coord);
  node_coordinates_2i(p,q,me,&my_row,&my_col);

  if (A->nb != B->mb || A->mb != C-> mb || B->nb != C->nb) {
    if (me == 0) {
      printf("     A  B  C\n");
      printf(" mb %d %d %d\n", A->mb, B->mb, C->mb);
      printf(" nb %d %d %d\n", A->nb, B->nb, C->nb);
    }
    return 1;
  }
  if (B->b != A->b || A->b != C-> b) return 2;
  mb = C->mb;
  nb = C->nb;
  kb = A->nb;
  b = A->b;

  Block *Ail, *Blj, *Cij;
  for (l = 0; l < kb; l++) {
    for (i = 0; i < mb; i++) {
      p2p_transmit_A(p,q,A,i,l);
    }
    for (j = 0; j < nb; j++) {
      p2p_transmit_B(p,q,B,l,j);
    }
    local_outer_product(1.0f, A, B, C, l, p, q);
  } 
  return 0;
}

int pgemm_bcast(int p, int q, int m, int n, int k, Matrix* A, Matrix* B, Matrix* C) {
  int mb, nb, kb, b;
  int i, j, l;
  int me, me_row_comm, me_col_comm, me_coord[2];
  int my_row, my_col;
  char name[100];
  int err;
  MPI_Comm row_comm, col_comm;

  MPI_Comm_rank(MPI_COMM_WORLD, &me);

  if (A->nb != B->mb || A->mb != C-> mb || B->nb != C->nb) {
    if (me == 0) {
      printf("     A  B  C\n");
      printf(" mb %d %d %d\n", A->mb, B->mb, C->mb);
      printf(" nb %d %d %d\n", A->nb, B->nb, C->nb);
    }
    return 1;
  }
  if (B->b != A->b || A->b != C-> b) return 2;
  mb = C->mb;
  nb = C->nb;
  kb = A->nb;
  b = A->b;

  node_coordinates(p,q,me,me_coord);
  node_coordinates_2i(p,q,me,&my_row, &my_col);
  if (q > 1) {
    MPI_Comm_split(MPI_COMM_WORLD, my_row, me, &row_comm);
    MPI_Comm_rank(row_comm, &me_row_comm);
  } else {
    me_row_comm = -1;
  }
  if (p > 1) {
    MPI_Comm_split(MPI_COMM_WORLD, my_col, me, &col_comm);
    MPI_Comm_rank(col_comm, &me_col_comm);
  } else {
    me_col_comm = -1;
  }

  Block *Ail, *Blj, *Cij;
  for (l = 0; l < kb ; l++) {
    for (i = 0; i < mb; i++) {
      bcast_A(p,q,A,i,l,row_comm);
    }
    for (j = 0; j < nb; j++) {
      bcast_B(p,q,B,l,j,col_comm);
    }
    err = local_outer_product(1.0f, A, B, C, l, p, q);
  } 
  if (q > 1)
    MPI_Comm_free(&row_comm);
  if (p > 1)
    MPI_Comm_free(&col_comm);
  return 0;
}

int pgemm_p2p_i_la(int p, int q, int lookahead, int m, int n, int k, Matrix* A, Matrix* B, Matrix* C) {
  int mb, nb, kb, b;
  int i, j, l;
  int me, me_coord[2],my_row, my_col;
  char name[100];
  MPI_Comm_rank(MPI_COMM_WORLD, &me);
  node_coordinates(p,q,me,me_coord);
  node_coordinates_2i(p,q,me,&my_row,&my_col);

  if (A->nb != B->mb || A->mb != C-> mb || B->nb != C->nb) {
    if (me == 0) {
      printf("     A  B  C\n");
      printf(" mb %d %d %d\n", A->mb, B->mb, C->mb);
      printf(" nb %d %d %d\n", A->nb, B->nb, C->nb);
    }
    return 1;
  }
  if (B->b != A->b || A->b != C-> b) return 2;
  mb = C->mb;
  nb = C->nb;
  kb = A->nb;
  b = A->b;
  if (lookahead <= 0) return 3;
  if (lookahead >= kb) lookahead = kb;
  //printf("LA = %d, KB = %d\n",lookahead, kb);
  Block *Ail, *Blj, *Cij;
  for (l = 0; l < lookahead ; l++) {
    for (i = 0; i < mb; i++) {
      p2p_i_transmit_A(p,q,A,i,l);
    }
    for (j = 0; j < nb; j++) {
      p2p_i_transmit_B(p,q,B,l,j);
    }
  }
  for (l = 0; l < kb ; l++) {
    if (l < kb - lookahead) { // "kb-th" lookahead : kb = l + lookahead
      for (i= 0; i < mb; i++) {
        p2p_i_transmit_A(p,q,A,i,l+lookahead);
      }
      for (j= 0; j < nb; j++) {
        p2p_i_transmit_B(p,q,B,l+lookahead,j);
      }
    }
    p2p_i_wait_AB(p,q,A,B,l);
    p2p_i_wait_AB(p,q,A,B,l);
    local_outer_product(1.0f,A,B,C,l,p,q);
  } 
  return 0;
}

