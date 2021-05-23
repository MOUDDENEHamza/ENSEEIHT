type token =
  | INT of (int)
  | VAR of (string)
  | LPAR
  | RPAR
  | SEMICOL
  | COMA
  | RAND_ITV
  | EQUAL
  | IF
  | ELSE
  | WHILE
  | LBRA
  | RBRA
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
  | SEQ
  | EOF

val file :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Ast.stm
