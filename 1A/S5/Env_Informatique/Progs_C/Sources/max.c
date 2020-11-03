#include <stdio.h>
#include <assert.h>

/**** Profil (signature) des sous-programmes utilisés */

/* maxtab renvoie la valeur max du tableau t de taille n (n > 0 ) */
int maxtab(int t[], int n);

/**** Fonction principale */

int main(int argc, char *charv[]) {

  int tab[] = {0,2,1,2,4,5,6,4,7,1,0,14};
  const long int n = sizeof(tab)/sizeof(int);
  int max;

  max = maxtab(tab, n);

  printf("la valeur max du tableau est : %d\n", max);

  return 0;
}

/**** Implémentation des sous-programmes */

/* maxtab renvoie la valeur max du tableau t de taille n */
int maxtab(int t[], int n) {

  int i;
  int max;

  assert(n > 0);
  max = t[0];
   
  for (i = 1; i < n; i++){
    if(max < t[i]) {
      max = t[i];
    }
  }

  return max;
}

/*
> gcc -o max max.c
> ./max 
la valeur max du tableau est : 14
*/
