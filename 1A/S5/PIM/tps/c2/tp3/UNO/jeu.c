
#include "jeu.h"
#include <stdlib.h>
#include <stdio.h>

/**
 * \brief Initialiser le jeu en ajoutant toutes les cartes possibles au jeu.
 * \param[out] le_jeu tableau de cartes avec les 4 couleurs et NB_VALEURS valeurs possibles
 */
void init_jeu(jeu le_jeu){
    int k=0;
    for (int i=0 ; i<4 ; i++){
        for (int j=0 ; j<NB_VALEURS ; j++){
            init_carte(&(le_jeu[k]), i, j, true);
            k++;
        }
    }
}

/**
 * \brief Afficher le jeu.
 * \param[in] le_jeu complet avec les 4 couleurs et 910valeurs possibles
 */
void afficher_jeu(jeu le_jeu){
    for (int k=0; k<NB_CARTES; k++){
        afficher_carte(le_jeu[k]);
    }
    printf("\n");
}

/**
 * \brief mélange le jeu.
 * \param[in out] le_jeu complet
 */
void melanger_jeu(jeu le_jeu){
    for (int k=0; k<10000; k++){
        // Choisir deux cartes aléatoirement
        int i = rand() % NB_CARTES;
        int j = rand() % NB_CARTES;
        // Les échanger
        carte mem;
        copier_carte(&mem, le_jeu[i]); 
        copier_carte(&(le_jeu[i]), le_jeu[j]); 
        copier_carte(&(le_jeu[j]), mem); 
    }
}

