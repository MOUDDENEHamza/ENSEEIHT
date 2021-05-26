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

type loc = { loc_file: string; loc_line : int; loc_start : int ; loc_end : int;
             loc_line_end : int; loc_line_end_c : int }
type t = loc

module Map = Map.Make (struct type t = loc let compare = compare end)

let dummy = { loc_file = "none"; loc_line = 1; loc_start = 0; loc_end = 0;
              loc_line_end = 1; loc_line_end_c = 0 }

let filename = ref "none"

let beg_p loc =
  let l, c = loc.loc_line, loc.loc_start in
  { loc with loc_end = c; loc_line_end = l; loc_line_end_c = c }

let end_p loc =
  let l, c = loc.loc_line_end, loc.loc_line_end_c in
  { loc with loc_line = l; loc_start = c; loc_end = c }

let location_of_positions start_p end_p =
  { loc_file = !filename;
    loc_line = start_p.Lexing.pos_lnum;
    loc_start = start_p.Lexing.pos_cnum - start_p.Lexing.pos_bol;
    loc_end = end_p.Lexing.pos_cnum - start_p.Lexing.pos_bol;  (* start_p for bol *)
    loc_line_end = end_p.Lexing.pos_lnum;
    loc_line_end_c = end_p.Lexing.pos_cnum - end_p.Lexing.pos_bol }

let get_current () =
  let start_p = Parsing.symbol_start_pos () in
  let end_p = Parsing.symbol_end_pos () in
  location_of_positions start_p end_p

let get_current_from_lexbuf lexbuf =
  let start_p = Lexing.lexeme_start_p lexbuf in
  let end_p = Lexing.lexeme_end_p lexbuf in
  location_of_positions start_p end_p

let fprint ff loc =
  if loc.loc_line = loc.loc_line_end then
    Format.fprintf ff "File \"%s\", line %d, characters %d-%d:@ "
      loc.loc_file loc.loc_line (loc.loc_start + 1) loc.loc_end
  else
    Format.fprintf ff "File \"%s\", lines %d-%d, characters %d-%d:@ "
      loc.loc_file loc.loc_line loc.loc_line_end (loc.loc_start + 1) loc.loc_line_end_c
