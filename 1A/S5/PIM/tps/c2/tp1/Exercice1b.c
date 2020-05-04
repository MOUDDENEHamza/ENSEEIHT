#include <assert.h>
#include <stdlib.h>
#include <stdio.h>

// Consignes pour une obtenir une exécution sans erreur : 
//     - compléter les instruction **** TODO **** 
// Attention : toutes les variables sont ici allouées et libérées dynamiquent

int main(){
    float* ptr_float; //un réel en mémoire dynamique 
    // **** TODO ****
    // Allocation du réel avec CALLOC;
    ptr_float = calloc(1, sizeof(float));
    assert(*ptr_float == 0.0);

    //**** TODO **** 
    //Libérer toute la mémoire dynamique
    free(ptr_float);
    ptr_float = NULL;
    assert(!ptr_float);
        
    printf("%s", "Bravo ! Tous les tests passent.\n");
    return EXIT_SUCCESS;
}
