
// Consignes : 
//  1. Compléter avec les instructions requises en lieu et place de *** TODO ***

#include <assert.h>
#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <time.h>

#define NB_VALEURS 10
#define NB_CARTES 4*NB_VALEURS

//Définition du type enseigne
enum couleur {JAUNE, ROUGE, VERT, BLEU};
typedef enum couleur couleur;

//Tableau de caractères représentant les couleurs
char C[4] = {'J', 'R', 'V', 'B'};

//Définition du type carte
struct carte {
    couleur couleur;
    int valeur; // Invariant : valeur >= 0 && valeur < NB_VALEURS
    bool presente; // la carte est-elle presente dans le jeu ?
};
typedef struct carte carte;

//Définition du type jeu complet pour enregistrer NB_CARTES cartes.
typedef carte jeu[NB_CARTES];

//Définition du type t_main, capable d'enregistrer un nombre variable de cartes.
struct main {
    carte * main; //tableau des cartes dans la main. 
    int nb; //monbre de cartes
};
typedef struct main t_main;


/**
 * \brief Initialiser une carte avec une couleur et une valeur. 
 * \param[in] c couleur de la carte
 * \param[in] v valeur de la carte
 * \param[in] ej booléen presente
 * \param[out] la_carte 
 */
void init_carte(carte* la_carte, couleur c, int v, bool pr){
    la_carte->couleur = c;
    la_carte->valeur = v;
    la_carte->presente = pr;
}

/**
 * \brief Vérifie si la valeur de la carte est conforme à l'invariant.
 * \param[in] c la carte
 * \return bool vrai si la valeur est conforme, faux sinon.
 */
 bool est_conforme(carte c){
    return (c.valeur>=0 && c.valeur<NB_VALEURS);
}

/**
 * \brief Copie les valeurs de la carte src dans la carte dest.
 * \param[in] src carte à copier
 * \param[out] dest carte destination de la copie 
 */
void copier_carte(carte* dest, carte src){
    dest->couleur = src.couleur;
    dest->valeur = src.valeur;
    dest->presente = src.presente;
}


/**
 * \brief Afficher une carte.
 * \param[in] cte carte à afficher
 */
void afficher_carte(carte cte){
    printf("(%c;%d;%d)\t", C[cte.couleur],cte.valeur, cte.presente);
}

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
 * \brief mélange le jeu.
 * \param[in out] le_jeu complet
 */
void melanger_jeu(jeu le_jeu){
    for (int i=0; i<1000; i++){
        // Choisir deux cartes aléatoirement
        int i = rand()%NB_CARTES;
        int j = rand()%NB_CARTES;        
        // Les échanger
        carte mem;
        copier_carte(&mem, le_jeu[i]); 
        copier_carte(&(le_jeu[i]), le_jeu[j]); 
        copier_carte(&(le_jeu[j]), mem); 
    }
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

/**
 * \brief Vérifie si les cartes c1 et c2 on la même couleur et la même valeur.
 * \param[in] c1 carte
 * \param[in] c2 carte
 * \return bool Vrai si les deux cartes ont même valeur et couleur.
*/
bool est_egale(carte c1, carte c2){
    return ((c1.couleur == c2.couleur) && (c1.valeur == c2.valeur));
}

/**
 * \brief Vérifie si la carte c est présente dans la main.
 * \param[in] main main d'un joueur
 * \param[in] c carte
 * \return bool Vrai si la carte est presente dans la main, faux sinon.
*/
bool est_presente_main(t_main main, carte c){
    int i = 0;
    while (i < main.nb && !est_egale(main.main[i], c)) {
        i++;
    }
    return !(i == main.nb);
}


/**
 * \brief Piocher une carte dans le jeu et l'inclure dans la main en paramètre.
 * \param[in out] le_jeu complet avec les 4 couleurs et 10 valeurs possibles.
 *                Ce jeu est mélangé.
 *                Si la carte est inclue dans une main ou est la derniere carte jouée,
 *                Alors carte.presente vaut faux.
 * \param[in out] main main d'un joueur
 * \return carte * un pointeur sur la carte piochee dans le_jeu en paramètre. 
 * Ce pointeur vaut NULL si aucune carte ne peut être piochée ou si l'allocation de mémoire échoue.
*/
carte * piocher(jeu le_jeu, t_main* main){
    // Recherche une carte presente dans le jeu.
    carte *carte_piochee = le_jeu;
    int i = 0;
    while(i < NB_CARTES && carte_piochee->presente == false){
        carte_piochee = carte_piochee + 1;
        i++;
    }
    if (i == NB_CARTES) {
        carte_piochee = NULL;
    } else {
        // Inserer la carte dans la main       
        //*** TODO *** ;
        // Reallouer la mémoire pour enregistrer une carte de plus dans la main.
        // Penser à l'echec de la reallocation
        
        // Copier la carte_piochee dans la main
        
        // Indiquer que carte_piochee n'est plus presente dans le_jeu
        
    }
    return carte_piochee;
}

/**
 * \brief Initialise le jeu de carte, les mains des joueurs et la carte 'last'.
 * \param[out] le_jeu complet avec les 4 couleurs et 10 valeurs possibles.
 *                Ce jeu est mélangé.
 *                Si la carte est inclue dans une main ou est la derniere carte jouée,
 *                Alors carte.presente vaut faux.
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
  
    test_piocher();
    
    printf("%s", "\n Bravo ! Tous les tests passent.\n");
    return EXIT_SUCCESS;
}

