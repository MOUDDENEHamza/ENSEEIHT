{
  open Parser
  open Lexing

  exception Error of string
}


let digit = ['0'-'9']
let id = ['a'-'z'] ['a'-'z' '0'-'9']*

rule token = parse
  | '\n'  (* ignore newlines but count them *)
      { new_line lexbuf; token lexbuf }
  | [' ' '\t'] (* ignore whitespaces and tabs *)
      { token lexbuf }
  | '('       {LeftParenthesisToken}
  | ')'       {RightParenthesisToken}
  | '='       {EqualToken}
  | ":="      {AssignToken}
  | "!="      {DifferentToken}
  | '='       {EqualToken}
  | ';'       {SequenceToken}
  | "ref"     {RefToken}
  | "not"     {NotToken}
  | '!'       {DerefToken}
  | '<'       {LesserToken}
  | '>'       {GreaterToken}
  | "<="      {LesserEqualToken}
  | ">="      {GreaterEqualToken}
  | '+'       {PlusToken}
  | '-'       {MinusToken}
  | '*'       {StarToken}
  | '/'       {SlashToken}
  | "&&"      {AndToken}
  | "||"      {OrToken}
  | "->"      {BodyToken}
  | "fun"     {FunctionToken}
  | "if"      {IfToken}
  | "then"    {ThenToken}
  | "else"    {ElseToken}
  | "let"     {LetToken}
  | "in"      {InToken}
  | "letrec"  {RecToken}
  | "true"    {TrueToken}
  | "false"   {FalseToken }
  | digit+ as inum
              {NumberToken (int_of_string inum)}
  | id as text
              {IdentToken text}
| eof         { EOF }
| _
{ raise (Error ("Unexpected char: "^(Lexing.lexeme lexbuf)^" at "^(string_of_int (Lexing.lexeme_start
lexbuf))^"-"^(string_of_int (Lexing.lexeme_end lexbuf)))) }
