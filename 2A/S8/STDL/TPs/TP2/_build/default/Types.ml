open Ast
open Semantics

let debug = ref false;

(* ..................................................................*)
type typeType =
  | ErrorType                             (* Échec du typage *)

  | IntegerType                           (* Type entier *)
  | BooleanType                           (* Type  booléen *)
  
  | UnknownType                           (* Type inconnu utilisé pour les *)
                                          (* variables de type avant unification *)

  | VariableType of (typeType ref * int)  (* Variable de type identifiée par un numéro *)
                                          (* et contenant une référence sur un type permettant *)
                                          (* l'unification *)

  | FunctionType of typeType * typeType   (* Type fonction d'un paramètre vers un résultat *)

  | UnitType                              (* Type vide *)
  | ReferenceType of typeType             (* Type pointeur sur un type *)

;;

(* ..................................................................*)
(* newVariable : typeType                                            *)
(* Cree une variable de type, differente des précedentes             *)
(* dont la valeur initiale (modifiable) est : Unknown                *)
(* ..................................................................*)
(* Cette variable globale permet de créer des numéros uniques pour   *)
(* chaque variable de type *)
let counter = ref 0
;;

let newVariable () =
  counter := (! counter) + 1;
  (VariableType ((ref UnknownType),(! counter)))
;;

let rec string_of_type t =
  match t with
  | ErrorType -> "error"

  | IntegerType -> "int"
  | BooleanType -> "bool"

  | UnknownType -> "unknown"
  | VariableType (r,c) ->
     "('" ^ (string_of_int c) ^ " " ^ (string_of_type (!r)) ^ ")"

  | FunctionType (tpar,tres) ->
     "(" ^ (string_of_type tpar) ^ " -> " ^ (string_of_type tres) ^ ")"

  | ReferenceType t -> "(ref " ^ (string_of_type t) ^ ")"
  | UnitType -> "unit"

and string_of_type_env env =
  match env with
  | [] -> ""
  | (key,typevalue)::q -> 
     ("{" ^ key ^ " = " ^ (string_of_type typevalue)) ^ "} " ^ (string_of_type_env q) 
;;

(* Normalisation d'un type *)
(* Il s'agit de remplacer une variable de type possèdant un type *)
(* par la valeur de ce type *)
(* et de propager l'erreur de typage si elle est contenu dans un type structuré *)
let rec normalize t =
  match t with
  | (IntegerType | BooleanType | UnitType 
     | ErrorType | UnknownType) as result -> result
                                           
  | VariableType (r,_) when ((! r) <> UnknownType) -> (normalize (! r))
  | VariableType _ as result -> result
                              
  | FunctionType (tp,tr) -> 
     let ntp = normalize tp in
     let ntr = normalize tr in
     if ((ntp <> ErrorType) && (ntr <> ErrorType)) then 
       FunctionType (ntp,ntr)
     else 
       ErrorType
     
  | ReferenceType t -> 
     let nt = normalize t in
     if (nt <> ErrorType) then ReferenceType nt
     else 
       ErrorType
;;

(* ..................................................................  *)
(* unify : typeType -> typeType                                        *)
(*     -> typeType * bool                                              *)
(* unify permet de comparer 2 types (en valuant eventuellement les     *)
(* variables de types presentes dans chacun des 2). La valeur renvoyee *)
(* est le premier type et true s'il y a correspondance                 *)
(* ErrorType et false sinon                                            *)
(* ..................................................................  *)
let rec unify t1 t2 =
  (* test de presence de v dans t : pour eviter une boucle infinie dans l'unification *)
  let rec occur_check v t =
    if !debug then (print_endline ("OC : " ^ (string_of_int v) ^ " in " ^ (string_of_type t)));
    match t with
    (* Une variable ne peut pas appartenir à un type constant *)
    | (IntegerType | BooleanType | UnitType | ErrorType | UnknownType) -> false
                                                                        
    (* Une variable peut appartenir au type du paramètre ou au type du résultat *)
    | FunctionType (tp,tr) -> ((occur_check v tp) || (occur_check v tr))
                            
    (* Une variable peut être égale à une autre variable ou appartenir au type associé *)
    (* par unification *)
    | VariableType (t,r) -> (r == v) || (occur_check v (!t))
                          
    (* Une variable peut appartenir au type pointé *)
    | ReferenceType t -> (occur_check v t)

    and
      (* la vraie comparaison *)
      aux t1 t2 =
      match t1,t2 with
      (* Si les 2 types sont identiques, l'unification réussit et renvoie le même type *)
      | IntegerType,IntegerType -> IntegerType, true
      | BooleanType,BooleanType -> BooleanType, true
      | UnitType,UnitType -> UnitType, true
                           
      (* L'unification de 2 types pointeurs réussit si l'unification des types pointés réussit *)
      | ReferenceType st1, ReferenceType st2 ->
         let t,tr = (aux st1 st2) in
         (ReferenceType t), tr
         
      (* L'unification de 2 types fonctions réussit si les unifications des types des paramètres *)
      (* et des types des résultats réussissent *)
      | (FunctionType (tp1,tr1)),(FunctionType (tp2,tr2)) ->
         let utp,rtp = (aux tp1 tp2) in
         let utr,rtr = (aux tr1 tr2) in
         (FunctionType (utp,utr)),(rtp && rtr)
         
      (* L'unification de 2 variables de type réussit s'il s'agit de la même variable *)
      | (VariableType (_,r1)), (VariableType (_,r2)) when (r1 = r2) -> (t1,true)
                                                                     
      (* L'unification de 2 variables de type différentes quand chaque variable est associée *)
      (* à un type *)
      (* réussit si l'unification de ces types réussit *)                                                  | (VariableType (v1,_)), (VariableType (v2,_)) when
             ((! v1) <> UnknownType) && ((! v2) <> UnknownType) ->
         (aux (! v1) (! v2))
                                                                                                                             
      (* L'unification d'une variable de type qui n'est pas associée à un type et d'un autre type *)
      (* réussit en associant à cette variable ce type de la seconde si la variable n'apparait pas *)
      (* dans le type -- test d'occur check *)
      | (VariableType (v1,r1)), _ when  ((! v1) = UnknownType) && (not (occur_check r1 t2)) ->
         ((v1 := t2); (t2,true))
                                                                  
      (* cas identique au précédent en permutant variable et type *)
      | _, (VariableType (v2,r2)) when 
             ((! v2) = UnknownType) && (not (occur_check r2 t1)) ->
         ((v2 := t1); (t1,true))
                                                                  
      (* L'unification d'une variable de type associée à un type et d'un autre type réussit *)
      (* si l'unification des 2 types réussit *)
      | (VariableType (v1,r1)), _ when ((! v1) <> UnknownType) -> (aux (! v1) t2)
                                                                
      (* cas identique au précédent en permutant variable et type *)
      | _, (VariableType (v2,r2)) when ((! v2) <> UnknownType) -> (aux t1 (! v2))
                                                                
      (* Si l'un des 2 types est une erreur, l'unification échoue *)
      | ErrorType, _ -> (ErrorType,false)
      | _, ErrorType -> (ErrorType,false)
      | _ -> (if (!debug) then
                (print_endline
                   ("Type Error : " ^ (string_of_type t1) ^ " != " ^ (string_of_type t2))));
             (ErrorType,false) 
  in
  (* Il faut normaliser les types t1 et t2 avant de les unifier *)
  let t1 = normalize t1 in
  let t2 = normalize t2 in
  (if (! debug) then 
     (print_endline ("before " ^ (string_of_type t1) ^ " <-> " ^ (string_of_type t2))));
  let t,r = aux t1 t2 in
  (if (! debug) then 
     (print_endline ("after " ^ (string_of_type t1) ^ " <-> " ^ (string_of_type t2))));
  (if (! debug) then 
     (print_endline ("result " ^ (string_of_type t))));
  (* Il faut normaliser le résultat après unification *)
  (normalize t),r
;;

(* ..................................................................*)
(* type_of_expr Ast.ast -> environment -> typeType                   *)
(*  calcule le type de l'expression dans un environnement de types   *)
(* Chaque expression est traitee par une fonction ruleXXX traitant   *)
(* a la regle d'inference associee                                   *)
(* ..................................................................*)
let rec type_of_expr expr env =
  let rec aux expr env =
    if ( ! debug ) then 
      (print_endline ((string_of_ast expr) ^ " -> " ^ (string_of_type_env env))); 
    match expr with
    (* Partie Expression *)
    | (TrueNode)                            -> ruleBoolean
    | (FalseNode)                           -> ruleBoolean
    | (IntegerNode value)                   -> ruleInteger
    | (AccessNode name)                     -> ruleAccess name env
    | (BinaryNode (op,left,right))          -> ruleBinary op left right env
    | (UnaryNode (op,subexpr))              -> ruleUnary op subexpr env
                                             
    (* Partie Fonctionnelle *)
    | (LetNode (ident,bvalue,bin))          -> ruleLet ident bvalue bin env
    | (IfthenelseNode (cond, ethen, eelse)) -> ruleIf cond ethen eelse env
    | (FunctionNode (par,body))             -> ruleFunction par body env
    | (CallNode (fct,par))                  -> ruleCall fct par env
    | (LetrecNode (ident,bvalue,bin))       -> ruleLetrec ident bvalue bin env
                                             
    (* Partie Impérative *)
    | (UnitNode)                            -> ruleUnit
    | (RefNode subexpr)                     -> ruleRef subexpr env
    | (ReadNode subexpr)                    -> ruleRead subexpr env
    | (WriteNode (left,right))              -> ruleWrite left right env
    | (SequenceNode (left,right))           -> ruleSequence left right env
    | (WhileNode (cond,body))               -> ruleWhile cond body env
  in
  (normalize (aux expr env))

  and
    (* ..................................................................*)
    ruleBoolean = BooleanType

  and
    (* ..................................................................*)
    ruleInteger = IntegerType

  and
    (* ..................................................................*)
    ruleAccess name env =
    (match (lookforEnv name env) with
     | NotFound -> ErrorType 
     | (Found t) -> t) 

  and
    (* ..................................................................*)
    ruleUnary op expr env =
    (match op with
     | Negation ->
        let texpr = (type_of_expr expr env) in
        let ute,ure = unify texpr BooleanType in
        (if (ure) then BooleanType else ErrorType)
     | Opposite ->
        let texpr = (type_of_expr expr env) in
        let ute,ure = unify texpr IntegerType in
        (if (ure) then IntegerType else ErrorType)
    (* | _ -> ErrorType *)
    )

  and
    (* ..................................................................*)
    ruleBinary op left right env =
    let tleft = (type_of_expr left env) in
    let tright = (type_of_expr right env) in
    (match op with
     | (Equal | Different | Lesser | LesserEqual | Greater | GreaterEqual) ->
        let utl,url = unify tleft IntegerType in
        let utr,urr = unify tright IntegerType in
        (if (url && urr) then BooleanType else ErrorType)
     | (Add | Substract | Multiply | Divide) ->
        let utl,url = unify tleft IntegerType in
        let utr,urr = unify tright IntegerType in
        (if (url && urr) then IntegerType else ErrorType)
     | (Or | And) ->
        let utl,url = unify tleft BooleanType in
        let utr,urr = unify tright BooleanType in
        (if (url && urr) then BooleanType else ErrorType)
    (*
    | _ -> ErrorType)
     *)
    )

  and
    (* ..................................................................*)
    ruleLet ident bvalue bin env =
    let typeident = (type_of_expr bvalue env) in
    (*    (print_endline ((string_of_ast bvalue) ^ " -> " ^ (string_of_type typeident)));
    (print_endline ((string_of_ast bin))); *)
    (type_of_expr bin ((ident,typeident)::env)) 

  and
    (* ..................................................................*)
    ruleIf cond ethen eelse env =
    let tcond = (type_of_expr cond env) in
    let tthen = (type_of_expr ethen env) in
    let telse = (type_of_expr eelse env) in
    let utc,urc = unify tcond BooleanType in
    let ut,ur = unify tthen telse in
    (if (urc && ur) then ut else ErrorType)

  and
    (* ..................................................................*)
    ruleFunction par body env =
    let tpar = newVariable () in
    (FunctionType (tpar, type_of_expr body ((par, tpar)::env)))

  and 
    (* ..................................................................*)
    ruleCall fct par env =
      let tfct = (type_of_expr fct env) in
        let tpar = (type_of_expr par env) in
          (match tfct with
          | FunctionType (tpara, tbody) ->
            let ut, ur = unify tpar tpara in
              if ur then
                tbody
              else 
                ErrorType
          | _ -> ErrorType  
          )

  and
    (* ..................................................................*)
    ruleLetrec ident bvalue bin env =
    let typevar = newVariable () in
    let typeident = (type_of_expr bvalue ((ident,typevar)::env)) in
    let ut,ur = unify typevar typeident in
    (if (ur) then 
       (type_of_expr bin ((ident,typeident)::env))
     else 
       ErrorType)

  and
    (* ..................................................................*)
    ruleUnit = UnitType

  and
    (* ..................................................................*)
    ruleRef expr env =
      let texpr = (type_of_expr expr env) in
        (ReferenceType (texpr))

  and
    (* ..................................................................*)
    ruleRead expr env =
      let texpr = (type_of_expr expr env) in
        (match texpr with
        | ReferenceType (texpr) -> texpr
        | _ -> ErrorType
        )

  and
    (* ..................................................................*)
    ruleWrite left right env =
      let tleft = (type_of_expr left env) in
        let tright = (type_of_expr right env) in  
          let ut, ur = unify tleft (ReferenceType (tright)) in
            if ur then
              tright
            else
              ErrorType

  and
    (* ..................................................................*)
    ruleSequence left right env =
      let tleft = (type_of_expr left env) in
        let tright = (type_of_expr right env) in  
          let ut, ur = unify tleft UnitType in
            if ur then
              tright
            else
              ErrorType

  and
    (* ..................................................................*)
    ruleWhile cond body env =
      let tcond = (type_of_expr cond env) in
        let tbody = (type_of_expr body env) in
          let ut, ur = unify tcond BooleanType in
            if ur then
              tbody
            else
              ErrorType

(* ...........fin des regles d'inference..........................................*)
;;
