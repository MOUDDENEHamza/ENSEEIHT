#include <stdio.h>
#include <malloc.h>

#include "liste.h"

struct chainon {
  int valeur;
  Liste suivant;
};

/* l1 = nouvelle_liste() renvoie une liste vide */
Liste nouvelle_liste() {
  return NULL; 
}

/* ret = est_vide(l1)
   renvoie 0 si l1 n'est pas vide, 
   quelque chose de différent sinon */
int est_vide(Liste l) {
  return (l == NULL);
}

/* ret = rechercher(val, l1)
   renvoie 0 si val n'appartient pas à l1,
   quelque chose de différent sinon */
int rechercher(int x, Liste l) {

  while(!est_vide(l) && l -> valeur != x) {
    l = l -> suivant;
  }

  return (l != NULL);
}

/* afficher(l1) affiche les éléments de l1 */
void afficher(Liste l) {

  if(est_vide(l)) {
    printf("\n ### la liste est vide ###\n");
  }
  else {
    printf("\n--- début liste ---\n");

    while(!est_vide(l)) {

      printf("%d\n", l -> valeur);
      l = l -> suivant;
    }

    printf("\n--- fin liste ---\n");
  }

  return;
}

/* ret = inserer_en_tete(val, &l1) insère val en tête de l1, 
   renvoie OK si l'opération est réussie, ERREUR si elle échoue */
CODE_RETOUR inserer_en_tete(int x, Liste *l) {

  Liste nv_chainon = (Liste) malloc (sizeof(struct chainon));
  CODE_RETOUR retour = OK;
  
  if(nv_chainon == NULL) {
    retour = ERREUR;
  }
  else {
    nv_chainon -> valeur = x;
    nv_chainon -> suivant = *l;
    *l = nv_chainon;
  }

  return retour;
}

/* ret = inserer_en_fin(val, &l1) insère val en fin de l1, 
   renvoie OK si l'opération est réussie, ERREUR si elle échoue */
CODE_RETOUR inserer_en_fin(int x, Liste *l){
  Liste nv_chainon = (Liste) malloc (sizeof(struct chainon));
  CODE_RETOUR retour = OK;
  Liste courant;
  
  if(nv_chainon == NULL) {
    retour = ERREUR;
  }
  else {
    nv_chainon -> valeur = x;
    nv_chainon -> suivant = NULL;

    if(est_vide(*l)) {
      *l = nv_chainon;
    } else {
      courant = *l;
      while(!est_vide(courant -> suivant)) {
        courant = courant -> suivant;
      }
      /* courant -> suivant est NULL */
      /* on raccroche à courant le nouveau chaînon */
      courant -> suivant = nv_chainon;
    }
  }

  return retour;
}

/* ret = supprimer_en_tete(&val, &l1) 
   enlève la tête de l1 et la range dans val, 
   renvoie OK si la liste n'était pas vide, ERREUR sinon */
CODE_RETOUR supprimer_en_tete(int *x, Liste *l) {

  Liste aux;
  CODE_RETOUR retour = OK;

  if(est_vide(*l)) {
    retour = ERREUR;
  }
  else {
    aux = *l;
    *x = aux -> valeur;
    *l = aux -> suivant;
    free(aux);
  }

  return retour;
}

/* ret = inserer_en_triant(val, &l1, comp)
   insère un élément val dans l1 à sa place
   en utilisant la fonction de comparaison comp
   renvoie OK si l'opération est réussie, ERREUR sinon */
CODE_RETOUR inserer_en_triant(int x, Liste *l, int (*cmp) (int, int)) {

  Liste nv_chainon, courant, precedent;
  CODE_RETOUR retour = OK;
  
  nv_chainon = (Liste) malloc (sizeof(struct chainon));

  if(nv_chainon == NULL) {
    retour = ERREUR;
  }
  else {
    nv_chainon -> valeur = x;
    nv_chainon -> suivant = NULL;

    courant = *l;
    precedent = *l;

    /* on trouve la bonne place */
    while(!est_vide(courant) && (*cmp)(courant->valeur, x)) {
      precedent = courant;
      courant = courant -> suivant;
    }

    if(courant == *l) {
      /* on insère en tête (le cas liste vide est compris) */
      nv_chainon -> suivant = *l;
      /* on modifie la tête */
      *l = nv_chainon;
    }
    else {
      /* on insère ailleurs qu'en tête (le cas insertion à la fin
         de la liste est compris) */
      nv_chainon -> suivant = courant;
      precedent -> suivant = nv_chainon;
      /* on ne modifie pas la tête */
    }
  }

  return retour;
}

/* ret = trier(l1, &l2, comp) tri, en utilisant la fonction de comparaison comp,
   la liste l1 en une nouvelle liste l2
   renvoie OK si tout se passe bien, ERREUR sinon */
CODE_RETOUR trier(Liste l, Liste* lt, int (*cmp) (int, int)){

  CODE_RETOUR ret = OK;

  *lt = nouvelle_liste ();

  while(!est_vide(l) && ret != ERREUR) {
    ret = inserer_en_triant(l -> valeur, lt, cmp);
    l = l -> suivant;
  }

  return ret;
}

/* ret = supprimer(val, &l1)
   supprime la première occurence val de l1 si elle existe */
void supprimer(int x, Liste *l) {

  Liste courant, precedent;

  courant = *l;
  precedent = *l;

  /* on cherche le chaînon qui contient la valeur */
  while(!est_vide(courant) && courant -> valeur != x) {
    precedent = courant;
    courant = courant -> suivant;
  }

  if(!est_vide(courant) && courant == *l) {
    /* on modifie la tête */
    *l = courant -> suivant;
    /* on supprime le chaînon */
    free(courant);
  }
  else if(!est_vide(courant)) {
    /* on reconnecte */
    precedent -> suivant = courant -> suivant;
    /* on supprime le chaînon */
    free(courant);
  }

  return;
}

/* détruit la liste l */
void detruit(Liste *l) {

  Liste a_supprimer;

  while(!est_vide(*l)) {
    a_supprimer = *l;
    *l = (*l) -> suivant;
    free(a_supprimer);
  }

  /* *l vaut NULL à la sortie */

  return;
}

/* do_list(l, f) applique la procédure f à tous les éléments de l */
void do_list(Liste l, void (*p)(int)){
  while(!est_vide(l)) {
    p(l -> valeur); 
    l = l -> suivant;
  }
  return;
}

/* do_list_rec(l, f) applique la procédure f à tous les éléments de l */
void do_list_rec(Liste l, void (*p)(int)){
  if(!est_vide(l)) {
    p(l -> valeur); 
    do_list(l -> suivant, p);
  }
  return;
}

/* apply_f(&l, f) remplace les valeurs entières contenues dans l
   par leur image par f */
void apply_f(Liste *l, int (*f)(int)){
  Liste aux;
  aux = *l;

  while(!est_vide(aux)) {
    aux -> valeur = f(aux -> valeur); 
    aux = aux -> suivant;
  }
  return;
}

/* map_list(l, f, &l1) crée la liste l1 composée de l'image de l par f ;
   f est une fonction de N dans N 
   renvoie OK si cette création réussit, ERREUR sinon */
CODE_RETOUR map_list(Liste l, int (*f)(int), Liste *fl){
  Liste inv, aux;
  CODE_RETOUR retour;

  inv = nouvelle_liste();
  retour = OK;

  while(l != NULL && retour == OK) {
    retour = inserer_en_tete(f(l -> valeur), &inv);
    l = l -> suivant;
  }

  aux = inv;

  *(fl) = nouvelle_liste();

  while(inv != NULL && retour == OK) {
    retour = inserer_en_tete(inv -> valeur, fl);
    inv = inv -> suivant;
  }

  detruit(&aux);

  return retour;

} 

