#include <stdlib.h>
#include <stdio.h>

#include "calcul.h"
#include "params.h"

/* Second membre */
static double *f;
static double coef[3];

/*
 * u : nbligne = ex-sx+3 nbcolonne = ey-sy+3
 */

#define IDX(i, j) ( ((i)-(sx-1))*(ey-sy+3) + (j)-(sy-1) )

void initialisation(double **pu, double **pu_nouveau, double **pu_exact) {
  double hx, hy;
  int iterx, itery;
  double x, y;

  *pu = calloc( (ex-sx+3) * (ey-sy+3), sizeof(double));
  *pu_nouveau = calloc( (ex-sx+3) * (ey-sy+3), sizeof(double));
  *pu_exact = calloc( (ex-sx+3) * (ey-sy+3), sizeof(double));
  f = calloc( (ex-sx+3) * (ey-sy+3), sizeof(double));

  /* Pas */
  hx = 1/(ntx+1.);
  hy = 1/(nty+1.);

  /* Calcul des coefficients */
  coef[0] = (0.5*hx*hx*hy*hy)/(hx*hx+hy*hy);
  coef[1] = 1./(hx*hx);
  coef[2] = 1./(hy*hy);

  /* Initialisation du second membre et calcul de la solution exacte */
  for(iterx=sx; iterx<ex+1; iterx++) {
    for (itery=sy; itery<ey+1; itery++) {
      x = iterx*hx;
      y = itery*hy;
      f[IDX(iterx, itery)] = 2*(x*x-x+y*y-y);
      (*pu_exact)[IDX(iterx, itery)] = x*y*(x-1)*(y-1);
    }
  }
}

/*
 * Calcul de la solution u_nouveau a l'iteration n+1
 */
void calcul(double *u, double *u_nouveau) {
  int iterx, itery;

  for (iterx=sx; iterx<ex+1; iterx++) {
    for (itery=sy; itery<ey+1; itery++) {
      u_nouveau[IDX(iterx, itery)] =
        coef[0] * (  coef[1]*(u[IDX(iterx+1, itery)]+u[IDX(iterx-1, itery)])
                   + coef[2]*(u[IDX(iterx, itery+1)]+u[IDX(iterx, itery-1)])
        - f[IDX(iterx, itery)]);
    }
  }
}

/*
 * Affichage
 */
void sortie_resultats(double *u, double *u_exact) {
  int itery;

  printf("Solution exacte u_exact - Solution calculee u\n");
  for(itery=sy; itery<ey+1; itery++)
    printf("%12.5e - %12.5e\n", u_exact[IDX(1, itery)], u[IDX(1, itery)]);
}
