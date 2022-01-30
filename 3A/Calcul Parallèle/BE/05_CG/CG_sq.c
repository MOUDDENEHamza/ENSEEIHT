#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#include "util.h" 

void cg_sq(double *A, double *rhs, int N, double tol){

  int num_it, max_it;
  double x[N], p[N], r[N], Ap[N];
  double nr;
  double epsilon;
  double np2, alpha, beta;

  max_it = 100;

  // initialization of the solution
  for(int i = 0; i < N; i++){
    //b[i] = (float) i;
    x[i] = 0.0;
  }

  // compute the norm of the rhs (dot product, then sqrt) 
  nr = dot(rhs, rhs, N);
  nr = sqrt(nr);
  //printf("nr = %lg\n", nr);
  
  // threshold of the CG
  epsilon = tol*nr;

  // Initialization of p and r
  copy_v(p, rhs, N);
  copy_v(r, rhs, N);

  // number of iterations
  num_it = 0;

  printf("num_it %d -- epsilon %lg -- nr %lg\n", num_it, epsilon, nr);

  while((nr > epsilon) && (num_it< max_it)){

    // Compute the vector Ap = A*p
    multAv(Ap, A, p, N, N);

    // compute the dot product np2 = (Ap, p)
    np2 = dot(p, Ap, N);
    //printf("np2 = %lg\n", np2);

    // alpha
    alpha = (nr*nr) / np2;
    //printf("alpha = %lg\n", alpha);
    
    // compute the new x and r
    axpy(alpha, x, p, N);
    axpy(-alpha, r, Ap, N);

    // compute the norm of the rhs (dot product, then sqrt) 
    nr = dot(r, r, N);
    nr = sqrt(nr);
    //printf("nr = %lg\n", nr);
    
    // beta
    beta = (nr*nr)/(alpha*np2);
    //printf("beta = %lg\n", beta);

    // compute the new p
    xpay(beta, r, p, N);

    // increase the number of iterations
    num_it++;

    printf("num_it %d -- nr %lg \n", num_it, nr);

  }

  // display the solution
  
  for(int i = 0; i < N; i++){
    printf("x[%d] = %lg\n", i, x[i]);
  }
  
  return;
}
