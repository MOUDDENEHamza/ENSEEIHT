#include <stdio.h>
 
int main(int argc, char* argv[]) {

  // const int n = 10;
  #define n 10
  int i;
  int somme_i;
  int fact_i;
  
  somme_i = 0;
  fact_i = 1;

  /* calcul de la somme des n premières factorielles */

  /* somme_i et fact_i sont initialisés */
  for(i=1; i <= n; i++) {
    fact_i = fact_i*i;
    somme_i = somme_i + fact_i;
  }
  /* fact_i contient n!
     somme_i contient la somme des n premières factorielles */
  
  printf("\nla somme des %d premières factorielles : %d\n", n, somme_i);
  
  return 0 ;
}

/*
 
Compilation :
>gcc -Wall -c somme_fact.c
 
Édition de liens (un seul fichier !) :
>gcc -o somme_fact somme_fact.o
 
Éxécution :
>./somme_fact
 
la somme des 10 premières factorielles : 4037913

Compilation et édition en une commande :

>gcc -Wall -o somme_fact somme_fact.c
 
*/
