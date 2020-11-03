#include <stdio.h>

#define EOL '\n'

/* Profil (signature) des sous-programmes utilisés */
void swap_qui_marche_pas(int a, int b);
void swap(int *a, int *b);
void affiche_tableau(int t[], int n);

int main() {

  int v1 = 10;
  int v2 = 20;

  int i, j;
  int *p, *q;
  int **r = &p;

  int t[10];

  i = 10;
  p = &i;
  j = *p + 3;
  q = p;
  r = &p;
  
  printf(" i = %d, *p = %d, j = %d, *q = %d, **r = %d\n", i, *p, j, *q, **r);
  *p = *p + 1;
  printf(" i = %d, *p = %d, j = %d, *q = %d, **r = %d\n", i, *p, j, *q, **r);
  p = &j;
  printf(" i = %d, *p = %d, j = %d, *q = %d, **r = %d\n", i, *p, j, *q, **r);
  *p = *p + 1;
  printf(" i = %d, *p = %d, j = %d, *q = %d, **r = %d\n", i, *p, j, *q, **r);
  *q = *q + 1;
  printf(" i = %d, *p = %d, j = %d, *q = %d, **r = %d\n", i, *p, j, *q, **r);
  **r = **r + 1;
  printf(" i = %d, *p = %d, j = %d, *q = %d, **r = %d\n", i, *p, j, *q, **r);
  r = &q;
  printf(" i = %d, *p = %d, j = %d, *q = %d, **r = %d\n", i, *p, j, *q, **r);

  printf("valeurs initiales de v1 et v2 : %d, %d\n", v1, v2);

  swap_qui_marche_pas(v1, v2);
  printf("valeurs de v1 et v2 après swap_qui_marche_pas : %d, %d\n", v1, v2);

  swap(&v1, &v2);
  printf("valeurs de v1 et v2 après swap : %d, %d\n", v1, v2);

  affiche_tableau(t, 10);
  p = t;
  t[0] = 1;
  t[1] = 2;
  *(t+2) = 3;
  *(p+3) = 4;
  p = p + 4;
  *p = 5;
  p[1] = 6;
  p++;
  p[1] = 7;

  affiche_tableau(t, 10);
  affiche_tableau(p, 5);

  swap(t+3, t+4);
  affiche_tableau(t,10);

  /* interdit : t est constant
  t=p;  
  t++ */

  return 0;
}

void swap_qui_marche_pas(int a, int b) {
  int aux;
  
  aux = a;
  a = b;
  b = aux;

  return;
}

void swap(int *a, int *b) {

  int aux;
  
  aux = *a;
  *a = *b;
  *b = aux;

  return;
}

void affiche_tableau(int t[], int n) {

  int i;

  for (i = 0; i < n; i++) {
    printf("%d ", t[i]);
  }
  printf("\n");

  return;

}
