type token =
  | NUM of (float * string * Ast.base_type)
  | VAR of (string)
  | LPAR
  | RPAR
  | SEMICOL
  | LOWER_SEMICOL
  | COMMA
  | RAND_ITV_REAL
  | RAND_ITV_INT
  | EQUAL
  | IF
  | ELSE
  | WHILE
  | LBRA
  | RBRA
  | DBLPOINT
  | PLUS2
  | MINUS2
  | GT
  | LT
  | GE
  | LE
  | PLUS
  | MINUS
  | TIMES
  | DIV
  | UMINUS
  | INTTYPE
  | REALTYPE
  | BOOLTYPE
  | SEQ
  | EOF

open Parsing;;
let _ = parse_error;;
# 2 "parser.mly"
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

let loc () = Location.get_current ()

let build l bop e1 e2 = (* match bop, Q.compare e2 (Q.of_int 0) with *)
  (* | Ast.Minus, 0 -> e1 *)
  (* | _ ->  *)Ast.UBinop (l, bop, e1, e2)
		   
let build_op_eq l v bop e = Ast.UAsn (l, v, build l bop (Ast.UVar (l, v)) e)

let build_call l name el = Ast.UCall (l, name, el)     

let build_comp l bop e1 e2 sl = Ast.UCond (l, (build l bop e1 e2), sl)


let build_itv a b loc tgt_type =
  let x1, x1s, t1 = a
  and x2, x2s, t2 = b in
  if t1 = t2 && t1 = tgt_type then
    Ast.URand (loc, t1, (x1, x1s), (x2, x2s))
  else
    failwith "invalid type: range with different types or invalid type"

# 80 "parser.ml"
let yytransl_const = [|
  259 (* LPAR *);
  260 (* RPAR *);
  261 (* SEMICOL *);
  262 (* LOWER_SEMICOL *);
  263 (* COMMA *);
  264 (* RAND_ITV_REAL *);
  265 (* RAND_ITV_INT *);
  266 (* EQUAL *);
  267 (* IF *);
  268 (* ELSE *);
  269 (* WHILE *);
  270 (* LBRA *);
  271 (* RBRA *);
  272 (* DBLPOINT *);
  273 (* PLUS2 *);
  274 (* MINUS2 *);
  275 (* GT *);
  276 (* LT *);
  277 (* GE *);
  278 (* LE *);
  279 (* PLUS *);
  280 (* MINUS *);
  281 (* TIMES *);
  282 (* DIV *);
  283 (* UMINUS *);
  284 (* INTTYPE *);
  285 (* REALTYPE *);
  286 (* BOOLTYPE *);
  287 (* SEQ *);
    0 (* EOF *);
    0|]

let yytransl_block = [|
  257 (* NUM *);
  258 (* VAR *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\002\000\004\000\004\000\004\000\005\000\005\000\
\006\000\006\000\003\000\003\000\007\000\007\000\007\000\007\000\
\007\000\007\000\007\000\007\000\007\000\007\000\007\000\007\000\
\008\000\008\000\008\000\008\000\008\000\008\000\008\000\008\000\
\008\000\008\000\008\000\008\000\008\000\008\000\008\000\010\000\
\010\000\009\000\009\000\000\000"

let yylen = "\002\000\
\003\000\004\000\003\000\001\000\001\000\001\000\003\000\001\000\
\003\000\001\000\001\000\002\000\004\000\007\000\005\000\005\000\
\005\000\005\000\005\000\005\000\003\000\003\000\003\000\003\000\
\001\000\001\000\006\000\006\000\003\000\003\000\003\000\003\000\
\003\000\002\000\004\000\003\000\003\000\003\000\003\000\003\000\
\001\000\001\000\002\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\004\000\005\000\006\000\044\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\001\000\012\000\000\000\000\000\
\025\000\000\000\000\000\000\000\000\000\000\000\000\000\022\000\
\024\000\000\000\000\000\000\000\000\000\000\000\000\000\021\000\
\023\000\007\000\002\000\000\000\000\000\000\000\000\000\034\000\
\013\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\029\000\042\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\032\000\033\000\017\000\018\000\
\019\000\020\000\000\000\000\000\010\000\016\000\000\000\035\000\
\043\000\000\000\000\000\000\000\000\000\040\000\000\000\000\000\
\009\000\014\000\028\000\027\000"

let yydgoto = "\002\000\
\006\000\007\000\014\000\008\000\017\000\092\000\015\000\072\000\
\077\000\073\000"

let yysindex = "\009\000\
\246\254\000\000\000\000\000\000\000\000\000\000\035\000\011\255\
\010\000\022\255\023\255\025\255\030\255\034\000\035\000\028\255\
\036\255\014\255\038\255\062\255\059\255\061\255\063\255\064\255\
\014\255\014\255\067\255\070\255\000\000\000\000\011\255\246\254\
\000\000\065\255\014\255\091\255\092\255\014\255\097\255\000\000\
\000\000\014\255\014\255\014\255\014\255\058\255\066\255\000\000\
\000\000\000\000\000\000\014\255\089\255\013\255\013\255\000\000\
\000\000\014\255\014\255\014\255\014\255\014\255\014\255\014\255\
\014\255\119\255\127\255\149\255\157\255\027\000\027\000\204\255\
\093\255\000\000\000\000\095\255\094\255\096\255\040\255\040\255\
\040\255\040\255\238\254\238\254\000\000\000\000\000\000\000\000\
\000\000\000\000\035\000\086\255\000\000\000\000\014\255\000\000\
\000\000\013\255\013\255\084\255\027\000\000\000\100\255\101\255\
\000\000\000\000\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\002\000\102\255\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\045\000\
\000\000\035\255\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\121\255\
\000\000\000\000\000\000\000\000\000\000\000\000\212\255\231\255\
\235\255\003\000\180\255\186\255\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\001\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\068\000\241\255\000\000\075\000\188\255\191\255\242\255\
\210\255\031\000"

let yytablesize = 319
let yytable = "\030\000\
\015\000\011\000\094\000\039\000\093\000\093\000\064\000\065\000\
\078\000\001\000\046\000\047\000\016\000\075\000\033\000\034\000\
\035\000\003\000\004\000\005\000\053\000\036\000\037\000\056\000\
\025\000\026\000\027\000\066\000\067\000\068\000\069\000\028\000\
\106\000\029\000\031\000\093\000\076\000\038\000\026\000\026\000\
\032\000\026\000\040\000\079\000\080\000\081\000\082\000\083\000\
\084\000\085\000\086\000\103\000\104\000\026\000\026\000\026\000\
\026\000\026\000\026\000\026\000\026\000\070\000\062\000\063\000\
\064\000\065\000\041\000\052\000\042\000\071\000\043\000\048\000\
\044\000\045\000\049\000\100\000\058\000\059\000\060\000\061\000\
\062\000\063\000\064\000\065\000\058\000\059\000\060\000\061\000\
\062\000\063\000\064\000\065\000\074\000\054\000\055\000\097\000\
\096\000\101\000\105\000\051\000\098\000\057\000\099\000\107\000\
\108\000\050\000\008\000\058\000\059\000\060\000\061\000\062\000\
\063\000\064\000\065\000\058\000\059\000\060\000\061\000\062\000\
\063\000\064\000\065\000\087\000\041\000\102\000\000\000\000\000\
\000\000\000\000\000\000\088\000\000\000\000\000\000\000\000\000\
\000\000\058\000\059\000\060\000\061\000\062\000\063\000\064\000\
\065\000\058\000\059\000\060\000\061\000\062\000\063\000\064\000\
\065\000\089\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\090\000\000\000\000\000\000\000\000\000\000\000\058\000\
\059\000\060\000\061\000\062\000\063\000\064\000\065\000\058\000\
\059\000\060\000\061\000\062\000\063\000\064\000\065\000\030\000\
\030\000\000\000\030\000\000\000\000\000\031\000\031\000\000\000\
\031\000\000\000\000\000\000\000\000\000\000\000\030\000\030\000\
\030\000\030\000\030\000\030\000\031\000\031\000\031\000\031\000\
\031\000\031\000\095\000\000\000\000\000\000\000\000\000\036\000\
\036\000\000\000\036\000\000\000\000\000\000\000\058\000\059\000\
\060\000\061\000\062\000\063\000\064\000\065\000\036\000\036\000\
\036\000\036\000\037\000\037\000\000\000\037\000\038\000\038\000\
\000\000\038\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\037\000\037\000\037\000\037\000\038\000\038\000\038\000\
\038\000\000\000\015\000\000\000\000\000\000\000\039\000\039\000\
\000\000\039\000\000\000\015\000\000\000\015\000\000\000\015\000\
\011\000\015\000\015\000\018\000\000\000\039\000\039\000\039\000\
\039\000\000\000\019\000\020\000\009\000\000\000\000\000\000\000\
\021\000\022\000\023\000\024\000\009\000\010\000\000\000\011\000\
\091\000\000\000\000\000\012\000\013\000\010\000\003\000\011\000\
\000\000\000\000\000\000\012\000\013\000\000\000\000\000\003\000\
\000\000\003\000\000\000\000\000\000\000\003\000\003\000"

let yycheck = "\015\000\
\000\000\000\000\071\000\018\000\070\000\071\000\025\001\026\001\
\055\000\001\000\025\000\026\000\002\001\001\001\001\001\002\001\
\003\001\028\001\029\001\030\001\035\000\008\001\009\001\038\000\
\003\001\003\001\002\001\042\000\043\000\044\000\045\000\002\001\
\101\000\000\000\007\001\101\000\024\001\024\001\004\001\005\001\
\005\001\007\001\005\001\058\000\059\000\060\000\061\000\062\000\
\063\000\064\000\065\000\098\000\099\000\019\001\020\001\021\001\
\022\001\023\001\024\001\025\001\026\001\004\001\023\001\024\001\
\025\001\026\001\005\001\003\001\010\001\004\001\010\001\005\001\
\010\001\010\001\005\001\091\000\019\001\020\001\021\001\022\001\
\023\001\024\001\025\001\026\001\019\001\020\001\021\001\022\001\
\023\001\024\001\025\001\026\001\004\001\003\001\003\001\001\001\
\004\001\012\001\015\001\032\000\007\001\005\001\007\001\004\001\
\004\001\031\000\005\001\019\001\020\001\021\001\022\001\023\001\
\024\001\025\001\026\001\019\001\020\001\021\001\022\001\023\001\
\024\001\025\001\026\001\005\001\004\001\095\000\255\255\255\255\
\255\255\255\255\255\255\005\001\255\255\255\255\255\255\255\255\
\255\255\019\001\020\001\021\001\022\001\023\001\024\001\025\001\
\026\001\019\001\020\001\021\001\022\001\023\001\024\001\025\001\
\026\001\005\001\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\005\001\255\255\255\255\255\255\255\255\255\255\019\001\
\020\001\021\001\022\001\023\001\024\001\025\001\026\001\019\001\
\020\001\021\001\022\001\023\001\024\001\025\001\026\001\004\001\
\005\001\255\255\007\001\255\255\255\255\004\001\005\001\255\255\
\007\001\255\255\255\255\255\255\255\255\255\255\019\001\020\001\
\021\001\022\001\023\001\024\001\019\001\020\001\021\001\022\001\
\023\001\024\001\007\001\255\255\255\255\255\255\255\255\004\001\
\005\001\255\255\007\001\255\255\255\255\255\255\019\001\020\001\
\021\001\022\001\023\001\024\001\025\001\026\001\019\001\020\001\
\021\001\022\001\004\001\005\001\255\255\007\001\004\001\005\001\
\255\255\007\001\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\019\001\020\001\021\001\022\001\019\001\020\001\021\001\
\022\001\255\255\002\001\255\255\255\255\255\255\004\001\005\001\
\255\255\007\001\255\255\011\001\255\255\013\001\255\255\015\001\
\015\001\017\001\018\001\010\001\255\255\019\001\020\001\021\001\
\022\001\255\255\017\001\018\001\002\001\255\255\255\255\255\255\
\023\001\024\001\025\001\026\001\002\001\011\001\255\255\013\001\
\014\001\255\255\255\255\017\001\018\001\011\001\002\001\013\001\
\255\255\255\255\255\255\017\001\018\001\255\255\255\255\011\001\
\255\255\013\001\255\255\255\255\255\255\017\001\018\001"

let yynames_const = "\
  LPAR\000\
  RPAR\000\
  SEMICOL\000\
  LOWER_SEMICOL\000\
  COMMA\000\
  RAND_ITV_REAL\000\
  RAND_ITV_INT\000\
  EQUAL\000\
  IF\000\
  ELSE\000\
  WHILE\000\
  LBRA\000\
  RBRA\000\
  DBLPOINT\000\
  PLUS2\000\
  MINUS2\000\
  GT\000\
  LT\000\
  GE\000\
  LE\000\
  PLUS\000\
  MINUS\000\
  TIMES\000\
  DIV\000\
  UMINUS\000\
  INTTYPE\000\
  REALTYPE\000\
  BOOLTYPE\000\
  SEQ\000\
  EOF\000\
  "

let yynames_block = "\
  NUM\000\
  VAR\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'decls) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'stmts) in
    Obj.repr(
# 72 "parser.mly"
                  ( _1 Typing.empty_env, _2 )
# 322 "parser.ml"
               :  Typing.typing_env * Ast.ustm))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'vtype) in
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'varlist) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'decls) in
    Obj.repr(
# 75 "parser.mly"
                              (  
  fun env -> 
    let env = List.fold_left (Typing.decl_var_type _1) env _2 in
    _4 env
)
# 335 "parser.ml"
               : 'decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'vtype) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'varlist) in
    Obj.repr(
# 81 "parser.mly"
                        ( fun env -> List.fold_left (Typing.decl_var_type _1) env _2 )
# 343 "parser.ml"
               : 'decls))
; (fun __caml_parser_env ->
    Obj.repr(
# 86 "parser.mly"
          ( Ast.IntT )
# 349 "parser.ml"
               : 'vtype))
; (fun __caml_parser_env ->
    Obj.repr(
# 87 "parser.mly"
           ( Ast.RealT )
# 355 "parser.ml"
               : 'vtype))
; (fun __caml_parser_env ->
    Obj.repr(
# 88 "parser.mly"
           ( Ast.BoolT )
# 361 "parser.ml"
               : 'vtype))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'varlist) in
    Obj.repr(
# 91 "parser.mly"
                    ( (_1,loc())::_3 )
# 369 "parser.ml"
               : 'varlist))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 92 "parser.mly"
      ( [_1, loc()] )
# 376 "parser.ml"
               : 'varlist))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'stmts) in
    Obj.repr(
# 96 "parser.mly"
                  ( _2 )
# 383 "parser.ml"
               : 'bloc))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'stm) in
    Obj.repr(
# 97 "parser.mly"
      ( _1 )
# 390 "parser.ml"
               : 'bloc))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'stm) in
    Obj.repr(
# 100 "parser.mly"
      ( _1 )
# 397 "parser.ml"
               : 'stmts))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'stm) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'stmts) in
    Obj.repr(
# 101 "parser.mly"
            ( Ast.USeq (loc (), _1, _2) )
# 405 "parser.ml"
               : 'stmts))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 105 "parser.mly"
                         ( Ast.UAsn (loc (), _1, _3) )
# 413 "parser.ml"
               : 'stm))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 2 : 'bloc) in
    let _7 = (Parsing.peek_val __caml_parser_env 0 : 'bloc) in
    Obj.repr(
# 107 "parser.mly"
        ( Ast.UIte (loc (), _3, _5, _7) )
# 422 "parser.ml"
               : 'stm))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'bloc) in
    Obj.repr(
# 109 "parser.mly"
        ( Ast.UIte (loc (), _3, _5, Ast.UNop(loc ())) )
# 430 "parser.ml"
               : 'stm))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'bloc) in
    Obj.repr(
# 111 "parser.mly"
    ( Ast.UWhile (loc (), _3, _5) )
# 438 "parser.ml"
               : 'stm))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 113 "parser.mly"
                              ( build_op_eq (loc ()) _1 Ast.Plus _4 )
# 446 "parser.ml"
               : 'stm))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 114 "parser.mly"
                               ( build_op_eq (loc ()) _1 Ast.Minus _4 )
# 454 "parser.ml"
               : 'stm))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 115 "parser.mly"
                               ( build_op_eq (loc ()) _1 Ast.Times _4 )
# 462 "parser.ml"
               : 'stm))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 116 "parser.mly"
                             ( build_op_eq (loc ()) _1 Ast.Div _4 )
# 470 "parser.ml"
               : 'stm))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 118 "parser.mly"
                    ( build_op_eq (loc ()) _2 Ast.Plus (Ast.UCst (loc (), (1., "1", None))) )
# 477 "parser.ml"
               : 'stm))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    Obj.repr(
# 119 "parser.mly"
                    ( build_op_eq (loc ()) _1 Ast.Plus (Ast.UCst (loc (), (1., "1", None))) )
# 484 "parser.ml"
               : 'stm))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 120 "parser.mly"
                     ( build_op_eq (loc ()) _2 Ast.Minus (Ast.UCst (loc (), (1., "1", None))) )
# 491 "parser.ml"
               : 'stm))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    Obj.repr(
# 121 "parser.mly"
                     ( build_op_eq (loc ()) _1 Ast.Minus (Ast.UCst (loc (), (1., "1", None))) )
# 498 "parser.ml"
               : 'stm))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : float * string * Ast.base_type) in
    Obj.repr(
# 125 "parser.mly"
      ( let x, xs, t = _1 in Ast.UCst (loc (), (x, xs, Some t)) )
# 505 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 126 "parser.mly"
      ( Ast.UVar (loc (), _1) )
# 512 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 3 : 'signed_num) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : 'signed_num) in
    Obj.repr(
# 127 "parser.mly"
                                                     (
		 build_itv _3 _5 (loc ()) Ast.IntT
)
# 522 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 3 : 'signed_num) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : 'signed_num) in
    Obj.repr(
# 130 "parser.mly"
                                                      (
		 build_itv _3 _5 (loc ()) Ast.RealT
)
# 532 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 133 "parser.mly"
                 ( _2 )
# 539 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 134 "parser.mly"
                 ( build (loc ()) Ast.Plus _1 _3 )
# 547 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 135 "parser.mly"
                  ( build (loc ()) Ast.Minus _1 _3 )
# 555 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 136 "parser.mly"
                  ( build (loc ()) Ast.Times _1 _3 )
# 563 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 137 "parser.mly"
                ( build (loc ()) Ast.Div _1 _3 )
# 571 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 139 "parser.mly"
                          ( build (loc ()) Ast.Minus (Ast.UCst (loc (), (0., "0", None))) _2 )
# 578 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'exprlist) in
    Obj.repr(
# 140 "parser.mly"
                         ( build_call (loc ()) _1 _3 )
# 586 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 142 "parser.mly"
               ( build_comp (loc ()) Ast.Minus _1 _3 Ast.Strict )
# 594 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 143 "parser.mly"
               ( build_comp (loc ()) Ast.Minus _3 _1 Ast.Strict )
# 602 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 144 "parser.mly"
               ( build_comp (loc ()) Ast.Minus _1 _3 Ast.Loose )
# 610 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 145 "parser.mly"
               ( build_comp (loc ()) Ast.Minus _3 _1 Ast.Loose )
# 618 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exprlist) in
    Obj.repr(
# 148 "parser.mly"
                      (_1 :: _3)
# 626 "parser.ml"
               : 'exprlist))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 149 "parser.mly"
                       ([_1])
# 633 "parser.ml"
               : 'exprlist))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : float * string * Ast.base_type) in
    Obj.repr(
# 153 "parser.mly"
      ( _1 )
# 640 "parser.ml"
               : 'signed_num))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : float * string * Ast.base_type) in
    Obj.repr(
# 154 "parser.mly"
             ( let x, xs, t = _2 in -. x, "-" ^ xs, t )
# 647 "parser.ml"
               : 'signed_num))
(* Entry file *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let file (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf :  Typing.typing_env * Ast.ustm)
