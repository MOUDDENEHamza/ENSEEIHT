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

(** Module to soundly manipulate potentially infinite integers. *)

(** Int64.t extended with -oo and +oo *)
type t

(** Equality on type [t]. *)
val eq : t -> t -> bool

(** Order (less or equal) on type [t] (-oo is less than everything,..). *)
val order : t -> t -> bool

val min : t -> t -> t
val max : t -> t -> t

val zero : t
val one : t

(** -oo *)
val minfty : t

(** +oo *)
val pinfty : t

val fin : int -> t
val fin64 : Int64.t -> t

val to_int : t -> int option

val to_string : t -> string

(** [add_lb x y] is a lower bound of [x+y]. *)
val add_lb : t -> t -> t

(** [add_ub x y] is an upper bound of [x+y]. *)
val add_ub : t -> t -> t

(** [sub_lb x y] is a lower bound of [x-y]. *)
val sub_lb : t -> t -> t

(** [sub_ub x y] is an upper bound of [x-y]. *)
val sub_ub : t -> t -> t

(** [mul_lb x y] is a lower bound of [x*y]. *)
val mul_lb : t -> t -> t

(** [mul_ub x y] is an upper bound of [x*y]. *)
val mul_ub : t -> t -> t

(** [div_lb x y] is a lower bound of [x/y] when [y != 0]. *)
val div_lb : t -> t -> t

(** [div_ub x y] is an upper bound of [x/y] when [y != 0]. *)
val div_ub : t -> t -> t
