#include <stdio.h>

#define EOL '\n'

/**** Profil (signature) des sous-programmes utilisés */

/* affiche_tab affiche les valeurs du tableau t de taille n */

/**** Fonction principale */

int main(int argc, char *charv[]) {

  int tab[4][4] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15};
  int tab1[16] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15};
  //const long n = sizeof(tab)/sizeof(int);
  int n=4;


  register int i,j,x;
  int *p=tab[0];
   
  for (i = 0; i < n; i++){
  for (j = 0; j < n; j++){
	x=x+tab[i][j];
    //printf("%d ; ", tab[i][j]);
  }
  //printf("%x\n",p);
 }
  for (j = 0; j < (n*n); j++){
	x=x+*p;
    //printf("%d ; ", *p);
	p++;
  }
  //printf("%x\n",p);
  for (j = 0; j < (n*n); j++){
	x=x+p[j];
    //printf("%d ; ", p[j]);
  }
 p=tab1;
  //printf("%x\n",p);
  for (j = 0; j < (n*n); j++){
	x=x+p[j];
//    printf("%d ; ", p[j]);
  }
    printf("%d ; ", x);
  return 0;
}

/**** Implémentation des sous-programmes */

/* affiche_tab affiche les valeurs du tableau t de taille n */


/*
> gcc -o affiche affiche.c
> ./affiche 
0 ; 2 ; 1 ; 2 ; 4 ; 5 ; 6 ; 4 ; 7 ; 1 ; 0 ; 14
*/

