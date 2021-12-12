#ifndef PARALLEL_H
#define PARALLEL_H

extern int rang;

void initialisation_mpi( int, char **);
void creation_topologie();
void domaine();
void voisinage();
void type_derive();
void communication(double *);
double erreur_globale(double *, double *);
void ecrire_mpi(double *);
void finalisation_mpi();

#endif
