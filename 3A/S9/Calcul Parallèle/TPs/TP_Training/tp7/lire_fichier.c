/*
 * lire_fichier.c --- T.P. 7 du cours MPI (à exécuter sur 4 processus)
 *
 * Auteur          : Dimitri LECAS (CNRS/IDRIS - France) <dimitri.lecas@idris.fr>
 *
 */

#include <mpi.h>
#include <stdlib.h>
#include <stdio.h>

int main(int argc, char * argv[]) {
  const int nb_valeurs=121;
  int valeurs[nb_valeurs];
  int rang,iter;
  MPI_File descripteur;
  int nb_octets_entier;
  MPI_Offset position_fichier;
  MPI_Status statut;
  char nom_fichier[256];
  FILE * fichier;

  MPI_Init( &argc, &argv);
  MPI_Comm_rank(MPI_COMM_WORLD,&rang);

  /* Ouverture du fichier donnees.dat en lecture */




  /* Lecture via des deplacements explictites en mode individuel */
  for (iter=0;iter<nb_valeurs; iter++) valeurs[iter]=0;


  sprintf(nom_fichier,"fichier_dei%1d.dat",rang);
  fichier = fopen(nom_fichier,"w");
  for (iter=0; iter<nb_valeurs; iter++)
    fprintf(fichier,"%3d\n",valeurs[iter]);
  fclose(fichier);



  /* Lecture via les pointeurs partages en mode collectif */
  for (iter=0;iter<nb_valeurs; iter++) valeurs[iter]=0;


  sprintf(nom_fichier,"fichier_ppc%1d.dat",rang);
  fichier = fopen(nom_fichier,"w");
  for (iter=0; iter<nb_valeurs; iter++)
    fprintf(fichier,"%3d\n",valeurs[iter]);
  fclose(fichier);


  /* Lecture via les pointeurs individuels en mode individuel */
  for (iter=0;iter<nb_valeurs; iter++) valeurs[iter]=0;


  sprintf(nom_fichier,"fichier_pii%1d.dat",rang);
  fichier = fopen(nom_fichier,"w");
  for (iter=0; iter<nb_valeurs; iter++)
    fprintf(fichier,"%3d\n",valeurs[iter]);
  fclose(fichier);


  /* Lecture via les pointeurs partages en mode individuel */
  for (iter=0;iter<nb_valeurs; iter++) valeurs[iter]=0;


  sprintf(nom_fichier,"fichier_ppi%1d.dat",rang);
  fichier = fopen(nom_fichier,"w");
  for (iter=0; iter<nb_valeurs; iter++)
    fprintf(fichier,"%3d\n",valeurs[iter]);
  fclose(fichier);

  /* Fermeture du fichier */


  MPI_Finalize();
  return 0;
}
