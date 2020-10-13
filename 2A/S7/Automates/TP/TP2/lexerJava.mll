{

(* Partie recopiée dans le fichier CaML généré. *)
(* Ouverture de modules exploités dans les actions *)
(* Déclarations de types, de constantes, de fonctions, d'exceptions exploités dans les actions *)

  open ParserJava
  exception LexicalError

}

(* Déclaration d'expressions régulières exploitées par la suite *)
let chiffre = ['0' - '9']
let binaire = ('0' | '1')
let octal = ['0' - '7']
let hexadecimal = chiffre | ['A' - 'F']
let minuscule = ['a' - 'z']
let majuscule = ['A' - 'Z']
let alpha = minuscule | majuscule
let alphanum = alpha | chiffre | '_'
let commentaire =
  (* Commentaire bloc *)
  ("/*" [^ '*']* '*'* ([^ '*' '/'] [^ '*']* '*'*)* '/')
  (* Commentaire fin de ligne *)
  |  "//" [^'\n']*

rule main = parse
  | ['\n' '\t' ' ']+					{ main lexbuf }
  | commentaire						{ (main lexbuf) }
  | "import"						{ IMPORT }
  | "int"						{ INT }
  | "float"						{ FLOAT }
  | "boolean"						{ BOOL }
  | "char"						{ CHAR }
  | "void"				       		{ VOID }
  | "String"		       				{ STRING }
  | "{"							{ ACCOUV }
  | "}"							{ ACCFER }
  | ","							{ VIRG }
  | ";"							{ PTVIRG }
  | "("					       		{ PAROUV }
  | ")"							{ PARFER }
  | "["							{ CROOUV }
  | "]"							{ CROFER }
  | "if"						{ SI }
  | "else"						{ SINON }
  | "while"				       		{ TANTQUE }
  | "return" 						{ RETOUR }
  | "=" 			       			{ ASSIGN }
  | "<" 						{ OPINF }
  | ">"							{ OPSUP }
  | "<="   						{ OPINFEG }
  | ">=" 						{ OPSUPEG }
  | "==" 				       		{ OPEG }
  | "!=" 						{ OPNONEG }
  | "+" 			       			{ OPPLUS }
  | "-" 		       				{ OPMOINS }
  | "||" 						{ OPOU }
  | "*"    						{ OPMULT }
  | "%" 						{ OPMOD }
  | "/" 				       		{ OPDIV }
  | "&&" 						{ OPET }
  | "!" 						{ OPNON }
  | "." 						{ OPPT }
  | chiffre+ as texte					{ (ENTIER (int_of_string texte)) }
  | "0x" hexadecimal+ as texte				{ (ENTIER (int_of_string texte)) }
  | "0o" octal+ as texte				{ (ENTIER (int_of_string texte)) }
  | "0b" binaire+ as texte				{ (ENTIER (int_of_string texte)) }
  | chiffre+"."chiffre+ as texte			{ (FLOTTANT (float_of_string texte))}
  | ("true" | "false") as texte				{ (BOOLEEN (bool_of_string texte)) }
  | '\'' _ '\'' as texte				{ (CARACTERE texte.[1]) }
  | '\"' ([^ '\"' '\\'] | ('\\' _))* '\"' as texte 	{ (CHAINE texte) }
  | "null"						{ VIDE }
  | "new"						{ NOUVEAU }
  | ('_' | minuscule) alphanum* as texte		{ (IDENT texte) }
  | majuscule alphanum* as texte			{ (TYPEIDENT texte) }
  | eof							{ FIN }
  | _ as texte				 		{ (print_string "Erreur lexicale : ");(print_char texte);(print_newline ()); VIDE }

{

}
