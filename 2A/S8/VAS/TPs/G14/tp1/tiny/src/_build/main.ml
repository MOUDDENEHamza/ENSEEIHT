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

let input_file = ref None
let output_file = ref None
let compile_mode = ref false
let descending = ref 0

let quiet () = Report.verbosity := 0

let set_input_file =
  let fst_call = ref true in
    fun filename ->
      if !fst_call then begin
        input_file := Some filename;
	fst_call := false
      end else
	raise (Arg.Bad ("Only accepts one input file: superfluous file \""
                        ^ filename ^ "\""))

let set_output_file s = output_file := Some s

let _ =
  let usage_msg = Printf.sprintf
    "Usage: %s [options] <input_filename>" Sys.argv.(0) in
  let speclist = Arg.align [
    ("--compile", Arg.Set compile_mode," Compilation mode: compile to C");
    ("-c", Arg.Set compile_mode," Compilation mode: compile to C");
    ("--quiet", Arg.Unit quiet," Quiet mode");
    ("-q", Arg.Unit quiet, " Quiet mode");
    ("--verbose", Arg.Set_int Report.verbosity, "<n>  Verbosity level (default is 1)");
    ("-v", Arg.Set_int Report.verbosity, "<n>  Verbosity level (default is 1)");
    ("--output", Arg.String set_output_file,
     "<filename>  Output results to file <filename> (default is standard ouput)");
    ("-o", Arg.String set_output_file,
     "<filename>  Output results to file <filename> (default is standard ouput)");
    ("--descending", Arg.Set_int descending, "<n>  Perform <n> descending iterations after fixpoint of a loop is reached (default is 0)");
    ("-d", Arg.Set_int descending, "<n>  Perform <n> descending iterations after fixpoint of a loop is reached (default is 0)");
  ] in
  try 
    Arg.parse speclist set_input_file usage_msg;
    match !input_file with
    | None ->
      Printf.eprintf "%s: No input file provided.\n" Sys.argv.(0);
      Arg.usage speclist usage_msg
    | Some f ->
      if !compile_mode then
        Compile.compile f !output_file
      else
        Analyze.analyze !descending f !output_file
  with Report.Error -> exit 2
