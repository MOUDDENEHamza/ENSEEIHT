open Tp
open Trie
open Menu_dico
open Chaines;;


(******************************************************************************)
(* Lancement de l'appli                                                       *)
(******************************************************************************)
let mots = [ "bas"; "bât"; "de"; "la"; "lai"; "laid"; "lait"; "lard"; "le"; "les"; "long"] in
gere_dico decompose_chaine recompose_chaine lit_chaine affiche_chaine
          nouveau appartient ajout retrait affiche mots
