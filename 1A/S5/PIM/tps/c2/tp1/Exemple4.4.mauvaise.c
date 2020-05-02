

#include <assert.h>
#include <stdlib.h>
#include <stdio.h>

#define TAILLE 10

int main(){

    // Allouer un tableau de TAILLE entiers
    int* tableau = malloc(TAILLE*sizeof(int));
    assert(tableau); //allocation réussie ?
    
    // Initialiser les éléments à 1
    for (int i=0; i<TAILLE; i++){
        tableau[i]=1;
    }
    
    // Augmenter la taille du tableau pour enregistrer TAILLE entiers supplémentaires.
    tableau = realloc(tableau, (TAILLE+TAILLE)*sizeof(int));
    assert(tableau); // ré-allocation réussie ?
    
    //test des 5 premiers éléments
    assert(tableau[0]==1 && tableau[1]==1 && tableau[2]==1 && tableau[3]==1 && tableau[4]==1); 

    for (int i=TAILLE; i<TAILLE+TAILLE; i++){
        tableau[i]=2;
    }
    
    //test de 5 nouveaux éléments
    assert(tableau[TAILLE]==2 && tableau[TAILLE+1]==2 && tableau[TAILLE+2]==2 && tableau[TAILLE+3]==2 && tableau[TAILLE+4]==2); 
    
    printf("%s", "\n Bravo ! Tous les tests passent.\n");
    return EXIT_SUCCESS;
}

