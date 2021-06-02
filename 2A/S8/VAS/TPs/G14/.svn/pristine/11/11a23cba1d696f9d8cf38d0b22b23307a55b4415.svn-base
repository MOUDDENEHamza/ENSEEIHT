(* Abstract domains which can be used for the analyses. *)
let available_domains : (module Relational.Domain) list =
  [

    (module (Relational.MakeRelational (BE)));

  (* Abstract domain used for the analyses. *)
    (module (Relational.MakeRelational (Dummy)));
    (module (Relational.MakeRelational (Intervals3)));
    (module (Relational.MakeRelational (Intervals_double)));

  (* To be able to use this last two domains, you have to install the Apron
   * library and change the flag "actually_use_apron" in myocamlbuild.ml. *)
  (* ; *)
  (* (module ApronWrapper.Polka); *)
  (* (module ApronWrapper.Oct) *)
  ]


let get_name d = let module D = (val d : Relational.Domain) in D.name


let available_domains_str =
  match List.map get_name available_domains with
  | [] -> "(compiled without any abstract domain)"
  | d :: l -> "(" ^ d ^ " (default), " ^ String.concat ", " l ^ ")"

