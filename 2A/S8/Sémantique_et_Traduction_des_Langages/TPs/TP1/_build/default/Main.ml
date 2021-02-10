open Ast 
open Lexer
open Parser
open Semantics
open Lexing
   
let report_error filename lexbuf msg =
  let (b,e) = (lexeme_start_p lexbuf, lexeme_end_p lexbuf) in
  let fc = b.pos_cnum - b.pos_bol + 1 in
  let lc = e.pos_cnum - b.pos_bol + 1 in
  Printf.eprintf "File \"%s\", line %d, characters %d-%d: %s\n" filename b.pos_lnum fc lc msg

(* main : string -> valueType *)
(* Analyse le contenu d'un fichier passé en paramètre *)
(* Dans le cas où l'analyse syntaxique s'est bien passée, *)
(* lance l'analyse sémantique avec un environement d'évaluation initial vide *)
let main fichier =
  let input = open_in fichier in
  let filebuf = Lexing.from_channel input in
  try
    let ast = Parser.main Lexer.token filebuf in
    let env = [] in 
    value_of_expr ast env
  with
  | Lexer.Error s ->
     report_error fichier filebuf "lexical error (unexpected character).";
     exit 2
  | Parser.Error ->
     report_error fichier filebuf "syntax error.";
     exit 2

let%test _ = ( (main "../../exemples/exemple-00.mml") = (IntegerValue 3))
let%test _ = ( (main "../../exemples/exemple-01.mml") = (IntegerValue (-8)))
let%test _ = ( (main "../../exemples/exemple-02.mml") = (IntegerValue 4))
let%test _ = ( (main "../../exemples/exemple-03.mml") = (IntegerValue 5))
let%test _ = ( (main "../../exemples/exemple-04.mml") = (IntegerValue 1))
let%test _ = ( (main "../../exemples/exemple-05.mml") = (IntegerValue 2))
let%test _ = ( (main "../../exemples/exemple-06.mml") = (IntegerValue 120))
let%test _ = ( (main "../../exemples/exemple-07.mml") = (IntegerValue 10))
let%test _ = ( (main "../../exemples/exemple-08.mml") = (IntegerValue 5))
let%test _ = ( (main "../../exemples/exemple-09.mml") = (FrozenValue (FunctionNode ("x",AccessNode "x"),[])))
let%test _ = ( (main "../../exemples/exemple-11.mml") = (IntegerValue 120))
let%test _ = ( (main "../../exemples/exemple-12.mml") = (IntegerValue 120))
               
