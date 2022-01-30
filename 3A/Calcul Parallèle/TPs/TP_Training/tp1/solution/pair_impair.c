/*
 * pair_impair.c --- TP1 : Affichage d'un message différent par les processus
 *                            pairs et les processus impairs
 *
 * Auteur          : Dimitri LECAS (CNRS/IDRIS - France) <dimitri.lecas@idris.fr>
 *
 */

#include "mpi.h"
#include <stdio.h>

int main(int argc, char *argv[]) {
  int rang, nb_processus;

  MPI_Init(&argc, &argv);

  MPI_Comm_rank(MPI_COMM_WORLD, &rang);
  MPI_Comm_size(MPI_COMM_WORLD, &nb_processus);

  if ((rang % 2) == 0)
    printf("Coucou, je suis le processus pair   %d\n", rang);
  else
    printf("Coucou, je suis le processus impair %d\n", rang);

  MPI_Finalize();
  return 0;
}
