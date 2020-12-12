{

  open TokenJava
(*  open String *)
(*  open Str *)
  exception LexicalError

}

(* Macro-definitions *)
let minuscule = ['a'-'z']
let majuscule = ['A'-'Z']
let chiffre = ['0'-'9']
let underscore = '_'
let underscores = underscore underscore*

let digit = chiffre ((underscore chiffre) | chiffre)*
let alphabet = minuscule | majuscule
let alphanum = alphabet | chiffre | '_'
let commentaireBloc =  "/*" _* "*/" 
let commentaireLigne = "//" [^'\n']* '\n'

let integerTypeSuffix = 'l' | 'L'
(* DecimalNumeral *)
let nonZeroDigit = ['1' - '9']
let digit = '0' | nonZeroDigit
let digitOrUnderscore = digit | underscore
let digitsAndUnderscores = digitOrUnderscore (digitOrUnderscore)*
let digits = digit | digit (digitsAndUnderscores)? digit
let decimalNumeral = '0' | nonZeroDigit (digits)? | nonZeroDigit underscores digits 

(* HexNumeral *)
let hexDigit = chiffre | ['a'-'f'] | ['A'-'F']
let hexDigitOrUnderscore = hexDigit | underscore
let hexDigitsAndUnderscores = hexDigitOrUnderscore (hexDigitOrUnderscore)*
let hexDigits = hexDigit | hexDigit (hexDigitsAndUnderscores)? hexDigit
let hexNumeral = '0' ('x' | 'X') hexDigits

(* OctalNumeral *)
let octalDigit = ['0'-'7']
let octalDigitOrUnderscore = octalDigit | underscore
let octalDigitsAndUnderscores = octalDigitOrUnderscore (octalDigitOrUnderscore)*
let octalDigits = octalDigit | octalDigit (octalDigitsAndUnderscores)? octalDigit
let octalNumeral = '0' octalDigits | '0' underscores octalDigits

(* BinaryNumeral *)
let binaryDigit = '0' | '1'
let binaryDigitOrUnderscore = binaryDigit | underscore
let binaryDigitsAndUnderscores = binaryDigitOrUnderscore (binaryDigitOrUnderscore)*
let binaryDigits = binaryDigit | binaryDigit (binaryDigitsAndUnderscores)? binaryDigit
let binaryNumeral = '0' ('b' | 'B') binaryDigits

let sign = '+' | '-'
let floatTypeSuffix = 'f' | 'F' | 'd' | 'D'
let exponentIndicator = 'e' | 'E'
let binaryExponentIndicator = 'p' | 'P'
(* DecimalFloating *)
let signedInteger = (sign)? digits
let exponentPart = exponentIndicator signedInteger
let decimalFloating = digits '.' (digits)? (exponentPart)? (floatTypeSuffix)? | '.' digits (exponentPart)? (floatTypeSuffix)? 
                      | digits exponentPart (floatTypeSuffix)? | digits (exponentPart)? floatTypeSuffix

(* HexadecimalFloating*)
let hexSignificand = hexNumeral ('.')? | '0' ('x' | 'X') (hexDigits)? '.' hexDigits
let binaryExponent = binaryExponentIndicator signedInteger
let hexadecimalFloating = hexSignificand binaryExponent (floatTypeSuffix)?

(* CharacterLiteral *)
let specialCharacter = "'" ("\\b" | "\\t" | "\\n" | "\\f" | "\\r" | "\\\"" | "\\\'" | "\\\\" | "\\" octalDigit) "'"


(* Analyseur lexical : expression reguliere { action CaML } *)
rule lexer = parse

(* Espace, tabulation, passage a ligne, etc : consommes par l'analyse lexicale *)
  | ['\n' '\t' ' ']+    { lexer lexbuf }

(* Commentaires consommes par l'analyse lexicale *)
  | commentaireBloc  	{ lexer lexbuf }
  | commentaireLigne	{ lexer lexbuf }

(* Structures de blocs *)
  | "("                 { PAROUV }
  | ")"                 { PARFER }
  | "["                 { CROOUV }
  | "]"                 { CROFER }
  | "{"                 { ACCOUV }
  | "}"                 { ACCFER }

(* Separateurs *)
  | ","                 { VIRG }
  | ";"                 { PTVIRG }

(* Operateurs booleens *)
  | "||"                { OPOU }
  | "&&"                { OPET }
  | "!"                 { OPNON }

(* Operateurs comparaisons *)
  | "=="                { OPEG }
  | "!="                { OPNONEG }
  | "<="                { OPSUPEG }
  | "<"                 { OPSUP }
  | ">="                { OPINFEG }
  | ">"                 { OPINF }

(* Operateurs arithmetiques *)
  | "+"                 { OPPLUS }
  | "-"                 { OPMOINS }
  | "*"                 { OPMULT }
  | "/"                 { OPDIV }
  | "%"                 { OPMOD }
  | "."                 { OPPT }
  | "="                 { ASSIGN }
  | "new"               { NOUVEAU }

(* Mots cles : types *)
  | "bool"              { BOOL }
  | "char"              { CHAR }
  | "float"             { FLOAT }
  | "int"               { INT }
  | "String"            { STRING }
  | "void"              { VOID }

(* Mots cles : instructions *)
  | "while"		{ TANTQUE }
  | "if"		{ SI }
  | "else"		{ SINON }
  | "return"		{ RETOUR }

(* Mots cles : constantes *)
  | "true"		{ (BOOLEEN true) }
  | "false"		{ (BOOLEEN false) }
  | "null"		{ VIDE }

(* Nombres entiers *)
  | decimalNumeral (integerTypeSuffix)? as texte                     { (ENTIER (int_of_string texte)) }
  | hexNumeral (integerTypeSuffix)? as texte                         { (HEXADECIMAL (int_of_string texte))}
  | octalNumeral (integerTypeSuffix)? as texte                       { (OCTAL (int_of_string texte))}
  | binaryNumeral (integerTypeSuffix)? as texte                      { (BINARY (int_of_string texte))}

(* Nombres flottants *)
  | (decimalFloating | hexadecimalFloating) as texte                 { (FLOTTANT (float_of_string texte)) }

(* Caracteres : A COMPLETER *)
  | "'" _ "'" as texte                                               { CARACTERE texte.[1] }
  | specialCharacter as texte                                        { CARACTERESPECIAL (texte.[2]) }

(* Chaines de caracteres : A COMPLETER *)
  | '"' (_ | specialCharacter)* '"' as texte                  { CHAINE texte }
  
(* Identificateurs *)
  | majuscule alphanum* as texte              { TYPEIDENT texte }
  | minuscule alphanum* as texte              { IDENT texte }
  | eof                                       { FIN }
  | _                                         { raise LexicalError }

{

}
