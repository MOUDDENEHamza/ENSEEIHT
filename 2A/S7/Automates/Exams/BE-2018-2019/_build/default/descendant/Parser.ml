open Tokens

(* Type du résultat d'une analyse syntaxique *)
type parseResult =
  | Success of inputStream
  | Failure
;;

(*
  Grammaire LL(1) d'un document JSON
  #1  - D -> { LA }
  #2  - LA ->
  #3  - LA -> A SA
  #4  - SA -> 
  #5  - SA -> , A SA
  #6  - A -> chaine : V
  #7  - V -> chaine
  #8  - V -> nombre
  #9  - V -> true
  #10 - V -> false
  #11 - V -> null
  #12 - V -> { LA }
  #13 - V -> [ LV ]
  #14 - LV ->
  #15 - LV -> V SV
  #16 - SV ->
  #17 - SV -> , V SV
*)

(* accept : token -> inputStream -> parseResult *)
(* Vérifie que le premier token du flux d'entrée est bien le token attendu *)
(* et avance dans l'analyse si c'est le cas *)
let accept expected stream =
  match (peekAtFirstToken stream) with
    | token when (token = expected) ->
      (Success (advanceInStream stream))
    | _ -> Failure
;;

(* acceptChaine : inputStream -> parseResult *)
(* Vérifie que le premier token du flux d'entrée est bien une chaine *)
(* et avance dans l'analyse si c'est le cas *)
let acceptChaine stream =
  match (peekAtFirstToken stream) with
    | (UL_CHAINE _) -> (Success (advanceInStream stream))
    | _ -> Failure
;;

(* acceptNombre : inputStream -> parseResult *)
(* Vérifie que le premier token du flux d'entrée est bien un nombre *)
(* et avance dans l'analyse si c'est le cas *)
let acceptNombre stream =
  match (peekAtFirstToken stream) with
    | (UL_NOMBRE _) -> (Success (advanceInStream stream))
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


(* parseD : inputStream -> parseResult *)
(* Analyse du non terminal D *)
let rec parseD stream =
  (print_string "D -> ");
  (match (peekAtFirstToken stream) with
     (* regle #1 *)
     | UL_ACCOUV ->
        (print_endline "{ LA }");
        (inject stream >>=
        accept UL_ACCOUV >>=
        parseLA >>=
        accept UL_ACCFER)
    | _ -> Failure)

(* parseLA : inputStream -> parseResult *)
(* Analyse du non terminal LA *)
and parseLA stream =
  (print_string "LA -> ");
  (print_string (string_of_stream [peekAtFirstToken stream]));
  (match (peekAtFirstToken stream) with
    (* regle #2 *)
    | UL_ACCFER -> inject stream

    (* regle #3 *)
    | UL_CHAINE _ -> 
      (inject stream >>=
      parseA >>=
      parseSA)

    | _ -> Failure)

(* parseSA : inputStream -> parseResult *)
(* Analyse du non terminal SA *)
and parseSA stream =
  (print_string "SA -> ");
  
  (match (peekAtFirstToken stream) with
    (* regle #4 *)
    | UL_ACCFER -> inject stream

    (* regle #5 *)
    | UL_VIRG -> 
      (inject stream >>=
      accept UL_VIRG >>=
      parseA >>=
      parseSA)

	| _ -> Failure)

(* parseA : inputStream -> parseResult *)
(* Analyse du non terminal A *)
and parseA stream =
  (print_string "A -> ");
  
  (match (peekAtFirstToken stream) with
    (* regle #6 *)
    | UL_CHAINE _ -> 
      (inject stream >>=
      acceptChaine >>=
      accept UL_DBLPT >>=
      parseV)

    | _ -> Failure)

(* parseV : inputStream -> parseResult *)
(* Analyse du non terminal V *)
and parseV stream =
  (print_string "V -> ");
  (match (peekAtFirstToken stream) with
    (* regle #7 *)
    | UL_CHAINE _ -> inject stream
      
    (* regle #8 *)
    | UL_NOMBRE _ -> inject stream

    (* regle #9 *)
    | UL_VRAI -> inject stream

    (* regle #10 *)
    | UL_FAUX -> inject stream

    (* regle #11 *)
    | UL_VIDE -> inject stream

    (* regle #12 *)
    | UL_ACCOUV ->
      (inject stream >>=
      accept UL_ACCOUV >>=
      parseLA >>=
      accept UL_ACCFER)

    (* regle #13 *)
    | UL_CROOUV ->
      (inject stream >>=
      accept UL_CROOUV >>=
      parseLV >>=
      accept UL_CROFER)

    | _ -> Failure)

(* parseLV : inputStream -> parseResult *)
(* Analyse du non terminal LV *)
and parseLV stream =
  (print_string "LV -> ");
  (match (peekAtFirstToken stream) with
    (* regle #14 *)
    | UL_CROFER -> inject stream

    (* regle #15 *)
    | UL_CHAINE _ | UL_NOMBRE _ | UL_VRAI | UL_FAUX | UL_VIDE | UL_ACCOUV | UL_CROOUV ->
        (inject stream >>=
        parseV >>=
        parseSV)

    | _ -> Failure)

(* parseSV : inputStream -> parseResult *)
(* Analyse du non terminal SV *)
and parseSV stream =
  (print_string "SV -> ");
  (match (peekAtFirstToken stream) with
    (* regle #16 *)
    | UL_CROFER -> inject stream

    (* regle #17 *)
    | UL_VIRG ->
        (inject stream >>=
        accept UL_VIRG >>=
        parseV >>=
        parseSV)

    | _ -> Failure)
;;
