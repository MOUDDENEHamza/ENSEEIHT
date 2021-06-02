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

(** Type of abstract syntax trees, printing and various functions on them. *)

(** {2 Type of Abstract Syntax Trees} *)

type bop = Plus | Minus | Times | Div

(* type cmp = Le | Lt *)

type cmp = Strict | Loose
		       
type base_type = IntT | RealT | BoolT

val pp_base_type: Format.formatter -> base_type -> unit				


module VarSet : sig
  include Set.S
  val to_names: t -> Name.Set.t

end with type elt = Name.t * base_type
  
(* Untyped AST *)

type uexpr =
  | UCst of Location.t * (float * string * base_type option) (** n *)
  | UVar of Location.t  * Name.t  (** v *)
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

(*type guard = expr * cmp  (** expr >= 0 (or >) *)*)

type stm = 
  | Asn of Location.t * Name.t * expr  (** v = expr; *)
  | Asrt of Location.t * expr (* guard *)  (** assert(guard); *)
  | Seq of Location.t * stm * stm  (** stm stm *)
  | Ite of Location.t * expr(* guard *) * stm * stm   (** if (guard) \{ stm \} else \{ stm \} *)
  | While of Location.t * expr (* guard *) * stm  (** while (guard) \{ stm \} *)
  | Nop of Location.t
(** {3 Maps of expressions} *)

(** Total ordering function over expressions (ignoring locations). *)
val cmp_expr : expr -> expr -> int

module ExprMap : Map.S with type key = expr  (** Maps from exprs. *)

(** {2 Various Utility Functions} *)

(** [loc_of_expr e] returns location contained in expression [e]. *)
val loc_of_expr : expr -> Location.t

(* (\** [loc_of_guard g] returns location contained in guard [g]. *\) *)
(* val loc_of_guard : guard -> Location.t *)

(** [loc_of_stm s] returns location contained in statement [s]. *)
val loc_of_stm : stm -> Location.t

(** [vars_of_expr e] returns the set of variables appearing
    in expression [e]. *)
val vars_of_expr : expr -> Name.Set.t


(** [neg_guard e sl] returns an expression [e'] such that guard e' >= 0 is
    equivalent to e > 0 is sl = Strict (resp >= if Loose). It depends on e
    type. *)
val neg_guard : expr -> expr

(** [vars_of_stm s] returns the set of variables appearing
    in statement [s]. *)
val vars_of_stm : stm -> Name.Set.t

val mk_expr : Location.t -> base_type -> expr_desc -> expr
val mk_cond : Location.t -> expr -> cmp  -> expr
val mk_cst_expr : Location.t -> base_type -> float * string -> expr
(** {2 Printing Functions} *)

val char_of_bop : bop -> char

val string_of_cmp : cmp -> string

val fprint_expr : Format.formatter -> expr -> unit

(* val fprint_guard : Format.formatter -> guard -> unit *)

val fprint_stm : Format.formatter -> stm -> unit

