/**
 *  Module date
 */

// Inclure l'interface Date.h
#include "date.h"

// Inclure les bibliothèques uniquement nécessaire à Date.c
#include <stdio.h>
#include <math.h>

void initialiser(Date *date){
    date->jour = 1;
    date->nomJour = JEUDI;
    date->mois = JAN;
    date->annee = 1970;
}
void convertir_vers_date(time_t t, Date* date){
    struct tm now;
    localtime_r(&t, &now);//convertion fuseau horaire
    date->jour = now.tm_mday;//jour
    date->nomJour = now.tm_wday;//jour de la semaine
    date->mois = now.tm_mon;//mois
    date->annee = now.tm_year+1900;//annee (a partir de 1900)
}
Date date_aujourd_hui(){
    time_t t = time(0);   // date systeme avec #include <time.h>
    Date auj;
    convertir_vers_date(t, &auj);
    return auj;
}
void afficher_date(Date d){
    printf("Date %i/%i/%i \n",d.jour, (d.mois+1), d.annee);
}

