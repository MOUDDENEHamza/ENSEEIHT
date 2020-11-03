#include <stdio.h>
#include <assert.h>

#define EOL '\n'

/*** Profil (signature) des sous-programmes utilisés */

/* kieme renvoie l'indice de la kieme (k > 0) occurence
   de x dans le tableau t de taille n (n >= 0);
   si cette valeur n'est pas présente, elle renvoie -1 */
int kieme_occurence(int x, int k, int t[], int n);

/**** Fonction principale */

int main(int argc, char *charv[]) {

  int tab[] = {0, 2, 1, 2, 4, 5, 6, 4, 7, 1, 0, 3};
  const long n = sizeof(tab)/sizeof(int);

  int valeur;
  int indice;
  int k;

  int nb_item;

  /* lecture de la valeur */
  do {
    puts("\nEntrez la valeur recherchée :");
    nb_item = scanf("%d",&valeur);
    while(getchar() != EOL) {/* empty */;}
  } while(nb_item != 1);

  /* lecture du k */
  do {
    puts("\nEntrez la valeur de k :");
    nb_item = scanf("%d",&k);
    while(getchar() != EOL) {/* empty */;}
  } while(nb_item != 1);
  
  indice = kieme_occurence(valeur, k, tab, n);

  if(indice == -1) {
    printf("la valeur %d n'a pas %d occurence(s) dans le tableau\n", valeur, k);
  }
  else {
    printf("la %d ième occurence de la valeur %d est à l'indice %d \n",
           k, valeur, indice);
  }

  /* pour tester le assert */
  indice = kieme_occurence(valeur, k, tab, -1);

  return 0;
}

/* kieme_occurence renvoie l'indice de la kieme occurence
   de x dans le tableau t de taille n ;
   si cette valeur n'est pas présente, elle renvoie -1 */
int kieme_occurence(int x, int k, int t[], int n) {

  int i = 0;

  assert(n >= 0 && k > 0);

  while(i<n && k>0) {
    if(t[i]==x) {
      k--;
    }
    i++;
  }

  if(k == 0) {
    i--;
  }
  else {
    i = -1;
  }

  return i;
}

/*
> gcc -o kieme_occurence kieme_occurence.c
> ./kieme_occurence 

Entrez la valeur recherchée :
3

Entrez la valeur de k :
2
la valeur 3 n'a pas 2 occurence(s) dans le tableau

> ./kieme_occurence 

Entrez la valeur recherchée :
2

Entrez la valeur de k :
2
la 2 ième occurence de la valeur 2 est à l'indice 3 
*/
