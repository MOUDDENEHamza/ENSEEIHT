---------------- MODULE philosophes0 ----------------
(* Philosophes. Version en utilisant l'état des voisins. *)

EXTENDS Naturals

CONSTANT N

Philos == 0..N-1

gauche(i) == (i+1)%N       \* philosophe à gauche du philo n°i
droite(i) == (i+N-1)%N     \* philosophe à droite du philo n°i

Hungry == "H"
Thinking == "T"
Eating == "E"

VARIABLES
    etat         \* i -> Hungry,Thinking,Eating

TypeInvariant == [](etat \in [ Philos -> { Hungry, Thinking, Eating }])

(* TODO : autres propriétés de philosophes0 (exclusion, vivacité) *)  

----------------------------------------------------------------

Init == TRUE  \* À changer

demande(i) == TRUE  \* À changer

mange(i) == TRUE  \* À changer

pense(i) == TRUE  \* À changer

Next ==
  \E i \in Philos : \/ demande(i)
                    \/ mange(i)
                    \/ pense(i)

Fairness == TRUE \* À changer

Spec ==
  /\ Init
  /\ [] [ Next ]_<<etat>>
  /\ Fairness

================================
