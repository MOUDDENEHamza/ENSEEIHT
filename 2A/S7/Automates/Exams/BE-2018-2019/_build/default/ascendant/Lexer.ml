# 1 "ascendant/Lexer.mll"
 

(* Partie recopiée dans le fichier CaML généré. *)
(* Ouverture de modules exploités dans les actions *)
(* Déclarations de types, de constantes, de fonctions, d'exceptions exploités dans les actions *)

  open Parser 
  exception LexicalError


# 13 "ascendant/Lexer.ml"
let __ocaml_lex_tables = {
  Lexing.lex_base =
   "\000\000\241\255\242\255\061\000\011\000\021\000\000\000\000\000\
    \247\255\248\255\249\255\250\255\251\255\252\255\000\000\001\000\
    \004\000\000\000\001\000\253\255\001\000\000\000\246\255\003\000\
    \000\000\002\000\245\255\243\255\119\000";
  Lexing.lex_backtrk =
   "\255\255\255\255\255\255\014\000\011\000\014\000\014\000\014\000\
    \255\255\255\255\255\255\255\255\255\255\255\255\014\000\001\000\
    \000\000\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255";
  Lexing.lex_default =
   "\001\000\000\000\000\000\255\255\255\255\255\255\255\255\255\255\
    \000\000\000\000\000\000\000\000\000\000\000\000\255\255\015\000\
    \255\255\255\255\255\255\000\000\255\255\255\255\000\000\255\255\
    \255\255\255\255\000\000\000\000\255\255";
  Lexing.lex_trans =
   "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\016\000\016\000\255\255\000\000\016\000\016\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \016\000\000\000\003\000\015\000\016\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\005\000\010\000\005\000\000\000\000\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\011\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\009\000\000\000\008\000\000\000\027\000\
    \000\000\023\000\000\000\000\000\000\000\022\000\006\000\026\000\
    \000\000\000\000\000\000\000\000\018\000\019\000\014\000\024\000\
    \000\000\000\000\020\000\025\000\007\000\017\000\021\000\000\000\
    \000\000\000\000\000\000\013\000\000\000\012\000\028\000\028\000\
    \028\000\028\000\028\000\028\000\028\000\028\000\028\000\028\000\
    \028\000\028\000\028\000\028\000\028\000\028\000\028\000\028\000\
    \028\000\028\000\028\000\028\000\028\000\028\000\028\000\028\000\
    \000\000\027\000\000\000\000\000\000\000\000\000\028\000\028\000\
    \028\000\028\000\028\000\028\000\028\000\028\000\028\000\028\000\
    \028\000\028\000\028\000\028\000\028\000\028\000\028\000\028\000\
    \028\000\028\000\028\000\028\000\028\000\028\000\028\000\028\000\
    \028\000\028\000\028\000\028\000\028\000\028\000\028\000\028\000\
    \028\000\028\000\028\000\028\000\028\000\028\000\028\000\028\000\
    \028\000\028\000\028\000\028\000\028\000\028\000\028\000\028\000\
    \028\000\028\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \028\000\028\000\028\000\028\000\028\000\028\000\028\000\028\000\
    \028\000\028\000\028\000\028\000\028\000\028\000\028\000\028\000\
    \028\000\028\000\028\000\028\000\028\000\028\000\028\000\028\000\
    \028\000\028\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \002\000\255\255\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    ";
  Lexing.lex_check =
   "\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\000\000\000\000\015\000\255\255\016\000\016\000\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\255\255\000\000\000\000\016\000\255\255\255\255\255\255\
    \255\255\255\255\255\255\000\000\000\000\000\000\255\255\255\255\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\000\000\255\255\000\000\255\255\003\000\
    \255\255\006\000\255\255\255\255\255\255\021\000\000\000\025\000\
    \255\255\255\255\255\255\255\255\017\000\018\000\000\000\023\000\
    \255\255\255\255\007\000\024\000\000\000\014\000\020\000\255\255\
    \255\255\255\255\255\255\000\000\255\255\000\000\003\000\003\000\
    \003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
    \003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
    \003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
    \255\255\028\000\255\255\255\255\255\255\255\255\003\000\003\000\
    \003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
    \003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
    \003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
    \028\000\028\000\028\000\028\000\028\000\028\000\028\000\028\000\
    \028\000\028\000\028\000\028\000\028\000\028\000\028\000\028\000\
    \028\000\028\000\028\000\028\000\028\000\028\000\028\000\028\000\
    \028\000\028\000\255\255\255\255\255\255\255\255\255\255\255\255\
    \028\000\028\000\028\000\028\000\028\000\028\000\028\000\028\000\
    \028\000\028\000\028\000\028\000\028\000\028\000\028\000\028\000\
    \028\000\028\000\028\000\028\000\028\000\028\000\028\000\028\000\
    \028\000\028\000\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\015\000\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    ";
  Lexing.lex_base_code =
   "";
  Lexing.lex_backtrk_code =
   "";
  Lexing.lex_default_code =
   "";
  Lexing.lex_trans_code =
   "";
  Lexing.lex_check_code =
   "";
  Lexing.lex_code =
   "";
}

let rec lexer lexbuf =
   __ocaml_lex_lexer_rec lexbuf 0
and __ocaml_lex_lexer_rec lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
# 23 "ascendant/Lexer.mll"
                                             ( (lexer lexbuf) )
# 149 "ascendant/Lexer.ml"

  | 1 ->
# 24 "ascendant/Lexer.mll"
                                           ( (lexer lexbuf) )
# 154 "ascendant/Lexer.ml"

  | 2 ->
# 25 "ascendant/Lexer.mll"
                                           ( UL_VIDE )
# 159 "ascendant/Lexer.ml"

  | 3 ->
# 26 "ascendant/Lexer.mll"
                                          ( UL_ACCOUV )
# 164 "ascendant/Lexer.ml"

  | 4 ->
# 27 "ascendant/Lexer.mll"
                                          ( UL_ACCFER )
# 169 "ascendant/Lexer.ml"

  | 5 ->
# 28 "ascendant/Lexer.mll"
                                                ( UL_DBLPT )
# 174 "ascendant/Lexer.ml"

  | 6 ->
# 29 "ascendant/Lexer.mll"
                                                ( UL_VIRG )
# 179 "ascendant/Lexer.ml"

  | 7 ->
# 30 "ascendant/Lexer.mll"
                                                ( UL_CROOUV )
# 184 "ascendant/Lexer.ml"

  | 8 ->
# 31 "ascendant/Lexer.mll"
                                                ( UL_CROFER )
# 189 "ascendant/Lexer.ml"

  | 9 ->
# 32 "ascendant/Lexer.mll"
                                                ( UL_VRAI )
# 194 "ascendant/Lexer.ml"

  | 10 ->
# 33 "ascendant/Lexer.mll"
                                                ( UL_FAUX )
# 199 "ascendant/Lexer.ml"

  | 11 ->
let
# 34 "ascendant/Lexer.mll"
                             texte
# 205 "ascendant/Lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_curr_pos in
# 34 "ascendant/Lexer.mll"
                                                ( UL_NOMBRE (int_of_string texte) )
# 209 "ascendant/Lexer.ml"

  | 12 ->
let
# 35 "ascendant/Lexer.mll"
                                        texte
# 215 "ascendant/Lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_curr_pos in
# 35 "ascendant/Lexer.mll"
                                                ( UL_CHAINE (texte) )
# 219 "ascendant/Lexer.ml"

  | 13 ->
# 36 "ascendant/Lexer.mll"
                                          ( UL_FIN )
# 224 "ascendant/Lexer.ml"

  | 14 ->
let
# 37 "ascendant/Lexer.mll"
         texte
# 230 "ascendant/Lexer.ml"
= Lexing.sub_lexeme_char lexbuf lexbuf.Lexing.lex_start_pos in
# 37 "ascendant/Lexer.mll"
                                           ( (print_string "Erreur lexicale : ");(print_char texte);(print_newline ()); raise LexicalError )
# 234 "ascendant/Lexer.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf;
      __ocaml_lex_lexer_rec lexbuf __ocaml_lex_state

;;

# 39 "ascendant/Lexer.mll"
 


# 245 "ascendant/Lexer.ml"