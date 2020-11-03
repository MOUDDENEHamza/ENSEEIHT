#include <stdio.h>
#include <malloc.h>

/* prototype */
int *tableau_des_carres(int n);

/* fonction principale */ 
int main() {

  int n;
  int nb_item;
  int i;
  int *tab; /* le tableau est alloué par la fonction */

  /* lecture de la valeur */
  do {
    puts("Entrez n :");
    nb_item = scanf("%d", &n);
    while(getchar() != '\n') {
      /* empty */
    }
  } while(nb_item != 1);

  /* calcul des n premiers carrés */
  tab = tableau_des_carres(n);
  if(tab!=NULL) {
    /* affichage */
    printf("\nles %d premiers carrés :\n", n);
    for(i = 0; i < n; i++) {
      printf("%d ", tab[i]);
    }
    printf("\n");
  }
  else {
    printf("Problème d'allocation");
  }
    
  return 0 ;
}
 
/* fonction */
int *tableau_des_carres(int dim){

  int *t;
  int i;
  
  /* création des cases du tableau */
  t = (int *) malloc(dim*sizeof(int));

  if(t!=NULL) {
    /* remplissage */
    for (i = 0; i < dim; i++){
      t[i]=(i+1)*(i+1);
    }
  }
  return t;
}

/* test
> gcc -o tableau_des_carres tableau_des_carres.c 
> ./tableau_des_carres 
Entrez n :
10

les 10 premiers carrés :
1 4 9 16 25 36 49 64 81 100
*/
