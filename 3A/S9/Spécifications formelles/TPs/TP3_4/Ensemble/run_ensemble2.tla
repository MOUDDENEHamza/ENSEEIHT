---------------- MODULE run_ensemble2 ----------------
EXTENDS FiniteSets, var_module, ensemble2

INSTANCE run_module

TypeInvariant == [] Inv(Etat)

SizeIsOk == [] (Etat.size = Cardinality(Etat.ens))

================================================================
