---------------- MODULE run_raffinement ----------------
EXTENDS Naturals, TLC

VARIABLES
    Param,
    EtatA, EtatC,
    Result, 
    Tour,
    Choix,
    RaffOk

CONSTANTS
    ETATA                    , ETATC,
    InitA(_)                 , InitC(_),
    ContratClientA(_,_,_)    , ContratClientC(_,_,_),
    ContratModuleA(_,_,_,_,_), ContratModuleC(_,_,_,_,_),
    Liaison(_,_)

NO_DATA == "<NO_DATA>"

RaffinementOk == [] RaffOk

CondInitial(etatA) ==
 /\ InitA(etatA)
 /\ Liaison(etatA, EtatC)

Initial ==
 /\ Choix = NO_DATA
 /\ Tour = "client"
 /\ Param = NO_DATA
 /\ Result = NO_DATA
 /\ InitC(EtatC)
 /\ (IF (\E etatA \in ETATA : CondInitial(etatA))
     THEN /\ RaffOk = TRUE
          /\ CondInitial(EtatA)
     ELSE /\ RaffOk = FALSE
          /\ InitA(EtatA))

CondClient(etatC) ==
 /\ ContratClientC(Choix', Param', etatC)

ActionClient ==
 /\ Tour  = "client"
 /\ Tour' = "module"
 /\ UNCHANGED EtatA
 /\ Result' = NO_DATA
 /\ ContratClientA(Choix', Param', EtatA)
 /\ (IF (CondClient(EtatC))
     THEN /\ RaffOk' = TRUE
          /\ UNCHANGED EtatC
          /\ CondClient(EtatC)
     ELSE /\ RaffOk' = FALSE
          /\ UNCHANGED EtatC )

CondModule(etatA_prime) ==
 /\ ContratModuleA(Choix, Param, EtatA, etatA_prime, Result')
 /\ Liaison(etatA_prime, EtatC')

ActionModule ==
 /\ Tour  = "module"
 /\ Tour' = "client"
 /\ Choix' = NO_DATA
 /\ Param' = NO_DATA
 /\ ContratModuleC(Choix, Param, EtatC, EtatC', Result')
 /\ (IF (\E etatA_prime \in ETATA : CondModule(etatA_prime))
     THEN /\ RaffOk' = TRUE
          /\ CondModule(EtatA')
     ELSE /\ RaffOk' = FALSE
          /\ EtatA' = NO_DATA)

Spec ==
 /\ Initial
 /\ [] [ ActionClient \/ ActionModule ]_<<Param, EtatA, EtatC, Result, Tour, Choix, RaffOk>>

================
