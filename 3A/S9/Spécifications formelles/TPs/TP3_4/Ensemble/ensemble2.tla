---------------- MODULE ensemble2 ----------------
\* ensemble2 est un raffinement de ensemble, où on stocke la taille de l'ensemble dans un champ de l'état

EXTENDS Naturals

CONSTANT
    D

----------------------------------------------------------------

\* INVARIANT

\* ensemble de choix de procédures possibles
CHOIX == { "plus", "moins", "estVide" }

NO_DATA == "<NO_DATA>"

ENS == SUBSET D

PARAM  == [ elt  : D  ]

ETAT   == [ ens : ENS, size : Nat ]

RESULT == [ vide  : BOOLEAN  ]

TypeEtat(etat) ==
 /\ etat \in ETAT

Inv(etat) ==
 /\ TypeEtat(etat)

----------------------------------------------------------------

\* ETAT INITIAL

\* version paramétrée
Init(etat) ==
 /\ etat = [ ens  |-> {},
             size |-> 0 ]

----------------------------------------------------------------

\* Choix = "plus"
\* PROCEDURE PLUS : version paramétrée

Pre_plus(param, etat) ==
 \E e \in (D \ etat.ens) :
 /\ param = [ elt |-> e ]

Act_plus(param, etat, etat_prime, result) ==
 /\ result = NO_DATA
 /\ etat_prime = [ etat EXCEPT !.ens  = @ \cup { param.elt },
                               !.size = @ + 1 ]

----------------------------------------------------------------

\* Choix = "moins"
\* PROCEDURE MOINS : version paramétrée

Pre_moins(param, etat) ==
 \E e \in etat.ens :
 /\ param = [ elt |-> e ]

Act_moins(param, etat, etat_prime, result) ==
 /\ result = NO_DATA
 /\ etat_prime = [ etat EXCEPT !.ens  = @ \ { param.elt },
                               !.size = @ - 1 ]

----------------------------------------------------------------

\* Choix = "estVide"
\* PROCEDURE ESTVIDE : version paramétrée

Pre_estVide(param, etat) ==
 /\ param = NO_DATA

Act_estVide(param, etat, etat_prime, result) ==
 /\ result = (etat.size = 0)
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
