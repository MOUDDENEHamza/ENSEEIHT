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

module type TypeAndManager = sig
  type domain_type
  val manager : domain_type Apron.Manager.t
end

module Wrapper (T : TypeAndManager) : Relational.Domain = struct
  include T

  type t = domain_type Apron.Abstract1.t

  let fprint = Apron.Abstract1.print

  let order = Apron.Abstract1.is_leq manager

  let env_of_name_set s =
    let a = Array.of_list (Name.Set.elements s) in
    let a = Array.map (fun v -> Apron.Var.of_string v) a in
    Apron.Environment.make a [||]

  let top s = Apron.Abstract1.top manager (env_of_name_set s)
  let bottom s = Apron.Abstract1.bottom manager (env_of_name_set s)

  let join = Apron.Abstract1.join manager
  let meet = Apron.Abstract1.meet manager

  let widening x y =
    let y = join x y in  (* Apron's widening requires that its first argument
                          * is included in the second one. *)
    Apron.Abstract1.widening manager x y

  let rec apron_texpr_of_expr env e =
    let rec apron_expr_of_expr = function
      | Ast.Int (_, n) -> Apron.Texpr1.Cst (Apron.Coeff.s_of_int n)
      | Ast.Var (_, n) -> Apron.Texpr1.Var (Apron.Var.of_string n)
      | Ast.Binop (_, bop, e1, e2) ->
        let e1 = apron_expr_of_expr e1 in
        let e2 = apron_expr_of_expr e2 in
        let bop = match bop with
          | Ast.Plus -> Apron.Texpr1.Add
          | Ast.Minus -> Apron.Texpr1.Sub
          | Ast.Times -> Apron.Texpr1.Mul
          | Ast.Div -> Apron.Texpr1.Div in
        Apron.Texpr1.Binop (bop, e1, e2, Apron.Texpr1.Int, Apron.Texpr1.Near)
      | Ast.Rand (_, n1, n2) -> Apron.Texpr1.Cst (Apron.Coeff.i_of_int n1 n2) in
    Apron.Texpr1.of_expr env (apron_expr_of_expr e)
      
  let assignment n e t =
    let e = apron_texpr_of_expr (Apron.Abstract1.env t) e in
    Apron.Abstract1.assign_texpr_array manager
      t [|Apron.Var.of_string n|] [|e|] None
      
  let guard e t =
    let e = apron_texpr_of_expr (Apron.Abstract1.env t) e in
    let cons = Apron.Tcons1.make e Apron.Tcons1.SUP in
    let earray =
      let a = Apron.Tcons1.array_make (Apron.Abstract1.env t) 1 in
      Apron.Tcons1.array_set a 0 cons;
      a in
    Apron.Abstract1.meet_tcons_array manager t earray
end

module Polka = Wrapper (struct
  type domain_type = Polka.loose Polka.t 
  let manager = Polka.manager_alloc_loose ()
end)

module Oct = Wrapper (struct
  type domain_type = Oct.t 
  let manager = Oct.manager_alloc ()
end)
