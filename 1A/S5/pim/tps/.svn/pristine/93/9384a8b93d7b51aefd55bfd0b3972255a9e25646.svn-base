/**
 *  module date
 */

// Garde conditionnelle pour protéger le module de la double inclusion
#ifndef DATE_H
#define DATE_H

// Inclusion des bibliothèques nécessaires à l'interface __ET__ au corps
#include <time.h>

// Declaration des types
enum NomJour { DIMANCHE, LUNDI, MARDI, MERCREDI, JEUDI, VENDREDI, SAMEDI};
enum Mois {JAN, FEV, MAR, AVR, MAI, JUIN, JUIL, AOUT, SEPT, OCT, NOV, DEC };
typedef enum NomJour NomJour;
typedef enum Mois Mois;

struct Date {
    int jour;
    NomJour nomJour;
    Mois mois;
    int annee;
    // Invariant : jour>=1 && jour<=31; annee>0
};
typedef struct Date Date;


// Declaration (en avant !) des fonctions et procedures

// Initialise une date. Elle vaut alors Jeudi 01/01/1970.
void initialiser(Date* date);

// Retourne la date d'aujourd'hui
Date date_aujourd_hui();

// Affiche dans stdout la date d'aujourd'hui au format d.jour/(d.mois+1)/d.annee
void afficher_date(Date d);

// Convertit la date au format time_t de time.h en une date de type Date
void convertir_vers_date(time_t t, Date* date);

#endif
