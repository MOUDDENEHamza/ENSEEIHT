/**
 *  \author Xavier Crégut <nom@n7.fr>
 *  \file file.h
 * 
 *  Objectifs :
 *	.  Définition et utilisation des modules
 *	.  Allocation dynamique de mémoire
 */

#include <stdbool.h>

struct Cellule {
    char valeur;
    struct Cellule *suivante;
};
typedef struct Cellule Cellule;

struct File {
    Cellule *tete;
    Cellule *queue;
    /** Invariant :
      *	 file vide :	tete == NULL && queue == NULL
      */
};
typedef struct File File;


/**
 * Initialiser la file \a f.
 * La file est vide.
 *
 * Assure
 *	est_vide(*f);
 */
void initialiser(File *f);

/**
 * Détruire la file \a f.
 * Elle ne pourra plus être utilisée (sauf à être de nouveau initialisée)
 */
void detruire(File *f);

/**
 * L'élément en tête de la file.
 * Nécessite :
 *	! est_vide(f);
 */
char tete(File f);

/**
 * Ajouter dans la file \a f l'élément \a v.
 *
 * Nécessite :
 *	f != NULL;
 */
void inserer(File *f, char v);

/**
 * Extraire l'élément \a v en tête de la file \a f.
 * Nécessite
 *	f != NULL;
 *	! est_vide(*f);
 */
void extraire(File *f, char *v);

/**
 * Est-ce que la file \a f  est vide ?
 */
bool est_vide(File f);

/**
 * Obtenir la longueur de la file.
 */
int longueur(File f);
