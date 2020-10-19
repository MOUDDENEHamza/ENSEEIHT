{
  open Parser

  exception Error of string
}

(* Définitions de macro pour les expressions régulières *)
let blanc = [' ' '\t' '\n']
let chiffre = ['0'-'9']
let majuscules = ['A'-'Z']
let majusculesAccentuees = "É"|"È"|"Ë"|"Ê"|"À"|"Â"|"Ä"|"Ï"|"Î"|"Ö"|"Ô"|"Ü"|"Û"|"Ù"|"'"|"Ç"|"_"|"Å"|"Ÿ"


(* Règles léxicales *)
rule token = parse
|  blanc (* Onignore les blancs *)
    { token lexbuf }
| chiffre+ as i
    { INT (int_of_string i) }
| "XXXX"
    { XXXX }
| (majuscules|"-"|majusculesAccentuees)+ as n
    { NAME n }
| eof
    { EOF }
| _
{ raise (Error ("Unexpected char: "^(Lexing.lexeme lexbuf)^" at "^(string_of_int (Lexing.lexeme_start
lexbuf))^"-"^(string_of_int (Lexing.lexeme_end lexbuf)))) }