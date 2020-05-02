#include "compteur.h"
#include <stdio.h>

// acces au compteur de compteur.c
extern int compteur;

int main(){
  // initialiser
  re_initialiser();
  printf("Init Compteur c=%d\n", valeur());
  
  // ********* DECOMMENTER *********
  // compteur = compteur +1;
  // printf("Incrementer directement le compteur c=%d\n", valeur());
  // ******* FIN DECOMMENTER *******
  
  // incrementer
  incrementer();
  printf("Incrementer c=%d\n", valeur());
  // access au compteur sans appel a valeur()
  incrementer();
  incrementer();
  printf("Acces direct a compteur c=%d\n", compteur);

  return 0; 
}
