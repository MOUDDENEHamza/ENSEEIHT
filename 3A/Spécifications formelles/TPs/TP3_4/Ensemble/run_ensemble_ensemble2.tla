---------------- MODULE run_ensemble_ensemble2 ----------------

EXTENDS Naturals, var_raffinement

CONSTANT
    D

A == INSTANCE ensemble

C == INSTANCE ensemble2

Liaison(etatA, etatC) ==
 /\ etatA.ens = etatC.ens

INSTANCE run_raffinement WITH ETATA <- A!ETAT, InitA <- A!Init, ContratClientA <- A!ContratClient, ContratModuleA <- A!ContratModule,
                              ETATC <- C!ETAT, InitC <- C!Init, ContratClientC <- C!ContratClient, ContratModuleC <- C!ContratModule


================================================================
