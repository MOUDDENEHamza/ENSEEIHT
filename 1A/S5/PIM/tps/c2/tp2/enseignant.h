#ifndef ENSEIGNANT_H
#define ENSEIGNANT_H

#include "date.h"

struct enseignant {
	char *nom;
	Date *d_naissance;
};
typedef struct enseignant enseignant; 

#endif
