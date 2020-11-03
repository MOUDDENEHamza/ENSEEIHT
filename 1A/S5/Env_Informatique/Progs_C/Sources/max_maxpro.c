#include <stdio.h>

/*---------------------------------------------------------------- 
  Fonction qui renvoie le maximum d'un tableau non vide
  et le nombre de maximums provisoires
----------------------------------------------------------------*/

/* Profil (signature) des fonctions utilisées */
int max_maxpro(int t[], int n, int *maxpro);

int main() {

  int max, nb_maxpro;
  int i;

  int test[] = {1,3,2,1,4,3,2};
  const long n = sizeof(test)/sizeof(int);

  for(i = 0; i < n; i++) {
    printf("test[%d] = %d\n", i, test[i]);
  }

  max = max_maxpro(test, n, &nb_maxpro);
  printf("maximum : %d\nnombre de maximum provisoires : %d\n", max, nb_maxpro);

  return 0;
}

/* 
   max_maxpro(t, n, &nb_maxpro) renvoie le maximum de t entre l'indice 0 et 
   l'indice n-1 et affecte nb_maxpro avec le nombre de maximums provisoires
   rencontrés dans un parcours de gauche à droite
*/

int max_maxpro(int t[], int n, int *maxpro) {
  int i;
  int max;
  
  *maxpro = 0;
  max = t[0];
  
  for(i = 1; i < n; i++) {
    if(t[i] > max) {
      max = t[i];
      *maxpro = *maxpro + 1;
      /* ou */
/*       (*maxpro)++; */
      /* mais pas */
/*       *maxpro++; */
    }
  }

  return max;
}

