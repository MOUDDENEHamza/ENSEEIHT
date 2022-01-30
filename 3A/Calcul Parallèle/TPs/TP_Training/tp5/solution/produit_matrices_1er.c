/*
 * produit_matrices.c --- TP5 : produit de matrices
 *
 * Auteur          : Dimitri LECAS (CNRS/IDRIS - France) <dimitri.lecas@idris.fr>
 *
 *
 *
 * Remarques :
 * ---------
 *
 *   * On veut réaliser le produit de matrices C = A * B en parallèle.
 *
 *   * On suppose que ces matrices sont carrées et que leur ordre N
 *     est divisible par le nombre Nprocs de processus.
 *
 *   * Le processus 0 initialise les matrices A et B qu'il distribue
 *     ensuite aux autres processus.
 *
 *   * La distribution de A se fait par bandes horizontales.
 *     La distribution de B se fait par bandes verticales.
 *
 *   * Chaque processus possède une bande des matrices A et B.
 *
 *   * Chaque processus calcule ainsi un bloc de la diagonale principale
 *     de C avec les éléments qu'il possède. Le calcul des blocs
 *     extra-diagonaux nécessite des communications avec les autres
 *     processus.
 *
 *   * En fait, l'opération se reduit ici à un produit de matrices par bloc.
 */

#include "mpi.h"
#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#ifdef USE_MKL
#include <mkl.h>
#endif

int etiquette=1000;

/* Allocation de la matrice et initialisation a zero */
void allouer_matrice(double **mat, int lignenbr, int colnbr) {
  int iter;
  (*mat) = (double *) malloc(lignenbr*colnbr*sizeof(double));
  for (iter=0; iter<lignenbr*colnbr; iter++) {
    (*mat)[iter] = 0.; }
}

/* Initialise la matrice avec des nombres aleatoires */
void random_number(double *mat,int n) {
  int iterl,iterc;
  for(iterl=0; iterl<n; iterl++)
    for(iterc=0;iterc<n; iterc++)
      mat[iterl*n+iterc] =  rand() / (RAND_MAX + 1.);
}

/* Produit de matrice C = A*B */
void matmul(double *A, double *B, double *C,int nl, int nc, int nk) {
  int iterl,iterc,iterk;
  double somme;

#ifdef USE_MKL
  double alpha,beta;
  alpha = 1.0;
  beta = 0.0;
  mkl_set_num_threads(1);
  cblas_dgemm(CblasRowMajor, CblasNoTrans, CblasNoTrans,
              nl, nc, nk, alpha, A, nk, B, nc, beta, C, nc);
#else
  for(iterl=0;iterl<nl;iterl++) {
    for(iterc=0;iterc<nc;iterc++) {
      somme = 0;
      for(iterk=0;iterk<nk;iterk++) {
        somme += A[iterl*nk+iterk]*B[iterk*nc+iterc]; }
      C[iterl*nc+iterc] = somme;
    }
  }
#endif
}

int main(int argc, char *argv[]) {
  int rang,Nprocs,N,NL;
  double *A,*B,*C,*CC;
  double *AL,*BL,*CL,*TEMP;
  MPI_Datatype type_temp,type_tranche;
  int taille_type_double;
  MPI_Aint borne_inferieure,taille_deplacement;
  int iter;
  MPI_Status statut;
  int rang_precedent,rang_suivant;

  /* Initialisation de MPI */
  MPI_Init(&argc, &argv);
  MPI_Comm_rank(MPI_COMM_WORLD, &rang);
  MPI_Comm_size(MPI_COMM_WORLD, &Nprocs);

  if (rang == 0) {
    FILE * fichier = fopen("produit_matrices.data","r");
    fscanf(fichier, "%d", &N);
    fclose(fichier);
  }

  /* Le processus 0 diffuse N à tous les autres processus */
  MPI_Bcast(&N,1,MPI_INTEGER,0,MPI_COMM_WORLD);

  /* Il faut que N soit divisible par Nprocs */
  if ( (N % Nprocs) == 0)
    NL = N/Nprocs;
  else {
    fprintf(stderr, "N n'est pas divisible par Nprocs\n");
    /* On arrete le programme */
    MPI_Abort(MPI_COMM_WORLD,1);
  }

  /* Le processus 0 initialise les matrices A et B */
  if (rang ==0) {
    /* Allocation dynamique des matrices A, B et C */
    allouer_matrice(&A,N,N);allouer_matrice(&B,N,N);
    allouer_matrice(&C,N,N);allouer_matrice(&CC,N,N);

    /* Initialisation de A et B */
    random_number(A,N);
    random_number(B,N);

    /* Calcul monoprocesseur du produit matriciel A*B */
    matmul(A,B,CC,N,N,N);
  }

  /* Allocation dynamique de memoire des divers tableaux locaux */
  allouer_matrice(&AL,NL,N);allouer_matrice(&BL,N,NL);
  allouer_matrice(&CL,N,NL);allouer_matrice(&TEMP,NL,N);

  /* Construction du type qui correspond a 1 bloc de N lignes et NL colonnes */
  MPI_Type_vector(N,NL,N,MPI_DOUBLE,&type_temp);
  MPI_Type_size(MPI_DOUBLE,&taille_type_double);
  borne_inferieure = 0;
  taille_deplacement = taille_type_double*NL;
  MPI_Type_create_resized(type_temp,borne_inferieure,taille_deplacement,
                          &type_tranche);
  MPI_Type_commit(&type_tranche);

  /* Le processus 0 distribue dans AL les tranches horizontales de A */
  MPI_Scatter(A, N*NL, MPI_DOUBLE, AL, N*NL, MPI_DOUBLE,
              0, MPI_COMM_WORLD);

  /* Le processus 0 distribue dans BL les tranches verticales de B */
  MPI_Scatter(B,1,type_tranche,BL,N*NL,MPI_DOUBLE,
              0,MPI_COMM_WORLD);

  /* Calcul des blocs diagonaux de la matrice resultante */
  matmul(AL,BL,&(CL[rang*NL*NL]),NL,NL,N);

  /* Calcul des blocs extra-diagonaux */

  /* Premier algorithme */
  for (iter=0; iter<Nprocs; iter++) {
    // Chaque processus ENVOIE sa tranche AL au processus iter
    // et RECOIT dans TEMP la tranche AL du processus iter
    if (rang != iter) {
      MPI_Sendrecv(AL,NL*N,MPI_DOUBLE,iter,etiquette,
                   TEMP,NL*N,MPI_DOUBLE,iter,etiquette,
                   MPI_COMM_WORLD,&statut);
      // Chaque processus calcul les blocs situes au dessus
      // et en dessous du bloc de la diagonale principale
      matmul(TEMP,BL,&(CL[iter*NL*NL]),NL,NL,N);
    }
  }

  /* Second algorithme
  rang_precedent = (Nprocs+rang-1)%Nprocs;
  rang_suivant = (rang+1)%Nprocs;
  for (iter=1; iter<Nprocs; iter++) {
    // Chaque processus ENVOIE sa tranche AL au processus precedent
    // et RECOIT la tranche AL du processus suivant ( mais les contenus changent)
    MPI_Sendrecv_replace(AL,NL*N,MPI_DOUBLE,rang_precedent,etiquette,
                         rang_suivant,etiquette,MPI_COMM_WORLD,&statut);
    // Chaque processus calcul les blocs situes au dessus
    // et en dessous du bloc de la diagonale principale
    matmul(AL,BL,&(CL[( (rang+iter)%Nprocs )*NL*NL]),NL,NL,N);
  } */

  /* Le processus 0 collecte les tranches CL de tous les processus
   * pour former la matrice résultante C */
  MPI_Gather(CL,NL*N,MPI_DOUBLE,C,1,type_tranche,0,MPI_COMM_WORLD);

  /* Les tableaux locaux sont desormais inutiles */
  free(AL); free(BL); free(CL); free(TEMP);

  /* Verification des resultats */
  if (rang == 0) {
    double Emax=0;
    for(iter=0; iter<N*N; iter++) {
      if (Emax < fabs(C[iter]-CC[iter])) {
        Emax = fabs(C[iter]-CC[iter]); }}
    free(A); free(B); free(C); free(CC);

    if (Emax < 1e-10)
      printf("Bravo !\nLe produit matriciel A*B calcule en parallele\n"
             "est bien egal a celui calcule en monoprocesseur\n");
    else
      printf("Resultat incorrect !\nLe produit matriciel A*B calcule en parallele\n"
             "est different de celui calcule en monoprocesseur\n");
  }

  MPI_Type_free(&type_temp);
  MPI_Type_free(&type_tranche);
  MPI_Finalize();
  return 0;
}
