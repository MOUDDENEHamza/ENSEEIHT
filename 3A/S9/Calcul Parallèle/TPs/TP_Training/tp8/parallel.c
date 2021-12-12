#include <stdlib.h>
#include <stdio.h>
#include <math.h>

#include <mpi.h>

#include "parallel.h"
#include "params.h"
#include "calcul.h"

#define ndims 2
#define NB_VOISINS 4
#define N 0
#define E 1
#define S 2
#define W 3

int rang;
static int nb_procs;
static int dims[ndims];
static MPI_Comm comm2d;
static int voisin[NB_VOISINS];
static MPI_Datatype type_colonne, type_ligne;
int ntx, nty;
int sx, ex, sy, ey;

/*
 * Initialisation pour chaque processus de son rang et du
 * nombre total de processus nb_procs
 */
void initialisation_mpi(int argc, char* argv[]) {
  /* Initialisation de MPI */

  /* Savoir quel processus je suis */

  /* Connaitre le nombre total de processus */

}

/*
 * Creation de la topologie cartesienne
 */
void creation_topologie() {
  FILE *fichier;
  int periods[ndims];
  const int reorganisation=faux;

  /* Lecture du nombre de points ntx en x et nty en y */
  fichier = fopen("poisson.data", "r");
  fscanf(fichier, "%d", &ntx);
  fscanf(fichier, "%d", &nty);
  fclose(fichier);

  /* Connaitre le nombre de processus selon x et le nombre de processus
     selon y en fonction du nombre total de processus */


  /* Creation de la grille de processus 2D sans periodicite */

  if (rang == 0) {
    printf("Execution code poisson avec %d processus MPI\n"
           "Taille du domaine : ntx=%d nty=%d\n"
           "Dimension de la topologie : %d suivant x, %d suivant y\n"
           "-----------------------------------------\n", 
           nb_procs, ntx, nty, dims[0], dims[1]);
  }
}

/*
 * Calcul du nombre de points dans les directions x et y pour chaque sous domaine
 */
void domaine() {
  int coords[ndims];
  /* Connaitre mes coordonnees dans la topologie */


  /* Calcul pour chaque processus de ses indices de debut et de fin suivant x */
  sx = (coords[0]*ntx)/dims[0]+1;
  ex = ((coords[0]+1)*ntx)/dims[0];

  sy = (coords[1]*nty)/dims[1]+1;
  ey = ((coords[1]+1)*nty)/dims[1];

  printf("Rang dans la topologie : %d Indice des tableaux : %d a %d suivant x, "
         "%d a %d suivant y\n", rang, sx, ex, sy, ey);
}

/*
 * Calcul des processus voisins pour chaque processus
 */
void voisinage() {
  /* Recherche des voisins Nord et Sud */


  /* Recherche des voisins Ouest et Est */


  printf("Processus %d a pour voisin : N %d E %d S %d W %d\n", 
         rang, voisin[N], voisin[E], voisin[S], voisin[W]);
}

/*
 * Creation des types derives type_ligne et type_colonne
 */
void type_derive() {
  /* Creation du type type_ligne pour echanger les points
   * au nord et au sud */



  /* Creation du type type_colonne pour echanger
   * les points  a l'ouest et a l'est */


}

/*
 * IDX(i, j) : indice de l'element i, j dans le tableau u
 * sx-1 <= i <= ex+1
 * sy-1 <= j <= ey+1
 */
#define IDX(i, j) ( ((i)-(sx-1))*(ey-sy+3) + (j)-(sy-1) )
/*
 * Echange des points aux interfaces
 */
void communication(double *u) {
  const int etiquette = 100;
  MPI_Status statut;
  /* Envoi au voisin N et reception du voisin S */




  /* Envoi au voisin S et reception du voisin N */




  /* Envoi au voisin W et  reception du voisin E */




  /* Envoi au voisin E et  reception du voisin W */



}

/*
 * Calcul de l'erreur globale (maximum des erreurs locales)
 */
double erreur_globale (double *u, double *u_nouveau) {
  double erreur_locale, diffnorm;
  int iterx, itery;

  erreur_locale = 0;
  for (iterx=sx; iterx<ex+1; iterx++) {
    for (itery=sy; itery<ey+1; itery++) {
      double temp = fabs( u[IDX(iterx, itery)] - u_nouveau[IDX(iterx, itery)] );
      if (erreur_locale < temp) erreur_locale = temp;
    }
  }

  /* Calcul de l'erreur sur tous les sous-domaines */


  return diffnorm;
}

/*
 * Ecriture du tableau u a l'interieur d'un domaine pour chaque processus
 * dans le fichier donnees.dat
 */
void ecrire_mpi(double *u) {
  int code;
  MPI_File descripteur;
  int profil_tab[ndims], profil_sous_tab[ndims], coord_debut[ndims];
  MPI_Datatype type_sous_tab, type_sous_tab_vue;
  int profil_tab_vue[ndims], profil_sous_tab_vue[ndims], coord_debut_vue[ndims];
  MPI_Offset deplacement_initial;
  MPI_Status statut;

  /* Ouverture du fichier "donnees.dat" en écriture */



  /* Test pour savoir si ouverture du fichier est correcte */
  if (code != MPI_SUCCESS) {
    fprintf(stderr, "ATTENTION erreur lors ouverture du fichier");
    MPI_Abort(comm2d, 2);
  }

  /* Définition de la vue sur le fichier a partir du debut */


  
  /* Creation du type derive type_sous_tab qui definit la matrice u
   * sans les cellules fantomes */


  
  /* Ecriture du tableau u par tous les processus avec la vue */


  /* Fermeture du fichier */

  /* Nettoyage type MPI */

}


/*
 * Desactivation de l'environnement MPI
 */
void finalisation_mpi() {
  /* Nettoyage objets MPI */

  /* Desactivation de MPI */

}
