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

(** Parses the file.
    If a parsing error occurs, print a message and raise Report.Error *)
let file filename =
  let env, ast = Utils.with_in_ch (Some filename) (fun in_ch ->
    let lexbuf = Lexing.from_channel in_ch in
    try
      Location.filename := filename;
      Parser.file Lexer.token lexbuf 
    with
    | Lexer.Lexing_error s ->
      let loc = Location.get_current_from_lexbuf lexbuf in
      Report.error_loc loc "%s." s
    | Failure _
    | Parsing.Parse_error ->
      let loc = Location.get_current_from_lexbuf lexbuf in
      Report.error_loc loc "Syntax error.") in
  Report.nlogf 1 "Input parsed.";
  let ast =  Typing.type_stm env ast in
  Report.nlogf 1 "AST typed.";
  let vars = Typing.vars_of_env env in 
  Report.nlogf 2 "%a" Ast.fprint_stm ast;
   vars, ast
