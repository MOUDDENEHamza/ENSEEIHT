

(*  Module qui permet la décomposition et la recomposition de données **)
(*  Passage du type t1 vers une liste d'éléments de type t2 (décompose) **)
(*  et inversement (recopose).**)
module type DecomposeRecompose =
sig
  (*  Type de la donnée **)
  type mot
  (*  Type des symboles de l'alphabet de t1 **)
  type symbole

  val decompose : mot -> symbole list
  val recompose : symbole list -> mot
end

module DRString : DecomposeRecompose = struct
  type mot = string
  type symbole = char
  
  (**
  Decompose une chaine de caractère en une liste de caractere
  signature : decompose = string -> char list = <fun>
  Parametre(s) : mot la chaine de caractere a transformer
  Return : les elements du mot dans une liste
  *)
  let decompose mot = 
    let rec aux i accu =
      if i < 0 then accu
      else aux (i - 1) (mot.[i] :: accu)
    in aux (String.length mot - 1) []
  
  let%test _ = decompose "abc" = ['a'; 'b'; 'c']
    
  (**
  Recompose une liste de caracteres en une chaine de caractère
  signature : recompose = char list -> string = <fun>
  Parametre(s) : mot la chaine de caractere a transformer
  Return : les elements du mot dans une liste
  *)
  let recompose l = List.fold_right (fun t q -> String.make 1 t ^ q) l ""

  let%test _ = recompose ['a'; 'b'; 'c'] = "abc"

end

module DRNAT : DecomposeRecompose with type mot = int and type symbole = int = struct 
  type mot = int
  type symbole = int

  (**
  Decompose un nombre en une liste de nombre
  signature : decompose = int -> int list = <fun>
  Parametre(s) : mot le nombre a transformer
  Return : les elements du nombre dans une liste
  *)
  let decompose n = 
    let rec aux acc n=
          if n < 10 then 
            n :: acc
          else 
            aux ((n mod 10)::acc) (n / 10)
    in aux [] n

  let%test _ = decompose 123 = [1; 2; 3]
  
  (**
  Recompose une liste de chiffres en un nombre
  signature : recompose = int list -> int = <fun>
  Parametre(s) : mot la liste de chiffres a transformer
  Return : le nombre correspondant a la liste
  *)
  let recompose l  =
    let rec aux l n =
        match l with 
        | [] -> n
        | (h :: t) -> aux t ((n * 10 ) + h)
    in aux l 0

  let%test _ = recompose [1; 2; 3] = 123

end 