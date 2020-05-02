--------------------------------------------------------------------------------
--  Fichier  : arbre_binaire.ads
--  Auteur   : MOUDDENE Hamza & CAZES Noa
--  Objectif : Test du module Arbre_Binaire.
--  Créé     : Dimanche Nov 25 2019
--------------------------------------------------------------------------------


with Ada.Text_IO;          use Ada.Text_IO;
with Arbre_Binaire;


procedure Test_Arbre_Binaire is


    -- Instantiation du package Arbre_Binaire avec T_DATA comme Entier.
    package AB_Entier is 
            New Arbre_Binaire (T_DATA => Integer);
    use AB_Entier;

    -- gt est la fonction > qui compare deux DATAs.
    --
    -- Param DATA1|2    : Est l'DATA qu'on va comparer.
    --
    -- Return Boolean : retourne True si DATA1 > DATA2, sinon False.
    function gt (DATA1, DATA2: in Integer) return Boolean is
    begin
        return (DATA1 > DATA2);
    end gt;


    procedure Insert is new AB_Entier.Insert (gt);


    -- Initialisation des variables.
    Nb_Donnees : constant Integer := 10; -- Height du tableau DATAs.
    DATAs : constant array (1..Nb_Donnees) of Integer -- DATAs est un tableau 
            := (56, 78, 76, 27, 90, 23, 12, 43, 24, 39);	 -- contenant des DATAs.

	
    -- Initialize un ABR avec 5 puis 3 et 6 ajoutés dans un Tree vDATAe.
    procedure Init (Tree : out T_BT) is
    begin
        Initialize (Tree); -- Créer un Tree vDATAe.
        Insert (Tree, 5);  -- Ajouter 5 à Tree.
        Insert (Tree, 3);  -- Ajouter 3 à Tree.
        Insert (Tree, 6);  -- Ajouter 6 à Tree.
    end Init;


    -- Tester la fonction Is_Empty avec différents arbres.
    procedure Tester_Is_Empty is
        Tree1, Tree2 : T_BT;
    begin
        Initialize (Tree1);
        pragma Assert (Is_Empty (Tree1)); -- Tree1 est vDATAe.
        Insert (Tree1, 12);
        pragma Assert (not Is_Empty (Tree1)); -- Tree1 n'est pas vDATAe.
        Destruct (Tree1);  -- Libérer la mémoire.

        Init (Tree2);
        pragma Assert (not Is_Empty (Tree2)); -- Tree2 n'est pas vDATAe.
        Destruct (Tree2);  -- Libérer la mémoire.
    		
        Put_line("Fonction Tester_Is_Empty est exécutée avec succès.");
        New_Line;
    end Tester_Is_Empty;


    -- Tester la procédure Height avec deux arbres différents.
    procedure Tester_Height is
        Tree1, Tree2 : T_BT;
    begin
        Initialize (Tree1);
        pragma assert (Height (Tree1) = 0); -- Height = 0.
        Insert (Tree1, 99);
        pragma assert (Height ( Tree1) /= 0); -- Height = 1.
        Destruct (Tree1);  -- Libérer la mémoire.

        Init (Tree2);
        pragma Assert (Height (Tree2) = 3); -- Height = 3.
        Insert (Tree2, 33);
        pragma Assert (Height (Tree2) /= 3); -- Height = 4.
        Destruct (Tree2);  -- Libérer la mémoire.
		
        Put_line("Fonction Tester_Height est exécutée avec succès.");
        New_Line;
    end Tester_Height;


    -- Tester la procédure Insert.
    procedure Tester_Insert is
        Tree : T_BT;
    begin
        Init (Tree);
        pragma Assert (not Is_Empty (Tree)); -- Tree n'est pas vDATAe.
        Insert (Tree, 16);
        pragma Assert (not Is_Empty (Tree)); -- Tree n'est pas vDATAe.
        Destruct (Tree); -- Libérer la mémoire.
                
        Put_Line ("Procédure Tester_Insert est exécutée avec succès.");
        New_Line;
    end Tester_Insert;


    -- Initialise l'ABR Tree comme un ABR vDATAe dans lequel ont été insérées
    -- les cles DATAs ci-dessus.
    procedure Construire_Exemple_Arbre (Annuaire : out T_BT) is
    begin
        Initialize (Annuaire);
        pragma Assert (Is_Empty (Annuaire));
        pragma Assert (Height (Annuaire) = 0);
        for i in 1..Nb_Donnees loop
            Insert (Annuaire, DATAs (i));
            pragma Assert (not Is_Empty (Annuaire));
            pragma Assert (Height (Annuaire) = i);
        end loop;
        Destruct (Annuaire);
        pragma Assert (Is_Empty (Annuaire));
        pragma Assert (Height (Annuaire) = 0);
    end Construire_Exemple_Arbre;

	
    procedure Tester_Exemple_Arbre is
        Annuaire : T_BT;
    begin
        Construire_Exemple_Arbre (Annuaire);
        Destruct (Annuaire);
        pragma Assert (Is_Empty (Annuaire));
        pragma Assert (Height (Annuaire) = 0);
		
        Put_Line ("Procédure Tester_Exemple_Arbre est exécutée avec succès.");
        New_Line;
    end Tester_Exemple_Arbre;


begin
    New_Line;
    Put_Line("*************************** Début ****************************");
    New_Line;

    -- Tester la fonction Is_Empty.
    Tester_Is_Empty;

    -- Tester la fonction Height.
    Tester_Height;

    -- Tester la procédure Insert.
    Tester_Insert;
	
    -- Tester la procédure Tester_Exemple_Arbre.
    Tester_Exemple_Arbre;

    New_Line;
    Put_Line("***************************** Fin ****************************");
    New_Line;


end Test_Arbre_Binaire;
