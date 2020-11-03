#include <stdio.h>
//#include <stdlib.h>
#include <assert.h>

#define EOL '\n'

/**** Profil (signature) des sous-programmes utilisés */

/* sous-programme qui affiche les diviseurs de n */
void affiche_div(int n);

/**** Fonction principale */

int main(int argc, char* argv[]) {

  int nb_item;
  int n;

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
  } while(nb_item != 1 );
  
  printf("Les diviseurs de %d sont :\n", n);
  /* affichage des diviseurs de n */
  affiche_div(n);

  return 0 ;
}

/**** Implémentation des sous-programmes */

/* sous-programme qui affiche les diviseurs de n */
void affiche_div(int n) {

  int i;

  assert(n>0);
  
  for(i=1; i <= n/2; i++) {
    if(n%i == 0) {
      printf("%d\n", i);
    }
  }
  printf("%d\n", n);

  return;
}
