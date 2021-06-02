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

let pp_base_type fmt t =
  match t with
  | Ast.IntT | BoolT -> Printf.fprintf fmt "int"
  | RealT -> Printf.fprintf fmt "double"
     
let pp_var_decl fmt (v,t) =
  Printf.fprintf fmt "%a %s" pp_base_type t v
    
(* Print preamble to [out_ch] plus declaration of variables [vars],
   returns number of lines outputed.*)
let print_preamble out_ch vars =
  let ln = ref 0 in
  let preamble1 =
    "#include <stdlib.h>\n\
     #include <stdio.h>\n\
     #include <time.h>\n\
     #include <math.h>\n\
     \n\
     typedef double real;\n\ 
     int rand_int(int n1, int n2)\n\
     {\n  \
       int res;\n\
     \n  \
       if (n2 < n1) exit(2);\n\
     \n  \
       res = n1 + rand() % (n2 - n1 + 1);\n  \
       printf(\"rand: %d\\n\", res);\n\
     \n  \
       return res;\n\
     }\n\
     \n\
     int rand_real(double n1, double n2)\n\
     {\n  \
       double res;\n\
     \n  \
       if (n2 < n1) exit(2);\n\
     \n  \
       res = (double)rand()/RAND_MAX * (n2 - n1) + n1;\n  \
       printf(\"rand: %f\\n\", res);\n\
     \n  \
       return res;\n\
     }\n\
     \n\
     int main(int argc, char *argv[])\n\
     {\n" in
  Printf.fprintf out_ch "%s" preamble1;
  ln := !ln + Utils.lines_of_string preamble1;
  let preamble2 =
    "\n  \
       srand(time(NULL));\n\
     \n" in
  Printf.fprintf out_ch "%s" preamble2;
  ln := !ln + Utils.lines_of_string preamble2;
  Printf.fprintf out_ch "#define rand(x, y) rand_itv(x, y)\n";
  incr ln;
  !ln

(* Print end to [out_ch] with C code to print final values of [var]. *)
let print_end out_ch vars =
  Printf.fprintf out_ch "  printf(\"At end of execution:\\n\");\n";
  Ast.VarSet.iter
    (fun (n,t) -> Printf.fprintf out_ch
                    "  printf(\"%s = %%%s\\n\", %s);\n"
                    n
                    (match t with Ast.IntT -> "d" | Ast.RealT -> "f" | Ast.BoolT -> "b")
                    n
    )
    vars;
  Printf.fprintf out_ch "%s%!"
    "\n  \
       return 0;\n\
     }\n"

let compile input_filename output_filename =
  let output_filename_string =
    match output_filename with None -> "stdout" | Some f -> f in
  Report.nlogf 1 "Compile file %s to %s." input_filename output_filename_string;
  let vars, _ = Parse.file input_filename in
  Utils.with_out_ch output_filename (fun out_ch ->
    let ln = ref (print_preamble out_ch vars) in
    Printf.fprintf out_ch "#line 1 \"%s\"\n" input_filename;
    Utils.with_in_ch (Some input_filename) (fun in_ch ->
      try
        while true do
          let l = input_line in_ch in
          Printf.fprintf out_ch "%s\n" l;
          incr ln
        done
      with End_of_file -> ());
    Printf.fprintf out_ch "\n#line %d \"%s\"\n" (!ln + 4)
      output_filename_string;
    print_end out_ch vars);
  Report.nlogf 1 "Compiled to %s." output_filename_string
