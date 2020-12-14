%{

(* Partie recopiee dans le fichier CaML genere. *)
(* Ouverture de modules exploites dans les actions *)
(* Declarations de types, de constantes, de fonctions, d'exceptions exploites dans les actions *)

%}

/* Declaration des unites lexicales et de leur type si une valeur particuliere leur est associee */

%token UL_PAROUV UL_PARFER
%token UL_PT UL_VIRG

/* Defini le type des donnees associees a l'unite lexicale */

%token <string> UL_SYMBOLE
%token <string> UL_VARIABLE

/* Unite lexicale particuliere qui represente la fin du fichier */
%token UL_FIN
%token UL_ECHEC
%token UL_COUPURE
%token UL_NEGATION
%token UL_DEDUCTION

/* Type renvoye pour le nom terminal document */
%type <unit> document

/* Le non terminal document est l'axiome */
%start document

%% /* Regles de productions */
document : programme UL_FIN { (print_endline "document : programme UL_FIN ") }

programme : regle { (print_endline "programme : programme : regle") }
          | regle programme { (print_endline "programme : regle programme") }

regle : axiome { (print_endline "regle : axiome ") }
      | deduction { (print_endline "regle : deduction ") }


axiome : predicat UL_PT { (print_endline "axiome : predicat UL_PT") }

deduction : predicat UL_DEDUCTION suite_deduction UL_PT { (print_endline "deduction : predicat UL_SYMBOLE_DEDUCTION suite_deduction UL_PT") }

suite_deduction : suite_predicat { (print_endline "suite_deduction : suite_predicat") }
               | suite_predicat UL_VIRG suite_deduction { (print_endline "suite_deduction : suite_predicat UL_VIRG suite_deduction") }

suite_predicat : predicat { (print_endline "suite_predicat : predicat") }
                | UL_NEGATION predicat { (print_endline "suite_predicat : UL_NEGATION predicat") }
                | UL_ECHEC { (print_endline "suite_predicat : UL_ECHEC") }
                | UL_COUPURE { (print_endline "suite_predicat : UL_COUPURE") }

predicat : UL_SYMBOLE UL_PAROUV suite_variable UL_PARFER { (print_endline "predicat : UL_SYMBOLE UL_PAROUV suite_variable UL_PARFER") }

suite_variable : UL_VARIABLE { (print_endline "suite_variable : UL_VARIABLE") }
               | terme { (print_endline "suite_variable : terme") }
               | UL_VARIABLE UL_VIRG suite_variable { (print_endline "suite_variable : UL_VARIABLE UL_VIRG suite_variable") }
               | terme UL_VIRG suite_variable { (print_endline "suite_variable : terme UL_VIRG suite_variable") }

terme : UL_SYMBOLE { (print_endline "terme : UL_SYMBOLE") }
      | predicat { (print_endline "terme : predicat") }

%%
