(* open List *)

type token =
  | EOSToken
  | FunctionToken
  | BodyToken
  | IfToken
  | ThenToken
  | ElseToken
  | LetToken
  | InToken
  | TrueToken
  | FalseToken
  | RecToken
  | IdentToken of string
  | NumberToken of int
  | EqualToken
  | DifferentToken
  | LesserToken
  | GreaterToken
  | LesserEqualToken
  | GreaterEqualToken
  | PlusToken
  | MinusToken
  | TimesToken
  | DivideToken
  | LeftParenthesisToken
  | RightParenthesisToken
;;

type inputStream = token list;;

(* string_of_token : token -> string *)
(* Converti un token en une chaîne de caractère*)
let string_of_token token =
  match token with
    | EOSToken -> "$"
    | FunctionToken -> "function"
    | BodyToken -> "->"
    | IfToken -> "if"
    | ThenToken -> "then"
    | ElseToken -> "else"
    | LetToken -> "let"
    | InToken -> "in"
    | TrueToken -> "true"
    | FalseToken -> "false"
    | RecToken -> "letrec"
    | NumberToken xxx  -> string_of_int xxx
    | IdentToken  name -> name
    | EqualToken -> "="
    | DifferentToken -> "!="
    | LesserToken -> "<"
    | GreaterToken -> ">"
    | LesserEqualToken -> "<="
    | GreaterEqualToken -> ">="
    | PlusToken -> "+"
    | MinusToken -> "-"
    | TimesToken -> "*"
    | DivideToken -> "/"
    | LeftParenthesisToken -> "("
    | RightParenthesisToken -> ")"
;;

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
