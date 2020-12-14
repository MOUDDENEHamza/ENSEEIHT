open Tokens
open Scanner
open Parser

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
  let tokens =  (scanner lexbuf) in
    (print_endline ("Résultat de l'analyse lexicale :" ^ (string_of_stream tokens)));
    (print_endline "Analyse syntaxique par descente récursive, règles appliquées :");
    (match (parseD tokens)
     with
       | Success [UL_FIN] -> print_endline "Succés"
       | _ -> print_endline "Echec")
;;

main();;
