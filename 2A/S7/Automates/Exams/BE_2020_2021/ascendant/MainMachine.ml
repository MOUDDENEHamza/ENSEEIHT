open Parser

(* Fonction d'affichage des unités lexicales et des données qu'elles contiennent *)
let printToken t =
  (print_endline
     (match t with
       | UL_ACCOUV -> "{"
       | UL_ACCFER -> "}"
       | UL_PT -> "."
       | UL_MACHINE -> "machine"
       | UL_REGION -> "region"
       | UL_STATE  -> "state"
       | UL_FROM  -> "from"
       | UL_TO   -> "to"
       | UL_ON   -> "on"
       | UL_EVENT  -> "event" 
       | UL_STARTS -> "starts"
       | UL_ENDS  -> "ends"
       | UL_IDENT n -> n
       | UL_FIN -> "EOF"
));;

(* Analyse lexicale du fichier passé en paramètre de la ligne de commande *)
if (Array.length Sys.argv > 1)
then
  let lexbuf = (Lexing.from_channel (open_in Sys.argv.(1))) in
  let token = ref (Lexer.lexer lexbuf) in
  while ((!token) != UL_FIN) do
    (printToken (!token));
    (token := (Lexer.lexer lexbuf))
  done
else
  (print_endline "MainJSON fichier");;

(* Analyse lexicale, syntaxique et sémantique du fichier passé en paramètre de la ligne de commande *)
if (Array.length Sys.argv > 1)
then
  let lexbuf = (Lexing.from_channel (open_in Sys.argv.(1))) in
  (Parser.machine Lexer.lexer lexbuf)
else
  (print_endline "MainJSON fichier");;