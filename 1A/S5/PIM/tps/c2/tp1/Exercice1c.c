
#define XXX 1

#include <assert.h>
#include <stdlib.h>
#include <stdio.h>

// Consignes pour une obtenir une exécution sans erreur : 
//     - Remplacer XXX par le bon résultat dans la suite.
// Attention : toutes les variables sont ici allouées et libérées dynamiquent

int main(){

    enum chat {SIAMOIS, CALICO, PERSAN, TABBY};
    enum chat * my_cat;
    my_cat = calloc(1, sizeof(enum chat));
    assert(*my_cat == XXX);

    //**** TODO **** 
    //Libérer toute la mémoire dynamique
    
    assert(!my_cat);

    printf("%s", "Bravo ! Tous les tests passent.\n");
    return EXIT_SUCCESS;
}
