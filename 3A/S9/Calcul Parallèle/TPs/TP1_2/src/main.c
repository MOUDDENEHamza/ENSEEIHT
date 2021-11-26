#include <mpe.h>
#include <mpi.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <math.h>
#include <float.h>
#include <cblas.h>
#include <time.h>
#include <argp.h>

#include "utils.h" 
#include "dsmat.h"
#include "gemms.h"

static char doc[] =
"TP Prog Parallèle -- Ligne de commande";


//static char args_doc[] = "-m [m] -n [n] -k [k] -b [b] -p [p] -q [q] --algorithm [p2p|p2p-i-la|bcast] --lookahead [la] --niter [i]";
static char args_doc[] = "-n [n] -b [b] -p [p] -q [q] --algorithm [p2p|p2p-i-la|bcast] --lookahead [la] --niter [i]";

static struct argp_option options[] = {
  {"m",        'm', "int", 0,  "Number of rows in A and C (deprecated)" },
  {"n",        'n', "int", 0,  "Dimension of A B and C" },
  {"k",        'k', "int", 0,  "Shared dimension of A and B (deprecated)" },
  {"blocking", 'b', "int", 0,  "Size of the square block of A, B and C (must divide m,n and k" },
  {"p",        'p', "int", 0, "Length of the logical grid"},
  {"q",        'q', "int", 0, "Width of the logical grid"},
  {"algorithm",'a', "string", 0, "GEMM distributed algorithm to use"},
  {"lookahead",'l', "int", 0, "Parameter for p2p-i-la algorithm"},
  {"verbose",  'v', 0, 0, "If the program print more"},
  {"checking", 'c', 0, 0, "If the program checks gemm results"},
  {"niter",    'i', "int", 0, "Number of iterations"},
  { 0 }
};

struct arguments
{
  int m, n, k, b;
  int p, q;
  int la;
  char* algo;
  int verbose, check;
  int iter;
};

  static error_t
parse_opt (int key, char *arg, struct argp_state *state)
{
  /* Get the input argument from argp_parse, which we
     know is a pointer to our arguments structure. */
  struct arguments *arguments = state->input;

  switch (key)
  {
    case 'm':
      arguments->m = atoi(arg);
      break;
    case 'n':
      arguments->n = atoi(arg);
      break;
    case 'k':
      arguments->k = atoi(arg);
      break;
    case 'b':
      arguments->b = atoi(arg);
      break;
    case 'p':
      arguments->p = atoi(arg);
      break;
    case 'q':
      arguments->q = atoi(arg);
      break;
    case 'l':
      arguments->la = atoi(arg);
      break;
    case 'a':
      arguments->algo = arg;
      break;
    case 'v':
      arguments->verbose = 1;
      break;
    case 'c':
      arguments->check = 1;
      break;
    case 'i':
      arguments->iter = atoi(arg);
      break;
    default:
      return ARGP_ERR_UNKNOWN;
  }
  return 0;
}

static struct argp argp = { options, parse_opt, args_doc, doc };

void print_res(Matrix C, char* algo) {
  int i,j;
  int size, rank;
  MPI_Comm_size(MPI_COMM_WORLD, &size);
  MPI_Comm_rank(MPI_COMM_WORLD, &rank);
  char name[100];
  for (i=0;i<C.mb;i++) {
    for (j=0;j<C.nb;j++) {
      sprintf(name,"resC[%d,%d](%s)",i,j,algo);
      if (C.blocks[i][j].owner == rank) 
	block_print(C.blocks[i][j].c, C.b, C.b, name);	
    }
  }
}

int gflops_gemm(int m, int n, int k, float exec_time, double* gflops) {
  (*gflops) = 2.0*m*n*k/(exec_time*pow(10,9));
}

int main(int argc, char* argv[]) {
  struct arguments arguments;
  arguments.m = 20;
  arguments.n = 20;
  arguments.k = 20;
  arguments.b = 10;
  arguments.p = 2;
  arguments.q = 2;
  arguments.algo = "p2p";
  arguments.la = 0;
  arguments.verbose = 0;
  arguments.check = 0;
  arguments.iter = 1;

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
  char hostname[1024];
  char * algo;
  int vbose, check;
  MPI_Status status;

  argp_parse (&argp, argc, argv, 0, 0, &arguments);
  m = arguments.n;
  n = arguments.n;
  k = arguments.n;
  b = arguments.b;
  p = arguments.p;
  q = arguments.q;
  algo = arguments.algo;
  la = arguments.la;
  vbose = arguments.verbose;
  check = arguments.check;
  niter = arguments.iter;
  if (strcmp(algo,"p2p")*strcmp(algo,"p2p-i-la")*strcmp(algo,"bcast") != 0) {
    printf("Wrong value for algo, only p2p, p2p-i-la and p2p-bcast authorized\n");
    return 1;
  }
  if (b < 0) { printf("Wrong value for B, should be non-negative\n"); return 1; }
  if (m%b != 0) { printf("M should be divisible by B\n"); return 1; }
  if (n%b != 0) { printf("N should be divisible by B\n"); return 1; }
  if (k%b != 0) { printf("K should be divisible by B\n"); return 1; }
  if (niter < 0) { printf("Wrong value for niter, should be non-negative\n"); return 1; }

  get_host_name(hostname,1024);
  // openblas_set_num_threads(1);
  srand(time(NULL));

  MPI_Init(NULL,NULL);
  int size, rank;
  MPI_Comm_size(MPI_COMM_WORLD, &size);
  MPI_Comm_rank(MPI_COMM_WORLD, &rank);
  if (vbose)
    //printf("I am the %d-th node in a world of size %d\n", rank, size);
    printf("%s is the %d-th node in a world of size %d\n", hostname, rank, size);
  if (p*q != size) {
    printf("bad world size\n");
    return 1;
  }

  // this initialization could probably get better
  Matrix  A = (Matrix){0}, B = (Matrix){0}, C = (Matrix){0};
  Matrix wA = (Matrix){0},wB = (Matrix){0},wC = (Matrix){0}, bwC = (Matrix){0};
  Matrix bA = (Matrix){0},bB = (Matrix){0},bC = (Matrix){0};
  if (vbose) 
    printf("[%s] m,n,k = %d,%d,%d | b = %d | pxq = %dx%d | la = %d \n",
	hostname, m,n,k, b, p,q, la);
   // printf("[%d] m,n,k = %d,%d,%d | b = %d | pxq = %dx%d | la = %d \n",
//	rank, m,n,k, b, p,q, la);
  //err = dsmat_fill_v(&A, m, k, b, p, q, "A", 1.0f);
  //err = dsmat_fill_v(&B, k, n, b, p, q, "B", 1.0f);
  err = dsmat_fill_s(&A, m, k, b, p, q, "A");
  err = dsmat_fill_s(&B, k, n, b, p, q, "B");
  //err = dsmat_fill(&A, m, k, b, p, q, "A");
  //err = dsmat_fill(&B, k, n, b, p, q, "B");
  err = dsmat_fill_v(&C, m, n, b, p, q, "C", 0.0f);
  err = MPI_Barrier(MPI_COMM_WORLD);	
  if (err != MPI_SUCCESS) return 1;

  for (iter = 0; iter < niter; iter++) {
    err = dsmat_copy(&wA,&A);
    err = dsmat_copy(&wB,&B);
    err = dsmat_copy(&wC,&C);
    MPI_Barrier(MPI_COMM_WORLD);	
    d_start = MPI_Wtime();
    if (strcmp(algo,"p2p") == 0) {
      err = pgemm_p2p(p,q,m,n,k,&wA,&wB,&wC);
//    } else if (strcmp(algo,"p2p-i") == 0) {
//     err = pgemm_p2p_i(p,q,m,n,k,&wA,&wB,&wC);
    } else if (strcmp(algo,"p2p-i-la") == 0) {
      err = pgemm_p2p_i_la(p,q,la,m,n,k,&wA,&wB,&wC);
    } else if (strcmp(algo,"bcast") == 0) {
      err = pgemm_bcast(p,q,m,n,k,&wA,&wB,&wC);
    }
    MPI_Barrier(MPI_COMM_WORLD);	
    d_stop = MPI_Wtime();
    gflops_gemm(m,n,k, d_stop - d_start, &gflops);
    if (rank == 0) {
    //printf("[%d] (%s) measured_wtime = %fs (la=%d) | %f Gflop/s\n", rank, algo, d_stop - d_start, la, gflops);
      printf("[%s] (%s) measured_wtime = %fs (la=%d) | %f Gflop/s\n", hostname, algo, d_stop - d_start, la, gflops);
    }
    MPI_Barrier(MPI_COMM_WORLD);

    if (check) {
      err = dsmat_copy_to(&bwC,&wC,0,"bwC","wC");
      err = dsmat_copy_to( &bA, &A,0, "bA", "A");
      err = dsmat_copy_to( &bB, &B,0, "bB", "B");
      err = dsmat_copy_to( &bC, &C,0, "bC", "C");
      MPI_Barrier(MPI_COMM_WORLD);
      if (rank == 0) {
	if (vbose) {
	  block_print(bwC.blocks[0][0].c, m, n, algo);
	  block_print( bA.blocks[0][0].c, m, k, "gA");
	  block_print( bB.blocks[0][0].c, k, n, "gB");
	  block_print( bC.blocks[0][0].c, m, n, "gC");
	}
	t = clock();
	cblas_sgemm(CblasRowMajor, CblasNoTrans, CblasNoTrans, m,n,k,
	    1.0f, bA.blocks[0][0].c, k, bB.blocks[0][0].c, n,
	    0.0f, bC.blocks[0][0].c, n);
	t = clock() - t;
	time_taken = ((double)t/CLOCKS_PER_SEC);
	gflops_gemm(m,n,k, time_taken, &gflops);
	//printf("[%d] (g) measured_wtime = %fs | %f Gflop/s\n", rank, time_taken, gflops);
	printf("[%s] (g) measured_wtime = %fs | %f Gflop/s\n", hostname, time_taken, gflops);
	if (vbose)
	  block_print(bC.blocks[0][0].c, m, n, "gresC");
	myblas_sgepxy(-1.0,bC.blocks[0][0].c,bwC.blocks[0][0].c, m,n);
	float nrm = cblas_snrm2(m*n,bwC.blocks[0][0].c,1);
	if (nrm < DBL_EPSILON) printf("GEMM is correct (%12.5e)\n",nrm);
	else printf("algorithm is not GEMM by %12.5e\n", nrm);
      }
      err = MPI_Barrier(MPI_COMM_WORLD);
      err = dsmat_destroy(&bwC,"bwC");
      err = dsmat_destroy( &bA,"bA");
      err = dsmat_destroy( &bB,"bB");
      err = dsmat_destroy( &bC,"bC");
    }
    MPI_Barrier(MPI_COMM_WORLD);
    err = dsmat_destroy(&wA,"wA");
    err = dsmat_destroy(&wB,"wB");
    err = dsmat_destroy(&wC,"wC");
  }
  err = MPI_Barrier(MPI_COMM_WORLD);	
  err = dsmat_destroy(&A,"A");
  err = dsmat_destroy(&B,"B");
  err = dsmat_destroy(&C,"C");
  if (vbose)
    printf("[%s] matrices destroyed (%d) \n", hostname, err);
    //printf("[%d] matrices destroyed (%d) \n", rank, err);
  return MPI_Finalize();
}
