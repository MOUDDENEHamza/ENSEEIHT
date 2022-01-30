#include <stdio.h>
#include <stdlib.h>
#include <mpi.h>

void multAv(double x[], double *A, double y[], int m, int n);

void init0(double x[], int n);

int main(int argc, char* argv[]) {

    int size;
    int const n = 12;
    int my_rank;
    MPI_Init(&argc, &argv);
 
    // Get number of processes and check that 4 processes are used
    MPI_Comm_size(MPI_COMM_WORLD, &size);
    if(size != 4) {
      printf("This application is meant to be run with 4 MPI processes.\n");
      MPI_Abort(MPI_COMM_WORLD, EXIT_FAILURE);
    }
 
    // Get my rank
    MPI_Comm_rank(MPI_COMM_WORLD, &my_rank);

    //  Declaration and Initialization of A (one for all components)
    //  the number of bloc of lines, b,  is the same for all node
    //  (if you don't change the constants)
    int b = n / size;
    double *A;

    A = (double *) malloc(b*n*sizeof(double));

    for(int i = 0; i < b; i++){
      for(int j = 0; j < n; j++){
	A[i*n + j] = 1.0;
	//A[i*n + j] = (double) my_rank;
	//A[i*n + j] = (double) my_rank*(i+1)+(j+1);
        //printf("Process [%d], A[%d][%d] = %f\n", my_rank, i, j, A[i*n+j]);
      }
    }

    // reference vector to verify that the global vector is correct
    double v_ref[n];
    for(int i = 0; i < n; i++){
      v_ref[i] = (double) i;
    }

    // local vector
    double v_local[b];
    for(int i = 0; i < b; i++){
      v_local[i] = (double) b*my_rank + i;
      //printf("Process [%d], v_local[%d] = %f\n", my_rank, i, v_local[i]);
    }

    // global vector
    double v_global[n];
    init0(v_global, n);

    // Use a collective communication in order to gather on ALL the nodes the
    // part of the local vector into the global vector

    MPI_Allgather(v_local, b, MPI_DOUBLE, v_global, b, MPI_DOUBLE, MPI_COMM_WORLD);
    
    // the node 2 checks if the global vector is correct
    if(my_rank == 2) {
      for(int i = 0; i < n; i++){
	printf("Process [%d], vérif[%d] = %f\n", my_rank, i, v_global[i]-v_ref[i]);
      }
    }

    MPI_Barrier(MPI_COMM_WORLD);

    // vector x_loc = A * v_global
    double x_loc[b];
    init0(x_loc, b);

    // Perform the multiplication
    multAv(x_loc, A, v_global, b, n);

    // each node displays x (with A, full of ones, all the components of x
    // should be the same)
    for(int i = 0; i < b; i++){
      printf("Process [%d], x_loc[%d] = %f\n", my_rank, i, x_loc[i]);
    }
 
    MPI_Finalize();
 
    return EXIT_SUCCESS;
}

void multAv(double x[], double *A, double y[], int m, int n){

  for(int i = 0; i < m; i++){
    x[i] = 0.0;
    for(int j = 0; j < n; j++){
      x[i] += A[i*n + j] * y[j];
    }
  }
  return;
}

void init0(double x[], int n){

  for(int i = 0; i < n; i++){
    x[i] = 0.0;
  }
  return;
}
