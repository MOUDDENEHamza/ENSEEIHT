{
(*
 * TINY (Tiny Is Not Yasa (Yet Another Static Analyzer)):
 * a simple abstract interpreter for teaching purpose.
 * Copyright (C) 2012  P. Roux
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 *)

open Parser

exception Lexing_error of string
}

let digit = ['0'-'9']
let alpha = ['a'-'z' 'A'-'Z']
let blank = [' ' '\r' '\t']
let nl = ['\r']?['\n']

rule token = parse
  | nl { Lexing.new_line lexbuf; token lexbuf }
  | blank+ { token lexbuf }
  | "/*" { comment lexbuf }
  | "++" { PLUS2 }
  | "--" { MINUS2 }
  | '+' { PLUS }
  | '-' { MINUS }
  | '*' { TIMES }
  | '/' { DIV }
  | '(' { LPAR }
  | ')' { RPAR }
  | "rand" { RAND_ITV }
  | '=' { EQUAL }
  | ';' { SEMICOL }
  | ',' { COMA }
  | "if" { IF }
  | "else" { ELSE }
  | "while" { WHILE }
  | '{' { LBRA }
  | '}' { RBRA }
  | '>' { GT }
  | '<' { LT }
  | ">=" { GE }
  | "<=" { LE }
  | ('0' | (['1'-'9'] digit*)) as n
      { let n =
          try int_of_string n
          with Failure "int_of_string" ->
            raise (Lexing_error "constant overflow") in
        INT n }
  | (alpha (alpha|digit|['_'])*) as n { VAR n }
  | eof { EOF }
  | _ { raise (Lexing_error "unknown char") }

and comment = parse
  | nl { Lexing.new_line lexbuf; comment lexbuf }
  | "*/" { token lexbuf }
  | _ { comment lexbuf }
