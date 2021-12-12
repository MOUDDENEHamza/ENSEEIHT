#include <stdlib.h>
#include <stdio.h>

int main(int argc, char *argv[]) {
  FILE *fichier=NULL;
  int ntx, nty;
  double u_exact;
  double *u_calc;
  int iter, iterx, itery;
  double hx, hy;
  double x, y;
  double erreur,u1,u2,tmp;

  /* Lecture de ntx et nty */
  fichier = fopen("poisson.data", "r");
  fscanf(fichier, "%d", &ntx);
  fscanf(fichier, "%d", &nty);
  fclose(fichier);

  /* Pas */
  hx = 1./(ntx+1);
  hy = 1./(nty+1);

  fichier = fopen("fort.11", "r");
  if (fichier == NULL) {
    fprintf(stdout, "COURAGE, le fichier n'est pas correctement écrit\n");
    return 0; }

  u_calc = malloc(ntx*nty*sizeof(double));
  for (iter=0; iter<ntx*nty; iter++) {
    u_calc[iter] = 0;
    fscanf(fichier, "%lf\n", &(u_calc[iter])); }
  fclose(fichier);

  /* Calcul de la solution exacte */
  erreur = 0;
  for (iterx=1; iterx<ntx+1; iterx++) {
    for (itery=1; itery<nty+1; itery++) {
      x = iterx*hx;
      y = itery*hy;
      u_exact = (x*y*(x-1)*(y-1));
      tmp = (u_calc[ (iterx-1)*nty + itery-1] - u_exact);
      if (tmp < 0) tmp *= -1;
      /*fprintf(stdout, "%e %e %e\n", tmp, u_exact,u_calc[ (iterx-1)*nty + itery-1] );*/
      if (tmp > erreur) {
        erreur = tmp;
        u1 = u_exact;
        u2 = u_calc[ (iterx-1)*nty + itery-1];
      }
    }
  }
  fprintf(stdout, "max ecart numerique %e\n", erreur);
  fprintf(stdout, "u_exact %e u_calc %e\n", u1, u2);

  if (erreur < 1e-6) {
    fprintf(stdout, "BRAVO, vous avez fini\n"); }
  else {
    fprintf(stdout,"COURAGE, le fichier n'est pas bon\n"); }

  fflush(stdout);

  free(u_calc);

  return 0;
}

