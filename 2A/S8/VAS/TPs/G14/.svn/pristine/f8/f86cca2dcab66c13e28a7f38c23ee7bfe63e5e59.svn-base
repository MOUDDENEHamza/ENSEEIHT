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

type bop = Plus | Minus | Times | Div

type expr =
  | Int of Location.t * int
  | Var of Location.t * Name.t
  | Binop of Location.t * bop * expr * expr
  | Rand of Location.t * int * int

type stm = 
  | Asn of Location.t * Name.t * expr
  | Seq of Location.t * stm * stm
  | Ite of Location.t * expr * stm * stm
  | While of Location.t * expr * stm

let loc_of_expr = function
  | Int (l, _) | Var (l, _) | Binop (l, _, _, _) | Rand (l, _, _) -> l

let loc_of_stm = function
  | Asn (l, _, _) | Seq (l, _, _) | Ite (l, _, _, _) | While (l, _, _) -> l

let neg_guard = function
  | Binop (l, Minus, Int (l', n), e2) when n > min_int ->  (* avoid underflows *)
    Binop (l, Minus, e2, Int (l', n - 1))
  | Binop (l, Minus, e1, Int (l', n)) when n < max_int ->  (* avoid overflows *)
    Binop (l, Minus, Int (l', n + 1), e1)
  | Binop (l, Minus, e1, e2) ->
    Binop (l, Minus, Binop (l, Plus, e2, Int (l, 1)), e1)
  | e -> let l = loc_of_expr e in Binop (l, Minus, Int (l, 1), e)

let vars_of_stm stm =
  let rec vars_of_expr s = function
    | Int _ -> s
    | Var (_, n) -> Name.Set.add n s
    | Binop (_, _, e1, e2) -> vars_of_expr (vars_of_expr s e1) e2
    | Rand _ -> s in
  let rec vars_of_stm s = function
    | Asn (_, n, e) -> vars_of_expr (Name.Set.add n s) e
    | Seq (_, s1, s2) -> vars_of_stm (vars_of_stm s s1) s2
    | Ite (_, e, s1, s2) ->
      vars_of_stm (vars_of_stm (vars_of_expr s e) s1) s2
    | While (_, e, st) -> vars_of_stm (vars_of_expr s e) st in
  vars_of_stm Name.Set.empty stm

let char_of_bop = function
  | Plus -> '+'
  | Minus -> '-'
  | Times -> '*'
  | Div -> '/'

let fprint_expr ff e =
  let prior_bop = function
    | Plus | Minus -> 0
    | Times | Div -> 1 in
  let prior_right_bop = function
    | Plus -> 0
    | Minus -> 1
    | Times -> 1
    | Div -> 2 in
  let rec fprint_expr_prior prior ff = function
    | Int (_, n) -> Format.fprintf ff "%d" n
    | Var (_, n) -> Format.fprintf ff "%s" n
    | Binop (_, bop, e1, e2) ->
      if prior_bop bop < prior then
        Format.fprintf ff "(@[%a@ %c %a@])"
          (fprint_expr_prior (prior_bop bop)) e1
          (char_of_bop bop)
          (fprint_expr_prior (prior_right_bop bop)) e2
      else
        Format.fprintf ff "%a@ %c %a"
          (fprint_expr_prior (prior_bop bop)) e1
          (char_of_bop bop)
          (fprint_expr_prior (prior_right_bop bop)) e2
    | Rand (_, n1, n2) -> Format.fprintf ff "rand(@[%d,@ %d@])" n1 n2 in
  fprint_expr_prior 0 ff e

let rec fprint_stm ff = function
  | Asn (_, n, e) -> Format.fprintf ff "%s = @[%a@];" n fprint_expr e
  | Seq (_, s1, s2) ->
    Format.fprintf ff "@[<v>%a@ %a@]" fprint_stm s1 fprint_stm s2
  | Ite (_, e, s1, s2) ->
    Format.fprintf ff "@[<v>@[<v 2>if (@[%a@] > 0) {@ %a@]@ @[<v 2>} else {@ %a@]@ }@]"
      fprint_expr e fprint_stm s1 fprint_stm s2
  | While (_, e, s) ->
    Format.fprintf ff "@[<v>@[<v 2>while (@[%a@] > 0) {@ %a@]@ }@]"
      fprint_expr e fprint_stm s
