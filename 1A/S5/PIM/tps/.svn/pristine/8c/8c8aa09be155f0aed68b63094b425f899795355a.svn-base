#include <assert.h>
#include <stdlib.h>
#include <stdio.h>

#define TAILLE 1e6
#define INC 1e14

int main(){

    // Allouer un tableau de TAILLE entiers initialisés à 1.
    int* tableau = malloc(TAILLE*sizeof(int));
    assert(tableau); //allocation réussie ?
    
    // Initialisation à 1
    for (int i=0; i<TAILLE; i++){
        tableau[i]=1;
    }
    
    // Augmentater la taille du tableau pour enregistrer 10 entiers.
    int* nouveau = realloc(tableau, (TAILLE+INC)*sizeof(int));
    if (nouveau) {
        //recopie de l'adresse uniquement si succès 
        tableau = nouveau;
    }
    assert(tableau[0]==1);
    
    printf("%s", "\n Bravo ! Tous les tests passent.\n");
    return EXIT_SUCCESS;
}

