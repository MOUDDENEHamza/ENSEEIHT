#include <stdio.h>
#include <stdlib.h>
#include <mpi.h>
#include <math.h>

#include "util.h" 

void cg_par(double *A_local, double *rhs, int N, int b, float tol){

  int size;
  int my_rank;

  // Get number of processes
  MPI_Comm_size(MPI_COMM_WORLD, &size);

  // Get my rank
  MPI_Comm_rank(MPI_COMM_WORLD, &my_rank);

  //**************** Parallel CG (M == N)
  int num_it, max_it;
  double x[b], r[b], Ap[b];
  double p_local[b], p_global[N];
  double nr_global, nr_local;
  double np2_global, np2_local;
  double epsilon;
  double alpha, beta;

  max_it = 100;

  // initialization of the solution (local vector)
  for(int i = 0; i < b; i++){
    x[i] = 0.0;
  }

  // compute the global norm of the rhs (dot product, then sqrt);
  // all the nodes must have this value
  nr_local = dot(rhs, rhs, b);
  MPI_Allreduce(&nr_local, &nr_global, 1, MPI_DOUBLE, MPI_SUM, MPI_COMM_WORLD);
  nr_global = sqrt(nr_global);
  //if(my_rank == 0) printf("nr = %lg\n", nr_global);

  // threshold of the CG
  epsilon = tol * nr_global;

  // Initialization of p_local and r (local vectors)
  copy_v(p_local, rhs, b);
  copy_v(r, rhs, b);

  // number of iterations
  num_it = 0;

  printf("num_it %d -- epsilon %lg -- nr_global %lg\n", num_it, epsilon, nr_global);

  while((nr_global > epsilon) && (num_it< max_it)){

    // Compute the local vector Ap = A_local*p_global
    // => gather p_local vectors to p_global
    // ...
    MPI_Allgather(&p_local, b, MPI_DOUBLE, p_global, b, MPI_DOUBLE, MPI_COMM_WORLD);

    // do the matrix-vector multiplication
    // ...
    multAv(Ap, A_local, p_global, b, N);    

    // compute the global dot product np2_global = (Ap_global, p_global)
    // all the node must have this value
    np2_local = dot(Ap, p_local, b);
    MPI_Allreduce(&np2_local, &np2_global, 1, MPI_DOUBLE, MPI_SUM, MPI_COMM_WORLD);
    //if(my_rank == 0) printf("np2 = %lg\n", np2_global);

    // alpha
    alpha = (nr_global*nr_global) / np2_global;
    //if(my_rank == 0) printf("alpha = %lg\n", alpha);

    // compute the new x and r (local vectors)
    axpy(alpha, x, p_local, b);
    axpy(-alpha, r, Ap, b);

    // compute the global norm of the rhs (dot product, then sqrt); 
    // all the nodes must have this value
    nr_local = dot(r, r, b);
    MPI_Allreduce(&nr_local, &nr_global, 1, MPI_DOUBLE, MPI_SUM, MPI_COMM_WORLD);
    nr_global = sqrt(nr_global);
    //if(my_rank == 0) printf("nr = %lg\n", nr_global);

    // beta
    beta = (nr_global*nr_global)/(alpha*np2_global);
    //if(my_rank == 0) printf("beta = %lg\n", beta);

    // compute the new p_local (local vector)
    xpay(beta, r, p_local, b);

    // increase the number of iterations
    num_it++;

    if(my_rank == 0) printf("num_it %d -- nr_global %lg\n", num_it, nr_global);

  }

  free(A_local);

  // gather the solution on the node 0
  double x_global[N];
  // ...
  MPI_Gather(&x, b, MPI_DOUBLE, &x_global, b, MPI_DOUBLE, 0, MPI_COMM_WORLD);
  
  // display the solution
  if(my_rank == 0){
    for(int i = 0; i < N; i++){
      printf("x[%d] = %lg\n", i, x_global[i]);
    }
  }

  return;
}
