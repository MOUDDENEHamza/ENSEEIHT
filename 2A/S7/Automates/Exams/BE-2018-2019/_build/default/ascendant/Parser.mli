
(* The type of tokens. *)

type token = 
  | UL_VRAI
  | UL_VIRG
  | UL_VIDE
  | UL_NOMBRE of (int)
  | UL_FIN
  | UL_FAUX
  | UL_DBLPT
  | UL_CROOUV
  | UL_CROFER
  | UL_CHAINE of (string)
  | UL_ACCOUV
  | UL_ACCFER

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val document: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (unit)
