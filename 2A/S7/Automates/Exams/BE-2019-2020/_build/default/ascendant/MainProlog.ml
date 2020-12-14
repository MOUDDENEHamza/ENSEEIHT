open Parser

(* Fonction d'affichage des unités lexicales et des données qu'elles contiennent *)
let printToken t =
  (print_endline
     (match t with
       | UL_PAROUV -> "("
       | UL_PARFER -> ")"
       | UL_FIN -> "EOF"
       | UL_VARIABLE (texte) -> (texte)
       | UL_SYMBOLE (texte) -> (texte)
       | UL_ECHEC -> "fail"
       | UL_COUPURE -> "!"
       | UL_NEGATION -> "-"
       | UL_PT -> "."
       | UL_VIRG -> ","
       | UL_DEDUCTION -> ":-"
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
  (Parser.document Lexer.lexer lexbuf)
else
  (print_endline "MainJSON fichier");;
