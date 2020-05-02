#ifndef MAIN__H
#define MAIN__H

#include "carte.h"
#include "jeu.h"
//Définition du type t_main, capable d'enregistrer un nombre variable de cartes.
struct main {
    carte * main; //tableau des cartes dans la main. 
    int nb; //monbre de cartes
};
typedef struct main t_main;

/**
 * \brief Initialiser une main.
 * \param[in] N nombre de cartes composant la main.  Précondition : N <= (NB_CARTES - 1) div 2
 * \param[out] la_main créée
 * \return true si l'initialisation a échouée.
 */
bool init_main(t_main* la_main, int N);


/**
 * \brief Afficher une main.
 * \param[in] la_main la main a afficher
 */
void afficher_main(t_main la_main);

/**
 * \brief Vérifie si la carte c est présente dans la main.
 * \param[in] main main d'un joueur
 * \param[in] c carte
 * \return bool Vrai si la carte est presente dans la main, faux sinon.
*/
bool est_presente_main(t_main main, carte c);

#endif
