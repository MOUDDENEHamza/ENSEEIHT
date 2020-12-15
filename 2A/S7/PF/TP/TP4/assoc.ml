
(******************************************************************************)
(*   fonction de recherche dans une liste associative 
      TRIEE par valeur croissante des clées                                   *)
(*                                                                            *)
(*   signature  : recherche :                                                 *)
(*                  'a -> ('a * 'b) list -> 'b option                  *)
(*   paramètres : - une clé (caractère dans le cas des tries)                 *)
(*                - une liste d'association (clé / valeur) 
                    (branches dans le cas des tries, où la clé est un caractère 
                    et la valeur un sous-arbres)                              *)
(*   résultat     : Some (la valeur correspondant à la clée),                 *)
(*                  si elle existe                                            *)
(*                  None, sinon                                               *)
(******************************************************************************)
let rec recherche c lb =
  match lb with
    | []            -> None
    | (tc, ta)::qlb -> if (c < tc) 
                       then None
                       else if (c = tc)
                            then Some ta
                            else recherche c qlb

(* TEST *)
let bb = ('b',1)
let bd = ('d',2)
let bl = ('l',3)
let b1 = [bb;bd;bl]
let%test _ = (recherche 'b' b1 = Some 1)
let%test _ = (recherche 'd' b1 = Some 2)
let%test _ = (recherche 'l' b1 = Some 3)
let%test _ = (recherche 'a' b1 = None)

(******************************************************************************)
(*   fonction  d'ajout/mise à jour d'une valeur dans une liste associative 
      TRIEE par valeur croissante des clées                                   *)
(*                                                                            *)
(*   signature  : maj :                                                       *)
(*                 'a -> 'b -> ('a * 'b) list -> ('a * 'b) list          *)
(*   paramètres : - une clé (un caractère dans le cas des tries)              *)
(*                - le couple (clé,valeur) (la branche dans le cas des tries 
                    à ajouter/modifier                                        *)
(*                - la liste associative                                      *)
(*   résultat   : la liste associative mise à jour                            *)
(******************************************************************************)
let rec maj c nouvelle_b lb =
  match lb with
   | []            -> [(c,nouvelle_b)]
   | (tc, ta)::qlb -> if (c < tc)
                      then (c,nouvelle_b)::lb
                      else if (c = tc)
                           then (c,nouvelle_b)::qlb 
                            else (tc, ta)::(maj c nouvelle_b qlb)


(* TESTS *)

let%test _ =  (maj 'b' 3 b1 = [('b',3);bd;bl])
let ba = ('a',4)
let%test _ =  (maj 'a' 4 b1 = [ba;bb;bd;bl])
let bm = ('m',5)
let%test _ = (maj 'm' 5 b1 = [bb;bd;bl;bm])