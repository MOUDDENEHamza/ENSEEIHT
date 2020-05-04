#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include "main.h"
#include "carte.h"

/**
 * \brief Initialiser une main.
 * \param[in] N nombre de cartes composant la main.  Précondition : N <= (NB_CARTES - 1) div 2
 * \param[out] la_main créée
 * \return true si l'initialisation a échouée.
 */
bool init_main(t_main* la_main, int N){
    assert(N <= (NB_CARTES-1)/2);
    la_main->main = malloc(N*sizeof(carte));
    la_main->nb = N;
    return (la_main==NULL); //allocation réussie ?
}

/**
 * \brief Afficher une main.
 * \param[in] la_main la main a afficher
 */
void afficher_main(t_main la_main){
    for (int k=0; k<la_main.nb; k++){
        afficher_carte(la_main.main[k]);
    }
    printf("\n");
}

/**
 \brief Distribuer N cartes à chacun des deux joueurs, en alternant les joueurs.
 * \param[in out] le_jeu complet.
 *       Si la carte c est distribuée dans une main, c.presente devient faux.
 * \param[in] N nombre de cartes distribuées à chaque joueur.  Précondition : N <= (NB_CARTES - 1) div 2
 * \param[out] m1 main du joueur 1.
 * \param[out] m2 main du joueur 2.
 */
void distribuer_mains(jeu le_jeu, int N, t_main* m1, t_main* m2){
    assert(N <= (NB_CARTES-1)/2);

    //Initialiser les mains de N cartes
    bool errA = init_main(m1, N);
    bool errB = init_main(m2, N);
    assert(!errA && !errB);

    //Distribuer les cartes
    for (int i=0; i<N; i++){
        // ajout d'une carte dans la main m1
        copier_carte(&(m1->main[i]), le_jeu[2*i]);
        // ajout d'une carte dans la main m2
        copier_carte(&(m2->main[i]), le_jeu[2*i+1]);
        //mise à jour de presente à false dans le_jeu
        le_jeu[2*i].presente = false;
        le_jeu[2*i+1].presente = false;
    }
}

