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

let profile f =
  let be = Unix.gettimeofday () in
  let r = f () in
  let en = Unix.gettimeofday () in
  r, en -. be

let lines_of_string s =
  let ln = ref 0 in
  String.iter (fun c -> if c = '\n' then incr ln) s;
  !ln

let output_filename_string = function Some s -> s | None -> "stdout"

let with_out_ch output_filename f =
  let out_ch =
    match output_filename with
    | None -> stdout
    | Some filename ->
      try open_out filename
      with Sys_error s ->
        Report.error_loc Location.dummy "%s." s in
  let res = f out_ch in
  begin
    match output_filename with
    | None -> ()
    | Some _ ->
      try close_out out_ch
      with Sys_error s ->
        Report.error_loc Location.dummy "%s." s
  end;
  res

let with_in_ch input_filename f =
  let in_ch =
    match input_filename with
    | None -> stdin
    | Some filename ->
      try open_in filename
      with Sys_error s ->
        Report.error_loc Location.dummy "%s." s in
  let res = f in_ch in
  begin
    match input_filename with
    | None -> ()
    | Some _ ->
      try close_in in_ch
      with Sys_error s ->
        Report.error_loc Location.dummy "%s." s
  end;
  res

let select_param name param =
  try
    let i = String.index param ':' in
    if String.sub param 0 i <> name then ""
    else String.sub param (i + 1) (String.length param - i - 1)
  with Not_found -> param

let warn_unknown_param name p =
  if p <> "" then
    Report.warning "domain '%s': unrecognized parameter '%s' ignored." name p

let rec fprintf_list ~sep:sep f fmt = function
  | []   -> ()
  | [e]  -> f fmt e
  | x::r -> Format.fprintf fmt "%a%(%)%a" f x sep (fprintf_list ~sep f) r

let desome x = match x with Some x -> x | None -> assert false
