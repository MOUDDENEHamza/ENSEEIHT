/*
 * ping_pong_3.c   --- TP3 : Communications point à point :
 *                           ping-pong pour des tailles variables de messages
 *
 * Auteur          : Dimitri LECAS (CNRS/IDRIS - France) <dimitri.lecas@idris.fr>
 *
*/

#include "mpi.h"
#include <stdlib.h>
#include <stdio.h>


int main(int argc, char *argv[]) {
  int rang,iter,iter2;
  int nb_tests=10;
  int nb_valeurs[nb_tests];
  int nb_valeurs_max=7000000;
  int etiquette=99;
  double *valeurs;
  MPI_Status statut;
  double temps_debut,temps_fin;

  MPI_Init(&argc, &argv);

  nb_valeurs[0]=0,nb_valeurs[1]=0,nb_valeurs[2]=1,nb_valeurs[3]=10;
  nb_valeurs[4]=100,nb_valeurs[5]=1000,nb_valeurs[6]=10000;
  nb_valeurs[7]=100000,nb_valeurs[8]=1000000,nb_valeurs[9]=7000000;

  MPI_Comm_rank(MPI_COMM_WORLD, &rang);

  valeurs = (double *) malloc(nb_valeurs_max*sizeof(double));

  for(iter=0; iter<nb_tests; iter++) {
    if (rang == 0) {
      for (iter2 = 0; iter2<nb_valeurs_max; iter2++)
        valeurs[iter2] = rand() / (RAND_MAX + 1.);
      temps_debut=MPI_Wtime();
      MPI_Send(valeurs, nb_valeurs, MPI_DOUBLE, 1, etiquette, MPI_COMM_WORLD);
      MPI_Recv(valeurs, nb_valeurs, MPI_DOUBLE, 1, etiquette, MPI_COMM_WORLD, &statut);
      temps_fin=MPI_Wtime();
      if (nb_valeurs[iter] != 0) {
        printf("Moi, processus 0, j'ai envoye et recu %8d valeurs"
               "(derniere = %4.2f) du processus 1 en %8.6f secondes, soit "
               "avec un debit de %7.2f Mo/s.\n",
               nb_valeurs[iter], valeurs[nb_valeurs[iter]-1],
               temps_fin-temps_debut,
               2.*nb_valeurs[iter]*8/1000000./(temps_fin-temps_debut));
      } else
        printf("Moi, processus 0, j'ai envoye et recu %8d valeurs en %8.6f "
               "secondes, soit avec un debit de %7.2f Mo/s.\n",
               nb_valeurs[iter], temps_fin-temps_debut,
               2.*nb_valeurs[iter]*8/1000000./(temps_fin-temps_debut));
    } else if(rang == 1) {
      MPI_Recv(valeurs, nb_valeurs, MPI_DOUBLE, 0, etiquette, MPI_COMM_WORLD, &statut);
      MPI_Send(valeurs, nb_valeurs, MPI_DOUBLE, 0, etiquette, MPI_COMM_WORLD);
    }
  }

  MPI_Finalize();
  return 0;
}
