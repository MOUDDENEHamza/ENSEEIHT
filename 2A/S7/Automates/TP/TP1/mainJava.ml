open TokenJava;;

if (Array.length Sys.argv > 1)
then
  let lexbuf = (Lexing.from_channel (open_in Sys.argv.(1))) in
  let token = ref (LexerJava.lexer lexbuf) in
  while ((!token) != FIN) do
    (printToken (!token));
    (token := (LexerJava.lexer lexbuf))
  done
else
  (print_endline "mainJava.exe fichier")
