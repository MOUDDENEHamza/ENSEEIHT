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

(** Module to print results of analysis and warning about possible
    runtime errors and dead code. *)

module Make (Dom : Relational.Domain) : sig
  (** The functions of this module take an abstract syntax tree [t : Ast.stm]
      and a map [m : Dom.t Location.Map.t] mapping locations in the AST to
      abstract values in the abstract domain [Dom]. Those values are assumed
      to be sound overapproximations of the collecting semantics of
      the program [t].
      
      Locations that will be considered are the followings (all are points as
      returned by [Location.beg_p] or [Location.end_p]) :
      - end of each statement;
      - beginning of the then and else branches of each if-then-else statement;
      - beginning of the body of each while loop statement;
      - and finally beginning of expressions used as guards in while loop
        statements, this last case being the loop invariant.

      In each case, an absence of value is soundly interpreted as [Dom.top]. *)

  (** [alarms m t] uses informations contained in [m] (as described above)
      to print warnings (using [Report.warning_loc]) about possible
      empty rand intervals, divisions by zero and code proven to be dead.

      Returns [true] if possible runtime errors (empty rand intervals or
      division by zero) are found, [false] if the program is proven without
      runtime errors. *)
  val alarms : Dom.t Location.Map.t -> Ast.stm -> bool

  (** [print m t output_filename] prints the statement [t], with results
      contained in [m] (as described above) interleaved in comments in file
      [output_filename] (or stdout if [output_filename] is [None]). *)
  val print : Dom.t Location.Map.t -> Ast.stm -> string option -> unit
end
