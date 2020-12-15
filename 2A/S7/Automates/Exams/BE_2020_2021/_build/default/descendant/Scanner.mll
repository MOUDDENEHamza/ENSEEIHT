{

(* Partie recopiée dans le fichier CaML généré. *)
(* Ouverture de modules exploités dans les actions *)
(* Déclarations de types, de constantes, de fonctions, d'exceptions exploités dans les actions *)

  open Tokens 
  exception Printf

}

(* Déclaration d'expressions régulières exploitées par la suite *)
let chiffre = ['0' - '9']
let minuscule = ['a' - 'z']
let majuscule = ['A' - 'Z']
let alphabet = minuscule | majuscule
let alphanum = alphabet | chiffre | '_'
let commentaire =
  (* Commentaire fin de ligne *)
  "#" [^'\n']*

rule scanner = parse
  | ['\n' '\t' ' ']+					{ (scanner lexbuf) }
  | commentaire						    { (scanner lexbuf) }
  | "machine"						      { UL_MACHINE::(scanner lexbuf) }
  | "."							          { UL_PT::(scanner lexbuf) }
  | "{"							          { UL_ACCOUV::(scanner lexbuf) }
  | "}"							          { UL_ACCFER::(scanner lexbuf) }
  | "event"                   { UL_EVENT::(scanner lexbuf) }
  | "region"                  { UL_REGION::(scanner lexbuf) }
  | "state"                   { UL_STATE::(scanner lexbuf) }
  | "from"                    { UL_FROM::(scanner lexbuf) }
  | "to"                      { UL_TO::(scanner lexbuf) }
  | "on"                      { UL_ON::(scanner lexbuf) }
  | "starts"                  { UL_STARTS::(scanner lexbuf) }
  | "ends"                    { UL_ENDS::(scanner lexbuf) }
  | eof							          { [UL_FIN] }
  | (majuscule|minuscule) ((majuscule|minuscule))* as texte   { (UL_IDENT (texte))::(scanner lexbuf) }
  | _ as texte				 		{ (print_string "Erreur lexicale : ");(print_char texte);(print_newline ()); (UL_ERREUR::(scanner lexbuf)) }

{

}