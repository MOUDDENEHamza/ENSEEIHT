
(* The type of tokens. *)

type token = 
  | UMinusToken
  | TrueToken
  | ThenToken
  | StarToken
  | SlashToken
  | SequenceToken
  | RightParenthesisToken
  | RefToken
  | RecToken
  | PlusToken
  | OrToken
  | NumberToken of (int)
  | NotToken
  | MinusToken
  | LetToken
  | LesserToken
  | LesserEqualToken
  | LeftParenthesisToken
  | InToken
  | IfToken
  | IdentToken of (string)
  | GreaterToken
  | GreaterEqualToken
  | FunctionToken
  | FalseToken
  | EqualToken
  | ElseToken
  | EOF
  | DifferentToken
  | DerefToken
  | BodyToken
  | AssignToken
  | AndToken

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val main: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.ast)
