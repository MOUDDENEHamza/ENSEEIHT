open List

type token = 
  | UL_ACCOUV
  | UL_ACCFER
  | UL_PT
  | UL_MACHINE
  | UL_IDENT of string
  | UL_FIN
  | UL_EVENT
  | UL_REGION
  | UL_STATE
  | UL_FROM
  | UL_TO
  | UL_ON
  | UL_STARTS
  | UL_ENDS
  | UL_ERREUR;;

type inputStream = token list;;

(* string_of_token : token -> string *)
(* Converti un token en une chaîne de caractère*)
let string_of_token token =
   match token with
     | UL_ACCOUV -> "{"
     | UL_ACCFER -> "}"
     | UL_PT -> "."
     | UL_MACHINE -> "machine"
     | UL_IDENT n -> n
     | UL_FIN -> "EOF"
     | UL_EVENT -> "event"
     | UL_REGION -> "REGION"
     | UL_STATE -> "state"
     | UL_FROM -> "from"
     | UL_TO -> "to"
     | UL_ON -> "on"
     | UL_STARTS -> "starts"
     | UL_ENDS -> "ends"
     | UL_ERREUR -> "Erreur Lexicale";;

(* string_of_stream : inputStream -> string *)
(* Converti un inputStream (liste de token) en une chaîne de caractère *)
let string_of_stream stream =
  List.fold_right (fun t tq -> (string_of_token t) ^ " " ^ tq ) stream "";;


(* peekAtFirstToken : inputStream -> token *)
(* Renvoie le premier élément d'un inputStream *)
(* Erreur : si l'inputStream est vide *)
let peekAtFirstToken stream = 
  match stream with
  (* Normalement, ne doit jamais se produire sauf si la grammaire essaie de lire *)
  (* après la fin de l'inputStream. *)
  | [] -> failwith "Impossible d'acceder au premier element d'un inputStream vide"
   |t::_ -> t;;

(* advanceInStream : inputStream -> inputStream *)
(* Consomme le premier élément d'un inputStream *)
(* Erreur : si l'inputStream est vide *)
let advanceInStream stream =
  match stream with
  (* Normalement, ne doit jamais se produire sauf si la grammaire essaie de lire *)
  (* après la fin de l'inputStream. *)
  | [] -> failwith "Impossible de consommer le premier element d'un inputStream vide"
  | _::q -> q;;
