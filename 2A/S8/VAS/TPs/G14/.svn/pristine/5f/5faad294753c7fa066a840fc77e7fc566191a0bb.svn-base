%{
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
%}

%token <int> INT
%token <string> VAR
%token LPAR RPAR SEMICOL COMA RAND_ITV EQUAL IF ELSE WHILE LBRA RBRA
%token PLUS2 MINUS2
%token GT LT GE LE
%token PLUS MINUS TIMES DIV UMINUS
%token SEQ
%token EOF

%nonassoc VAR IF WHILE PLUS2 MINUS2
%nonassoc SEQ
%left PLUS MINUS
%left TIMES DIV
%nonassoc UMINUS

%type <Ast.stm> file
%start file

%%

file:
| stm EOF { $1 }

stm:
| VAR EQUAL expr SEMICOL { Ast.Asn (loc (), $1, $3) }
| stm stm %prec SEQ { Ast.Seq (loc (), $1, $2) }
| IF LPAR comp RPAR LBRA stm RBRA ELSE LBRA stm RBRA
    { Ast.Ite (loc (), $3, $6, $10) }
| WHILE LPAR comp RPAR LBRA stm RBRA
    { Ast.While (loc (), $3, $6) }
/* syntactic sugar : v *= e ~~> v = v * e */
| VAR PLUS EQUAL expr SEMICOL { build_op_eq (loc ()) $1 Ast.Plus $4 }
| VAR MINUS EQUAL expr SEMICOL { build_op_eq (loc ()) $1 Ast.Minus $4 }
| VAR TIMES EQUAL expr SEMICOL { build_op_eq (loc ()) $1 Ast.Times $4 }
| VAR DIV EQUAL expr SEMICOL { build_op_eq (loc ()) $1 Ast.Div $4 }
/* syntactic sugar : ++x ~~> x = x + 1 */
| PLUS2 VAR SEMICOL { build_op_eq (loc ()) $2 Ast.Plus (Ast.Int (loc (), 1)) }
| VAR PLUS2 SEMICOL { build_op_eq (loc ()) $1 Ast.Plus (Ast.Int (loc (), 1)) }
| MINUS2 VAR SEMICOL { build_op_eq (loc ()) $2 Ast.Minus (Ast.Int (loc (), 1)) }
| VAR MINUS2 SEMICOL { build_op_eq (loc ()) $1 Ast.Minus (Ast.Int (loc (), 1)) }

expr:
| INT { Ast.Int (loc (), $1) }
| VAR { Ast.Var (loc (), $1) }
| RAND_ITV LPAR signed_int COMA signed_int RPAR { Ast.Rand (loc (), $3, $5) }
| LPAR expr RPAR { $2 }
| expr PLUS expr { build (loc ()) Ast.Plus $1 $3 }
| expr MINUS expr { build (loc ()) Ast.Minus $1 $3 }
| expr TIMES expr { build (loc ()) Ast.Times $1 $3 }
| expr DIV expr { build (loc ()) Ast.Div $1 $3 }
/* syntactic sugar : -e ~~> 0 - e */
| MINUS expr %prec UMINUS { build (loc ()) Ast.Minus (Ast.Int (loc (), 0)) $2 }

comp:
| expr GT expr { build (loc ()) Ast.Minus $1 $3 }
| expr LT expr { build (loc ()) Ast.Minus $3 $1 }
| expr GE expr { Ast.neg_guard (build (loc ()) Ast.Minus $3 $1) }
| expr LE expr { Ast.neg_guard (build (loc ()) Ast.Minus $1 $3) }

signed_int:
| INT { $1 }
| MINUS INT { - $2 }
