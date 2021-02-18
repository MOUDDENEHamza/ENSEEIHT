---------------- MODULE hlmc ----------------
\* Time-stamp: <25 mar 2019 10:41 queinnec@enseeiht.fr>

(* Le problème de l'homme, du loup, du mouton et du chou *)

(* Version opératoire. *)

VARIABLES
  homme,
  loup,
  mouton,
  chou
  \* la barque est inutile, car elle est avec l'homme.

Rives == {"G", "D"}

TypeInvariant ==
  [] (/\ homme \in Rives
      /\ loup \in Rives
      /\ mouton \in Rives
      /\ chou \in Rives)

pasMiam ==
    /\ (loup = mouton => homme = loup)
    /\ (chou = mouton => homme = chou)

ToujoursOk == []pasMiam

Solution ==
  [] \neg(homme = "D" /\ loup = "D" /\ mouton = "D" /\ chou = "D")

----------------------------------------------------------------

inv(r) == IF r = "G" THEN "D" ELSE "G"

Init ==
  /\ homme = "G"
  /\ loup = "G"
  /\ mouton = "G"
  /\ chou = "G"

bougeHomme ==
  /\ homme' = inv(homme)
  /\ UNCHANGED <<loup,mouton,chou>>
  /\ pasMiam'

bougeLoup ==
  /\ loup = homme
  /\ homme' = inv(homme)
  /\ loup' = inv(loup)
  /\ UNCHANGED <<mouton,chou>>
  /\ pasMiam'

bougeMouton ==
  /\ mouton = homme
  /\ homme' = inv(homme)
  /\ mouton' = inv(mouton)
  /\ UNCHANGED <<loup,chou>>
  /\ pasMiam'

bougeChou ==
  /\ chou = homme
  /\ homme' = inv(homme)
  /\ chou' = inv(chou)
  /\ UNCHANGED <<mouton,loup>>
  /\ pasMiam'

Next == bougeHomme \/ bougeLoup \/  bougeMouton \/ bougeChou

Spec == Init /\ [] [ Next ]_<<homme,loup,mouton,chou>>

================================================================
