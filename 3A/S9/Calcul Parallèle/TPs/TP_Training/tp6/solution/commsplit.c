/*
 * commsplit.f90 --- Subdiviser une grille 2D avec MPI_COMM_SPLIT
 *
 *
 */

#include <mpi.h>
#include <stdlib.h>
#include <stdio.h>

int main(int argc, char *argv[]) {
  int nb_procs,rang;
  const int nDimCart2D=2;
  int dimCart2D[nDimCart2D];
  int periode[nDimCart2D];
  const int faux=0;
  int reordonne;
  MPI_Comm commCart2D,commCart1D;
  int coordCart2D[nDimCart2D];
  const int m=4;
  double v[4];
  double w;

  MPI_Init(&argc, &argv);

  MPI_Comm_size(MPI_COMM_WORLD, &nb_procs);

  dimCart2D[0] = 4;
  dimCart2D[1] = 2;
  if (dimCart2D[0]*dimCart2D[1] != nb_procs) {
    /* On arrete le programme */
    fprintf(stderr, "Ce n'est pas le nombre de processus necessaire !");
    MPI_Abort(MPI_COMM_WORLD,1);
  }
  periode[0] = faux; periode[1] = faux;
  reordonne = faux;

  /* Creation du communicateur commcart2D (topologie cartesienne 2D) */
  MPI_Cart_create(MPI_COMM_WORLD,nDimCart2D,dimCart2D, periode, reordonne,
                  &commCart2D);
  MPI_Comm_rank(commCart2D,&rang);
  MPI_Cart_coords(commCart2D,rang,nDimCart2D,coordCart2D);

  /* Initialisation du vecteur V et du scalaire W */
  w = v[0] = v[1] = v[2] = v[3] = 0;
  if (coordCart2D[0] == 1) {
    v[0] = 1; v[1] = 2; v[2] = 3; v[3] = 4; }

  /* Subdivision de la grille 2D a l'aide de MPI_COMM_SPLIT */
  MPI_Comm_split(commCart2D, coordCart2D[1], rang, &commCart1D);

  /* Les processus de la 2eme colonne diffusent selectivement
   * le vecteur V aux processus de leur ligne */
  MPI_Scatter(v,1,MPI_DOUBLE,&w,1,MPI_DOUBLE,1,commCart1D);

  printf("Rang : %2d ; Coordonnees ( %1d , %1d ) ; W = %2f\n",
         rang, coordCart2D[0], coordCart2D[1], w);

  MPI_Comm_free(&commCart1D);
  MPI_Comm_free(&commCart2D);

  MPI_Finalize();
  return 0;
}

