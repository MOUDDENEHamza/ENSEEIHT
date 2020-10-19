(** Exercice 5 **)
(** pgcd : int * int -> int 
    Calcule le PGCD de deux nombres entiers passés en paramètres.
    parametre (a, b) : int * int, les deux entiers.
    Précondition : (a != 0 || b!= 0) && (a >= 0 && b >= 0).
    Résultat : int, le plus grand commun diviseur entre a et b.
*)
let rec pgcd (a, b) =
  if a = b then
    a
  else
  if a > b then
    pgcd (a - b, b)
  else
    pgcd (a, b - a)

let%test _ = pgcd 8 4 = 4 ;;
let%test _ = pgcd 4 4 = 4 ;;
let%test _ = pgcd 12 2 = 2 ;;
let%test _ = pgcd 1 1 = 1 ;;
