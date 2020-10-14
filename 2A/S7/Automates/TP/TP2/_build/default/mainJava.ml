open ParserJava

(* Fonction d'affichage des unités lexicales et des données qu'elles contiennent *)
let printToken t =
  (print_endline
     (match t with
       | IMPORT -> "import"
       | IDENT (texte) -> texte
       | TYPEIDENT (texte) -> texte
       | INT -> "int"
       | FLOAT -> "float"
       | BOOL -> "bool"
       | CHAR -> "char"
       | VOID -> "void"
       | STRING -> "String"
       | ACCOUV -> "{"
       | ACCFER -> "}"
       | PTVIRG -> ";"
       | VIRG -> ","
       | PAROUV -> "("
       | PARFER -> ")"
       | CROOUV -> "["
       | CROFER -> "]"
       | SI -> "if"
       | SINON -> "else"
       | TANTQUE -> "while"
       | RETOUR -> "return"
       | ENTIER (texte) -> (string_of_int texte)
       | FLOTTANT (texte) -> (string_of_float texte)
       | BOOLEEN (texte) -> (string_of_bool texte)
       | CARACTERE (texte) -> (String.make 1 texte)
       | CHAINE (texte) -> texte
       | VIDE -> "null"
       | NOUVEAU -> "new"
       | FIN -> "EOF"
       | ASSIGN -> "="
       | OPINF -> "<"
       | OPSUP -> ">"
       | OPINFEG -> "<="
       | OPSUPEG -> ">="
       | OPEG -> "=="
       | OPNONEG -> "!="
       | OPPLUS -> "+"
       | OPMOINS -> "-"
       | OPOU -> "||"
       | OPMULT -> "*"
       | OPMOD -> "%"
       | OPDIV -> "/"
       | OPET -> "&&"
       | OPNON -> "!"
       | OPPT -> "."));;

(* Analyse lexicale du fichier passé en paramètre de la ligne de commande *)
if (Array.length Sys.argv > 1)
then
  let lexbuf = (Lexing.from_channel (open_in Sys.argv.(1))) in
  let token = ref (LexerJava.main lexbuf) in
  while ((!token) != FIN) do
    (printToken (!token));
    (token := (LexerJava.main lexbuf))
  done
else
  (print_endline "MainMuJava fichier");;

(* Analyse lexicale, syntaxique et sémantique du fichier passé en paramètre de la ligne de commande *)
if (Array.length Sys.argv > 1)
then
  let lexbuf = (Lexing.from_channel (open_in Sys.argv.(1))) in
  (ParserJava.fichier LexerJava.main lexbuf)
else
  (print_endline "MainJava fichier");;
