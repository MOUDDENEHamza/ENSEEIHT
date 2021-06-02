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

(* Abstract domain used for the analyses. *)
module DomDummy : Relational.Domain = NonRelational.MakeRelational (Dummy) 
module DomParity : Relational.Domain = NonRelational.MakeRelational (Parity) 
module DomKildall : Relational.Domain = NonRelational.MakeRelational (Kildall) 
(* To be able to use this last two domains, you have to install the Apron
 * library and change the flag "actually_use_apron" in myocamlbuild.ml. *)
(* module Dom : Relational.Domain = ApronWrapper.Polka *)
(* module Dom : Relational.Domain = ApronWrapper.Oct *)

module Dom = DomKildall

(* Analyze statement stm from abstract value t. Returns both the resulting
 * abstract value and an updated (m : Dom.t Location.map.t) registering all
 * the intermediate results. Performs [descending] descending iterations
 * after fixpoint of loops are reached.
 * m registers results as described in PrintResults.mli. *)
let rec post_stm descending (m, t) s =

  (* Just a shortcut. *)
  let post_stm = post_stm descending in

  (* Some functions in Dom with printing added. *)
  let assignment l n e t =
    let t' = Dom.assignment n e t in
    Report.nlogf 4 "%a⟦%s = %a⟧@,(%a)@ = %a." Location.fprint l
      n Ast.fprint_expr e Dom.fprint t Dom.fprint t';
    t' in
  let guard l e t =
    let t' = Dom.guard e t in
    Report.nlogf 4 "%a⟦%a > 0⟧@,(%a)@ = %a." Location.fprint l
      Ast.fprint_expr e Dom.fprint t Dom.fprint t';
    t' in
  let join l x y =
    let t = Dom.join x y in
    Report.nlogf 4 "%a%a@ ⊔ %a@ = %a." Location.fprint l
      Dom.fprint x Dom.fprint y Dom.fprint t;
    t in
  let order x y =
    let b = Dom.order x y in
    Report.nlogf 4 "%a@ ⊑ %a@ = %b."
      Dom.fprint x Dom.fprint y b;
    b in

  match s with

    | Ast.Asn (l, n, e) ->
      let t = assignment l n e t in
      Location.Map.add (Location.end_p l) t m, t

    | Ast.Seq (_, s1, s2) -> post_stm (post_stm (m, t) s1) s2

    | Ast.Ite (l, e, s1, s2) ->
      let t1 = guard (Ast.loc_of_expr e) e t in
      let m = Location.Map.add (Location.beg_p (Ast.loc_of_stm s1)) t1 m in
      let m, t1 = post_stm (m, t1) s1 in
      let t2 = guard (Location.beg_p (Ast.loc_of_stm s2)) (Ast.neg_guard e) t in
      let m = Location.Map.add (Location.beg_p (Ast.loc_of_stm s2)) t2 m in
      let m, t2 = post_stm (m, t2) s2 in
      let t = join (Location.end_p l) t1 t2 in
      Location.Map.add (Location.end_p l) t m, t

    | Ast.While (l, e, s) ->

      let rec lfp n m t =
        let m = Location.Map.add (Location.beg_p (Ast.loc_of_expr e)) t m in
        let t' = guard (Ast.loc_of_expr e) e t in
        let m = Location.Map.add (Location.beg_p (Ast.loc_of_stm s)) t' m in
        let m, t' = post_stm (m, t') s in
        if order t' t then begin
          Report.nlogf 3 "%aIteration %d: @[%a@ ⊑ %a,@ fixpoint reached.@]"
            Location.fprint l n Dom.fprint t' Dom.fprint t;
          m, t, t'
        end else begin
          let t'' = Dom.widening t t' in
          Report.nlogf 3 "%aIteration %d: @[%a@ ∇ %a@ = %a.@]"
            Location.fprint l n Dom.fprint t Dom.fprint t' Dom.fprint t'';
          lfp (n + 1) m t''
        end in

      let rec desc_iter n m t' =
        let t'' = Dom.join t t' in
        let m = Location.Map.add (Location.beg_p (Ast.loc_of_expr e)) t'' m in
        Report.nlogf 3 "%aDescending iteration %d of %d: @[%a@ ⊔ %a@ = %a.@]"
          Location.fprint l n descending Dom.fprint t Dom.fprint t' Dom.fprint t'';
        if n >= descending then
          m, t''
        else begin
          let t' = guard (Ast.loc_of_expr e) e t'' in
          let m = Location.Map.add (Location.beg_p (Ast.loc_of_stm s)) t' m in
          let m, t' = post_stm (m, t') s in
          desc_iter (n + 1) m t'
        end in

      (* Compute loop invariant. *)
      let m, t =
        (* First compute fixpoint. *)
        let m, t, t' = lfp 1 m t in
        (* Then perform potential descending iterations. *)
        if descending <= 0 then m, t
        else desc_iter 1 m t' in
      (* Compute reachable states after the loop. *)
      let t = guard (Location.end_p l) (Ast.neg_guard e) t in
      Location.Map.add (Location.end_p l) t m, t

module PrintResults = PrintResults.Make (Dom)

let analyze descending input_filename output_filename =
  Report.nlogf 1 "Analyze file %s, writing results to %s."
    input_filename (Utils.output_filename_string output_filename);
  let vars, ast = Parse.file input_filename in
  let m, _ =
    let top = Dom.top vars in
    post_stm descending (Location.Map.empty, top) ast in
  Report.nlogf 1 "Analysis done.";
  if not (PrintResults.alarms m ast) then
    Report.nlogf 1 "The program is proven free of runtime errors.";
  PrintResults.print m ast output_filename
