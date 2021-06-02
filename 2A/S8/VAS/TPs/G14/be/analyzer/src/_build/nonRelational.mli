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

(** A module type for non relational domains and a functor to build
    relational domains from them (by pointwise extension). *)

(** Module type of non relational domains. *)
module type Domain = sig
  (** Name of the domain. Used to select it via command line
      arguments. Should be of the form \[a-z\]\[a-zA-Z0-9_\]*. *)
  val name : string

  (** [parse_param s] parses parameters in [s]. If [s] is of the form
      "dom:s'" where dom doesn't contain ':' and is not [name], the
      parameter should be ignored. If dom is [name], only s' should be
      considered ([Utils.select_param name] can be used for that). A
      warning should be issued for unrecognised parameters (use
      [Utils.warn_unknown_param]). *)
  val parse_param : string -> unit

  (** Outputs some help about the options recognized by
      [parse_param]. *)
  val fprint_help : Format.formatter -> unit

  (** Type of represented values (ie. int, real, bool). *)
  val base_type : Ast.base_type

  (** Type of abstract values. *)
  type t

  (** Prints an abstract value. *)
  val fprint : Format.formatter -> t -> unit

  (** {2 Lattice Structure} *)

  (** Order on type [t]. [t] with this order must be a lattice. *)
  val order : t -> t -> bool

  val top : t
  val bottom : t
  val is_bottom : t -> bool
  
  (** Infimums of the lattice. *)

  val join : t -> t -> t
  val meet : t -> t -> t
  (** Least upper bound and greatest lower bound of the lattice. *)

  (** Widening to ensure termination of the analyses. *)
  val widening : t -> t -> t

  (** {2 Abstract Operators} *)

  (** [sem_itv n1 n2] returns an abstraction [t] of the interval \[n1, n2\]:
      {[[n1, n2] \subseteq \gamma(t).]} *)
  val sem_itv : float -> float -> t

  (** Semantics of four basic arithmetic operations. *)

  val sem_plus : t -> t -> t
  val sem_minus : t -> t -> t
  val sem_times : t -> t -> t
  val sem_div : t -> t -> t
  (** [sem_plus t1 t2] returns a [t'] such that:
      {[\{ n1 + n2 | n1 \in \gamma(t1), n2 \in \gamma(t2) \} \subseteq \gamma(t').]} *)
		    
  (** Abstract operator for guard ">= 0". *)

  val sem_geq0 : t -> t
  (** [sem_geq0 t] returns a [t'] such that:
      {[\{ n \in \gamma(t) | n >= 0 \} \subseteq \gamma(t').]} *)

  val sem_call: string -> t list -> t
  (** [sem_call f args] returns a [t'] such that:
      {[\{ f(n_1, .., n_k) | n_i \in \gamma(args_i)  \} \subseteq \gamma(t').]} *)
				      

  (** Arithmetic operations, useful only for complicated guards. *)

  val backsem_plus : t -> t -> t -> t * t
  val backsem_minus : t -> t -> t -> t * t
  val backsem_times : t -> t -> t -> t * t
  val backsem_div : t -> t -> t -> t * t
  (** [backsem_plus t1 t2 t] returns a pair [(t1', t2')] such that:
      {[\forall n1 n2 : Z or R,
      (n1 \in \gamma(t1) /\ n2 \in \gamma(t2) /\ n1+n2 \in \gamma(t))
      -> (n1 \in \gamma(t1') /\ n2 \in \gamma(t2')).]} *)
end

