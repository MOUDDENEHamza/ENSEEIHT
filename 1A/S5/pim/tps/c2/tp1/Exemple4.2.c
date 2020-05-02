
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

void exemple_dynamique(){
    //Allouer dynamiquement un entier
    unsigned int taille = sizeof(int);
    int *mon_entier = malloc(taille);
    //Vérifier le succès de la demande d'allocation
    assert(mon_entier != NULL);
    
    //Initialiser la donnée à travers le pointeur mon_entier
    *mon_entier = 10;
    //Accéder à la donnée
    printf("Donnée enregistrée : %d\n", *mon_entier);
    
    //Libérer la mémoire dynamique
    free(mon_entier);
    //Oublier l'adresse mémoire
    mon_entier = NULL;
}

int main() {
    exemple_dynamique();
    return EXIT_SUCCESS;
}

