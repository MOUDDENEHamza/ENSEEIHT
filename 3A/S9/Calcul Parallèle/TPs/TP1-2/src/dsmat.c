#include <mpe.h>
#include <mpi.h>
#include <stdlib.h>
#include <stdio.h>
#include <cblas.h>
#include "utils.h"
#include "dsmat.h"

int dsmat_fill(Matrix* a, int m, int n, int b, int p, int q, char* name) {
  int me, node, err;
  MPI_Comm_rank(MPI_COMM_WORLD, &me);
  int mb = m/b, nb = n/b;
  int ii, jj, i;
  int row, col;
  a->mb = mb;
  a->nb = nb;
  a->b = b;
  //printf("%d] %s : m x n (b) = %d x %d (%d)\n", me, name, mb, nb, b);
  a->blocks = calloc(mb,sizeof(Block*));
  for (ii = 0; ii < mb;ii++) {
    a->blocks[ii] = calloc(nb,sizeof(Block));
    for (jj = 0; jj < nb;jj++) {
      node = get_node(p,q,ii,jj);
      node_coordinates_2i(p,q,node,&row,&col);
      a->blocks[ii][jj].owner = node;
      a->blocks[ii][jj].row = row;
      a->blocks[ii][jj].col = col;
      a->blocks[ii][jj].request = MPI_REQUEST_NULL;
      if (me == a->blocks[ii][jj].owner) {
	//printf("%d]allocating x_%d,%d\n",me,ii,jj);
	a->blocks[ii][jj].c = calloc(b*b,sizeof(float));
	rand_mat(b,b,a->blocks[ii][jj].c,10);
      } else {
	a->blocks[ii][jj].c = NULL;
      }
    }
  }
  return 0;
}

int dsmat_fill_v(Matrix* a, int m, int n, int b, int p, int q, char* name, float value) {
  int me, node, err;
  MPI_Comm_rank(MPI_COMM_WORLD, &me);
  int mb = m/b, nb = n/b;
  int ii, jj;
  int row, col;
  a->mb = mb;
  a->nb = nb;
  a->b = b;
  a->blocks = calloc(mb,sizeof(Block*));
  for (ii = 0; ii < mb;ii++) {
    a->blocks[ii] = calloc(nb,sizeof(Block));
    for (jj = 0; jj < nb;jj++) {
      node = get_node(p,q,ii,jj);
      node_coordinates_2i(p,q,node,&row,&col);
      a->blocks[ii][jj].owner = node;
      a->blocks[ii][jj].row = row;
      a->blocks[ii][jj].col = col;
      a->blocks[ii][jj].request = MPI_REQUEST_NULL;
      if (me == a->blocks[ii][jj].owner) {
	//printf("%d]allocating x_%d,%d to fill with %f\n",me,ii,jj, value);
	a->blocks[ii][jj].c = calloc(b*b,sizeof(float));
	val_mat(b,b,a->blocks[ii][jj].c,value);
      } else {
	a->blocks[ii][jj].c = NULL;
      }
    }
  }
  return 0;
}

int dsmat_fill_s(Matrix* a, int m, int n, int b, int p, int q, char* name) {
  int me, node, err;
  MPI_Comm_rank(MPI_COMM_WORLD, &me);
  int mb = m/b, nb = n/b;
  int ii, jj;
  int row, col;
  a->mb = mb;
  a->nb = nb;
  a->b = b;
  a->blocks = calloc(mb,sizeof(Block*));
  for (ii = 0; ii < mb;ii++) {
    a->blocks[ii] = calloc(nb,sizeof(Block));
    for (jj = 0; jj < nb;jj++) {
      node = get_node(p,q,ii,jj);
      node_coordinates_2i(p,q,node,&row,&col);
      a->blocks[ii][jj].owner = node;
      a->blocks[ii][jj].row = row;
      a->blocks[ii][jj].col = col;
      a->blocks[ii][jj].request = MPI_REQUEST_NULL;
      if (me == a->blocks[ii][jj].owner) {
	//printf("%d] s_allocating %s_%d,%d to fill with %f\n",me,name,ii,jj,(float)nb*(ii+1)+(jj+1));
	a->blocks[ii][jj].c = calloc(b*b,sizeof(float));
	val_mat(b,b,a->blocks[ii][jj].c,(float) nb*(ii+1)+(jj+1));
      } else {
	a->blocks[ii][jj].c = NULL;
      }
    }
  }
  return 0;
}

int dsmat_destroy(Matrix* a, char* name) {
  int me, err;
  MPI_Comm_rank(MPI_COMM_WORLD, &me);
  int mb = a->mb, nb = a->nb;
  //printf("[%d] destroying matrix %s (mb=%d,nb=%d,b=%d)\n",me, name, mb, nb, a->b);
  int ii, jj;
  Block * a_ij;
  for (ii = 0; ii < mb ; ii++) {
    for (jj = 0; jj < nb ; jj++) {
      a_ij = & a->blocks[ii][jj];
      //if (a_ij->c != NULL) { // && a_ij.owner == me) {
      if (a_ij->c != NULL && a_ij->owner == me) {
	free(a_ij->c);
      }		
    }
    free(a->blocks[ii]);
  }
  free(a->blocks);
  return 0;
}

int scal_eid_begin = -1, scal_eid_end = -1;
int dsmat_scal(Matrix* A, float alpha) {
  char name[100];
  if (scal_eid_begin == -1 && scal_eid_end == -1) {
    MPE_Log_get_state_eventIDs(&scal_eid_begin, &scal_eid_end);
    MPE_Describe_state(scal_eid_begin, scal_eid_end, "scal_block", "magenta");
  }
  int i,j;
  int me;
  if (alpha == 0.0) return 0;
  MPI_Comm_rank(MPI_COMM_WORLD, &me);
  Block* Aij;
  for (i = 0; i<A->mb; i++) {
    for (j = 0; j<A->nb; j++) {
      Aij = & A->blocks[i][j];
      if (Aij->owner == me) {
	sprintf(name,"scaling C[%d,%d]", i, j);
	MPE_Log_event(scal_eid_begin, 0, "scaling block");//name);
	cblas_sgemm(CblasRowMajor, CblasNoTrans, CblasNoTrans, A->b, A->b, A->b,
	    0.0, Aij->c, A->b, Aij->c, A->b,
	    alpha, Aij->c, A->b);
	sprintf(name,"scaled C[%d,%d]", i, j);
	MPE_Log_event(scal_eid_end, 0, "scaled block");//name);
      }	
    }
  }
  return 0;
}

// FIXME : remove alpha/beta
int local_outer_product(float alpha, Matrix* A, Matrix* B, Matrix* C, int l, int p, int q) {
  int i, j, err;
  for (i = 0; i < C->mb ; i++) {
    for (j = 0; j < C->nb ; j++) {
      err = compute_local_op(alpha, A, B, C, i, j, l);
      if (err != 0) return 1;
    }
  }
  /* free useless memory */
  free_local_op(A, B, l, p, q);
  return 0;
}

int gemm_eid_begin = -1, gemm_eid_end = -1;
int compute_local_op(float alpha, Matrix* A, Matrix* B, Matrix* C, int i, int j, int l) {
  char name[100];
  int me;
  int b;
  Block *Ail, *Blj, *Cij;
  if (gemm_eid_begin == -1 && gemm_eid_end == -1) {
    MPE_Log_get_state_eventIDs(&gemm_eid_begin, &gemm_eid_end);
    MPE_Describe_state(gemm_eid_begin, gemm_eid_end, "gemm_block", "cyan");
  }
  MPI_Comm_rank(MPI_COMM_WORLD, &me);
  Cij = & C->blocks[i][j];
  b = C->b;
  if (Cij->owner == me) {
    Ail = & A->blocks[i][l];
    if (Ail->c == NULL) { return 1; }
    Blj = & B->blocks[l][j];
    if (Blj->c == NULL) { return 2; }
    sprintf(name, "C[%d,%d] += %f*A[%d,%d]*B[%d,%d]",i,j, alpha, i,l, l,j);
    MPE_Log_event(gemm_eid_begin,0,"computing gemm");//name);
    cblas_sgemm(CblasRowMajor, CblasNoTrans, CblasNoTrans, b,b,b,
	alpha, Ail->c, b, Blj->c, b,
	1.0, Cij->c, b); 
    sprintf(name, "C[%d,%d] += %f*A[%d,%d]*B[%d,%d] done",i,j, alpha,i,l, l,j);
    MPE_Log_event(gemm_eid_end,0,"computed gemm");//name);
  }
  return 0;
}

int free_local_op(Matrix* A, Matrix* B, int l, int p, int q) {
  int i,j;
  int me, me_coord[2];
  MPI_Comm_rank(MPI_COMM_WORLD, &me);
  node_coordinates(p,q,me,me_coord);
  Block *Ail, *Blj;
  for (i = 0; i < A->mb; i++) {
    Ail = & A->blocks[i][l];
    if (Ail->owner != me && Ail->c != NULL) {
      free(Ail->c);
      Ail->c = NULL;
    }
  }
  for (j = 0; j < B->nb; j++) {
    Blj = & B->blocks[l][j];
    if (Blj->owner != me && Blj->c != NULL) {
      free(Blj->c);
      Blj->c = NULL;
    }
  }
  return 0;
}

int block_copy(float * a, float * b, int m, int n) {
  int i, j;
  for (i = 0; i < m ; i++) {
    for (j = 0; j < n ; j++) {
      a[n*i+j] = b[n*i+j];		
    }	
  }	
  return 0;
}

int block_print(float * a, int m, int n, char* name) {
  int i, j;
  printf("block %s\n", name);
  for (i = 0; i < m ; i++) {
    for (j = 0; j < n ; j++) {
      printf("%9.2f\t", a[n*i+j]);
    }	
    printf("\n");
  }	
  printf("\n");
  return 0;
}

// A <- B
int dsmat_copy(Matrix * A, Matrix * B) {
  int i, j;
  int me;
  int mb, nb, b;
  Block *Aij, *Bij;

  MPI_Comm_rank(MPI_COMM_WORLD, &me);

  A->mb = B->mb;
  A->nb = B->nb;
  A->b = B->b;

  mb = A->mb;
  nb = A->nb;
  b = A->b;

  A->blocks = calloc(mb, sizeof(Block*));
  for (i = 0; i<mb;i++){
    A->blocks[i] = calloc(nb, sizeof(Block));
    for (j = 0; j<nb;j++){
      Aij = & A->blocks[i][j];
      Bij = & B->blocks[i][j];
      Aij->owner = Bij->owner;
      Aij->row = Bij->row;
      Aij->col = Bij->col;
      Aij->request = MPI_REQUEST_NULL;
      if (Bij->owner == me) {
        Aij->c = calloc(b*b,sizeof(float));
	block_copy(Aij->c, Bij->c, b, b);
      }
    }
  }
  return 0;
}

int dsmat_copy_to(Matrix * A, Matrix * B, int rcv, char* copy, char* copied) {
  int i, j, l;
  int me,tag;
  int mb, nb, b;
  Block *Aij, *Bij;
  float* localA;
  MPI_Status status;
  char name[100];

  MPI_Comm_rank(MPI_COMM_WORLD, &me);
  A->nb = 1;
  A->mb = 1;
  A->b = -1;

  mb = B->mb;
  nb = B->nb;
  b = B->b;

  tag = 0;
  A->blocks = malloc(sizeof(Block*));
  A->blocks[0] = malloc(sizeof(Block));
  Aij = & A->blocks[0][0];
  Aij->owner = rcv;
  Aij->row = -1;
  Aij->col = -1; // not on a grid ...
  Aij->request = MPI_REQUEST_NULL;
  if (me == rcv) { 
    Aij->c = malloc(mb*b * nb*b * sizeof(float));
    localA = malloc(b*b*sizeof(float));
  }
  for (i = 0; i<mb;i++){
    for (j = 0; j<nb;j++){
      Bij = & B->blocks[i][j];
      if (Bij->owner == me) {
	if (rcv != me) {
	  MPI_Send(Bij->c, b*b, MPI_FLOAT, 
	      rcv, tag,
	      MPI_COMM_WORLD); 
	} else {
	  for (l = 0; l<b; l++) {
	    block_copy(&Aij->c[nb*i*b*b+j*b+l*nb*b], Bij->c, 1, b);
	  }
	}
      } else if (me == rcv) {
	MPI_Recv(localA, b*b, MPI_FLOAT, 
	    Bij->owner, tag,
	    MPI_COMM_WORLD,&status); 
	for (l = 0; l<b; l++) {
	  block_copy(&Aij->c[nb*i*b*b+j*b+l*nb*b], localA, 1, b);
	}
      }
    }
  }
  if (me == rcv) 
    free(localA);
  return 0;
}
