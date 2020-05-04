#include <stdio.h>
#include <stdlib.h>
#include "carte.h"

#define NB_VALEURS 10
#define NB_CARTES (4*NB_VALEURS)

//Tableau de caractères représentant les couleurs
char C[4] = {'J', 'R', 'V', 'B'};

/**
 * \brief Initialiser une carte avec une couleur et une valeur. 
 * \param[in] c couleur de la carte
 * \param[in] v valeur de la carte
 * \param[in] ej booléen presente
 * \param[out] la_carte 
 */
void init_carte(carte* la_carte, couleur c, int v, bool pr) {
    la_carte->couleur = c;
    la_carte->valeur = v;
    la_carte->presente = pr;
}

/**
 * \brief Vérifie si la valeur de la carte est conforme à l'invariant.
 * \param[in] c la carte
 * \return bool vrai si la valeur est conforme, faux sinon.
 */
 bool est_conforme(carte c) {
    return (c.valeur>=0 && c.valeur<NB_VALEURS);
}

/**
 * \brief Copie les valeurs de la carte src dans la carte dest.
 * \param[in] src carte à copier
 * \param[out] dest carte destination de la copie 
 */
void copier_carte(carte* dest, carte src) {
    dest->couleur = src.couleur;
    dest->valeur = src.valeur;
    dest->presente = src.presente;
}

void afficher_carte(carte cte) {
    printf("(%c;%d;%d)\t", C[cte.couleur],cte.valeur, cte.presente);
}
