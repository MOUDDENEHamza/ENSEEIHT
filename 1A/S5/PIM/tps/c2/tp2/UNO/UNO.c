#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <stdbool.h>
#include <time.h>
#include "carte.h"
#include "main.h"
#include "jeu.h"
#include "UNO.h"

/**
 * \brief Initialise le jeu de carte, les mains des joueurs et la carte 'last'.
 * \param[out] le_jeu complet avec les 4 couleurs et 10 valeurs possibles.
 *                Ce jeu est mélangé.
 *                Si la carte est inclue dans une main ou est présente sur le deck, 
 *                Alors presente vaut vrai.
 * \param[in] N nombre de cartes par main.  Precondition : N <= (NB_CARTES-1)/2);
 * \param[out] main_A main du joueur A.
 * \param[out] main_B main du joueur B.
 * \param[out] last la derniere carte jouée par un des joueurs.
 */
int preparer_jeu_UNO(jeu le_jeu, int N, t_main* main_A, t_main* main_B, carte* last){
    assert(N <= (NB_CARTES-1)/2);

    //Initialiser le générateur de nombres aléatoires
    time_t t;
    srand((unsigned) time(&t));

    //Initialiser le jeu
    init_jeu(le_jeu);

    //Melanger le jeu
    melanger_jeu(le_jeu);

    //Distribuer N cartes à chaque joueur
    distribuer_mains(le_jeu, N, main_A, main_B);

    //Initialiser last avec la (2N+1)-ème carte du jeu.
    copier_carte(last, le_jeu[2*N]);
    le_jeu[2*N].presente = false; //carte n'est plus presente dans le_jeu

    return EXIT_SUCCESS;
}

void test_preparer_jeu_UNO(){
    //Déclarer un jeu (tableau statique)
    // *** TODO ***
    jeu le_jeu;

    //Déclarer les deux mains (tableaux dynamiques)
    // *** TODO ***
    t_main main_A, main_B;

    //Déclarer la carte last (i.e. derniere carte jouée)
    carte last;

    //Préparer le jeu, les deux mains de 7 cartes et la carte last
    int retour = preparer_jeu_UNO(le_jeu, 7, &main_A, &main_B, &last);
    printf("\n Le jeu mélangé avec les cartes presentes (c ; v ; p) : \n");
    afficher_jeu(le_jeu);
    printf("\n Les deux mains : \n");
    afficher_main(main_A);
    afficher_main(main_B);
    printf("\n La carte last : ");
    afficher_carte(last);
    printf("\n");

    //Vérifier le jeu et les mains.
    assert(retour == EXIT_SUCCESS);
    assert(main_A.nb == 7 && main_B.nb==7);
    assert(main_A.main != NULL && main_B.main != NULL);
    assert(est_conforme(main_A.main[0]));
    assert(est_conforme(main_B.main[0]));
    assert(est_conforme(last));


    //Détruire la mémoire allouée dynamiquement
    // *** TODO ***
    free(main_A.main);
    free(main_B.main);
    main_A.main = NULL;
    main_B.main = NULL;

    assert(main_A.main == NULL);
    assert(main_B.main == NULL);

}


int main(void) {

    test_preparer_jeu_UNO();

    printf("%s", "\n Bravo ! Tous les tests passent.\n");
    return EXIT_SUCCESS;
}

