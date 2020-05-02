#include "uno.h"
#include <stdlib.h> 
#include <stdio.h>

int main(){
	jeu le_jeu; // le jeu de cartes
	t_main main_A, main_B; // les deux mains
	carte last; // la derniere carte posee

	//Préparer le jeu, les deux mains de 7 cartes et la carte last
	int retour = preparer_jeu_UNO(le_jeu, 7, &main_A, &main_B, &last);
	printf("\n Les deux mains : \n");
 	afficher_main(main_A);
	afficher_main(main_B);

	return EXIT_SUCCESS;
}
