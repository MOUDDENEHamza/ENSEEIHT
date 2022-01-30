#include <stdio.h>
#include <stdlib.h>
#include <mpi.h>
#include <math.h>

#include "util.h" 
#include "CG_par.h"

int main(int argc, char* argv[]) {

  int size;
  int my_rank;

  FILE *f;
  int M, N, nz;

  double *A = NULL;
  double *rhs;

  double tol = 1e-6;

  // Make sure that the command line has one argument (name of the matrix file)

  if(argc != 2){
    printf("usage : CG_par <file>\n");
    return EXIT_FAILURE;
  }

  //**************** MPI Initialization

  MPI_Init(&argc, &argv);

  // Get number of processes and check that 4 processes are used
  MPI_Comm_size(MPI_COMM_WORLD, &size);

  if(size != 4) {
    printf("This application is meant to be run with 4 MPI processes.\n");
    MPI_Abort(MPI_COMM_WORLD, EXIT_FAILURE);
  }

  // Get my rank
  MPI_Comm_rank(MPI_COMM_WORLD, &my_rank);

  //**************** READING OF THE MATRICE AND DISTRIBUTION OF THE BLOCS OF LINES TO EACH NODE

  // You have the possibility to test with a small matrice ("Laplacien.txt")
  // or a larger one ("nos3.mtx")
  
  f = fopen(argv[1], "r");

  // All nodes get the sizes
  mm_read_mtx_crd_size(f, &M, &N, &nz);
  //printf("%d %d %d\n", M, N, nz);

  // Reading the matrix by node 0
  if(my_rank == 0) {

    A = (double *) malloc(M*N*sizeof(double));
    read_A(f, A, M, N, nz);

    // increase diagonal to be sure to converge easily
    for (int i = 0; i < M; i++) {
      *(A+i*N+i) = *(A+i*N+i) + 10.0;
    }
    
  }

  if (f != stdin) fclose(f);

  // DISTRIBUTION OF BLOCS => A_local(b, N)
  int b = M / size;
  double *A_local;

  A_local = (double *) malloc(b*N*sizeof(double));
  MPI_Scatter(A, b*N, MPI_DOUBLE, A_local, b*N, MPI_DOUBLE, 0, MPI_COMM_WORLD);

  if(my_rank == 0) free(A);

  //**************** END OF THE READING OF THE MATRICE AND THE DISTRIBUTION OF THE BLOCS OF LINES TO EACH NODE

  //**************** PARALLEL CG (M == N)

  rhs = (double *) malloc(b*sizeof(double));

  // initialization of the right hand side (local vector)
  for(int i = 0; i < b; i++){
    rhs[i] = (float) (b*my_rank + i);
  }

  cg_par(A_local, rhs, N, b, tol);

  //**************** END OF PARALLEL CG

  MPI_Finalize();
  printf("The End\n");

  return EXIT_SUCCESS;
}
