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

(** Various utility functions. *)

(** [profile f] executes the function [f] and returns both its result
    and the execution time in second. *)
val profile : (unit -> 'a) -> 'a * float

(** Returns the number of '\n' appearing in a string. *)
val lines_of_string : string -> int

(** Returns string in option or "stdout" if None given. *)
val output_filename_string : string option -> string

(** Open an output channel on given filename, gives it to the given function and
    eventually closes the channel. stdout is used if no filename is given. *)
val with_out_ch : string option -> (out_channel -> 'b) -> 'b

(** Same as [with_out_ch] for input channels (with stdin instead of stdout). *)
val with_in_ch : string option -> (in_channel -> 'b) -> 'b

(** [select_param n p] cuts the string [p] into [n'] and [p'] such
    that [p] = [n':p'] and n' doesn't contain the character ':'. Then,
    if [n] = [n'], [p'] is returned, otherwise the empty string is
    returned. If [p] doesn't contain the character ':', it is returned
    unchanged. *)
val select_param : string -> string -> string

(** [warn_unknown_param n p] does nothin if [p] is the empty string
    and outputs a warning otherwise (using [Report.warning]), saying
    that parameter [p] is unrecognized by domain [n]. *)
val warn_unknown_param : string -> string -> unit


val fprintf_list:  sep:('a, 'b, 'c, 'd, 'd, 'a) format6 ->
           (Format.formatter -> 'e -> unit) ->
           Format.formatter -> 'e list -> unit


val desome: 'a option -> 'a
