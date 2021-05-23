type token =
  | INT of (int)
  | VAR of (string)
  | LPAR
  | RPAR
  | SEMICOL
  | COMA
  | RAND_ITV
  | EQUAL
  | IF
  | ELSE
  | WHILE
  | LBRA
  | RBRA
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

let build l bop e1 e2 = match bop, e2 with
  | Ast.Minus, Ast.Int (_, 0) -> e1
  | _ -> Ast.Binop (l, bop, e1, e2)
let build_op_eq l v bop e = Ast.Asn (l, v, build l bop (Ast.Var (l, v)) e)
# 59 "parser.ml"
let yytransl_const = [|
  259 (* LPAR *);
  260 (* RPAR *);
  261 (* SEMICOL *);
  262 (* COMA *);
  263 (* RAND_ITV *);
  264 (* EQUAL *);
  265 (* IF *);
  266 (* ELSE *);
  267 (* WHILE *);
  268 (* LBRA *);
  269 (* RBRA *);
  270 (* PLUS2 *);
  271 (* MINUS2 *);
  272 (* GT *);
  273 (* LT *);
  274 (* GE *);
  275 (* LE *);
  276 (* PLUS *);
  277 (* MINUS *);
  278 (* TIMES *);
  279 (* DIV *);
  280 (* UMINUS *);
  281 (* SEQ *);
    0 (* EOF *);
    0|]

let yytransl_block = [|
  257 (* INT *);
  258 (* VAR *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\002\000\002\000\002\000\002\000\002\000\002\000\
\002\000\002\000\002\000\002\000\002\000\003\000\003\000\003\000\
\003\000\003\000\003\000\003\000\003\000\003\000\004\000\004\000\
\004\000\004\000\005\000\005\000\000\000"

let yylen = "\002\000\
\002\000\004\000\002\000\011\000\007\000\005\000\005\000\005\000\
\005\000\003\000\003\000\003\000\003\000\001\000\001\000\006\000\
\003\000\003\000\003\000\003\000\003\000\002\000\003\000\003\000\
\003\000\003\000\001\000\002\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\029\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\001\000\003\000\014\000\015\000\
\000\000\000\000\000\000\000\000\011\000\013\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\010\000\012\000\000\000\
\000\000\022\000\002\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\017\000\027\000\000\000\000\000\000\000\000\000\020\000\
\021\000\006\000\007\000\008\000\009\000\000\000\000\000\000\000\
\000\000\000\000\000\000\028\000\000\000\000\000\000\000\000\000\
\000\000\005\000\016\000\000\000\000\000\000\000\004\000"

let yydgoto = "\002\000\
\008\000\022\000\035\000\036\000\061\000"

let yysindex = "\013\000\
\134\255\000\000\095\255\013\255\015\255\018\255\019\255\000\000\
\001\000\006\255\017\255\023\255\021\255\033\255\034\255\041\255\
\006\255\006\255\038\255\054\255\000\000\000\000\000\000\000\000\
\006\255\058\255\006\255\030\255\000\000\000\000\006\255\006\255\
\006\255\006\255\135\255\063\255\064\255\000\000\000\000\011\255\
\009\255\000\000\000\000\006\255\006\255\006\255\006\255\035\255\
\043\255\049\255\055\255\006\255\006\255\006\255\006\255\050\255\
\069\255\000\000\000\000\082\255\076\255\245\254\245\254\000\000\
\000\000\000\000\000\000\000\000\000\000\239\254\239\254\239\254\
\239\254\134\255\134\255\000\000\009\255\110\255\118\255\083\255\
\078\255\000\000\000\000\077\255\134\255\126\255\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\075\255\081\255\000\000\
\000\000\000\000\000\000\000\000\000\000\086\255\100\255\101\255\
\102\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\255\255\248\255\089\000\031\000"

let yytablesize = 272
let yytable = "\009\000\
\021\000\028\000\044\000\045\000\046\000\047\000\023\000\024\000\
\025\000\059\000\046\000\047\000\026\000\001\000\058\000\017\000\
\040\000\018\000\042\000\019\000\020\000\029\000\048\000\049\000\
\050\000\051\000\027\000\030\000\031\000\060\000\044\000\045\000\
\046\000\047\000\043\000\062\000\063\000\064\000\065\000\066\000\
\032\000\033\000\038\000\070\000\071\000\072\000\073\000\067\000\
\034\000\044\000\045\000\046\000\047\000\068\000\044\000\045\000\
\046\000\047\000\039\000\069\000\041\000\074\000\044\000\045\000\
\046\000\047\000\056\000\057\000\044\000\045\000\046\000\047\000\
\078\000\079\000\044\000\045\000\046\000\047\000\018\000\018\000\
\075\000\077\000\076\000\086\000\019\000\019\000\083\000\084\000\
\085\000\023\000\018\000\018\000\018\000\018\000\018\000\018\000\
\019\000\019\000\019\000\019\000\019\000\019\000\010\000\024\000\
\025\000\026\000\037\000\080\000\011\000\012\000\000\000\003\000\
\000\000\000\000\013\000\014\000\015\000\016\000\004\000\003\000\
\005\000\000\000\081\000\006\000\007\000\000\000\004\000\003\000\
\005\000\000\000\082\000\006\000\007\000\000\000\004\000\003\000\
\005\000\000\000\087\000\006\000\007\000\000\000\004\000\000\000\
\005\000\000\000\000\000\006\000\007\000\000\000\052\000\053\000\
\054\000\055\000\044\000\045\000\046\000\047\000\000\000\000\000\
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
\000\000\000\000\003\000\000\000\000\000\000\000\000\000\000\000\
\000\000\004\000\000\000\005\000\000\000\000\000\006\000\007\000"

let yycheck = "\001\000\
\000\000\010\000\020\001\021\001\022\001\023\001\001\001\002\001\
\003\001\001\001\022\001\023\001\007\001\001\000\004\001\003\001\
\025\000\003\001\027\000\002\001\002\001\005\001\031\000\032\000\
\033\000\034\000\021\001\005\001\008\001\021\001\020\001\021\001\
\022\001\023\001\005\001\044\000\045\000\046\000\047\000\005\001\
\008\001\008\001\005\001\052\000\053\000\054\000\055\000\005\001\
\008\001\020\001\021\001\022\001\023\001\005\001\020\001\021\001\
\022\001\023\001\005\001\005\001\003\001\012\001\020\001\021\001\
\022\001\023\001\004\001\004\001\020\001\021\001\022\001\023\001\
\074\000\075\000\020\001\021\001\022\001\023\001\004\001\005\001\
\012\001\006\001\001\001\085\000\004\001\005\001\004\001\010\001\
\012\001\004\001\016\001\017\001\018\001\019\001\020\001\021\001\
\016\001\017\001\018\001\019\001\020\001\021\001\008\001\004\001\
\004\001\004\001\018\000\077\000\014\001\015\001\255\255\002\001\
\255\255\255\255\020\001\021\001\022\001\023\001\009\001\002\001\
\011\001\255\255\013\001\014\001\015\001\255\255\009\001\002\001\
\011\001\255\255\013\001\014\001\015\001\255\255\009\001\002\001\
\011\001\255\255\013\001\014\001\015\001\255\255\009\001\255\255\
\011\001\255\255\255\255\014\001\015\001\255\255\016\001\017\001\
\018\001\019\001\020\001\021\001\022\001\023\001\255\255\255\255\
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
\255\255\255\255\002\001\255\255\255\255\255\255\255\255\255\255\
\255\255\009\001\255\255\011\001\255\255\255\255\014\001\015\001"

let yynames_const = "\
  LPAR\000\
  RPAR\000\
  SEMICOL\000\
  COMA\000\
  RAND_ITV\000\
  EQUAL\000\
  IF\000\
  ELSE\000\
  WHILE\000\
  LBRA\000\
  RBRA\000\
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
  SEQ\000\
  EOF\000\
  "

let yynames_block = "\
  INT\000\
  VAR\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'stm) in
    Obj.repr(
# 51 "parser.mly"
          ( _1 )
# 261 "parser.ml"
               : Ast.stm))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 54 "parser.mly"
                         ( Ast.Asn (loc (), _1, _3) )
# 269 "parser.ml"
               : 'stm))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'stm) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'stm) in
    Obj.repr(
# 55 "parser.mly"
                    ( Ast.Seq (loc (), _1, _2) )
# 277 "parser.ml"
               : 'stm))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 8 : 'comp) in
    let _6 = (Parsing.peek_val __caml_parser_env 5 : 'stm) in
    let _10 = (Parsing.peek_val __caml_parser_env 1 : 'stm) in
    Obj.repr(
# 57 "parser.mly"
    ( Ast.Ite (loc (), _3, _6, _10) )
# 286 "parser.ml"
               : 'stm))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 4 : 'comp) in
    let _6 = (Parsing.peek_val __caml_parser_env 1 : 'stm) in
    Obj.repr(
# 59 "parser.mly"
    ( Ast.While (loc (), _3, _6) )
# 294 "parser.ml"
               : 'stm))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 61 "parser.mly"
                              ( build_op_eq (loc ()) _1 Ast.Plus _4 )
# 302 "parser.ml"
               : 'stm))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 62 "parser.mly"
                               ( build_op_eq (loc ()) _1 Ast.Minus _4 )
# 310 "parser.ml"
               : 'stm))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 63 "parser.mly"
                               ( build_op_eq (loc ()) _1 Ast.Times _4 )
# 318 "parser.ml"
               : 'stm))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 64 "parser.mly"
                             ( build_op_eq (loc ()) _1 Ast.Div _4 )
# 326 "parser.ml"
               : 'stm))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 66 "parser.mly"
                    ( build_op_eq (loc ()) _2 Ast.Plus (Ast.Int (loc (), 1)) )
# 333 "parser.ml"
               : 'stm))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    Obj.repr(
# 67 "parser.mly"
                    ( build_op_eq (loc ()) _1 Ast.Plus (Ast.Int (loc (), 1)) )
# 340 "parser.ml"
               : 'stm))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 68 "parser.mly"
                     ( build_op_eq (loc ()) _2 Ast.Minus (Ast.Int (loc (), 1)) )
# 347 "parser.ml"
               : 'stm))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    Obj.repr(
# 69 "parser.mly"
                     ( build_op_eq (loc ()) _1 Ast.Minus (Ast.Int (loc (), 1)) )
# 354 "parser.ml"
               : 'stm))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 72 "parser.mly"
      ( Ast.Int (loc (), _1) )
# 361 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 73 "parser.mly"
      ( Ast.Var (loc (), _1) )
# 368 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 3 : 'signed_int) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : 'signed_int) in
    Obj.repr(
# 74 "parser.mly"
                                                ( Ast.Rand (loc (), _3, _5) )
# 376 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 75 "parser.mly"
                 ( _2 )
# 383 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 76 "parser.mly"
                 ( build (loc ()) Ast.Plus _1 _3 )
# 391 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 77 "parser.mly"
                  ( build (loc ()) Ast.Minus _1 _3 )
# 399 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 78 "parser.mly"
                  ( build (loc ()) Ast.Times _1 _3 )
# 407 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 79 "parser.mly"
                ( build (loc ()) Ast.Div _1 _3 )
# 415 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 81 "parser.mly"
                          ( build (loc ()) Ast.Minus (Ast.Int (loc (), 0)) _2 )
# 422 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 84 "parser.mly"
               ( build (loc ()) Ast.Minus _1 _3 )
# 430 "parser.ml"
               : 'comp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 85 "parser.mly"
               ( build (loc ()) Ast.Minus _3 _1 )
# 438 "parser.ml"
               : 'comp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 86 "parser.mly"
               ( Ast.neg_guard (build (loc ()) Ast.Minus _3 _1) )
# 446 "parser.ml"
               : 'comp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 87 "parser.mly"
               ( Ast.neg_guard (build (loc ()) Ast.Minus _1 _3) )
# 454 "parser.ml"
               : 'comp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 90 "parser.mly"
      ( _1 )
# 461 "parser.ml"
               : 'signed_int))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 91 "parser.mly"
            ( - _2 )
# 468 "parser.ml"
               : 'signed_int))
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
   (Parsing.yyparse yytables 1 lexfun lexbuf : Ast.stm)
