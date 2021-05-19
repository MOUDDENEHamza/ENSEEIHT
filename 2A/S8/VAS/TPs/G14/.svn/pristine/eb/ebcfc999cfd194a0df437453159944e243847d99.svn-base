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

module Make (Dom : Relational.Domain) = struct
  let alarms m t =
    let top, bottom =
      let vars = Name.Set.add "_" (Ast.vars_of_stm t) in
      Dom.top vars, Dom.bottom vars in
    let find_or_top l = try Location.Map.find l m with Not_found -> top in
    let env_zero = Dom.assignment "_" (Ast.Int (Location.dummy, 0)) top in
    (* Returns true iff a warning was printed. *)
    let rec alarms_expr env = function
      | Ast.Int _ | Ast.Var _ -> false
      | Ast.Binop (l, bop, e1, e2) ->
        let possible_div_by_zero =
          if bop <> Ast.Div then false else
            let env' = Dom.assignment "_" e2 env in
            let env' = Dom.meet env' env_zero in
            if Dom.order env' bottom then false
            else begin
              Report.warning_loc l "Possible division by zero.";
              true
            end in
        let alarms_e1 = alarms_expr env e1 in
        let alarms_e2 = alarms_expr env e2 in
        possible_div_by_zero || alarms_e1 || alarms_e2
      | Ast.Rand (l, n1, n2) ->
        if n1 > n2 then begin
          Report.warning_loc l "Empty random interval.";
          true
        end else false in
    (* Returns a pair (b, env) with b = true iff a warning about a runtime error
     * was printed and env the abstract value contained in m at end of given
     * statement s (or top if none). *)
    let rec alarms_stm env s =
      let alarms_env_beg_stm s =
        fst (alarms_stm (find_or_top (Location.beg_p (Ast.loc_of_stm s))) s) in
      if Dom.order env bottom then begin
        Report.warning_loc (Ast.loc_of_stm s) "This is dead code.";
        false, env
      end else match s with
      | Ast.Asn (l, _, e) -> alarms_expr env e, find_or_top (Location.end_p l)
      | Ast.Seq (_, s1, s2) ->
        let alarms_s1, env = alarms_stm env s1 in
        let alarms_s2, env = alarms_stm env s2 in
        (alarms_s1 || alarms_s2), env
      | Ast.Ite (l, e, s1, s2) ->
        let alarms_e = alarms_expr env e in
        let alarms_s1 = alarms_env_beg_stm s1 in
        let alarms_s2 = alarms_env_beg_stm s2 in
        (alarms_e || alarms_s1 || alarms_s2), find_or_top (Location.end_p l)
      | Ast.While (l, e, s) ->
        let alarms_e =
          let loop_inv = find_or_top (Location.beg_p (Ast.loc_of_expr e)) in
          alarms_expr loop_inv e in
        let alarms_s = alarms_env_beg_stm s in
        (alarms_e || alarms_s), find_or_top (Location.end_p l) in
    fst (alarms_stm top t)

  let print m t output_filename =
    let top = Dom.top (Ast.vars_of_stm t) in
    let rec fprint_stm ff s =
      let fprint_annot f ff l =
        try
          let a = Location.Map.find l m in
          if Report.silent (fun () -> Dom.order top a) then ()
          else Format.fprintf ff f Dom.fprint a
        with Not_found -> () in
      let fprint_invariant = fprint_annot "/* loop invariant: %a */@ " in
      let fprint_annot = fprint_annot "@ /* %a */" in
      match s with
      | Ast.Asn (l, n, e) -> Format.fprintf ff "%s = @[%a@];%a"
        n Ast.fprint_expr e fprint_annot (Location.end_p l)
      | Ast.Seq (_, s1, s2) ->
        Format.fprintf ff "@[<v>%a@ %a@]" fprint_stm s1 fprint_stm s2
      | Ast.Ite (l, e, s1, s2) ->
        Format.fprintf ff "@[<v>@[<v 2>if (@[%a@] > 0) {%a@ %a@]@ @[<v 2>} else {%a@ %a@]@ }%a@]"
          Ast.fprint_expr e
          fprint_annot (Location.beg_p (Ast.loc_of_stm s1)) fprint_stm s1
          fprint_annot (Location.beg_p (Ast.loc_of_stm s2)) fprint_stm s2
          fprint_annot (Location.end_p l)
      | Ast.While (l, e, s) ->
        Format.fprintf ff "@[<v>%a@[<v 2>while (@[%a@] > 0) {%a@ %a@]@ }%a@]"
          fprint_invariant (Location.beg_p (Ast.loc_of_expr e))
          Ast.fprint_expr e
          fprint_annot (Location.beg_p (Ast.loc_of_stm s)) fprint_stm s
          fprint_annot (Location.end_p l) in
    Utils.with_out_ch output_filename (fun out_ch ->
      let ff = Format.formatter_of_out_channel out_ch in
      fprint_stm ff t;
      Format.fprintf ff "\n%!");
    Report.nlogf 1 "Results written to %s."
      (Utils.output_filename_string output_filename)
end
