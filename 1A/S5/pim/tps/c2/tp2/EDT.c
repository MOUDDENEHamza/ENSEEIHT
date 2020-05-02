#include "cours.h"
#include "enseignant.h"
#include "salle.h"
#include <stdio.h> 
#include <stdlib.h> 

int main(){
	Date auj = date_aujourd_hui();
	afficher_date(auj);
	return EXIT_SUCCESS;
}

