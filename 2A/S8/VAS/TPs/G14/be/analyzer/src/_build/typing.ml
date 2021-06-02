
type typing_env = (Name.t * (Location.t * Ast.base_type)) list
let empty_env = []
  
let decl_var_type t env (v, l) =
  if not (List.mem_assoc v env) then
    (v, (l, t))::env
  else
    (failwith ("Variable " ^ v ^ " already declared"))
      
let get_env_type loc env n = 
  try
    List.assoc n env
  with Not_found -> 
    (Format.eprintf "Typing error. Could not find declaration for variable %s at location %a:@.@?"
       n Location.fprint loc;
     exit 1)

let vars_of_env env =
  List.fold_left (fun accu (v, (_,t)) -> Ast.VarSet.add (v, t) accu) Ast.VarSet.empty env
    
let type_error msg loc_error expected_t found_t = 
Format.eprintf "Typing error at loc %a: Found type %a, expecting type %a (%s)@.@?"
  Location.fprint loc_error
  Ast.pp_base_type found_t
  Ast.pp_base_type expected_t
  msg;
  exit 1

(* let type_cst l typ c = *)
(*   if not (typ = Ast.IntT) || (Z.equal (Q.den c) Z.one) then *)
(*     c *)
(*   else *)
(*     type_error l typ Ast.RealT *)
let rec get_used_type env ue =
  match ue with
  | Ast.UCst (_, (_, _, t)) -> t
  | Ast.URand (_, t, _, _) -> Some t
  | Ast.UCall (_,f,_) -> let t, _ = List.assoc f Basic_library.functions in Some t
  | Ast.UVar (l, n) -> let _, n_t = get_env_type l env n in Some n_t
  | Ast.UBinop (_, _, e1, e2) -> (  
    match get_used_type env e1, get_used_type env e2 with
    | Some t, None 
    | None, Some t -> Some t
    | None, None -> None
    | Some t1, Some t2 -> if t1 = t2 then Some t1 else assert false
  )
  | Ast.UCond _ -> Some Ast.BoolT
    
let rec type_expr (env:typing_env) typ (ue: Ast.uexpr) =
  let te = type_expr env typ in
  match ue with
  | Ast.UCst (l, (c, cs, t)) -> (
    match t with
      None -> if typ = Ast.IntT && (float_of_int (int_of_float c) = c) then
	  Ast.mk_expr l Ast.IntT (Ast.Cst (c, cs))
	else if typ = Ast.RealT then
	  Ast.mk_expr l Ast.RealT (Ast.Cst (c, cs))
	else
	  failwith "Unable to compute type"
    | Some t -> 
      if typ = t then
	Ast.mk_expr l typ (Ast.Cst (c, cs))
      else 
	type_error ("cst("^cs^")") l typ t
  )
  | Ast.UVar (l, n) -> 
    let n_loc, n_t = get_env_type l env n in
    if n_t = typ then
      Ast.mk_expr l typ (Ast.Var n)
    else
      type_error "var"  l typ n_t	

  | Ast.UBinop (l, op, e1, e2) -> 
    Ast.mk_expr l typ (Ast.Binop (op, te e1, te e2))
  | Ast.URand (l, t, c1, c2) -> 
    if typ = t then
      Ast.mk_expr l typ (Ast.Rand (c1, c2))
    else
      type_error "rand" l typ t	
  | Ast.UCall (l, f, args) -> (* we check the type in the library *)
    if List.mem_assoc f Basic_library.functions then
      let t, args_t = List.assoc f Basic_library.functions in
      if typ = t then
	let args' = try List.map2 (type_expr env) args_t args with Invalid_argument _ -> failwith ("Mistyped function call " ^ f) in
	Ast.mk_expr l t (Ast.Call(f, args'))
      else 
	type_error ("call("^ f ^")") l typ t	
    else (
      Format.eprintf "Unable to find function %s in defined fcns@." f;
      assert false
    )
  | Ast.UCond (l, e, sl) -> if typ = Ast.BoolT then
      let typ_e = 
	match get_used_type env e with 
	| Some t -> t 
	| None -> Format.eprintf "Unable to type expression@.@?"; assert false

      in
      Ast.mk_cond l (type_expr env typ_e e) sl
    else 
      type_error "cond" l typ Ast.BoolT
    
let type_guard env e = 
  type_expr env Ast.BoolT e

let rec type_stm env s = 

  let te loc n = type_expr env (snd (get_env_type loc env n)) in
  let tg = type_guard env in
  let ts = type_stm env in

  match s with
  | Ast.UAsn (loc, n, e) -> Ast.Asn (loc, n, te loc n e)
  | Ast.UAsrt (l, g) -> Ast.Asrt (l, tg g)
  | Ast.USeq (l, s1, s2) -> Ast.Seq (l, ts s1, ts s2) 
  | Ast.UIte (l, g, s1, s2) -> Ast.Ite (l, tg g, ts s1, ts s2) 
  | Ast.UWhile (l, g, s) -> Ast.While (l, tg g, ts s) 
  | Ast.UNop l -> Ast.Nop l
