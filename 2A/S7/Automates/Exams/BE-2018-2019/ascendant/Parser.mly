%{

(* Partie recopiee dans le fichier CaML genere. *)
(* Ouverture de modules exploites dans les actions *)
(* Declarations de types, de constantes, de fonctions, d'exceptions exploites dans les actions *)

%}

/* Declaration des unites lexicales et de leur type si une valeur particuliere leur est associee */

%token UL_ACCOUV UL_ACCFER UL_CROOUV UL_CROFER
%token UL_DBLPT UL_VIRG
%token UL_VIDE
%token UL_VRAI UL_FAUX

/* Defini le type des donnees associees a l'unite lexicale */

%token <string> UL_CHAINE
%token <int> UL_NOMBRE

/* Unite lexicale particuliere qui represente la fin du fichier */

%token UL_FIN

/* Type renvoye pour le nom terminal document */
%type <unit> document

/* Le non terminal document est l'axiome */
%start document

%% /* Regles de productions */

document : UL_ACCOUV liste_attributs UL_ACCFER UL_FIN { (print_endline "D : UL_ACCOUV LA UL_ACCFER FIN ") }

liste_attributs : /* Lambda, mot vide */ { (print_endline "LA : /* Lambda, mot vide */") }

%%
