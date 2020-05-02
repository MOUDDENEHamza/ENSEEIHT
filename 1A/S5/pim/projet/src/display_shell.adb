-------------------------------------------------------------------------------
--  Fichier  : display_shell.adb
--  Auteur   : MOUDDENE Hamza & CAZES Noa
--  Objectif : Implantation du module Display_Shell
--  Crée     : Dimanche Nov 25 2019
--------------------------------------------------------------------------------


with Ada.Text_IO; 	  	use Ada.Text_IO;
with Ada.Characters.Latin_1; 	use Ada.Characters.Latin_1;
with Ada.Strings.Unbounded; 	use Ada.Strings.Unbounded;
with Ada.Text_IO.Unbounded_IO;  use Ada.Text_IO.Unbounded_IO;


-- RED ESC & "[31m"
-- GREEN ESC & "[32m"
-- BLUE ESC & "[34m"
-- RESET ESC & "[0m"


package body Display_Shell is


    -- Afficher la barre d'initialisation.
    procedure Init_Bar is
    begin
        New_Line;
        Put_Line ("*****************************************************************************************************");
        New_Line;
        Put_Line ("                                           " & ESC & "[32m" & "ARBRE GÉNÉALOGIQUE" & ESC & "[0m");
        New_Line;
        Put_Line ("*****************************************************************************************************");
        New_Line;
        Put_Line ("Téléchargement programme ...");
        New_Line;
    end Init_Bar;


    -- Afficher le menu principal.
    procedure Display_Menu is
    begin
        New_Line;
        Put_Line ("                                           MENU PRINCIPAL");
        New_Line;
        Put_Line (ESC & "[31m" & "0)-  Pour quitter" & ESC & "[0m");
        Put_Line (ESC & "[34m" & "1)-  Créer un arbre minimal");
        Put_Line ("2)-  Ajouter un parent");
        Put_Line ("3)-  Obtenir le nombre d'ancêtres");
        Put_Line ("4)-  Obtenir l'ensemble des ancêtres situés à une certaine génération");
        Put_Line ("5)-  Afficher l'arbre génealogqiue");
        Put_Line ("6)-  Supprimer l'arbre généalogique");
        Put_Line ("7)-  Obtenir l'ensemble des individus qui n'ont qu'un parent connu");
        Put_Line ("8)-  Obtenir l'ensemble des individus dont les deux parents sont connus");
        Put_Line ("9)-  Obtenir l'ensemble des individus dont les deux parents sont inconnus");
        Put_Line ("10)- Identifier les ancêtres sur n générations données");
        Put_Line ("11)- Vérifier que deux individus n et m ont un ou plusieurs ancêtres homonymes");
        Put_Line ("12)- Obtenir l'ensemble des demi-frères");
        Put_Line ("13)- Obtenir l'ensemble des conjoints" & ESC & "[0m");
        New_Line;
    end Display_Menu;


    -- Afficher une erreur quand l'arbre existe déja dans la foret.
    procedure Display_TREE_IN_FOREST is
    begin
        New_Line;
        Put_Line (ESC & "[31m" & "ÉCHOUÉ :" & ESC & "[0m" & " L'ID entré est dèja racine d'un arbre existant dans la foret.");
    end Display_TREE_IN_FOREST;


    -- Afficher un message quand une fonction ou procedure lève une exception.
    procedure Display_Exception (Message : in String; Restart : in Integer) is
    begin
        New_Line;
        Put_Line (ESC & "[31m" & "ÉCHOUÉ : " & ESC & "[0m" & Message);
        New_Line;
        if (Restart = 0) then
            Put_Line ("Réessayez encore une fois avec un autre ID.");
        else
            Put_Line ("Retour au menu principal.");
        end if;
    end Display_Exception;


    -- Afficher un message quand l'exéctuion d'une procédure ou fonction réussit.
    procedure Display_Success (Message : in String) is
    begin
        New_Line;
        Put_Line (ESC & "[32m" & "RÉUSSI : " & ESC & "[0m" & Message & " est exécutée avec succés.");
        New_Line;
        Put_Line ("Retour au menu principal");
    end Display_Success;


    -- Afficher un message quand la création de l'arbre minimal réussi.
    procedure Display_Success_Minimal_Tree_Ceation is
    begin
        New_Line;
        Put_Line (ESC & "[32m" & "RÉUSSI : " & ESC & "[0m" & "La création d'arbre minimal est exécutée avec succés.");
        New_Line;
        Put_Line ("Retour au menu principal");
    end Display_Success_Minimal_Tree_Ceation;


    -- Afficher un message quand creer arbre minimal lève l'exception ARBRE_NON_VIDE_EXCEPTION.
    procedure Display_ARBRE_NON_VIDE_EXCEPTION is
    begin
        New_Line;
        Put_Line (ESC & "[31m" & "ÉCHOUÉ :" & ESC & "[0m" & " L'arbre passé en paramètre n'est pas vide. L'opération Créer un arbre minimal a échoué.");
        New_Line;
        Put_Line ("Retour au menu principal");
    end Display_ARBRE_NON_VIDE_EXCEPTION;


    -- Afficher un message quand ajouter parent réussit.
    procedure Display_Success_Add_Parent is
    begin
        New_Line;
        Put_Line (ESC & "[32m" & "RÉUSSI : " & ESC & "[0m" & "Ajout du parent est fait avec succés.");
        New_Line;
        Put_Line ("Retour au menu principal");
    end Display_Success_Add_Parent;


    -- Afficher un message quand ajouter parent lève l'exception ARBRE_VIDE_EXCEPTION.
    procedure Display_ARBRE_VIDE_EXCEPTION (Message : in String; Restart : in Integer) is
    begin
        New_Line;
        Put_Line (ESC & "[31m" & "ÉCHOUÉ : " & ESC & "[0m" & "L'arbre passé en paramètre est vide. " & Message);
        New_Line;
        if (Restart = 0) then
            Put_Line ("Réessayez encore une fois avec un autre ID.");
        else
            Put_Line ("Retour au menu principal.");
        end if;
    end Display_ARBRE_VIDE_EXCEPTION;


    -- Afficher un message quand ajouter parent lève l'exception DEUX_PARENTS_PRESENTS_EXCEPTION.
    procedure Display_DEUX_PARENTS_PRESENTS_EXCEPTION is
    begin
        New_Line;
        Put_Line (ESC & "[31m" & "ÉCHOUÉ : " & ESC & "[0m" & "L'individu a déjà deux parents. L'ajout du parent a échoué.");
        New_Line;
        Put_Line ("Réessayez encore une fois avec un autre ID.");
    end Display_DEUX_PARENTS_PRESENTS_EXCEPTION;


    -- Afficher un message quand ajouter parent lève l'exception ID_ABSENT_EXCEPTION.
    procedure Display_ID_ABSENT_EXCEPTION (Message : in String; Restart : in Integer) is
    begin
        New_Line;
        Put_Line (ESC & "[31m" & "ÉCHOUÉ : " & ESC & "[0m" & "l'ID que vous avez entré n'existe pas. " & Message);
        New_Line;
        if (Restart = 0) then
            Put_Line ("Réessayez encore une fois avec un autre ID.");
        else
            Put_Line ("Retour au menu principal.");
        end if;
    end Display_ID_ABSENT_EXCEPTION;


    -- Afficher le nombre d'ancetres d'un individu donné.
    procedure Display_Number_Ancestors (Ab : in T_ABG; ID : in Integer) is
    begin
        New_Line;
        Put_Line ("L'individu qui a l'ID" & ESC & "[32m" & Integer'Image (ID) & ESC & "[0m" & " a" & ESC & "[31m" & Integer'Image(Nombre_Ancetres (Ab, ID)) & ESC & "[0m" &  " ancetres.");
        New_Line;
        Put_Line ("Retour au menu principal.");
    end Display_Number_Ancestors;


    -- Afficher un message descriptif de l'ensemble affiché sur le terminal.
    procedure Display_Title_Set (Message : in String; Generation : in Integer) is
    begin
        if (Generation = -1) then
            New_Line;
            Put (Message & " est : ");
        else
            New_Line;
            Put (Message & Integer'Image (Generation) & " géneration est : ");
        end if;
    end Display_Title_Set;


    -- Afficher Vrai si deux individus n et m ont un ou plusieurs ancêtres
    -- homonymes, sinon faux.
    procedure Display_Is_Homonym (Is_Homonym : in Boolean) is
    begin
        New_Line;
        if (Is_Homonym) then
            Put_Line (ESC & "[32m" & "Vrai : " & ESC & "[0m" & "Il existe des ancetres homonymes entre les deux individus");
        else
            Put_Line (ESC & "[31m" & "Faux : " & ESC & "[0m" & "Il n'existe pas des ancetres homonymes entre les deux individus");
        end if;
    end Display_Is_Homonym;


    -- Afficher la donnée associée à un identifiant dans le registre.
    procedure Afficher_Donnee(Registre : in T_Registre ; Id : in Integer) is
        Donnee : T_Donnee;
    begin
        Donnee := La_Donnee_R(Registre,Id);
        Put_Line ("Nom : " & Get_Last_Name (Donnee));
        Put_Line ("Prénom : " & Get_First_Name (Donnee));
        Put_Line ("Date de Naissance : " & Integer'Image(Get_Birthday_Day (Donnee)) & "/" & Integer'Image(Get_Birthday_Month (Donnee)) & "/" & Integer'Image(Get_Birthday_Year (Donnee)));
        Put_Line ("Lieu de Naissance : " & Get_Birthplace (Donnee));
        Put_Line ("Date de Décès : " & Integer'Image(Get_Deathday_Day (Donnee)) & "/" & Integer'Image(Get_Deathday_Month (Donnee)) & "/" & Integer'Image(Get_Deathday_Year (Donnee)));
        Put_Line ("Lieu de Décès : " & Get_Deathplace (Donnee));
        Put_Line ("Sexe : " & Character'Image (Get_Sex (Donnee)));
        Put_Line ("Email : " &  Get_Email (Donnee));
        Put_Line ("Numéro de téléphone : " & Integer'Image (Get_Tel (Donnee)));
    end Afficher_Donnee;


    procedure Display_ABSENT_TREE_EXCEPTION (Message : in String) is
    begin
        New_Line;
        Put_Line (ESC & "[31m" & "ÉCHOUÉ : " & ESC & "[0m" & "L'arbre n'existe pas. " & Message & " a échoué.");
        New_Line;
        Put_Line ("Retour au menu principal.");
    end Display_ABSENT_TREE_EXCEPTION;


    -- Afficher la barre de fin d'exécution.
    procedure End_Bar is
    begin
        New_Line;
        Put_Line ("À bientôt!");
        New_Line;
        Put_Line ("                                           " & ESC & "[32m" & "FIN D'EXÉCTUTION" & ESC & "[0m");
        New_Line;
        Put_Line ("*****************************************************************************************************");
        New_Line;
    end End_Bar;


end Display_Shell;
