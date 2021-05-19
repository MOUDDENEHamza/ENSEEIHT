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

(* Int64.t extended with -oo and +oo *)
type t = Infty_neg | Infty_pos | Fin of Int64.t

let eq = ( = )

let order i1 i2 = match i1, i2 with
  | Infty_neg, _
  | _, Infty_pos -> true
  | Fin i, Fin j -> Int64.compare i j <= 0
  | Infty_pos, _
  | _, Infty_neg -> false

let order_strict a b = order a b && not (eq a b)
      
let min i1 i2 = if order i1 i2 then i1 else i2
let max i1 i2 = if order i1 i2 then i2 else i1

let zero = Fin (Int64.zero)
let one = Fin (Int64.one)

let minfty = Infty_neg
let pinfty = Infty_pos
let fin n = Fin (Int64.of_int n)

let to_int = function
  | Fin x when Int64.compare x (Int64.of_int min_int) >= 0 &&
      Int64.compare x (Int64.of_int max_int) <= 0 -> Some (Int64.to_int x)
  | _ -> None

let to_string = function
  | Infty_neg -> "-oo"
  | Infty_pos -> "+oo"
  | Fin n -> Int64.to_string n

(* return true iff x+y < Int64.min_int *)
let add_lt_min_int x y =
  Int64.compare x Int64.zero < 0 && Int64.compare y Int64.zero < 0 &&
    Int64.compare x (Int64.sub Int64.min_int y) < 0

(* return true iff x+y > Int64.max_int *)
let add_gt_max_int x y =
  Int64.compare x Int64.zero > 0 && Int64.compare y Int64.zero > 0 &&
    Int64.compare x (Int64.sub Int64.max_int y) > 0

let add_lb x y = match x, y with
  | Fin x, Fin y when not (add_lt_min_int x y) -> Fin (Int64.add x y)
  | Fin _, Infty_pos
  | Infty_pos, Fin _
  | Infty_pos, Infty_pos -> Infty_pos
  | _ -> Infty_neg

let add_ub x y = match x, y with
  | Fin x, Fin y when not (add_gt_max_int x y) -> Fin (Int64.add x y)
  | Fin _, Infty_neg
  | Infty_neg, Fin _
  | Infty_neg, Infty_neg -> Infty_neg
  | _ -> Infty_pos

(* return true iff x-y < Int64.min_int *)
let sub_lt_min_int x y =
  Int64.compare x Int64.zero < 0 && Int64.compare y Int64.zero > 0 &&
    Int64.compare x (Int64.add Int64.min_int y) < 0

(* return true iff x-y > Int64.max_int *)
let sub_gt_max_int x y =
  Int64.compare x Int64.zero > 0 && Int64.compare y Int64.zero < 0 &&
    Int64.compare x (Int64.add Int64.max_int y) > 0

let sub_lb x y = match x, y with
  | Fin x, Fin y when not (sub_lt_min_int x y) -> Fin (Int64.sub x y)
  | Fin _, Infty_neg
  | Infty_pos, Fin _
  | Infty_pos, Infty_neg -> Infty_pos
  | _ -> Infty_neg

let sub_ub x y = match x, y with
  | Fin x, Fin y when not (sub_gt_max_int x y) -> Fin (Int64.sub x y)
  | Fin _, Infty_pos
  | Infty_neg, Fin _
  | Infty_neg, Infty_pos -> Infty_neg
  | _ -> Infty_pos

let sqrt_max    = Int64.of_string "46340"
let op_sqrt_max = Int64.of_string "-46340"

(* We could improve the two following functions. *)
(* Returns false only if x*y >= Int64.min_int. *)
let mul_lt_min_int x y =
  Int64.compare x op_sqrt_max < 0 && Int64.compare y sqrt_max > 0 ||
    Int64.compare x sqrt_max > 0 && Int64.compare y op_sqrt_max < 0

(* Returns false only if x*y <= Int64.max_int. *)
let mul_gt_max_int x y =
  Int64.compare x sqrt_max > 0 && Int64.compare y sqrt_max > 0 ||
    Int64.compare x op_sqrt_max < 0 && Int64.compare y op_sqrt_max < 0

let mul_lb x y = match x, y with
  | Fin x, Fin y when not (mul_lt_min_int x y) -> Fin (Int64.mul x y)
  | Fin x, Infty_pos
  | Infty_pos, Fin x when Int64.compare x Int64.zero > 0 -> Infty_pos
  | Fin x, Infty_neg
  | Infty_neg, Fin x when Int64.compare x Int64.zero < 0 -> Infty_pos
  | _ -> Infty_neg

let mul_ub x y = match x, y with
  | Fin x, Fin y when not (mul_gt_max_int x y) -> Fin (Int64.mul x y)
  | Fin x, Infty_neg
  | Infty_neg, Fin x when Int64.compare x Int64.zero > 0 -> Infty_neg
  | Fin x, Infty_pos
  | Infty_pos, Fin x when Int64.compare x Int64.zero < 0 -> Infty_neg
  | _ -> Infty_pos

let div_lb x y = match x, y with
  | Fin x, Fin y ->
      begin try Fin (Int64.div x y)
      with Division_by_zero -> Infty_neg end
  | Fin x, Infty_pos
  | Fin x, Infty_neg -> zero
  | Infty_pos, Fin x when Int64.compare x Int64.zero > 0 -> Infty_pos
  | Infty_neg, Fin x when Int64.compare x Int64.zero < 0 -> Infty_pos
  | _ -> Infty_neg

let div_ub x y = match x, y with
  | Fin x, Fin y ->
      begin try Fin (Int64.div x y)
      with Division_by_zero -> Infty_neg end
  | Fin x, Infty_pos
  | Fin x, Infty_neg -> zero
  | Infty_neg, Fin x when Int64.compare x Int64.zero > 0 -> Infty_neg
  | Infty_pos, Fin x when Int64.compare x Int64.zero < 0 -> Infty_neg
  | _ -> Infty_pos
