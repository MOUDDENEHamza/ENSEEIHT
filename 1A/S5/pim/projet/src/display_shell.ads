-------------------------------------------------------------------------------
--  Fichier  : display_shell.adb
--  Auteur   : MOUDDENE Hamza & CAZES Noa
--  Objectif : Spécification du package Display_Shell
--  Crée     : Dimanche Nov 25 2019
--------------------------------------------------------------------------------


with Arbre_Genealogique;	use Arbre_Genealogique;
with Registre; 			use Registre;


package Display_Shell is


    -- Nom 	  : Init_Bar.
    -- Sémantique : Afficher la barre d'initialisation.
    procedure Init_Bar;


    -- Nom 	  : Display_Menu.
    -- Sémantique : Afficher le menu principal.
    procedure Display_Menu;


    -- Nom 	  : Display_TREE_IN_FOREST.
    -- Sémantique : Afficher une erreur quand l'arbre existe déja dans la foret.
    procedure Display_TREE_IN_FOREST;


    -- Nom        : Display_EXCEPTION.
    -- Sémantique : Afficher un message quand une fonction ou procedure lève une exception.
    -- Paramètres :
    -- 		Message -- Le message qui sera afficher.
    -- 		Restart -- 1 si on redémarre le programme, 0 si on redémarre l'option.
    procedure Display_Exception (Message : in String; Restart : in Integer);


    -- Nom 	  : Display_Menu.
    -- Sémantique : Afficher un message quand l'exéctuion d'une procédure ou fonction réussit.
    -- Paramètres :
    -- 		Message -- Le message qui sera afficher.
    procedure Display_Success (Message : in String);


    -- Nom        : Display_Success_Minimal_Tree_Ceation.
    -- Sémantique : Afficher un message quand la création de l'arbre minimal réussit.
    procedure Display_Success_Minimal_Tree_Ceation;


    -- Nom        : Display_ARBRE_NON_VIDE_EXCEPTION.
    -- Sémantique : Afficher un message quand creer arbre minimal lève l'exception ARBRE_NON_VIDE_EXCEPTION.
    procedure Display_ARBRE_NON_VIDE_EXCEPTION;


    -- Nom        : Display_Success_Add_Parent.
    -- Sémantique : Afficher un message quand ajouter parent réussit.
    procedure Display_Success_Add_Parent;


    -- Nom        : Display_ARBRE_VIDE_EXCEPTION.
    -- Sémantique : Afficher un message quand ajouter parent lève l'exception ARBRE_VIDE_EXCEPTION.
    -- Paramètres :
    -- 		Message -- Le message qui sera afficher.
    -- 		Restart -- 1 si on redémarre le programme, 0 si on redémarre l'option.
    procedure Display_ARBRE_VIDE_EXCEPTION (Message : in String; Restart : in Integer);


    -- Nom        : Display_DEUX_PARENTS_PRESENTS_EXCEPTION.
    -- Sémantique : Afficher un message quand ajouter parent lève l'exception DEUX_PARENTS_PRESENTS_EXCEPTION.
    procedure Display_DEUX_PARENTS_PRESENTS_EXCEPTION;


    -- Nom        : Display_ID_ABSENT_EXCEPTION.
    -- Sémantique : Afficher un message quand une fonction ou procedure lève l'exception ID_ABSENT_EXCEPTION.
    -- Paramètres :
    -- 		Message -- Le message qui sera afficher.
    -- 		Restart -- 1 si on redémarre le programme, 0 si on redémarre l'option.
    procedure Display_ID_ABSENT_EXCEPTION (Message : in String; Restart : in Integer);


    -- Nom        : Display_Number_Ancestors.
    -- Sémantique : Afficher le nombre d'ancetres d'un individu donné.
    -- Paramètres :
    -- 		Ab -- L'Ab qui contient l'ID qu'on va afficher le nombre des ses ancetres.
    -- 		ID -- l'ID qu'on va afficher le nombre des ses ancetres.
    procedure Display_Number_Ancestors (Ab : in T_ABG; ID : in Integer);


    -- Nom 	  : Display_Title_Set.
    -- Semantique : Afficher un message descriptif de l'ensemble affiché sur le terminal.
    -- Paramètres :
    -- 		Generation -- La Génération des ancestres.
    procedure Display_Title_Set (Message : in String; Generation : in Integer);


    -- Nom 	  : Display_Is_Homonym.
    -- Semantique : Afficher Vrai si deux individus n et m ont un ou plusieurs
    --		    ancêtres homonymes, sinon faux.
    -- Paramètres :
    -- 		Is_Homonym -- L'existence des homonymes.
    procedure Display_Is_Homonym (Is_Homonym : in Boolean);


    -- Nom : Afficher_Donnee
    -- Sémantique : Afficher la donnée associée à un identifiant dans le registre
    -- Paramètres :
    -- 		Registre -- L'état civil.
    --		ID 	 -- l'ID de l'individu qu'on cherche à afficher son registre.
    procedure Afficher_Donnee(Registre : in T_Registre; ID : in Integer);


    -- Nom        : Display_ABSENT_TREE_EXCEPTION.
    -- Sémantique : Afficher un message quand une fonction ou procedure lève l'exception ABSENT_TREE_EXCEPTION.
    -- Paramètres :
    -- 		Message -- Le message qui sera afficher.
    procedure Display_ABSENT_TREE_EXCEPTION (Message : in String);


    -- Nom 	  : End_Bar.
    -- Semantique : Afficher la barre de fin d'exécution.
    procedure End_Bar;


end Display_Shell;
