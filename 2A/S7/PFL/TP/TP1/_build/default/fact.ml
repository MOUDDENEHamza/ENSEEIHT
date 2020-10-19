
(** 
   fact : int -> int
   calcule la factorielle
   Parametre n : int, le nombre dont on veut la factorielle
   Resultat : int, factorielle de n
   Précondition : n strictement positf
*)
let rec fact n = 
  if n = 1
  then 1
  else n * (fact (n-1))

let%test _ = fact 1 = 1
let%test _ = fact 2 = 2
let%test _ = fact 5 = 120