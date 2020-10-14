
(* The type of tokens. *)

type token = 
  | VOID
  | VIRG
  | VIDE
  | TYPEIDENT of (string)
  | TANTQUE
  | STRING
  | SINON
  | SI
  | RETOUR
  | PTVIRG
  | PAROUV
  | PARFER
  | OPSUPEG
  | OPSUP
  | OPPT
  | OPPLUS
  | OPOU
  | OPNONEG
  | OPNON
  | OPMULT
  | OPMOINS
  | OPMOD
  | OPINFEG
  | OPINF
  | OPET
  | OPEG
  | OPDIV
  | NOUVEAU
  | INT
  | IMPORT
  | IDENT of (string)
  | FLOTTANT of (float)
  | FLOAT
  | FIN
  | ENTIER of (int)
  | CROOUV
  | CROFER
  | CHAR
  | CHAINE of (string)
  | CARACTERE of (char)
  | BOOLEEN of (bool)
  | BOOL
  | ASSIGN
  | ACCOUV
  | ACCFER

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val fichier: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (unit)
