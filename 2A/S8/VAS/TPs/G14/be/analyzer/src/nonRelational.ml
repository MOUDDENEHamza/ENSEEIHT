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

module type Domain = sig
  val name : string
  val parse_param : string -> unit
  val fprint_help : Format.formatter -> unit
  val base_type: Ast.base_type
  type t
  val fprint : Format.formatter -> t -> unit
  val order : t -> t -> bool
  val top : t
  val bottom : t
  val is_bottom : t -> bool
  val join : t -> t -> t
  val meet : t -> t -> t
  val widening : t -> t -> t
  val sem_itv : float -> float -> t
  val sem_plus : t -> t -> t
  val sem_minus : t -> t -> t
  val sem_times : t -> t -> t
  val sem_div : t -> t -> t
  val sem_geq0 : t -> t
  val sem_call: string -> t list -> t

  (* val backsem_le : t -> t -> t * t *)
  val backsem_plus : t -> t -> t -> t * t
  val backsem_minus : t -> t -> t -> t * t
  val backsem_times : t -> t -> t -> t * t
  val backsem_div : t -> t -> t -> t * t
end

