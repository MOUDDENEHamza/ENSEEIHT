---------------- MODULE hlmc2 ----------------
\* Time-stamp: <12 fév 2013 14:28 queinnec@enseeiht.fr>

(* Le problème de l'homme, du loup, du mouton et du chou *)
(* Version ensembliste basique *)

EXTENDS Naturals, FiniteSets

Entites == {"H", "L", "M", "C"}

Rives == {"G", "D"}

VARIABLES
  posG, posD

TypeInvariant ==
  [] (/\ posG \subseteq Entites
      /\ posD \subseteq Entites
      /\ posG \intersect posD = {}
      /\ posG \union posD = Entites)

pasMiam1(pos) == 
    /\ ({"L","M"} \subseteq pos => "H" \in pos)
    /\ ({"C","M"} \subseteq pos => "H" \in pos)

pasMiam ==
  pasMiam1(posG) /\ pasMiam1(posD)

ToujoursOk == []pasMiam

Solution ==
  [] \neg(posD = Entites)
----------------------------------------------------------------

Init ==
  /\ posG = Entites
  /\ posD = {}

bougeGD(S) ==
  /\ S \subseteq posG
  /\ "H" \in S
  /\ Cardinality(S) \leq 2
  /\ posG' = posG \ S
  /\ posD' = posD \union S
  /\ pasMiam'

bougeDG(S) ==
  /\ S \subseteq posD
  /\ "H" \in S
  /\ Cardinality(S) \leq 2
  /\ posD' = posD \ S
  /\ posG' = posG \union S
  /\ pasMiam'

Next == \E s \in SUBSET Entites :
          bougeGD(s) \/ bougeDG(s)
        

Spec == Init /\ [] [ Next ]_<<posG,posD>>

================================================================
