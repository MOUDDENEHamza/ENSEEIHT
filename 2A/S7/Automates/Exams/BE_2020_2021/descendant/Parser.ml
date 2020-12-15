open Tokens

(* Type du résultat d'une analyse syntaxique *)
type parseResult =
  | Success of inputStream
  | Failure
;;

(* accept : token -> inputStream -> parseResult *)
(* Vérifie que le premier token du flux d'entrée est bien le token attendu *)
(* et avance dans l'analyse si c'est le cas *)
let accept expected stream =
  match (peekAtFirstToken stream) with
    | token when (token = expected) ->
      (Success (advanceInStream stream))
    | _ -> Failure
;;


let acceptIdent stream =
  match (peekAtFirstToken stream) with
    | (UL_IDENT _) -> (Success (advanceInStream stream))
    | _ -> Failure
;;

(* Définition de la monade  qui est composée de : *)
(* - le type de donnée monadique : parseResult  *)
(* - la fonction : inject qui construit ce type à partir d'une liste de terminaux *)
(* - la fonction : bind (opérateur >>=) qui combine les fonctions d'analyse. *)

(* inject inputStream -> parseResult *)
(* Construit le type de la monade à partir d'une liste de terminaux *)
let inject s = Success s;;

(* bind : 'a m -> ('a -> 'b m) -> 'b m *)
(* bind (opérateur >>=) qui combine les fonctions d'analyse. *)
(* ici on utilise une version spécialisée de bind :
   'b  ->  inputStream
   'a  ->  inputStream
    m  ->  parseResult
*)
(* >>= : parseResult -> (inputStream -> parseResult) -> parseResult *)
let (>>=) result f =
  match result with
    | Success next -> f next
    | Failure -> Failure
;;


(* parseMachine : inputStream -> parseResult *)
(* Analyse du non terminal Programme *)
let rec parseMachine stream =
  (print_string "Machine -> ");
  (match (peekAtFirstToken stream) with
    | UL_MACHINE ->
      (print_endline "machine ident { SC }");
      inject stream >>=
      accept UL_MACHINE >>=
      acceptIdent >>=
      accept UL_ACCOUV >>=
      parseSC >>=
      accept UL_ACCFER
    | _ -> Failure)

and parseSC stream =
  (print_string "SC -> ");
  (print_string (string_of_stream[peekAtFirstToken stream]));
  (match (peekAtFirstToken stream) with
    | UL_ACCFER ->
      (print_endline "");
      inject stream
    | UL_EVENT | UL_FROM | UL_REGION ->
      (print_endline "C SC");
      inject stream >>=
      parseC >>=
      parseSC
    | _ -> Failure)


and parseC stream =
  (print_string "C -> ");
  (match (peekAtFirstToken stream) with
    | UL_EVENT ->
      (print_endline "event ident");
      inject stream >>=
      accept UL_EVENT >>=
      acceptIdent
    | UL_FROM ->
      (print_endline "from NQ to NQ on ident");
      inject stream >>=
      accept UL_FROM >>=
      parseNQ >>=
      accept UL_TO >>=
      parseNQ >>=
      accept UL_ON >>=
      acceptIdent
    | UL_REGION ->
      (print_endline "R");
      inject stream >>=
      parseR
    | _ -> Failure)


and parseNQ stream =
  (print_string "NQ -> ");
  (match (peekAtFirstToken stream) with
    | UL_IDENT _ ->
      (print_endline "ident SQ");
      inject stream >>=
      acceptIdent >>=
      parseSQ
    | _ -> Failure)

and parseSQ stream =
  (print_string "SQ -> ");
  (match (peekAtFirstToken stream) with
    | UL_TO | UL_ON ->
      (print_endline "");
      inject stream
    | UL_PT ->
      (print_endline ". ident SQ");
      inject stream >>=
      accept UL_PT >>=
      acceptIdent >>=
      parseSQ
    | _ -> Failure)

and parseR stream =
  (print_string "R -> ");
  (match (peekAtFirstToken stream) with
    | UL_REGION ->
      (print_endline "region ident { E SE }");
      inject stream >>=
      accept UL_REGION >>=
      acceptIdent >>=
      accept UL_ACCOUV >>=
      parseE >>=
      parseSE >>=
      accept UL_ACCFER
    | _ -> Failure)

and parseSE stream =
  (print_string "SE -> ");
  (match (peekAtFirstToken stream) with
    | UL_ACCFER ->
      (print_endline "");
      inject stream
    | UL_STATE ->
      (print_endline "E SE");
      inject stream >>=
      parseE >>=
      parseSE
    | _ -> Failure)

and parseE stream =
  (print_string "E -> ");
  (match (peekAtFirstToken stream) with
    | UL_STATE ->
      (print_endline "state ident ES EE EC");
      inject stream >>=
      accept UL_STATE >>=
      acceptIdent >>=
      parseES >>=
      parseEE >>=
      parseEC
    | _ -> Failure)

and parseES stream =
  (print_string "ES -> ");
  (match (peekAtFirstToken stream) with
    | UL_ENDS | UL_ACCOUV | UL_ACCFER ->
      (print_endline "");
      inject stream
    | UL_STARTS  ->
      (print_endline "starts");
      inject stream >>=
      accept UL_STARTS
    | _ -> Failure)


and parseEE stream =
  (print_string "EE -> ");
  (match (peekAtFirstToken stream) with
    | UL_ACCOUV | UL_ACCFER ->
      (print_endline "");
      inject stream
    | UL_ENDS  ->
      (print_endline "ends");
      inject stream >>=
      accept UL_ENDS
    | _ -> Failure)

and parseEC stream =
  (print_string "EC -> ");
  (match (peekAtFirstToken stream) with
    | UL_ACCFER | UL_STATE ->
      (print_endline "");
      inject stream
    | UL_ACCOUV ->
      (print_endline "{ R SR }");
      inject stream >>=
      accept UL_ACCOUV >>=
      parseR >>=
      parseSR >>=
      accept UL_ACCFER
    | _ -> Failure)

and parseSR stream =
  (print_string "SR -> ");
  (match (peekAtFirstToken stream) with
    | UL_ACCFER ->
      (print_endline "");
      inject stream
    | UL_REGION  ->
      (print_endline "R SR");
      inject stream >>=
      parseR >>=
      parseSR
    | _ -> Failure)
;;