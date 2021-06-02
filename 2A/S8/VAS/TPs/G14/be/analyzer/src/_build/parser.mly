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

%}

%token <float * string * Ast.base_type> NUM
%token <string> VAR
%token LPAR RPAR SEMICOL LOWER_SEMICOL COMMA RAND_ITV_REAL RAND_ITV_INT EQUAL IF ELSE WHILE LBRA RBRA DBLPOINT
%token PLUS2 MINUS2
%token GT LT GE LE
%token PLUS MINUS TIMES DIV UMINUS
%token INTTYPE REALTYPE BOOLTYPE
%token SEQ
%token EOF

%nonassoc SEMICOL
%nonassoc LOWER_SEMICOL
%nonassoc VAR IF WHILE PLUS2 MINUS2
%nonassoc IFX
%nonassoc ELSE
%nonassoc SEQ
%left GT LT GE LE
%left PLUS MINUS
%left TIMES DIV
%nonassoc UMINUS

%type < Typing.typing_env * Ast.ustm> file
%start file

%%

file:
| decls stmts EOF { $1 Typing.empty_env, $2 }

decls:
| vtype varlist SEMICOL decls {  
  fun env -> 
    let env = List.fold_left (Typing.decl_var_type $1) env $2 in
    $4 env
}

| vtype varlist SEMICOL { fun env -> List.fold_left (Typing.decl_var_type $1) env $2 }



vtype:
| INTTYPE { Ast.IntT }
| REALTYPE { Ast.RealT }
| BOOLTYPE { Ast.BoolT }
	   
varlist:
| VAR COMMA varlist { ($1,loc())::$3 }
| VAR { [$1, loc()] }
    

bloc:
| LBRA stmts RBRA { $2 }
| stm { $1 }

stmts:
| stm { $1 }
| stm stmts { Ast.USeq (loc (), $1, $2) }


stm:
| VAR EQUAL expr SEMICOL { Ast.UAsn (loc (), $1, $3) }
| IF LPAR expr RPAR bloc ELSE bloc
        { Ast.UIte (loc (), $3, $5, $7) }
| IF LPAR expr RPAR bloc %prec IFX
        { Ast.UIte (loc (), $3, $5, Ast.UNop(loc ())) }
| WHILE LPAR expr RPAR bloc
    { Ast.UWhile (loc (), $3, $5) }
/* syntactic sugar : v *= e ~~> v = v * e */
| VAR PLUS EQUAL expr SEMICOL { build_op_eq (loc ()) $1 Ast.Plus $4 }
| VAR MINUS EQUAL expr SEMICOL { build_op_eq (loc ()) $1 Ast.Minus $4 }
| VAR TIMES EQUAL expr SEMICOL { build_op_eq (loc ()) $1 Ast.Times $4 }
| VAR DIV EQUAL expr SEMICOL { build_op_eq (loc ()) $1 Ast.Div $4 }
/* syntactic sugar : ++x ~~> x = x + 1 */
| PLUS2 VAR SEMICOL { build_op_eq (loc ()) $2 Ast.Plus (Ast.UCst (loc (), (1., "1", None))) }
| VAR PLUS2 SEMICOL { build_op_eq (loc ()) $1 Ast.Plus (Ast.UCst (loc (), (1., "1", None))) }
| MINUS2 VAR SEMICOL { build_op_eq (loc ()) $2 Ast.Minus (Ast.UCst (loc (), (1., "1", None))) }
| VAR MINUS2 SEMICOL { build_op_eq (loc ()) $1 Ast.Minus (Ast.UCst (loc (), (1., "1", None))) }


expr:
| NUM { let x, xs, t = $1 in Ast.UCst (loc (), (x, xs, Some t)) }
| VAR { Ast.UVar (loc (), $1) }
| RAND_ITV_INT LPAR signed_num COMMA signed_num RPAR {
		 build_itv $3 $5 (loc ()) Ast.IntT
}
| RAND_ITV_REAL LPAR signed_num COMMA signed_num RPAR {
		 build_itv $3 $5 (loc ()) Ast.RealT
}
| LPAR expr RPAR { $2 }
| expr PLUS expr { build (loc ()) Ast.Plus $1 $3 }
| expr MINUS expr { build (loc ()) Ast.Minus $1 $3 }
| expr TIMES expr { build (loc ()) Ast.Times $1 $3 }
| expr DIV expr { build (loc ()) Ast.Div $1 $3 }
/* syntactic sugar : -e ~~> 0 - e */
| MINUS expr %prec UMINUS { build (loc ()) Ast.Minus (Ast.UCst (loc (), (0., "0", None))) $2 }
| VAR LPAR exprlist RPAR { build_call (loc ()) $1 $3 }
/* everything rephrased as expr >= 0 or expr > 0 */
| expr GT expr { build_comp (loc ()) Ast.Minus $1 $3 Ast.Strict }
| expr LT expr { build_comp (loc ()) Ast.Minus $3 $1 Ast.Strict }
| expr GE expr { build_comp (loc ()) Ast.Minus $1 $3 Ast.Loose }
| expr LE expr { build_comp (loc ()) Ast.Minus $3 $1 Ast.Loose }

exprlist:
| expr COMMA exprlist {$1 :: $3}
| expr                 {[$1]}
 

signed_num:
| NUM { $1 }
| MINUS NUM  { let x, xs, t = $2 in -. x, "-" ^ xs, t }
