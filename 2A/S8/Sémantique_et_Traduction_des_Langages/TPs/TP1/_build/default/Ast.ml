(* Type des opérateurs binaires *)
type binary = 
  | Add 
  | Substract 
  | Or 
  | Multiply 
  | Divide 
  | And 
  | Equal 
  | Different 
  | Lesser 
  | LesserEqual 
  | Greater 
  | GreaterEqual


(* Type des opérateurs unaires *)
type unary = 
  | Opposite
  | Negation

(* Type pour la construction de l'arbre abstrait (Abstract Syntaxic Tree) *)
type ast =
  (* Expressions *)
  | TrueNode                           (* true *)
  | FalseNode                          (* false *)
  | IntegerNode of int                 (* number *)
  | AccessNode of string               (* ident *)
  | UnaryNode of unary * ast           (* unop E *)
  | BinaryNode of binary * ast * ast   (* E binop E *)
  (* Partie fonctionnelle *)
  | LetNode of string * ast * ast      (* let ident = E in E *)
  | IfthenelseNode of ast * ast * ast  (* if E then E else E *)
  | FunctionNode of string * ast       (* fun ident -> E *)
  | CallNode of ast * ast              (* (E) E *)
  | LetrecNode of string * ast * ast   (* letrec ident = E in E *)
  (* Partie impérative *)
  | RefNode of ast                     (* ref E *)
  | ReadNode of ast                    (* ! E *)
  | WriteNode of ast * ast             (* E := E *)
  | SequenceNode of ast * ast          (* E ; E *)
  | UnitNode                           (* () *)


(* string_of_ast : ast -> string *)
(* Convertit un AST en une chaine de caractères en vue de son affichage *)
let rec string_of_ast tree =
  match tree with
  | TrueNode  -> ( "true")
  | FalseNode  -> ( "false")
  | (IntegerNode value) -> (string_of_int value) 
  | (AccessNode name) -> name
  | (UnaryNode (op,expr)) -> 
     ( "(" ^ 
	 (match op with
	  | Negation -> "- "
          | Opposite -> "not "
         ) ^ (string_of_ast expr) ^ ")" )
  | (BinaryNode (op,left,right)) -> 
     ( "(" ^ (string_of_ast left) ^
	 (match op with
	  | Equal -> " = "
	  | Different -> " != "
	  | Lesser -> " < "
	  | Greater -> " > "
	  | LesserEqual -> " <= "
	  | GreaterEqual -> " => "
	  | Add -> " + "
	  | Substract -> " - "
	  | Or -> " || "
	  | Multiply -> " * "
	  | Divide -> " / "
	  | And -> " && "
	 ) ^ (string_of_ast right) ^ ")" ) 
  | (LetNode (id,blet,bin)) -> 
     ("(let " ^ id ^ " = "
      ^ (string_of_ast blet) ^ " in "
      ^ (string_of_ast bin) ^ ")")
  | (IfthenelseNode (cond,bthen,belse)) -> 
     ("(if " ^ (string_of_ast cond)
      ^ " then " ^ (string_of_ast bthen)
      ^ " else " ^ (string_of_ast belse) ^ ")")
  | (FunctionNode (par,body)) -> 
     ("(fun " ^ par ^ " -> " ^ (string_of_ast body) ^ ")")
  | (CallNode (func,par)) -> 
     ("((" ^ (string_of_ast func) ^ ") " ^ (string_of_ast par) ^ ")") 
  | (LetrecNode (id,blet,bin)) -> 
     ("(let rec " ^ id ^ " = "
      ^ (string_of_ast blet) ^ " in "
      ^ (string_of_ast bin) ^ ")")
  | (RefNode exp) -> ("(ref " ^ (string_of_ast exp) ^ ")")
  | (ReadNode exp) -> ("(! " ^ (string_of_ast exp) ^ ")")
  | (WriteNode (id,exp)) -> 
     ("(" ^ (string_of_ast id) ^ " := " ^ (string_of_ast exp) ^ ")")
  | (SequenceNode (exp,exp2)) ->
     ("( " ^ (string_of_ast exp) ^ "; " ^ (string_of_ast exp2) ^ ")")
  | UnitNode  -> ( "()");;

