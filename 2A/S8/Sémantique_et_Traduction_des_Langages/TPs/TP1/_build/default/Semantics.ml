(* Analyseur sémantique *)

open Ast

let debug = ref false;

(* ======================================================== *)
(* Définition du type des erreurs *)
type errorType =
  | UnknownIdentError of string (* Identificateur non défini *)
  | TypeMismatchError           (* Erreur de type *)
  | RuntimeError                (* Erreur à l'exécution *)
  | UndefinedExpressionError    (* Expression non définie à traiter par les étudiants *)

(* ======================================================== *)
(* Définition du type des valeurs renvoyées par l'interprète *)
(* ======================================================== *)
type valueType =
  | FrozenValue of (ast * environment)        (* Fermeture fonctionnelle *)
  | IntegerValue of int                       (* Valeur entière *)
  | BooleanValue of bool                      (* Valeur booléenne *)
  | ErrorValue of errorType                   (* Valeur représentant une erreur *)
and environment = (string * valueType) list   (* Environnement d'exécution *)

(* ======================================================== *)
(* string_of_names : string list -> string *)
(* Converti une liste de chaînes de caractères en une seule chaîne de caractères *)
(* ======================================================== *)
let string_of_names names =
  List.fold_right (fun t tq -> t ^ " " ^ tq ) names ""

(* ======================================================== *)
(* string_of_env : environment -> string *)
(* Convertit un environnement en une chaine de caractères en vue de son affichage *)
(* ======================================================== *)
let rec string_of_env env =
  match env with
  | [] -> ""
  | (key,value)::q -> (key ^ "," ^ (string_of_value value)) ^ ";" ^ (string_of_env q)
                    
(* ======================================================== *)
(* string_of_value : valueType -> string *)
(* Convertit une valueType en une chaine de caractères en vue de son affichage *)
(* ======================================================== *)
and string_of_value value =
  match value with
  | (FrozenValue (expr,env)) -> ((string_of_ast expr) ^ (string_of_env env))
  | (IntegerValue value) -> (string_of_int value)
  | (BooleanValue value) -> (if (value) then "true" else "false")
  | (ErrorValue error) -> (string_of_error error)
                        
(* ======================================================== *)
(* string_of_error : errorType -> string *)
(* Convertit une erreur en une chaine de caractères en vue de son affichage *)
(* ======================================================== *)
and string_of_error error =
  match error with
  | (UnknownIdentError name) -> "Unknown ident : " ^ name
  | RuntimeError -> "Runtime error"
  | TypeMismatchError -> "Type mismatch"
  | UndefinedExpressionError -> "Undefined expression error"

(* ======================================================== *)
(* Type du résultat d'une recherche *)
(* ======================================================== *)                              
type 'a searchResult = 
  | NotFound 
  | Found of 'a

(* ======================================================== *)
(* lookfor : string -> environment -> valueType searchResult *)
(* Cherche un identifiant dans un environnement et renvoie la *)
(* valeur associée le cas échéant *)
(* ======================================================== *)
let rec lookfor name env =
  match env with
  | [] -> NotFound
  | (key,value) :: others ->
    (if (key = name) then (Found value) else (lookfor name others))
  
(* ========================================================*)
(* value_of_expr : ast -> environment -> valueType *)
(* Fonction d'évaluation des expressions *)
let rec value_of_expr expr env =
  if ( ! debug ) then 
    (print_endline ((string_of_ast expr) ^ " -> " ^ (string_of_env env))); 
  match expr with
  (* Partie Expression *)
  | (TrueNode) ->  ruleTrue 
  | (FalseNode) ->  ruleFalse 
  | (IntegerNode value) -> ruleInteger value
  | (AccessNode name) -> ruleAccess env name
  | (UnaryNode (op,expr)) -> ruleUnary env op expr
  | (BinaryNode (op,left,right)) -> ruleBinary env op left right
  (* Partie Fonctionnelle *)
  | (LetNode (ident,bvalue,bin)) -> ruleLet env ident bvalue bin
  | (IfthenelseNode (cond,bthen,belse)) -> ruleIf env cond bthen belse
  | (FunctionNode (_,_)) -> ruleFunction expr env
  | (CallNode (fexpr,pexpr)) -> ruleCallByValue env fexpr pexpr
  (*| (CallNode (fexpr,pexpr)) -> ruleCallByName env fexpr pexpr *) 
  | (LetrecNode (ident,bvalue,bin)) -> ruleLetrec env ident bvalue bin
  (* Partie Impérative : à compléter *)
  | _ -> ErrorValue UndefinedExpressionError (* les expressions avec effets de bord *)

  (* ========================================================*)
  and
    (* ruleTrue : valueType *)
    (* Fonction d'évaluation de true *)
    ruleTrue = (BooleanValue true)
             
  (* ========================================================*)
  and
    (* ruleFalse : valueType *)
    (* Fonction d'évaluation de false *)
    ruleFalse = (BooleanValue false)

  (* ========================================================*)
  and 
    (* ruleInteger : int -> valueType *)
    (* Fonction d'évaluation d'un entier *)
    ruleInteger value = (IntegerValue value)

  (* ========================================================*)
  and 
    (* ruleName : environment -> string -> valueType *)
    (* Fonction d'évaluation d'un identificateur *)
    ruleAccess env name = 
    match (lookfor name env) with
    | NotFound -> (ErrorValue (UnknownIdentError name))
    (* A compléter lors de l'ajout de la fermeture pour les définitions récursives *)
    | (Found value) -> value
    
  (* ========================================================*)
  and 
    (* ruleUnary : environment -> unary -> ast- > valueType *)
    (* Fonction d'évaluation d'un opérateur unaire *)
    ruleUnary env op exp =
    let value =  
      (value_of_expr exp env) 
    in
    match value with
    | (ErrorValue _) as result -> result (* Propagation des erreurs *)
    (* Vérification des types *)
    | (BooleanValue value) ->
       (match op with
        | Negation -> (BooleanValue (not value))
        | Opposite -> (ErrorValue TypeMismatchError))
    | (IntegerValue value) ->
       (match op with
        | Negation -> (ErrorValue TypeMismatchError)
        | Opposite -> (IntegerValue (- value)))
    | _ -> (ErrorValue TypeMismatchError)
                              
  (* ========================================================*)
  and 
    (* ruleBinary : environment -> binary -> ast- > ast -> valueType *)
    (* Fonction d'évaluation d'un opérateur binaire *)
    ruleBinary env op left right = 
    let leftvalue = 
      (value_of_expr left env) (* Evaluation du paramètre gauche *)
    in
    (match leftvalue with
     | (ErrorValue _) as result -> result (* Propagation de l'erreur *)
     | _ ->
        (let rightvalue = 
           (value_of_expr right env) (* Evaluation du paramètre droit *)
         in
         (match rightvalue with
          | (ErrorValue _) as result -> result (* Propagation de l'erreur *)
          | _ ->
             (match (leftvalue,rightvalue) with
              (* Vérification des types *)
              | ((IntegerValue leftvalue), (IntegerValue rightvalue)) -> 
                 (match op with
                  | Equal -> (BooleanValue (leftvalue = rightvalue))
                  | Different -> (BooleanValue (leftvalue <> rightvalue))
                  | Lesser -> (BooleanValue (leftvalue < rightvalue))
                  | LesserEqual -> (BooleanValue (leftvalue <= rightvalue))
                  | Greater -> (BooleanValue (leftvalue > rightvalue))
                  | GreaterEqual -> (BooleanValue (leftvalue >= rightvalue))
                  | Add -> (IntegerValue (leftvalue + rightvalue))
                  | Substract -> (IntegerValue (leftvalue - rightvalue))
                  | Multiply -> (IntegerValue (leftvalue * rightvalue))
                  | Divide -> 
                     (if (rightvalue = 0) then 
                        (ErrorValue RuntimeError) (* Division par zéro *)
                      else 
                        (IntegerValue (leftvalue / rightvalue)))
                  | _ -> (ErrorValue TypeMismatchError))
              (* Vérification des types *)
              | ((BooleanValue leftvalue), (BooleanValue rightvalue)) -> 
                 (match op with
                  | Or -> (BooleanValue (leftvalue || rightvalue))
                  | And -> (BooleanValue (leftvalue && rightvalue))
                  | _ -> (ErrorValue TypeMismatchError))
              | _ -> (ErrorValue TypeMismatchError)))))
    
  (* ========================================================*)
  and 
    (* ruleLet : environment -> string -> ast- > ast -> valueType *)
    (* Fonction d'évaluation d'un let *)
    (* "let ident = bvalue in bin" *)
    ruleLet env ident bvalue bin = 
    let v =
      (value_of_expr bvalue env)
    in
    match v with
      | (ErrorValue _) as result -> result
      | _ -> let env1 =
              (ident, v)::env
            in 
            (value_of_expr bin env1)
          
  (* ========================================================*)
  and
    (* ruleIf : environment -> ast -> ast -> ast- > valueType *)
    (* Fonction d'évaluation d'une conditionnelle *)
    (* "if cond then bthen else belse" *)
    ruleIf env cond bthen belse = 
    let condvalue = 
      (value_of_expr cond env) (* Evaluation of cond *)
    in
    match condvalue with
    | (BooleanValue true) -> value_of_expr bthen env
    | (BooleanValue false) -> value_of_expr belse env
    | _ -> (ErrorValue TypeMismatchError)
    
  (* ========================================================*)
  and 
    (* ruleFunction : ast -> environment -> valueType *)
    (* Fonction d'évaluation d'une fonction *)
    ruleFunction expr env = 
    FrozenValue (expr, env)

  (* Appel par nom *)
  (* ========================================================*)
  and
    (* ruleCallByName : environment -> ast -> ast -> valueType *)
    (* Fonction d'évaluation d'un appel de fonction avec passage de paramètre par nom*)
    ruleCallByName env fexpr pexpr = 
    let fvalue = 
      (value_of_expr fexpr env)
    in
    match fvalue with
    | (FrozenValue (expr, defenv)) -> 
        (match expr with
        | FunctionNode (par, body) -> let evalenv = (par, FrozenValue(pexpr, env))::defenv in
            value_of_expr body evalenv
        | _ -> (ErrorValue UndefinedExpressionError))
    | _ -> (ErrorValue UndefinedExpressionError)
    
  (* ========================================================*)
  and
    (* ruleCallByValue : environment -> ast -> ast -> valueType *)
    (* Fonction d'évaluation d'un appel de fonction avec passage de paramètre par valeur*)
    ruleCallByValue env fexpr pexpr = 
    let pvalue = (value_of_expr pexpr env) in
        match pvalue with
        | (ErrorValue _) as result -> result
        | _ -> let fvalue = (value_of_expr fexpr env) in
            match fvalue with
            | (FrozenValue (expr, fenv)) -> 
                (match expr with
                | FunctionNode (par, body) -> let ev_env = (par, pvalue)::fenv in
                    value_of_expr body ev_env
                | _ -> (ErrorValue UndefinedExpressionError))
            | _ -> (ErrorValue UndefinedExpressionError)
    
  (* ========================================================*)
  and
    (* ruleLetrec : environment -> string -> ast- > ast -> valueType *)
    (* Fonction d'évaluation d'un let rec*)
    (* "letrec ident = bvalue in bin" *)
    ruleLetrec env ident bvalue bin = 
    let nenv = (ident, FrozenValue(LetrecNode(ident, bvalue, bvalue), env))::env in
        value_of_expr bin nenv
    


