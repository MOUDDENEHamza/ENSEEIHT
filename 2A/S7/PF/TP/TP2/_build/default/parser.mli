
(* The type of tokens. *)

type token = 
  | XXXX
  | NAME of (string)
  | INT of (int)
  | EOF

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val main: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> ((int * string * int * int) list)
