#include <stdio.h>
#include <malloc.h>

/*---------------------------------------------------------------- 
  Fonction create_complexe qui renvoie un nombre complexe
          à partir de 2 réels
----------------------------------------------------------------*/

typedef struct complexe {
          float pr;
          float pi;
        } Complexe, *P_complexe;

/* Profil (signature) des sous-programme utilisés */
P_complexe create_complexe(float a, float b);
void print_complexe(struct complexe c);

int main() {

  struct complexe *ptc1;

  ptc1 = create_complexe(1.5, 2.5);	
  print_complexe(*ptc1);

  free(ptc1);
  print_complexe(*ptc1);
  ptc1 = NULL;
  print_complexe(*ptc1);

  return 0;
}

/* 
   make_complexe(a, b) crée le nombre complexe a +b*i à partir de 2 réels a et b
*/

P_complexe create_complexe(float reel1, float reel2) {

  P_complexe pc;
  
  pc= (P_complexe) malloc(sizeof(Complexe));
  if(pc!=NULL) {
    pc->pr=reel1;
    pc->pi=reel2;
  }
  return pc;
}

void print_complexe(struct complexe a) {
  printf("%f + %f*i\n", a.pr, a.pi);
  return;
}

/*  execution

> gcc -o create_complexe create_complexe.c 
> ./create_complexe 
./create_complexe 
1.500000 + 2.500000*i
0.000000 + 2.500000*i
Erreur de segmentation (core dumped)
*/
