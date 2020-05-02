#include "uno.h"
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

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


void test_piocher(){
    jeu le_jeu; // le jeu de cartes
    t_main main_A, main_B; // les deux mains
    carte last; // la derniere carte posee
   
    //Préparer le jeu, les deux mains de 7 cartes et la carte last
    int retour = preparer_jeu_UNO(le_jeu, 7, &main_A, &main_B, &last);
    printf("\n Les deux mains : \n");
    afficher_main(main_A);
    afficher_main(main_B);

    int mem_taille = main_A.nb;
    
    //Le joueur A pioche une carte dans le_jeu
    carte *c_piochee = piocher(le_jeu, &main_A);
    
    // Une carte a-t-elle été piochée ?
    assert(c_piochee);
    assert(c_piochee->presente==false); // absence du jeu ?
    assert(est_presente_main(main_A, *c_piochee));
    assert(main_A.nb = mem_taille + 1);

    // Affichage
    printf("\n\n ***** APRES la pioche : ");
    printf("\n La carte piochee : ");
    afficher_carte(*c_piochee);
    printf("\n La nouvelle main A après pioche : \n");
    afficher_main(main_A);
    printf("\n Le nouveau jeu après pioche : \n");
    afficher_jeu(le_jeu);

    //Détruire la mémoire allouée dynamiquement
    free(main_A.main);
    free(main_B.main);
    main_A.main = NULL;
    main_B.main = NULL;
}

int main(void) {
  
    test_preparer_jeu_UNO();
    test_piocher();
    
    printf("%s", "\n Bravo ! Tous les tests passent.\n");
    return EXIT_SUCCESS;
}
