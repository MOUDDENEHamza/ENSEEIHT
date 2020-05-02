
#include "salle.h"
#include "enseignant.h"

struct cours{
	Date debut;
	Date fin;
	char* nom;
};
typedef struct cours cours;

void initialiser_cours(cours *c, salle s, enseignant e);
