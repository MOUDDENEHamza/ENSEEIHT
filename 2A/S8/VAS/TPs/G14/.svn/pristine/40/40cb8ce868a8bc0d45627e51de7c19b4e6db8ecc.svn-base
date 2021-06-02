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
let descending = ref 1
let unrolling = ref 0

open Load_domains
  

let quiet () = Report.verbosity := 0

let set_input_file filename =
  match !input_file with
  | None -> input_file := Some filename
  | Some _ ->
     raise (Arg.Bad ("Only accepts one input file: superfluous file \""
                     ^ filename ^ "\""))

let set_output_file s = output_file := Some s

let _ =
  let usage_msg = Printf.sprintf
    "Usage: %s [options] <input_filename>" Sys.argv.(0) in
  let speclist = Arg.align [
    ("--abstract-domain", Arg.String decl_domain,
     "<domain>  Use abstract domain <domain> " ^ Domains.available_domains_str);
    ("-a", Arg.String decl_domain,
     "<domain>  Use abstract domain <domain> " ^ Domains.available_domains_str);
    ("--param", Arg.String set_param,
     "<p>  Send <p> to the abstract domain, syntax <dom>:<p> can be used \
      to target the (sub)domain <dom>");
    ("-p", Arg.String set_param,
     "<p>  Send <p> to the abstract domain, syntax <dom>:<p> can be used \
      to target the (sub)domain <dom>");
    ("--help-domain", Arg.String help_domain,
     "<domain>  Print params of <domain>");
    ("-h", Arg.String help_domain, "<domain>  Print params of <domain>");
    ("--compile", Arg.Set compile_mode, " Compilation mode: compile to C");
    ("-c", Arg.Set compile_mode, " Compilation mode: compile to C");
    ("--quiet", Arg.Unit quiet, " Quiet mode");
    ("-q", Arg.Unit quiet, " Quiet mode");
    ("--verbose", Arg.Set_int Report.verbosity,
     "<n>  Verbosity level (default is 1)");
    ("-v", Arg.Set_int Report.verbosity, "<n>  Verbosity level (default is 1)");
    ("--output", Arg.String set_output_file,
     "<filename>  Output results to file <filename> (default is standard ouput)");
    ("-o", Arg.String set_output_file,
     "<filename>  Output results to file <filename> (default is standard ouput)");
    ("--descending", Arg.Set_int descending,
     "<n>  Perform <n> descending iterations after fixpoint of a loop \
      is reached (default is 1)");
    ("-d", Arg.Set_int descending,
     "<n>  Perform <n> descending iterations after fixpoint of a loop \
      is reached (default is 1)");
    ("--unrolling", Arg.Set_int unrolling,
     "<n>  Unroll loops <n> times before computing fixpoint (default is 0)");
    ("-u", Arg.Set_int unrolling,
     "<n>  Unroll loops <n> times before computing fixpoint (default is 0)");
  ] in
  try 
    Arg.parse speclist set_input_file usage_msg;
    (* try to set terminal width for format *)
    let cols = Sys.command "exit `stty size | cut -d\" \" -f2`" in
    if cols >= 32 then Format.set_margin cols;
    match !input_file with
    | None ->
      Printf.eprintf "%s: No input file provided.\n" Sys.argv.(0);
      Arg.usage speclist usage_msg
    | Some f ->
      if !compile_mode then
        Compile.compile f !output_file
      else
	let dom =
	  match !domains with 
	  | [] -> (
	    match Domains.available_domains with
	    | [] -> Report.error "compiled without any abstract domain!"
	    | d :: _ -> prepare_domain d
	  )
	  | [s] -> prepare_domain (get_domain s)
	  | hd::tl -> (
 	    List.fold_left (
 	      fun accu domain ->
		let dom = prepare_domain (get_domain domain) in
		let module Dom = (val dom: Relational.Domain) in
		let module Accu = (val accu: Relational.Domain) in
		let module D = Relational.Prod (Accu) (Dom) in
		(module D)
 	    ) (prepare_domain (get_domain hd)) tl

	  )		
	in
        Analyze.analyze dom !descending !unrolling f !output_file
  with Report.Error -> exit 2
