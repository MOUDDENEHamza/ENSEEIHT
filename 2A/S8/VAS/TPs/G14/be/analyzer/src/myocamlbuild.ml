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

(* Configuration section *)

(* Turn this to true if you want to use Apron relational
 * abstract domains. *)
let actually_use_apron = false;;

(* Then set the path for Apron (this is the default
 * for the debian package). *)
let apron_include = "/usr/lib/ocaml/apron";;

(* End of configuration section *)
 
let apron_lib = "-lboxMPQ_caml -lboxMPQ \
-loctMPQ_caml -loctMPQ  \
-lpolkaMPQ_caml -lpolkaMPQ_debug \
-lapron_caml -lapron \
-lgmp_caml -lmpfr -lgmp -lbigarray -lcamlidl"

open Ocamlbuild_plugin;;
open Command;;

dispatch begin function
| After_rules ->
  if actually_use_apron then begin
    (* We declare external libraries *)
    ocaml_lib ~extern:true "gmp";
    ocaml_lib ~extern:true ~dir:apron_include "apron";
    ocaml_lib ~extern:true "polka";
    ocaml_lib ~extern:true "oct";
    ocaml_lib ~extern:true "box";
    (* Link flag for APRON *)
    flag ["link"; "ocaml"; "use_apron"] (S[A"-cclib"; A apron_lib]);
    (* Link flag for APRON *)
    flag ["doc"; "use_apron"] (S[A"-I"; A apron_include])
  end else ()
| _ -> ()
end;;
