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
