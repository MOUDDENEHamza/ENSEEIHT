open Lex
open Scanner
open Syntax

(* main : unit -> unit *)
(* Analyse le contenu d'un fichier passé en paramètre ou l'entrée standard si aucun fichier n'est donné *)
(* Affiche OK si l'analyse syntaxique c'est bien passée et KO sinon *)
let main () =
  let cin =
    if Array.length Sys.argv > 1 then
      open_in Sys.argv.(1)
    else
      stdin
  in
    let lexbuf = Lexing.from_channel cin in
    match (parseE (scanner lexbuf))
     with
       | Success [EOSToken] -> print_endline "Ok"
       | _ -> print_endline "Ko"
;;

main();;
