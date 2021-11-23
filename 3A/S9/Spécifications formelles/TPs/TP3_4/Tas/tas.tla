---------------- MODULE tas ----------------

EXTENDS Naturals, FiniteSets, Bags

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

ETAT == UNION { [ dom -> 1..N ] : dom \in SUBSET D }

TypeEtat(tas) ==
 /\ tas \in ETAT

\* version paramétrée
Inv(tas) ==
 /\ TypeEtat(tas)

----------------------------------------------------------------

\* ETAT INITIAL

\* version paramétrée
Init(tas) ==
 /\ tas = EmptyBag

----------------------------------------------------------------

\* Choix = "put"
\* PROCEDURE PUT : version paramétrée

Pre_put(param, tas) ==
 /\ BagCardinality(tas) < N
 /\ param \in D

Act_put(param, tas, tas_p, result) ==
 /\ result = NO_DATA
 /\ tas_p = tas (+) SetToBag({ param })

----------------------------------------------------------------

\* Choix = "get"
\* PROCEDURE GET : version paramétrée

Pre_get(param, tas) ==
 /\ param = NO_DATA
 /\ tas # EmptyBag

Act_get(param, tas, tas_p, result) ==
 \E r  \in BagToSet(tas) :
 /\ result = r 
 /\ tas_p = tas (-) SetToBag({ r })

----------------------------------------------------------------

\* Choix = "estVide"
\* PROCEDURE ESTVIDE : version paramétrée

Pre_estVide(param, tas) ==
 /\ param = NO_DATA

Act_estVide(param, tas, tas_p, result) ==
 /\ result = (tas = EmptyBag)
 /\ tas_p = tas

----------------------------------------------------------------

\* CONTRAT CLIENT

\* contrat paramétré
ContratClient(choix, param, tas) ==
 \/ (choix = "put"     /\ Pre_put(param, tas))
 \/ (choix = "get"     /\ Pre_get(param, tas))
 \/ (choix = "estVide" /\ Pre_estVide(param, tas))

----------------------------------------------------------------

\* CONTRAT MODULE

\* contrat paramétré
ContratModule(choix, param, tas, tas_p, result) ==
 /\ (choix = "put"     => (Pre_put(param, tas)     => Act_put(param, tas, tas_p, result)))
 /\ (choix = "get"     => (Pre_get(param, tas)     => Act_get(param, tas, tas_p, result)))
 /\ (choix = "estVide" => (Pre_estVide(param, tas) => Act_estVide(param, tas, tas_p, result)))

----------------------------------------------------------------

================================================================
