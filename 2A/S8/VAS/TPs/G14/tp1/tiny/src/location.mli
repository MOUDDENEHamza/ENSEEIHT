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

(** Locations to keep track of position of code in original source file. *)

type t  (** Type of locations. *)

module Map : Map.S with type key = t  (** Maps from locations. *)

(** Dummy location. *)
val dummy : t

(** [beg_p l] returns a location representing the point at beginning of [l]. *)
val beg_p : t -> t

(** [end_p l] returns a location representing the point at the end of [l]. *)
val end_p : t -> t

(** The filename which will be registered in all subsequent calls to
    [get_current*]. *)
val filename : string ref

(** [get_current ()] returns current location in file [filename] during parsing.
    To be called in a parser rule. *)
val get_current : unit -> t

(** [get_current_from_lexbuf lexbuf] returns current location
    of lexer in file [filename]. Useful for lexing errors. *)
val get_current_from_lexbuf : Lexing.lexbuf -> t

(** Outputs a location. *)
val fprint : Format.formatter -> t -> unit
