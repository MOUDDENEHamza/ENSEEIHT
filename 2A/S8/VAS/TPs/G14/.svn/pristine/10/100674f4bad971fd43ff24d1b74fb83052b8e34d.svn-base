
(* Take as an argument the domain to be tested 

   Enumerate random and selected cases and evaluate the soundness of each
   operator
 *)
open Load_domains

(* Basic log is conditional *)
let log f = if !Report.verbosity >= 2 then Format.eprintf "%t@ " f

(* Potential error reporting shall be always printed *)
let msg b f = if not b then Format.eprintf "issue: %t@ " f
			      
module Set =
  struct
    include Set.Make (struct type t = Q.t let compare = compare end)
    let pp fmt set = 
      (Utils.fprintf_list ~sep:", " (fun fmt q -> Format.pp_print_string fmt (Q.to_string q))) fmt (elements set)
  end
    
module CheckNonRel (D: NonRelational.Domain) =
  struct

    let values :  (Set.t * D.t) list ref = ref []

    (* Protecting calls to deal with failures *)
    let _D_fprint fmt x = try D.fprint fmt x with _ -> msg false (fun fmt -> Format.fprintf fmt "printf failure"); exit 1
    let _D_is_bottom x = try D.is_bottom x with _ -> msg false (fun fmt -> Format.fprintf fmt "is_bottom: failure for value %a" _D_fprint x); exit 1
    let _D_sem_itv (a,sa) (b,sb) = try D.sem_itv (a,sa) (b,sb)
				   with _ -> msg false (fun fmt -> Format.fprintf fmt "sem_itv: failure for values [%s.%s]" sa sb); exit 1
    let _D_sem_geq0 x =  try D.sem_geq0 x with _ -> msg false (fun fmt -> Format.fprintf fmt "sem_geq0: failure for value %a" _D_fprint x); exit 1
    let protect_bin op f x y = try f x y
			       with _ -> msg false (fun fmt -> Format.fprintf fmt "%s: failure for values %a %a" op _D_fprint x _D_fprint y);
					 exit 1
    let _D_order = protect_bin "order" D.order
    let _D_join = protect_bin "join" D.join
    let _D_meet = protect_bin "meet" D.meet
    let _D_sem_plus = protect_bin "sem_plus" D.sem_plus
    let _D_sem_minus = protect_bin "sem_minus" D.sem_minus
    let _D_sem_times = protect_bin "sem_times" D.sem_times
    let _D_sem_div = protect_bin "sem_div" D.sem_div
	  
               
    let check_bottom () =
      let ok = _D_is_bottom D.bottom in
      msg ok (fun fmt -> Format.fprintf fmt "bottom: value shall be detected as bottom");
      if ok then log (fun fmt -> Format.fprintf fmt  "bottom well defined");
      ok

    let check_elem =
      (* Recording already checked elements *)
      let seen = ref [] in
      fun e ->
      if List.mem e !seen then true else (
        log (fun fmt -> Format.fprintf fmt "checking element %a" _D_fprint e);
	seen := e :: !seen;
	(* bot, top , reflexivity *)
	let ok_bot = _D_order D.bottom e in
	msg ok_bot (fun fmt -> Format.fprintf fmt "%a: is not smaller then top" _D_fprint e);
	let ok_top = _D_order e D.top in
        msg ok_top (fun fmt -> Format.fprintf fmt "%a: is not bigger then top" _D_fprint e);
        let ok_refl = _D_order e e in
        msg ok_refl (fun fmt -> Format.fprintf fmt "%a: non reflexive order" _D_fprint e);
        ok_bot && ok_top && ok_refl
      )
      
    let single_vals () = (* TODO : add a few more random values *)
      [0; 1; -1; 42; -42; 126456465; 3121321; -53; -331131; min_int; max_int]

    (* building all sets of single_vals elements with a cardinal up to i *)
    let build_vals size =
      let ok_single, single = 
        List.fold_left (
            fun (ok, accu) i ->
            let q = Q.of_int i in
            let s = string_of_int i in
            let set = Set.singleton q in 
            if not (List.mem_assoc set accu) then
              let e = _D_sem_itv (q,s) (q,s) in
              let ok_e = check_elem e in
              ok && ok_e, ((set, e)::accu)
            else
              ok, accu
          ) (true,[]) (single_vals ())
      in
      let rec aux i (ok, list) =
        if i = size then ok, list
        else
          let ok, new_list =
	    List.fold_left (
		fun (ok, accu) (set, abs) ->
		(* We add all elements of single to (set, abs) then merge with
             accu *)  
		List.fold_left (
		    fun (ok, accu) (e,e_abs) -> (* we add e to (set,abs) *)
		    if not (Set.is_empty (Set.inter e set)) then
		      (* do not add it, it is already here *)
		      ok, accu
		    else
		      let new_set = Set.union e set in
		      if List.mem_assoc new_set accu then
			ok, accu (* the new_set is already computed *)
		      else
			let new_elem = _D_join e_abs abs in
			(* Is new_elem bigger than both abs and e_abs ? *)
			let ok_join = _D_order abs new_elem && _D_order e_abs new_elem in
			msg ok_join (fun fmt -> Format.fprintf fmt "leq or join: %a cup %a = %a"
							       _D_fprint abs
							       _D_fprint e_abs
							       _D_fprint new_elem);
			(* Checking that abs leq (new_elem cap e_abs) and 
                         e_abs leq (new_ele    m cap abs) *)
			let ok_meet  = _D_order (_D_meet abs e_abs) (_D_meet new_elem e_abs)
				       && _D_order (_D_meet e_abs abs) (_D_meet new_elem abs)
			in
			msg ok_meet
			    (fun fmt ->
			     Format.fprintf
			       fmt
			       "meet: (%a cup %a = %a) but (%a meet %a) leq (%a meet %a) and (%a meet %a) leq (%a meet %a)"
			       _D_fprint abs
			       _D_fprint e_abs
			       _D_fprint new_elem
			       
			       _D_fprint abs
			       _D_fprint e_abs
			       _D_fprint new_elem
			       _D_fprint e_abs
			       
			       _D_fprint abs
			       _D_fprint e_abs
			       _D_fprint new_elem
			       _D_fprint abs)
			;
			  
			  
			  let ok_elem = check_elem new_elem in
			  ok&&ok_join&&ok_meet&&ok_elem,
			  (new_set, new_elem)::accu
						 
		  ) (ok, accu) single 
	      ) (ok, []) list
	  in
	  aux (i+1) (ok, list@new_list)
      in
      let ok, list = aux 1 (ok_single, single) in
      values := list;
      log (fun fmt -> Format.fprintf fmt "generated %i sets of concrete values" (List.length list));
      ok
      

    let check_bin_ops () =
      let inj q =
	let s = try Q.to_string q with _ -> assert false in
	_D_sem_itv (q,s) (q,s) 		 
      in
      let msg_op ok op_s c1 c2 cres a1 a2 ares = 
	msg ok (fun fmt ->
		Format.fprintf
		  fmt
		  "%s: %s %s %s = %s and %a %s %a = %a but alpha(%s) = %a should be leq %a"
		  op_s
		  (Q.to_string c1) op_s (Q.to_string c2) (Q.to_string cres)
		  _D_fprint a1 op_s _D_fprint a2 _D_fprint ares
		  (Q.to_string cres) _D_fprint (inj cres) _D_fprint ares
	       )
      in
      
      let check_ops concrete_pairs a1 a2 =
	let a1_plus_a2 = try _D_sem_plus a1 a2 with _ -> assert false and
	    a1_minus_a2 = try _D_sem_minus a1 a2 with _ -> assert false and
	    a1_times_a2 = try _D_sem_times a1 a2 with _ -> assert false and
	    a1_div_a2 = try _D_sem_div a1 a2 with _ -> assert false
	in
	List.fold_left (
	    fun ok (c1, c2) -> 
	    let plus_res = Q.add c1 c2 in
	    let ok_plus = _D_order (inj plus_res) a1_plus_a2 in
	    msg_op ok_plus "+" c1 c2 plus_res a1 a2  a1_plus_a2;

	    let minus_res = Q.sub c1 c2 in
	    let ok_minus = _D_order (inj minus_res) a1_minus_a2 in
	    msg_op ok_minus "-" c1 c2 minus_res a1 a2  a1_minus_a2;

	    let times_res = Q.mul c1 c2 in
	    let ok_times = _D_order (inj times_res) a1_times_a2 in
	    msg_op ok_times "*" c1 c2 times_res a1 a2  a1_times_a2;

	    let ok_div =
	      if Q.equal c2 (Q.of_int 0) || (D.base_type <> Ast.IntT && D.base_type <> Ast.RealT) then
		true
	      else
		let div_res =
		  if D.base_type = Ast.IntT then (
		    assert (Z.equal c1.Q.den Z.one);
		    assert (Z.equal c2.Q.den Z.one);
		    let numc1 = c1.Q.num in
		    let numc2 = c2.Q.num in
		    let div_, _ = Z.div_rem numc1 numc2 in
		    Q.(~$$) div_
		  )
		  else if D.base_type = Ast.RealT then
		    Q.div c1 c2
		  else
		    assert false (* already filtered out *)
		in
		let ok_div = _D_order (inj div_res) a1_div_a2 in
		msg_op ok_div "/" c1 c2 div_res a1 a2  a1_div_a2;
		ok_div
	    in
	    ok && ok_plus && ok_minus && ok_times && ok_div
	  )
		       true concrete_pairs
		       

      in
      let pairs =
        List.fold_left (fun accu v1 ->
			List.fold_left (fun accu v2 ->
					(v1,v2)::accu
				       ) accu !values
		       ) [] !values
      in
      (* Unfold concrete combinations *)
      List.fold_left (
	  fun accu ((s1,a1), (s2,a2)) ->
	  (* Format.eprintf "unfold s1=%a and s2=%a@." Set.pp s1 Set.pp s2; *)
	  let concrete_pairs =
	    Set.fold (fun c1 res ->
		      Set.fold (fun c2 res -> (c1, c2) :: res) s2 res
		     ) s1 []
	  in
	  (check_ops concrete_pairs a1 a2) && accu
	) true pairs
      

      
(* ITV related checks TODO
   [x,x] shall work for various values. It has been evaluated already
   [y,x] with y > x shall be bottom    TODO
   we can check that [x,x] \leq [x,y] for x<= y
 *)
    let check_itv dom = true 

    let check_geq0 () =
      log (fun fmt -> Format.fprintf fmt "checking geq0");
      (* Recording already checked elements *)
      let ok, _ =
	List.fold_left (
	  fun (accu, seen) (set, abs) ->
	  if (*not (List.mem abs seen) &&*) Set.exists (fun e -> Q.geq e Q.zero) set then
	    let ok = not (_D_is_bottom (_D_sem_geq0 abs)) in
	    msg ok (fun fmt -> Format.fprintf fmt "qeg0: element %a=alpha({%a}) contains values >=0, yet geq0(%a) = bottom"
					      _D_fprint abs
					      Set.pp set
					      _D_fprint abs
		   );
	    ok && accu, abs::seen
	  else
	    accu, seen
	) (true, []) !values
      in
      ok
		     
    let check () =
      let ok_bot = check_bottom () in
      let ok_vals = build_vals 3 in
      let ok_geq0 = check_geq0 () in
      let ok_ops = check_bin_ops () in

      ok_bot && ok_vals && ok_geq0 && ok_ops
           (* && (check_itv ()) *)
      
  end


(* Main functions *)
    
let check_nonrel dom =
  let module D = (val dom : Relational.Domain) in
  match D.nonrel_base with
  | None -> Format.eprintf "Not a non relational domain"; exit 1
  | Some nr ->
     let module NR = (val nr : NonRelational.Domain) in
     let module C = CheckNonRel (NR) in 
     C.check ()

let check_dom name =
  let dom =  prepare_domain (get_domain name) in
  Format.eprintf "Checking domain %s@.@?@  @[<v 2>" name;
  let ok = check_nonrel dom in
  (if ok then
    Format.eprintf "Everything seems ok so far@ "
  else
    Format.eprintf "There was issues@ ");
  Format.eprintf "@]@.";
  ok
  
let _ =
  let usage_msg =
    Printf.sprintf
      "Usage: %s [options]" Sys.argv.(0) in
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
		     ("--verbose", Arg.Set_int Report.verbosity,
		      "<n>  Verbosity level (default is 1)");
		     ("-v", Arg.Set_int Report.verbosity, "<n>  Verbosity level (default is 1)");
		   ]
  in
  try 
    Arg.parse speclist
	      (fun _ -> ())
	      usage_msg;
    let _ = 
      match !domains with
      | [] -> (
	Format.eprintf "No domain provided@.Considering all available ones.@.";
	domains := List.map Domains.get_name Domains.available_domains
      )
      | _ -> ()
    in
    let results =
      List.fold_left
	(fun accu d ->
	 let ok = check_dom d in
	 (d, ok)::accu
	) [] !domains
    in
    Format.eprintf "----- Results -----@.";
    let ok = List.fold_left (fun accu (d,ok) ->
			     Format.eprintf "-- %s: %s@." d (if ok then "ok" else "issues");
			     accu && ok)
			    true results in
    if ok then
      exit 0
    else
      exit 1
	   
  with Report.Error -> exit 2
