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
  MPI_Init(&argc, &argv);

  /* Savoir quel processus je suis */
  MPI_Comm_rank(MPI_COMM_WORLD, &rang);

  /* Connaitre le nombre total de processus */
  MPI_Comm_size(MPI_COMM_WORLD, &nb_procs);
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
  dims[0] = dims[1] = 0;
  MPI_Dims_create(nb_procs, ndims, dims);

  /* Creation de la grille de processus 2D sans periodicite */
  periods[0] = periods[1] = faux;
  MPI_Cart_create(MPI_COMM_WORLD, ndims, dims, periods, reorganisation, &comm2d);

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
  MPI_Cart_coords(comm2d, rang, ndims, coords);

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
  MPI_Cart_shift(comm2d, 0, 1, &(voisin[N]), &(voisin[S]));

  /* Recherche des voisins Ouest et Est */
  MPI_Cart_shift(comm2d, 1, 1, &(voisin[W]), &(voisin[E]));

  printf("Processus %d a pour voisin : N %d E %d S %d W %d\n", 
         rang, voisin[N], voisin[E], voisin[S], voisin[W]);
}

/*
 * Creation des types derives type_ligne et type_colonne
 */
void type_derive() {
  /* Creation du type type_ligne pour echanger les points
   * au nord et au sud */
  MPI_Type_contiguous(ey-sy+1, MPI_DOUBLE, &type_ligne);
  MPI_Type_commit(&type_ligne);

  /* Creation du type type_colonne pour echanger
   * les points  a l'ouest et a l'est */
  MPI_Type_vector(ex-sx+1, 1, ey-sy+3, MPI_DOUBLE, &type_colonne);
  MPI_Type_commit(&type_colonne);
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
  /* MPI 3 version
  int snbr[NB_VOISINS], rnbr[NB_VOISINS];
  MPI_Aint sdisp[NB_VOISINS], rdisp[NB_VOISINS];
  MPI_Datatype stype[NB_VOISINS], rtype[NB_VOISINS];
  int iterx, itery,iterr, sizedouble;
  
  snbr[3] = snbr[2] = snbr[1] = snbr[0] = 1;
  rnbr[3] = rnbr[2] = rnbr[1] = rnbr[0] = 1;
  stype[1] = stype[0] = type_ligne; stype[3] = stype[2] = type_colonne;
  rtype[1] = rtype[0] = type_ligne; rtype[3] = rtype[2] = type_colonne;
  MPI_Type_size(MPI_DOUBLE, &sizedouble);
  sdisp[0] = IDX(sx, sy)*sizedouble; sdisp[1] = IDX(ex, sy)*sizedouble;
  sdisp[2] = IDX(sx, sy)*sizedouble; sdisp[3] = IDX(sx, ey)*sizedouble;
  rdisp[0] = IDX(sx-1, sy)*sizedouble; rdisp[1] = IDX(ex+1, sy)*sizedouble;
  rdisp[2] = IDX(sx, sy-1)*sizedouble; rdisp[3] = IDX(sx, ey+1)*sizedouble;
  
  MPI_Neighbor_alltoallw(u, snbr, sdisp, stype, u, rnbr, rdisp, rtype, comm2d);
  */
  /* Envoi au voisin N et reception du voisin S */
  MPI_Sendrecv(&(u[IDX(sx, sy)]), 1, type_ligne, voisin[N], etiquette, 
               &(u[IDX(ex+1, sy)]), 1, type_ligne, voisin[S], etiquette, 
               comm2d, &statut);

  /* Envoi au voisin S et reception du voisin N */
  MPI_Sendrecv(&(u[IDX(ex, sy)]), 1, type_ligne, voisin[S], etiquette, 
               &(u[IDX(sx-1, sy)]), 1, type_ligne, voisin[N], etiquette, 
               comm2d, &statut);

  /* Envoi au voisin W et  reception du voisin E */
  MPI_Sendrecv(&(u[IDX(sx, sy)]), 1, type_colonne , voisin[W], etiquette, 
               &(u[IDX(sx, ey+1)]), 1, type_colonne , voisin[E], etiquette, 
               comm2d, &statut);

  /* Envoi au voisin E et  reception du voisin W */
  MPI_Sendrecv(&(u[IDX(sx, ey)]), 1, type_colonne, voisin[E], etiquette, 
               &(u[IDX(sx, sy-1)]), 1, type_colonne, voisin[W], etiquette, 
               comm2d, &statut);
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
  MPI_Allreduce(&erreur_locale, &diffnorm, 1, MPI_DOUBLE, MPI_MAX, comm2d);

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
  code = MPI_File_open(comm2d, "donnees.dat", MPI_MODE_WRONLY+MPI_MODE_CREATE, 
                       MPI_INFO_NULL, &descripteur);

  /* Test pour savoir si ouverture du fichier est correcte */
  if (code != MPI_SUCCESS) {
    fprintf(stderr, "ATTENTION erreur lors ouverture du fichier");
    MPI_Abort(comm2d, 2);
  }

  /* Creation du type derive type_sous_tab qui definit la matrice u
   * sans les cellules fantomes */
  profil_tab[0] = ex-sx+3;
  profil_tab[1] = ey-sy+3;

  /* Profil du sous tableau */
  profil_sous_tab[0] = ex-sx+1;
  profil_sous_tab[1] = ey-sy+1;

  /* Coordonnees de depart du sous tableau */
  coord_debut[0] = 1;
  coord_debut[1] = 1;

  /* Creation du type_derive type_sous_tab */
  MPI_Type_create_subarray(ndims, profil_tab, profil_sous_tab, coord_debut, 
                           MPI_ORDER_C, MPI_DOUBLE, &type_sous_tab);

  /* Validation du type_derive type_sous_tab */
  MPI_Type_commit(&type_sous_tab);

  /* Creation du type type_sous_tab_vue  pour la vue sur le fichier */
  /* Profil du tableau global */
  profil_tab_vue[0] = ntx;
  profil_tab_vue[1] = nty;

  /* Profil du sous tableau */
  profil_sous_tab_vue[0] = ex-sx+1;
  profil_sous_tab_vue[1] = ey-sy+1;

  /* Coordonnees de depart du sous tableau */
  coord_debut_vue[0] = sx-1;
  coord_debut_vue[1] = sy-1;

  /* Creation du type_derive type_sous_tab_vue */
  MPI_Type_create_subarray(ndims, profil_tab_vue, profil_sous_tab_vue, coord_debut_vue, 
                           MPI_ORDER_C, MPI_DOUBLE, &type_sous_tab_vue);

  /* Validation du type_derive type_sous_tab_vue */
  MPI_Type_commit(&type_sous_tab_vue);

  /* Définition de la vue sur le fichier a partir du debut */
  deplacement_initial = 0;
  MPI_File_set_view(descripteur, deplacement_initial, MPI_DOUBLE, 
                    type_sous_tab_vue, "native", MPI_INFO_NULL);

  /* Ecriture du tableau u par tous les processus avec la vue */
  MPI_File_write_all(descripteur, u, 1, type_sous_tab, &statut);

  /* Fermeture du fichier */
  MPI_File_close(&descripteur);

  /* Nettoyage type MPI */
  MPI_Type_free(&type_sous_tab_vue);
  MPI_Type_free(&type_sous_tab);
}


/*
 * Desactivation de l'environnement MPI
 */
void finalisation_mpi() {
  /* Nettoyage objets MPI */
  MPI_Comm_free(&comm2d);
  MPI_Type_free(&type_ligne);
  MPI_Type_free(&type_colonne);
  /* Desactivation de MPI */
  MPI_Finalize();
}
