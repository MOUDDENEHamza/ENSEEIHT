(* Ce fichier ne sera ni lu, ni corrigé *)
(* Ce fichier est uniquement là pour vérifier que votre architecture est *)
(* compatible avec nos tests automatiques *)
(* Les tests unitaires doivent être réalisé dans le fichier be.ml *)

(*open Boa*)
(*open ArbreReecritureBOA*)



(*let%test _ = Regle1.appliquer ['B';'O'] = [['B'; 'O'; 'A']] 

let%test _ = Regle2.appliquer ['B'; 'O'; 'A'] = [['B'; 'O'; 'A'; 'O'; 'A']]

let%test _ = List.mem ['B'; 'A'; 'O'] (Regle3.appliquer ['B'; 'O'; 'O'; 'O'; 'O'])
let%test _ = List.mem ['B'; 'O'; 'A'] (Regle3.appliquer ['B'; 'O'; 'O'; 'O'; 'O'])
let%test _ = List.length (Regle3.appliquer ['B'; 'O'; 'O'; 'O'; 'O']) = 2

let%test _ = Regle4.appliquer ['B';'O';'A';'A';'O'] = [['B';'O';'O']]


let axiome = ['B';'O']
let a1 = creer_noeud axiome []

let%test _ = racine a1 = axiome

let%test _ = fils a1 = []

let%test _ = appartient axiome a1*)