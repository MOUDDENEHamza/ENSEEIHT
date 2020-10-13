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

/* Type renvoye pour le nom terminal document */
%type <unit> document

/* Le non terminal document est l'axiome */
%start document

%% /* Regles de productions */

programme : regle suite_regle UL_FIN { (print_endline "programme : regle suite_regle FIN ") }


%%
