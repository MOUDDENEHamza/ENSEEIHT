type token =
  | NUM of (float * string * Ast.base_type)
  | VAR of (string)
  | LPAR
  | RPAR
  | SEMICOL
  | LOWER_SEMICOL
  | COMMA
  | RAND_ITV_REAL
  | RAND_ITV_INT
  | EQUAL
  | IF
  | ELSE
  | WHILE
  | LBRA
  | RBRA
  | DBLPOINT
  | PLUS2
  | MINUS2
  | GT
  | LT
  | GE
  | LE
  | PLUS
  | MINUS
  | TIMES
  | DIV
  | UMINUS
  | INTTYPE
  | REALTYPE
  | BOOLTYPE
  | SEQ
  | EOF

val file :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf ->  Typing.typing_env * Ast.ustm
