
#include <assert.h>
#include <stdlib.h>
#include <stdio.h>

int main(){
    int taille_entier = sizeof(int);
    printf("Taille d'un entier : %d\n", taille_entier);
    int taille_pointeur = sizeof(int*);
    printf("Taille d'un pointeur : %d\n", taille_pointeur);
    
    // Allouer un tableau de 10 entiers
    int* mon_tableau = malloc(10*taille_entier);
    int taille_dynamique = sizeof(mon_tableau);
    assert(taille_dynamique == taille_pointeur);
    
    // Declarer un tableau statique de 10 entiers 
    int mon_tab[10];
    int taille_statique = sizeof(mon_tab);
    assert(taille_statique == 10*taille_entier);
    
    printf("%s", "Bravo ! Tous les tests passent.\n");
    return EXIT_SUCCESS;
}

