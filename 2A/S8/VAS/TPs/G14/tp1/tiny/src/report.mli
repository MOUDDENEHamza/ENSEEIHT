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

(** Module providing functions to print errors in a way the compilation mode
    of Emacs understands while handling verbosity level and locations. *)

(** Exception raised after printing an error message. *)
exception Error

(** Verbosity level. Defines the amount of logging messages outputed.
    Default is 1. 0 means quiet (only warning and error messages get printed). *)
val verbosity : int ref

(** [nflogf n ff f <args>] prints a log message like [Format.fprintf]
    if [n] is greater or equal to [verbosity].

    Starting from level 4, the message is also indented from 2*(n-3) spaces. *)
val nlogf : int -> ('a, Format.formatter, unit, unit) format4 -> 'a

(** Prints a warning message along with location. *)
val warning_loc : Location.t -> ('a, Format.formatter, unit, unit) format4 -> 'a

(** Prints an error message along with location and raises [Error]. *)
val error_loc : Location.t -> ('a, Format.formatter, unit, 'b) format4 -> 'a

(** [silent f] executes function [f] without printing any log message. *)
val silent : (unit -> 'a) -> 'a
