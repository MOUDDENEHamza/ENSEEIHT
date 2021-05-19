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

type expr =
  | Int of Location.t * int  (** n *)
  | Var of Location.t * Name.t  (** v *)
  | Binop of Location.t * bop * expr * expr  (** expr + expr,... *)
  | Rand of Location.t * int * int  (** rand(n, n) *)

type stm = 
  | Asn of Location.t * Name.t * expr  (** v = expr; *)
  | Seq of Location.t * stm * stm  (** stm stm *)
  | Ite of Location.t * expr * stm * stm  (** if (expr > 0) \{ stm \} else \{ stm \} *)
  | While of Location.t * expr * stm  (** while (expr > 0) \{ stm \} *)

(** {2 Various Utility Functions} *)

(** [loc_of_expr e] returns location contained in expression [e]. *)
val loc_of_expr : expr -> Location.t

(** [loc_of_stm s] returns location contained in statement [s]. *)
val loc_of_stm : stm -> Location.t

(** [neg_guard e] returns an expression [e'] such that guard e' > 0
    is equivalent to e <= 0. *)
val neg_guard : expr -> expr

(** [vars_of_stm stm] returns the set of variables appearing
    in statement [stm]. *)
val vars_of_stm : stm -> Name.Set.t

(** {2 Printing Functions} *)

val char_of_bop : bop -> char

val fprint_expr : Format.formatter -> expr -> unit

val fprint_stm : Format.formatter -> stm -> unit
