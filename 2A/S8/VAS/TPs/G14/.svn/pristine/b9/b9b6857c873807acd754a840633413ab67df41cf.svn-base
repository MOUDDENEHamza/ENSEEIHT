(*
 * TINY (Tiny Is Not Yasa (Yet Another Static Analyzer)):
 * a simple abstract interpreter for teaching purpose.
 * Copyright (C) 2012, 2014  P. Roux
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

type bop = Plus | Minus | Times | Div

type cmp = Strict | Loose
		       
type base_type = IntT | RealT | BoolT

let pp_base_type fmt = function
  | IntT -> Format.pp_print_string fmt "int"
  | RealT -> Format.pp_print_string fmt "real"
  | BoolT -> Format.pp_print_string fmt "bool"

type var = Name.t * base_type 
module VarSet = struct
  include Set.Make (struct type t = var let compare = compare end)
  let to_names s = fold (fun (v,_) acc -> Name.Set.add v acc) s Name.Set.empty
end
     
(* Untyped AST *)

type uexpr =
  | UCst of Location.t * (float * string * base_type option) (** n *)
  | UVar of Location.t * Name.t  (** v *)
  | UBinop of Location.t * bop * uexpr * uexpr    (** expr + expr,... *)
  | URand of Location.t * base_type * (float *string) * (float *string)    (** rand(n, n) *)
  | UCall of Location.t * Name.t * uexpr list
  | UCond of Location.t * uexpr * cmp 



type ustm = 
  | UAsn of Location.t * Name.t * uexpr
  | UAsrt of Location.t * uexpr
  | USeq of Location.t * ustm * ustm
  | UIte of Location.t * uexpr * ustm * ustm
  | UWhile of Location.t * uexpr * ustm
  | UNop of Location.t
(* Typed Ast *) 
				
type expr_desc =
  | Cst of float * string (** n *)
  | Var of Name.t  (** v *)
  | Binop of bop * expr * expr    (** expr + expr,... *)
  | Rand of (float * string) * (float *string)    (** rand(n, n) *)
  | Call of Name.t * expr list
  | Cond of expr * cmp


 and expr =
   { expr_desc: expr_desc;
     expr_loc: Location.t;
     expr_type: base_type
   }


type stm = 
  | Asn of Location.t * Name.t * expr
  | Asrt of Location.t * expr
  | Seq of Location.t * stm * stm
  | Ite of Location.t * expr * stm * stm
  | While of Location.t * expr * stm
  | Nop of Location.t

let rec cmp_expr e1 e2 = match e1.expr_desc, e2.expr_desc with
  | Cst (n1,_), Cst (n2,_) -> compare n1 n2
  | Cst _, _ -> -1
  | Var _, Cst _ -> 1
  | Var n1, Var n2 -> compare n1 n2
  | Var _, _ -> -1
  | Binop _, (Cst _ | Var _) -> 1
  | Binop (op1, e11, e12), Binop (op2, e21, e22) ->
     let r = compare op1 op2 in
     if r <> 0 then r
     else
       let r = cmp_expr e11 e21 in
       if r <> 0 then r else cmp_expr e12 e22
  | Binop _, _ -> -1
  | Rand _, (Cst _ | Var _ | Binop _) -> 1
  | Rand ((n11, _), (n12, _)), Rand ((n21, _), (n22, _)) ->
     let r = compare n11 n21 in
     if r <> 0 then r
     else compare n12 n22
  | Rand _, _ -> -1
  | Cond _, (Rand _ | Cst _ | Var _ | Binop _) -> 1
  | Cond (e1, cmp1) , Cond (e2, cmp2) -> cmp_expr e1 e2
  | Cond _, _ -> -1
  | Call _, (Rand _ | Cst _ | Var _ | Binop _ | Cond _) -> 1
  | Call (f1, args1), Call (f2, args2) -> compare args1 args2
  

module OrderedExpr = struct
  type t = expr
  let compare = cmp_expr
end

module ExprMap = Map.Make (OrderedExpr)

let loc_of_expr e = e.expr_loc

(* let loc_of_guard (e, _) = e.expr_loc *)

let loc_of_stm = function
  | Asn (l, _, _) | Asrt (l, _) | Seq (l, _, _)
  | Ite (l, _, _, _) | While (l, _, _)  | Nop l -> l

let rec vars_of_expr s e = match e.expr_desc with
  | Cst _ -> s
  | Var n -> Name.Set.add n s
  | Binop ( _, e1, e2) -> vars_of_expr (vars_of_expr s e1) e2
  | Rand _ -> s
  | Call (_, el) -> List.fold_left vars_of_expr s el
  | Cond (e, _) -> vars_of_expr s e

let mk_expr l t d = { expr_type = t; expr_loc = l; expr_desc = d }
let mk_cond l d sl = { expr_type = BoolT; expr_loc = l; expr_desc = Cond (d, sl) }
let mk_cst_expr l t (v,v_s) = mk_expr l t (Cst (v,v_s))

let neg_guard e = 
  match e.expr_desc with
  | Cond (e, sl) -> 
    let minus_e = 
      mk_expr 
	e.expr_loc
	e.expr_type 
	(Binop (Minus, mk_cst_expr e.expr_loc e.expr_type (0., "0"), e))
    in
    mk_expr e.expr_loc BoolT (Cond (minus_e, (match sl with Loose -> Strict | Strict -> Loose)))
  | _ -> assert false


(*
  else if e.expr_tyfunction
  | Binop (l, Minus, CstInt (l', n), e2) when n > min_int ->  (* avoid underflows *)
    Binop (l, Minus, e2, Int (l', n - 1))
  | Binop (l, Minus, e1, Int (l', n)) when n < max_int ->  (* avoid overflows *)
    Binop (l, Minus, Int (l', n + 1), e1)
  | Binop (l, Minus, e1, e2) ->
    Binop (l, Minus, Binop (l, Plus, e2, Int (l, 1)), e1)
  | e -> let l = loc_of_expr e in Binop (l, Minus, Int (l, 1), e)
*)

let vars_of_stm stm =
  (* let vars_of_guards s (e, _) = vars_of_expr s e in  *)
  let rec vars_of_stm s = function
    | Asn (_, n, e) -> vars_of_expr (Name.Set.add n s) e
    | Asrt (_, g) -> vars_of_expr s g
    | Seq (_, s1, s2) -> vars_of_stm (vars_of_stm s s1) s2
    | Ite (_, g, s1, s2) ->
      vars_of_stm (vars_of_stm (vars_of_expr s g) s1) s2
    | While (_, g, st) ->
       vars_of_stm (vars_of_expr s g) st
    | Nop _ -> Name.Set.empty
  in
  vars_of_stm Name.Set.empty stm

let vars_of_expr = vars_of_expr Name.Set.empty


		    
let char_of_bop = function
  | Plus -> '+'
  | Minus -> '-'
  | Times -> '*'
  | Div -> '/'

let string_of_cmp = function Loose -> ">=" | Strict -> ">"

let fprint_expr ff e =
  let prior_bop = function
    | Plus | Minus -> 0
    | Times | Div -> 1 in
  let rec fprint_expr_prior prior ff e = match e.expr_desc with
    | Cst (c,s) -> Format.fprintf ff "%s" s
    | Var n -> Format.fprintf ff "%s" n
    | Binop (bop, e1, e2) ->
      (if prior_bop bop < prior then
          Format.fprintf ff "(@[%a@ %c %a@])"
       else
          Format.fprintf ff "%a@ %c %a")
        (fprint_expr_prior (prior_bop bop)) e1
        (char_of_bop bop)
        (fprint_expr_prior (prior_bop bop + 1)) e2
    | Rand ((_,c1), (_,c2)) ->
      Format.fprintf ff "rand(@[%s,@ %s@])" c1 c2 
    | Call(n, el) ->
      Format.fprintf ff "@[<h>%s(%a)@]"
	n
	(Utils.fprintf_list ~sep:", " (fprint_expr_prior 0)) el
    | Cond(e, cmp) ->
      Format.fprintf ff "@[%a@ %s 0@]"
	(fprint_expr_prior 0) e (string_of_cmp cmp)
  in
  fprint_expr_prior 0 ff e
  
let rec fprint_stm ff = function
  | Asn (_, n, e) -> Format.fprintf ff "%s = @[%a@];" n fprint_expr e
  | Asrt (_, g) -> Format.fprintf ff "assert(%a);" fprint_expr g
  | Seq (_, s1, s2) ->
     Format.fprintf ff "@[<v>%a@ %a@]" fprint_stm s1 fprint_stm s2
  | Ite (_, g, s1, s2) ->
     Format.fprintf ff "@[<v>@[<v 2>if (%a) {@ %a@]@ @[<v 2>} else {@ %a@]@ }@]"
                    fprint_expr g fprint_stm s1 fprint_stm s2
  | While (_, g, s) ->
     Format.fprintf ff "@[<v>@[<v 2>while (%a) {@ %a@]@ }@]"
                    fprint_expr g fprint_stm s
  | Nop _ -> ()
