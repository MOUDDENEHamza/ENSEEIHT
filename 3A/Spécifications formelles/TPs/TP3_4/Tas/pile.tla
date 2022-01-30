---------------- MODULE pile ----------------

EXTENDS Naturals, Sequences

CONSTANT
    D, N


\* Pour pouvoir écrire les obligations de preuves du raffinement, et également pour pouvoir faire des importations de modules plus facilement,
\* toutes les définitions importantes (Inv, Init, ContratClient et ContratModule) sont paramétrées par des variables arbitraires.
\* Ainsi, on pourra quantifier sur ces variables pour prouver le raffinement ou faire de la composition d'actions et de modules.
\* Dans les actions exécutées par ce module, ces paramètres seront associés naturellement aux variables d'états.

----------------------------------------------------------------

\* INVARIANT

\* ensemble de choix de procédures possibles
CHOIX == { "put", "get", "estVide" }

NO_DATA == "<NO_DATA>"

ETAT == Seq(D)

TypeEtat(pile) ==
 /\ pile \in ETAT

\* version paramétrée
Inv(pile) ==
 /\ TypeEtat(pile)

----------------------------------------------------------------

\* ETAT INITIAL

\* version paramétrée
Init(pile) ==
  TRUE

----------------------------------------------------------------

\* Choix = "put"
\* PROCEDURE PUT : version paramétrée

Pre_put(param, pile) ==
  /\ TRUE

Act_put(param, pile, pile_p, result) ==
  /\ TRUE

----------------------------------------------------------------

\* Choix = "get"
\* PROCEDURE GET : version paramétrée

Pre_get(param, pile) ==
  /\ TRUE

Act_get(param, pile, pile_p, result) ==
  /\ TRUE

----------------------------------------------------------------

\* Choix = "estVide"
\* PROCEDURE ESTVIDE : version paramétrée

Pre_estVide(param, pile) ==
  /\ TRUE

Act_estVide(param, pile, pile_p, result) ==
  /\ TRUE

----------------------------------------------------------------

\* CONTRAT CLIENT

\* contrat paramétré
ContratClient(choix, param, pile) ==
 \/ (choix = "put"     /\ Pre_put(param, pile))
 \/ (choix = "get"     /\ Pre_get(param, pile))
 \/ (choix = "estVide" /\ Pre_estVide(param, pile))

----------------------------------------------------------------

\* CONTRAT MODULE

\* contrat paramétré
ContratModule(choix, param, pile, pile_p, result) ==
 /\ (choix = "put"     => (Pre_put(param, pile)     => Act_put(param, pile, pile_p, result)))
 /\ (choix = "get"     => (Pre_get(param, pile)     => Act_get(param, pile, pile_p, result)))
 /\ (choix = "estVide" => (Pre_estVide(param, pile) => Act_estVide(param, pile, pile_p, result)))

----------------------------------------------------------------

================================================================
