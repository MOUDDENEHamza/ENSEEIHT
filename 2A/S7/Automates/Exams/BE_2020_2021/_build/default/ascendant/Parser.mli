
(* The type of tokens. *)

type token = 
  | UL_TO
  | UL_STATE
  | UL_STARTS
  | UL_REGION
  | UL_PT
  | UL_ON
  | UL_MACHINE
  | UL_IDENT of (string)
  | UL_FROM
  | UL_FIN
  | UL_EVENT
  | UL_ENDS
  | UL_ACCOUV
  | UL_ACCFER

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val machine: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (unit)
