#include <stdlib.h> 
#include <stdio.h>
#include <assert.h>
#include <stdbool.h>


#define TAILLE 5
#define RED "\x1B[31m"
#define GREEN "\x1B[32m"
#define BLUE "\x1B[34m"
#define RESET "\x1B[0m"

/*-----------------------------------Structure--------------------------------*/

// Definition du type monnaie
struct Monnaie {
    float valeur;
    char devise;
};

typedef struct Monnaie Monnaie;

/*----------------------------------------------------------------------------*/

/**
 * \Afficher la barre d'initialisattion
 */
void init_bar(void) {
    printf("\n*****************************************************************\n");
    printf("\n\t\t\t"GREEN"Conversion de la monnaie"RESET"\n");
    printf("\n*****************************************************************\n");
    printf("\n\nTéléchargment du programme ...\n");
}


/**
 * \Demander à l'utilisateur d'entrer une devise
 */
void input_devise(char *devise) {
	do {
		printf("\nEntrer la devise de votre monnaie : ");
        	scanf(" %c", devise);

		if (*devise >= 48 && *devise <= 57) {
			printf("\n"RED"ERREUR : "RESET"vous avez entrez un entier. Vous devez entrer un\ncaractère.\n");
		}
	} while (*devise >= 48 && *devise <= 57);
}


/**
 * \brief Initialiser une monnaie 
 * \param[out] m la monnaie qu'on initialisera
 * \param[in] valeur de la monnaie qu'on initialisera
 * \param[in] devise de la monnaie qu'on initialisera
 * \pre valeur > 0
 */ 
void initialiser(Monnaie* m, float valeur, char devise) {
    assert(valeur > 0);
    m->valeur = valeur;
    m->devise = devise;
}


/**
 * \brief Ajouter une monnaie m2 à une monnaie m1 
 * \param[in] m1 la monnaie qu'on l'ajouter
 * \param[in out] m2 la monnaie qu'on lui ajouter m2
 */ 
bool ajouter(Monnaie* m1, Monnaie* m2) {
	if (m1->devise == m2->devise) {
		m2->valeur += m1->valeur;
		return true;
    	} 
    	else { 
    		return false;
	}
}


/*-------------------------------Programme de test----------------------------*/

/**
 * \brief Tester Initialiser 
 */ 

void tester_initialiser() {
    	Monnaie m1, m2;

    	initialiser(&m1, 12, 'e');
    	assert (12 == m1.valeur);
    	assert ('e' == m1.devise);

    	initialiser(&m2, 26, 'f');
    	assert (26 == m2.valeur);
    	assert ('f' == m2.devise);
   
	printf("\n"GREEN"le test tester_initialiser est passé avec succés."RESET"\n");	
}


/**
 * \brief Tester Ajouter 
 */ 
void tester_ajouter() {   
	Monnaie m1, m2, m3;

        initialiser(&m1, 149, 'e');
        assert (149 == m1.valeur);
        assert ('e' == m1.devise);

        initialiser(&m2, 26, 'f');
        assert (26 == m2.valeur);
        assert ('f' == m2.devise);

	assert (!ajouter(&m1, &m2));

	initialiser(&m3, 24, 'f');
        assert (24 == m3.valeur);
        assert ('f' == m3.devise);

        assert (ajouter(&m2, &m3));
	assert (26 == m2.valeur);
        assert ('f' == m2.devise);
	assert (50 == m3.valeur);
        assert ('f' == m3.devise);

	printf("\n"GREEN"le test tester_ajouter est passé avec succés."RESET"\n");
}

/*----------------------------------------------------------------------------*/


/**
 * \Display the end bar
 */
void end_bar(void) {
    printf("\nÀ bientôt!\n");
    printf("\n\n\t\t\t"GREEN"THE END"RESET"\t\t\t\n");
    printf("\n*****************************************************************\n");
}


/**
 * \Programme pricipale
 */
int main(void) {
    	// Déclaration des variables
    	int i;
    	float sum, valeur;
    	char devise;
   	
    	// Déclarer un tableau de 5 monnaies
   	Monnaie porte_monnaie[TAILLE];
	
	// Démarrer le programme
	init_bar();

	//Initialiser les monnaies
    	for (i = 0 ; i < TAILLE ; i++){
		printf("\nEntrer la valeur de votre monnaie : ");
		scanf("%f", &valeur);

		input_devise(&devise);
	
		initialiser(&porte_monnaie[i], valeur, devise);
    	}
	
	// Afficher la somme de toutes les monnaies qui sont dans une devise entrée par l'utilisateur.
    	printf("\nAfficher la somme de toutes les monnaies qui sont dans une devise\nde votre choix.\n");
	input_devise(&devise);

    	for (i = 0 ; i < TAILLE ; i++) {
		if (porte_monnaie[i].devise == devise){
	    		sum += porte_monnaie[i].valeur;
		}
    	}
    	
	printf("\nLa somme de toutes les monnaies qui sont en "BLUE"%c"RESET" est "RED"%1.2f."RESET"\n", devise, sum);
	
	//Programmes de test
	tester_initialiser();
	tester_ajouter();

	// Fin de programme
	end_bar();

    	return EXIT_SUCCESS;
}

