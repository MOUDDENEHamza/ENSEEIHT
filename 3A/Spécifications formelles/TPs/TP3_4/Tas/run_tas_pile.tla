---------------- MODULE run_tas_pile ----------------

EXTENDS Naturals, FiniteSets, Sequences, var_raffinement

CONSTANT
    D, N

A == INSTANCE tas

C == INSTANCE pile

Liaison(tas, pile) ==
 TRUE

INSTANCE run_raffinement WITH ETATA <- A!ETAT, InitA <- A!Init, ContratClientA <- A!ContratClient, ContratModuleA <- A!ContratModule,
                              ETATC <- C!ETAT, InitC <- C!Init, ContratClientC <- C!ContratClient, ContratModuleC <- C!ContratModule


================================================================
