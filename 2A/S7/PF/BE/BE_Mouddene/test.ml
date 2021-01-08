open Chiffrement
open Dr

(* 
module TexteCodeInt = TODO

module TexteCodeTexte = TODO

(*  Tests dechiffrer **)

let%test _ = TexteCodeInt.dechiffrer 123212 Arbre.arbre1 = "bac"
let%test _ = TexteCodeInt.dechiffrer 123 Arbre.arbre1 = "ba"
let%test _ = try let _ = TexteCodeInt.dechiffrer 321321 Arbre.arbre1 in false with CodeNonValide -> true

let%test _ = TexteCodeInt.dechiffrer 123212 Arbre.arbre2 = "abcbab"
let%test _ = TexteCodeInt.dechiffrer 123 Arbre.arbre2 = "abc"
let%test _ = TexteCodeInt.dechiffrer 321321 Arbre.arbre2 = "cbacba"
let%test _ = try let _ = TexteCodeInt.dechiffrer 457 Arbre.arbre2 in false with CodeNonValide -> true


let%test _ = TexteCodeTexte.dechiffrer "au" Arbre.arbre3 = "a"
let%test _ = TexteCodeTexte.dechiffrer "aa" Arbre.arbre3 = "b"
let%test _ = TexteCodeTexte.dechiffrer "e" Arbre.arbre3 = "c"
let%test _ = TexteCodeTexte.dechiffrer "aaaue" Arbre.arbre3 = "bac"

let%test _ = TexteCodeTexte.dechiffrer "fea" Arbre.arbre4 = "bac"
let%test _ = TexteCodeTexte.dechiffrer "eeeee" Arbre.arbre4 = "aaaaa"
let%test _ = TexteCodeTexte.dechiffrer "abc" Arbre.arbre4 = "cde"
let%test _ = TexteCodeTexte.dechiffrer "d" Arbre.arbre4 = "f"

(*  Tests chiffrer **)

let%test _ = TexteCodeInt.chiffrer "bac" Arbre.arbre1 = 123212
let%test _ = TexteCodeInt.chiffrer "ba" Arbre.arbre1 = 123

let%test _ = TexteCodeInt.chiffrer "abcbab" Arbre.arbre2 = 123212
let%test _ = TexteCodeInt.chiffrer "abc" Arbre.arbre2 = 123
let%test _ = TexteCodeInt.chiffrer "cbacba" Arbre.arbre2 = 321321
let%test _ = try let _ = TexteCodeInt.chiffrer "dab" Arbre.arbre2 in false with DonneeNonValide -> true 
let%test _ = try let _ = TexteCodeInt.chiffrer "zut" Arbre.arbre2 in false with DonneeNonValide -> true

let%test _ = TexteCodeTexte.chiffrer "bac" Arbre.arbre3 = "aaaue"

let%test _ = TexteCodeTexte.chiffrer "bac" Arbre.arbre4 = "fea"
*)