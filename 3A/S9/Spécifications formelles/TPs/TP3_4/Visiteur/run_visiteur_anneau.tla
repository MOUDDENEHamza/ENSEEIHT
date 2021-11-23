---------------- MODULE run_visiteur_anneau ----------------

EXTENDS Naturals, FiniteSets, Sequences, var_raffinement

CONSTANT
    NbSites

A == INSTANCE visiteur

C == INSTANCE anneau

Liaison(etatA, etatC) ==
  TRUE

INSTANCE run_raffinement WITH ETATA <- A!ETAT, InitA <- A!Init, ContratClientA <- A!ContratClient, ContratModuleA <- A!ContratModule,
                              ETATC <- C!ETAT, InitC <- C!Init, ContratClientC <- C!ContratClient, ContratModuleC <- C!ContratModule


================================================================
