/*
 * transpose.f90  --- Utilisation d'un type derive (type_transpose)
 *                    pour transposer une matrice.
 *
 *
 * Auteur          : Dimitri LECAS (CNRS/IDRIS - France)
 *                   <dimitri.lecas@idris.fr>
 *
 */

#include "mpi.h"
#include <stdlib.h>
#include <stdio.h>

int main(int argc, char *argv[]) {
  int nb_lignes=5;
  int nb_colonnes=4;
  int etiquette=1000;
  double a[nb_lignes][nb_colonnes];
  double at[nb_colonnes][nb_lignes];
  int rang,iterl,iterc,taille_reel;
  MPI_Datatype type_colonne, type_transpose;
  MPI_Aint pas;
  MPI_Status statut;

  /* Initialisation de MPI */
  MPI_Init( &argc, &argv);

  /* Qui je suis */
  MPI_Comm_rank( MPI_COMM_WORLD, &rang);





  /* Type_transpose pour at */

  /* Validation du type_transpose */


  if (rang == 0) {
    /* Initialisation de A */
    for (iterl=0; iterl<nb_lignes; iterl++)
      for (iterc=0; iterc<nb_colonnes; iterc++)
        a[iterl][iterc] = 1+iterc*nb_lignes+iterl;

    /* Affichage de A */
    printf("Matrice a\n");
    for (iterl=0; iterl<nb_lignes;iterl++) {
      for (iterc=0; iterc<nb_colonnes; iterc++) {
        printf("%4.f ", a[iterl][iterc]);
      }
      printf("\n");
    }

    /* Envoi de la matrice A au processus 1 */

  } else {
    /* Reception dans la matrice AT avec le type_transpose */


    /* Affichage */
    printf("Matrice transposee at\n");
    for (iterc=0; iterc<nb_colonnes; iterc++) {
      for (iterl=0; iterl<nb_lignes;iterl++) {
        printf("%4.f ", at[iterc][iterl]);
      }
      printf("\n");
    }
  }

  /* Nettoyage types MPI */

  /* Sortie de MPI */
  MPI_Finalize();
  return 0;
}
