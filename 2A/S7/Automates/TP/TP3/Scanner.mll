{
  open Lex
  open Printf
}

let digit = ['0'-'9']
let id = ['a'-'z'] ['a'-'z' '0'-'9']*

rule scanner = parse
  | [' ' '\t' '\n' '\r']    { (scanner lexbuf) }    (* eat up whitespace *)
  | '('
      { 
      LeftParenthesisToken :: (scanner lexbuf)
    }
  | ')'
      { 
      RightParenthesisToken :: (scanner lexbuf)
    }
  | '='
      {
      EqualToken :: (scanner lexbuf)
    }
  | "!="
      {
      DifferentToken :: (scanner lexbuf)
    }
  | '='
      {
      EqualToken :: (scanner lexbuf)
    }
  | '<'
      {
      LesserToken :: (scanner lexbuf)
    }
  | '>'
      {
      GreaterToken :: (scanner lexbuf)
    }
  | "<="
      {
      LesserEqualToken :: (scanner lexbuf)
    }
  | ">="
      {
      GreaterEqualToken :: (scanner lexbuf)
    }
  | '+'
      { 
      PlusToken :: (scanner lexbuf)
    }
  | '-'
      { 
      MinusToken :: (scanner lexbuf)
    }
  | '*'
      {
      TimesToken :: (scanner lexbuf)
    }
  | '/'
      {
      DivideToken :: (scanner lexbuf)
    }
  | "->"
      {
      BodyToken :: (scanner lexbuf)
    }
  | "function"
      {
      FunctionToken :: (scanner lexbuf)
    }
  | "if"
      {
      IfToken :: (scanner lexbuf)
    }
  | "then"
      {
      ThenToken :: (scanner lexbuf)
    }
  | "else"
      {
      ElseToken :: (scanner lexbuf)
    }
  | "let"
      {
      LetToken :: (scanner lexbuf)
    }
  | "in"
      {
      InToken :: (scanner lexbuf)
    }
  | "letrec"
      {
      RecToken :: (scanner lexbuf)
    }
  | "true"
      {
      TrueToken :: (scanner lexbuf)
    }
  | "false"
      {
      FalseToken :: (scanner lexbuf)
    }
  | digit+ as inum
      { 
      (NumberToken (int_of_string inum)) :: (scanner lexbuf)
    }
  | id as text
      {
      (IdentToken ("\"" ^ text ^"\"")) :: (scanner lexbuf)
    }
  | _ as c
      { printf "Unrecognized character: %c\n" c;
      (scanner lexbuf)
    }
  | eof        {[ EOSToken ] }

{
}

