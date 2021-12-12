/*
 * ping_pong_1.c   --- TP2 : Communications point à point :
 *                           envoi d'un message du processus 0 au processus 1
 *
 * Auteur          : Dimitri LECAS (CNRS/IDRIS - France) <dimitri.lecas@idris.fr>
 *
*/

#include "mpi.h"
#include <stdlib.h>
#include <stdio.h>


int main(int argc, char *argv[]) {
  int rang,iter;
  int nb_valeurs=1000;
  int etiquette=99;
  double valeurs[nb_valeurs];
  MPI_Status statut;

  MPI_Init(&argc, &argv);

  MPI_Comm_rank(MPI_COMM_WORLD, &rang);

  if (rang == 0) {
    for (iter = 0; iter<nb_valeurs; iter++)
      valeurs[iter] = rand() / (RAND_MAX + 1.);
    MPI_Send(valeurs,nb_valeurs,MPI_DOUBLE,1,etiquette,MPI_COMM_WORLD);
  } else if(rang == 1) {
    MPI_Recv(valeurs,nb_valeurs,MPI_DOUBLE,0,etiquette,MPI_COMM_WORLD,&statut);
    printf("Moi, processus 1, j'ai recu %d valeurs (derniere = %g)"
           "du processus 0.\n", nb_valeurs, valeurs[nb_valeurs-1]);
  }

  MPI_Finalize();
  return 0;
}
