---------------- MODULE ensemble ----------------

EXTENDS Naturals

CONSTANT
    D


\* Pour pouvoir écrire les obligations de preuves du raffinement, et également pour pouvoir faire des importations de modules plus facilement,
\* toutes les définitions importantes (Inv, Init, ContratClient et ContratModule) sont paramétrées par des variables arbitraires.
\* Ainsi, on pourra quantifier sur ces variables pour prouver le raffinement ou faire de la composition d'actions et de modules.
\* Dans les actions exécutées par ce module, ces paramètres seront associés naturellement aux variables d'états.

----------------------------------------------------------------

\* INVARIANT

\* ensemble de choix de procédures possibles
CHOIX == { "plus", "moins", "estVide" }

NO_DATA == "<NO_DATA>"

ENS == SUBSET D

PARAM  == [ elt  : D  ]

ETAT   == [ ens : ENS ]

RESULT == [ vide  : BOOLEAN  ]

TypeEtat(etat) ==
 /\ etat \in ETAT

\* version paramétrée
Inv(etat) ==
 /\ TypeEtat(etat)

----------------------------------------------------------------

\* ETAT INITIAL

\* version paramétrée
Init(etat) ==
 /\ etat = [ ens |-> {} ]

----------------------------------------------------------------

\* Choix = "plus"
\* PROCEDURE PLUS : version paramétrée

Pre_plus(param, etat) ==
 \E e \in (D \ etat.ens) :
 /\ param = [ elt |-> e ]

Act_plus(param, etat, etat_prime, result) ==
 /\ result = NO_DATA
 /\ etat_prime = [ etat EXCEPT !.ens = @ \cup { param.elt } ]

----------------------------------------------------------------

\* Choix = "moins"
\* PROCEDURE MOINS : version paramétrée

Pre_moins(param, etat) ==
 \E e \in etat.ens :
 /\ param = [ elt |-> e ]

Act_moins(param, etat, etat_prime, result) ==
 /\ result = NO_DATA
 /\ etat_prime = [ etat EXCEPT !.ens = @ \ { param.elt } ]

----------------------------------------------------------------

\* Choix = "estVide"
\* PROCEDURE ESTVIDE : version paramétrée

Pre_estVide(param, etat) ==
 /\ param = NO_DATA

Act_estVide(param, etat, etat_prime, result) ==
 /\ result = (etat.ens = {})
 /\ etat_prime = etat

----------------------------------------------------------------

\* CONTRAT CLIENT

\* contrat paramétré
ContratClient(choix, param, etat) ==
 \/ (choix = "plus"    /\ Pre_plus(param, etat))
 \/ (choix = "moins"   /\ Pre_moins(param, etat))
 \/ (choix = "estVide" /\ Pre_estVide(param, etat))

----------------------------------------------------------------

\* CONTRAT MODULE

\* contrat paramétré
ContratModule(choix, param, etat, etat_prime, result) ==
 /\ (choix = "plus"    => (Pre_plus(param, etat)    => Act_plus(param, etat, etat_prime, result)))
 /\ (choix = "moins"   => (Pre_moins(param, etat)   => Act_moins(param, etat, etat_prime, result)))
 /\ (choix = "estVide" => (Pre_estVide(param, etat) => Act_estVide(param, etat, etat_prime, result)))

----------------------------------------------------------------

================================================================
