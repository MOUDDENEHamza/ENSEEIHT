---------------- MODULE run_module ----------------

EXTENDS Naturals

VARIABLES
\* variables utilisateurs
    Etat,
    Param,
    Result,
\* variables spéciales
    Tour,
    Choix

CONSTANTS
    CHOIX,
    Init(_),
    ContratClient(_,_,_),
    ContratModule(_,_,_,_,_)

_NO_DATA == "<NO_DATA>"

----------------------------------------------------------------

\* SPECIFICATION DES EXECUTIONS DU MODULE

\* initialisation des variables d'états
Initial ==
 /\ Choix = _NO_DATA
 /\ Tour = "client"
 /\ Param = _NO_DATA
 /\ Result = _NO_DATA
 /\ Init(Etat)

\* action du client sur les variables d'états
ActionClient ==
 /\ Tour  = "client"
 /\ Tour' = "module"
 /\ UNCHANGED Etat
 /\ Result' = _NO_DATA
 /\ ContratClient(Choix', Param', Etat)                     \* contrat instancié sur les variables d'états

\* action du module sur les variables d'états
ActionModule ==
 /\ Tour  = "module"
 /\ Tour' = "client"
 /\ Choix' = _NO_DATA
 /\ Param ' = _NO_DATA
 /\ ContratModule(Choix, Param, Etat, Etat', Result')          \* contrat instancié sur les variables d'états

Spec ==
 /\ Initial
 /\ [] [ ActionClient \/ ActionModule ]_<<Tour, Choix, Param, Etat, Result>>


================================================================
