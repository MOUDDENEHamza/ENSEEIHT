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

module type Domain = sig
  type t
  val fprint : Format.formatter -> t -> unit
  val order : t -> t -> bool
  val top : t
  val bottom : t
  val join : t -> t -> t
  val meet : t -> t -> t
  val widening : t -> t -> t
  val sem_itv : int -> int -> t
  val sem_plus : t -> t -> t
  val sem_minus : t -> t -> t
  val sem_times : t -> t -> t
  val sem_div : t -> t -> t
  val sem_guard : t -> t
  val backsem_plus : t -> t -> t -> t * t
  val backsem_minus : t -> t -> t -> t * t
  val backsem_times : t -> t -> t -> t * t
  val backsem_div : t -> t -> t -> t * t
end

module MakeRelational (D : Domain) : Relational.Domain = struct
  type t = EnvBot | Env of D.t Name.Map.t

  let fprint ff t = match t with
    | EnvBot -> Format.fprintf ff "⊥"
    | Env m ->
      if Name.Map.is_empty m then
        Format.fprintf ff "⊤"
      else
        let first = ref true in
        Name.Map.iter
          (fun n v ->
            if !first then begin
              Format.fprintf ff "@[<2>{ %s : %a" n D.fprint v;
              first := false
            end else
              Format.fprintf ff ",@ %s : %a" n D.fprint v)
          m;
        Format.fprintf ff " }@]"

  let find_or_top n m = try Name.Map.find n m with Not_found -> D.top

  let order_print n x y =
    let b = D.order x y in
    Report.nlogf n "%a@ ⊑ %a@ = %b."
      D.fprint x D.fprint y b;
    b

  let order t1 t2 = match t1, t2 with
    | EnvBot, _ -> true
    | _, EnvBot -> false
    | Env m1, Env m2 -> Name.Map.fold
      (fun n v2 b -> b && order_print 5 (find_or_top n m1) v2)
      m2
      true

  let top _ = Env Name.Map.empty
  let bottom _ = EnvBot

  let join_f s f t1 t2 = match t1, t2 with
    | EnvBot, _ -> t2
    | _, EnvBot -> t1
    | Env m1, Env m2 ->
      let m = Name.Map.fold
        (fun n v1 m ->
          let v2 = find_or_top n m2 in
          let v = f v1 v2 in
          Report.nlogf 5 "%a@ %s %a@ = %a."
            D.fprint v1 s D.fprint v2 D.fprint v;
          if order_print 6 D.top v then m
          else Name.Map.add n v m)
        m1
        Name.Map.empty in
      Env m

  let join = join_f "⊔" D.join

  let meet_print x y =
    let r = D.meet x y in
    Report.nlogf 5 "%a@ ⊓ %a@ = %a."
      D.fprint x D.fprint y D.fprint r;
    r

  let meet t1 t2 = match t1, t2 with
    | EnvBot, _ | _, EnvBot -> EnvBot
    | Env m1, Env m2 ->
      try
        let m = Name.Map.fold
          (fun n v1 m ->
            let v2 = find_or_top n m2 in
            let v = meet_print v1 v2 in
            if order_print 6 v D.bottom then raise Exit
            else Name.Map.add n v m)
          m1
          m2 in
        Env m
      with Exit -> EnvBot

  (* We assume that the analyzed program has a finite number of variables.
   * Then, widening of environments is just a pointwise application of
   * D.widening.*)
  let widening = join_f "∇" D.widening

  let rec eval_expr env = function
    | Ast.Int (l, n) -> eval_expr env (Ast.Rand (l, n, n))
    | Ast.Var (_, n) -> find_or_top n env
    | Ast.Binop (_, bop, e1, e2) ->
      let v1 = eval_expr env e1 in
      let v2 = eval_expr env e2 in
      let s, sem = match bop with
        | Ast.Plus -> "sem_plus", D.sem_plus
        | Ast.Minus -> "sem_minus", D.sem_minus
        | Ast.Times -> "sem_times", D.sem_times
        | Ast.Div -> "sem_div", D.sem_div in
      let v = sem v1 v2 in
      Report.nlogf 5 "%s@ %a@ %a@ = %a."
        s D.fprint v1 D.fprint v2 D.fprint v;
      v
    | Ast.Rand (_, n1, n2) ->
      let v = D.sem_itv n1 n2 in
      Report.nlogf 5 "sem_itv@ %d@ %d@ = %a." n1 n2 D.fprint v;
      v

  let assignment n e t = match t with
    | EnvBot -> EnvBot
    | Env m ->
      let t = eval_expr m e in
      if order_print 6 t D.bottom then EnvBot
      else if order_print 6 D.top t then Env (Name.Map.remove n m)
      else Env (Name.Map.add n t m)

  let rec backeval_expr env e t = match e with
    | Ast.Int (l, n) -> backeval_expr env (Ast.Rand (l, n, n)) t
    | Ast.Var (_, n) ->
      let t' = find_or_top n env in
      let t = meet_print t t' in
      if order_print 6 t D.bottom then raise Exit
      else if order_print 6 D.top t then env
      else Name.Map.add n t env
    | Ast.Binop (_, bop, e1, e2) ->
      (* not very efficient,
       * but guards should not be very large anyway *)
      let t1 = eval_expr env e1 in
      let t2 = eval_expr env e2 in
      let s, backsem = match bop with
        | Ast.Plus -> "backsem_plus", D.backsem_plus
        | Ast.Minus -> "backsem_minus", D.backsem_minus
        | Ast.Times -> "backsem_times", D.backsem_times
        | Ast.Div -> "backsem_div", D.backsem_div in
      let t1', t2' = backsem t1 t2 t in
      Report.nlogf 5 "%s@ %a@ %a@ %a@ = @[%a,@ %a@]."
        s D.fprint t1 D.fprint t2 D.fprint t D.fprint t1' D.fprint t2';
      backeval_expr (backeval_expr env e1 t1') e2 t2'
    | Ast.Rand _ ->
      let t' = eval_expr env e in
      let t = meet_print t t' in
      if order_print 6 t D.bottom then raise Exit
      else env

  let guard e t = match t with
    | EnvBot -> EnvBot
    | Env m ->
      let t = eval_expr m e in
      let t' = D.sem_guard t in
      Report.nlogf 5 "sem_guard@ %a@ = %a." D.fprint t D.fprint t';
      try Env (backeval_expr m e t')
      with Exit -> EnvBot
end
