/*
 * pi.c --- TP3 : Diffusions globales et réductions
 *
 * Auteur          : Dimitri LECAS (CNRS/IDRIS - France) <dimitri.lecas@idris.fr>
 *
 */

#include <stdio.h>
#include <mpi.h>

#define MAX(a,b) ((a) > (b) ? a : b)
#define MIN(a,b) ((a) < (b) ? a : b)

int main(int argc, char *argv[]) {
  long long nbbloc,i;
  double largeur, somme, x;
  int rang,nbprocs;
  long long debut,fin;
  double global;

  MPI_Init(&argc, &argv);
  MPI_Comm_rank(MPI_COMM_WORLD,&rang);
  MPI_Comm_size(MPI_COMM_WORLD,&nbprocs);

  /* Nombre d'intervalles */
  nbbloc = 3*1000*1000LL*100;
  /* largeur des intervalles */
  largeur = 1.0/nbbloc;

  somme = 0;

  debut = (rang*nbbloc)/nbprocs;
  fin = ((rang+1)*nbbloc)/nbprocs;

  /*debut = ((1.0*rang)*nbbloc)/nbprocs;
    fin = ((1.0*(rang+1))*nbbloc)/nbprocs;*/

  /*debut = rang*(nbbloc/nbprocs)+MIN(rang,nbbloc%nbprocs);
    fin = debut+1+(nbbloc-(rang+1))/nbprocs;*/

  /*debut = rang*(nbbloc/nbprocs)+MIN(rang,nbbloc%nbprocs);
    fin = debut+(nbbloc/nbprocs);
    if (rang < (nbbloc%nbprocs)) fin++;*/

  /*debut = rang*(nbbloc/nbprocs)+MAX((nbbloc%nbprocs)+rang-nbprocs,0);
    fin = debut+(nbbloc+rang)/nbprocs;*/

  printf("%d debut: %lld fin: %lld delta: %lld\n", rang, debut, fin, fin-debut);

  for (i=debut; i<fin; i++) {
    /* Point au milieu de l'intervalle */
    x = largeur*(i+0.5);
    /* Calcul de l'aire */
    somme = somme + largeur*(4.0 / (1.0 + x*x));
  }

  MPI_Reduce(&somme, &global, 1, MPI_DOUBLE, MPI_SUM, 0, MPI_COMM_WORLD);
  if (rang ==0) printf("Pi = %.12lf\n", global);
  i = fin-debut;
  MPI_Allreduce(MPI_IN_PLACE,&i,1,MPI_LONG_LONG, MPI_SUM, MPI_COMM_WORLD);
  if (rang ==0) printf("Nb = %lld\n", i);

  MPI_Finalize();
  return 0;
}