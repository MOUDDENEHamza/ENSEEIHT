%token <int> INT
%token <string> NAME
%token XXXX 
%token EOF

(* Déclarations du type de retour des actions associées à un non terminal *)
%type <(int*string*int*int)> ligne

(* Indication de l'axiom et du type de retour des actions associées à l'axiom *)
%start <(int*string*int*int) list> main

%%

main:
| stat = ligne EOF { [stat] }
| stat = ligne m = main { stat :: m}

ligne :
| sexe = INT prenom = NAME annee = INT nb = INT {(sexe,prenom,annee,nb)}
| sexe = INT prenom = NAME XXXX nb = INT {(sexe,prenom,-1,nb)}