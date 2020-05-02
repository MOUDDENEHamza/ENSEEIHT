#include <string.h> 
#include <stdlib.h>
#include <stdio.h>

#include "carte.h"

//Tableau de caractères représentant les couleurs
char C[4] = {'J', 'R', 'V', 'B'};

void init_carte(carte* la_carte, couleur c, int v, bool pr){
    la_carte->couleur = c;
    la_carte->valeur = v;
    la_carte->presente = pr;
}

 bool est_conforme(carte c){
    return (c.valeur>=0 && c.valeur<NB_VALEURS);
}

void copier_carte(carte* dest, carte src){
    dest->couleur = src.couleur;
    dest->valeur = src.valeur;
    dest->presente = src.presente;
}


bool est_egale(carte c1, carte c2){
    return ((c1.couleur == c2.couleur) && (c1.valeur == c2.valeur));
}

void afficher_carte(carte cte){
    printf("(%c;%d;%d)\t", C[cte.couleur],cte.valeur, cte.presente);
}
