
(** pgcd : int * int -> int 
    Calcule le PGCD de deux nombres entiers passés en paramètres.
    parametre (a, b) : int * int, les deux entiers.
    Précondition : (a != 0 || b!= 0) && (a >= 0 && b >= 0).
    Résultat : int, le plus grand commun diviseur entre a et b.
*)
let rec pgcd (a, b) =
   let abs x =
      if x < 0 then
         -x
      else 
         x
   in
   if abs a = abs b then
      abs a
   else if abs a > abs b then
      pgcd (abs a - abs b, abs b)
   else
      pgcd (abs a, abs b - abs a)

let%test _ = pgcd (8, 4) = 4
let%test _ = pgcd (4, 4) = 4
let%test _ = pgcd (3, 5) = 1
let%test _ = pgcd (24, 16) = 8
let%test _ = pgcd (12, 2) = 2
let%test _ = pgcd (1, 1) = 1
let%test _ = pgcd (-5, -3) = 1
let%test _ = pgcd (-2, -4) = 2