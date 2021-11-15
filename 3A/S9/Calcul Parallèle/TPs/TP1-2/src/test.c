#include <mpe.h>
#include <mpi.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <math.h>
#include <float.h>
#include <cblas.h>
#include <time.h>
#include "utils.h" 
#include "dsmat.h"
#include "gemms.h"

int main(int argc, char* argv[]) {

  int p, q;
  int m,n,k,b;
  int i,j,l,la;
  int err, iter, niter;
  double d_start, d_stop; // on multiple nodes
  clock_t t;		// on one node
  double time_taken, gflops;
  int node,tag;
  long unsigned int total_us;
  char name[100];
  char * algo;
  int vbose, check;
  MPI_Status status;

  m = 2;
  n = 4;
  k = 4;
  b = 2;
  p = 1;
  q = 2;

  // openblas_set_num_threads(1);
  srand(time(NULL));

  MPI_Init(NULL,NULL);
  int world_size, world_rank;
  MPI_Comm_size(MPI_COMM_WORLD, &world_size);
  MPI_Comm_rank(MPI_COMM_WORLD, &world_rank);
  printf("I am the %d-th node in a world of size %d\n", world_rank, world_size);
  if (p*q != world_size) {
    printf("bad world size\n");
    return 1;
  }

  err = MPI_Barrier(MPI_COMM_WORLD);	
  if (err != MPI_SUCCESS) return 1;
  // this initialization could probably get better
  Matrix A  = (Matrix){0},B  = (Matrix){0},C = (Matrix){0};
  Matrix bA = (Matrix){0},bB = (Matrix){0},bC= (Matrix){0};
  Matrix wA = (Matrix){0},wB = (Matrix){0},wC= (Matrix){0}, bwC= (Matrix){0};
    printf("[%d] m,n,k = %d,%d,%d | b = %d | pxq = %dx%d | la = %d | test %f \n",
	world_rank, m,n,k, b, p,q, la, 1.0f);
  err = dsmat_fill_s(&A, m, k, b, p, q, "A");
  err = MPI_Barrier(MPI_COMM_WORLD);	
  if (err != MPI_SUCCESS) return 1;

  err = dsmat_copy(&wA,&A);
  MPI_Barrier(MPI_COMM_WORLD);	
  err = dsmat_copy_to(&wC,&A,0,"wC","A");
  printf("%d ] dsmat_copy_to.err = %d\n", world_rank, err);
  err = dsmat_destroy(&wA,"wA");
  err = dsmat_copy(&wA,&A);
  err = dsmat_destroy(&wA,"wA");
  err = dsmat_copy(&wA,&A);
  err = dsmat_destroy(&wC,"wC");
  err = dsmat_destroy(&A,"A");
  err = MPI_Barrier(MPI_COMM_WORLD);	
  printf("[%d] matrices destroyed (%d) \n", world_rank, err);
  return MPI_Finalize();
}
