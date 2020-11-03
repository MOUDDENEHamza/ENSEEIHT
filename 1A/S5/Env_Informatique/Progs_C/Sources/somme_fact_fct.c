#include <stdio.h>
#include <stdlib.h>
#include <limits.h>

#define EOL '\n'

/**** Profil (signature) des sous-programmes utilisés */

/* calcul la somme des factorielles de 1 à n */
int somme_fact(int n);

/**** Fonction principale */
int main(int argc, char* argv[]) {

  int nb_item;
  unsigned int n;
  int s;

  do {
    puts("\nEntrez n (n>0) :");
    nb_item = scanf("%d",&n);
    /* vidage du buffer 
       obligatoire, sinon boucle infinie 
       dans le cas d'un échec du scanf
       (le même buffer incorrect est proposé encore et encore */
    while(getchar() != EOL){
      /* empty */
    }
  } while(nb_item != 1 || n <= 0);
  
  /* calcul de la somme des n premières factorielles */
  s = somme_fact(n);

  printf("\nla somme des %d premières factorielles : %d\n", n, s);
  
  return 0 ;
}

/**** Implémentation des sous-programmes */

/* calcul la somme des factorielles de 1 à n */
int somme_fact(int n) {

  int i, somme_i, fact_i;
  
  somme_i = 0;
  fact_i = 1;

  /* calcul de la somme des n premières factorielles */

  /* somme_i et fact_i sont initialisés */
  for(i=1; i <= n; i++) {
    if(fact_i > INT_MAX/i) return(-1);
    fact_i = fact_i*i;
    if(somme_i > INT_MAX - fact_i) return(-1);
    somme_i = somme_i + fact_i;
  }
  /* fact_i contient n!
     somme_i contient la somme des n premières factorielles */

  return somme_i;
}
