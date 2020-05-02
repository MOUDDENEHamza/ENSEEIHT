
#include <assert.h>
#include <stdlib.h>
#include <stdio.h>

#define TAILLE 1000000
#define INC 1e13

int main(){

    // Allouer un tableau de TAILLE entiers.
    int* tableau = malloc(TAILLE*sizeof(int));
    assert(tableau); //allocation réussie ?
    
    // Initialiser les éléments à 1
    for (int i=0; i<TAILLE; i++){
        tableau[i]=1;
    }
    
    // Augmenter la taille du tableau pour enregistrer INC entiers supplémentaires.
    tableau = realloc(tableau, (TAILLE+INC)*sizeof(int));
    assert(tableau);
    
    // Initialiser l'élément d'indice 0 à 2
    tableau[0]=2;
    
    printf("%s", "\n Bravo ! Tous les tests passent.\n");
    return EXIT_SUCCESS;
}

