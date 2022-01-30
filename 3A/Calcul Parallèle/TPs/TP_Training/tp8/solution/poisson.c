/*
 *   poisson.c - Resolution de l'equation de Poisson en utilisant Jacobi
 *   sur le domaine [0,1]x[0,1]par une methode aux differences finies,
 *   avec comme solveur Jacobi.
 *   Delta u = f(x,y)= 2*(x*x-x+y*y -y)
 *   u sur les bords vaut 0
 *   La solution exacte est u= x*y*(x-1)*(y-1)
 *
 *   La valeur de u est donnee par la formule:
 *    coef(1) = (0.5*hx*hx*hy*hy)/(hx*hx+hy*hy)
 *    coef(2) = 1./(hx*hx)
 *    coef(3) = 1./(hy*hy)
 *
 *    u(i,j)(n+1)= coef(1) * ( coef(2)*(u(i+1,j)+u(i-1,j)) &
 *               + coef(3)*(u(i,j+1)+u(i,j-1)) - f(i,j))
 *
 *   Dans cette version, on se donne le nombre de points interieurs
 *   total suivant x (ntx) et le nombre de points interieurs total
 *   suivant y (nty).
 *
 *   hx represente le pas suivant x, hy le pas suivant y
 *    hx = 1./(ntx+1)
 *    hy = 1./(nty+1)
 *
 *   Pour chaque processus :
 *   1) decomposer le domaine
 *   2) connaitre ses 4 voisins
 *   3) echanger les points aux interfaces
 *   4) calculer
 *   5) recomposer la matrice u dans un fichier de sortie donnees.dat
 *
 *   Auteur          : Dimitri Lecas  (CNRS/IDRIS - France)
 *
 */

#include <stdlib.h>
#include <stdio.h>
#include <mpi.h>

#include "parallel.h"
#include "params.h"
#include "calcul.h"

int main(int argc, char *argv[]) {
  double *u, *u_nouveau, *u_exact;
  int it, convergence;
  double t1, t2;
  double *temp;
  double diffnorm;

  /* Initialisation de MPI */
  initialisation_mpi(argc, argv);

  /* Creation de la topologie cartesienne 2D */
  creation_topologie();

  /* Determinination des indices de chaque sous domaine */
  domaine();

  /* Initialisation du second membre, u, u_nouveau et u_exact */
  initialisation(&u, &u_nouveau, &u_exact);

  /* Recherche de ses 4 voisins pour chaque processus */
  voisinage();

  /* Creation des types derives type_ligne et type_colonne */
  type_derive();

  /* Schema iteratif en temps */
  it = 0;
  convergence = faux;

  /* Mesure du temps en seconde dans la boucle en temps */
  t1 = MPI_Wtime();

  while (!(convergence) && (it < it_max)) {
    it = it+1;

    temp = u; u = u_nouveau; u_nouveau = temp;

    /* Echange des points aux interfaces pour u a l'iteration n */
    communication(u);

    /* Calcul de u a l'iteration n+1 */
    calcul(u, u_nouveau);

    /* Calcul de l'erreur globale */
    diffnorm = erreur_globale (u, u_nouveau);

    /* Arret du programme si on a atteint la precision machine obtenu */
    convergence = (diffnorm < eps);

    /* Affichage pour le processus 0 de la difference */
    if ((rang == 0) && ((it % 100) == 0))
      printf("Iteration %d erreur_globale = %g\n", it, diffnorm);
  }

  /* Mesure du temps a la sortie de la boucle */
  t2 = MPI_Wtime();

  if (rang == 0) {
    /* Affichage du temps de convergence par le processus 0 */
    printf("Convergence apres %d iterations en %f secs\n", it, t2-t1);

    /* Comparaison de la solution calculee et de la solution exacte
     * sur le processus 0 */
    sortie_resultats(u, u_exact);
  }

  /* Ecriture des resultats u(sx:ex, sy:ey)
   * pour chaque processus */
  ecrire_mpi(u);

  free(u);
  free(u_nouveau);
  free(u_exact);
  /* free(f); */

  finalisation_mpi();
  return 0;
}
