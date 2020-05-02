-- Programme de test du module Ensemble.


with Ensemble;
with Ada.Text_IO; use Ada.Text_IO;


procedure Test_Ensemble is


    package Ensemble_Caractere is
        -- Instantiation du package Ensemble avec 
        -- T_Element => Character.
        new Ensemble (T_Element => Character);
    use Ensemble_Caractere;


    -- Initialiser un ensemble avec 'A' puis 'B' ajoutés dans l'ensemble vide.
    procedure Init (Ensemble : out T_Ensemble) is
    begin
        Initialiser (Ensemble); -- Créer un ensemble vide.
        Ajouter (Ensemble, 'A'); -- Ajouter A à Ensemble.
        Ajouter (Ensemble, 'B'); -- Ajouter B à Ensemble.
    end Init;


    -- Tester la fonction Est_Vide avec différents Ensembles.
    procedure Tester_Est_Vide is
        E1, E2 : T_Ensemble;
    begin
        Initialiser (E1); -- E1 = {}.
        pragma Assert (Est_Vide (E1)); -- E1 est vide.
        Ajouter (E1, 'C'); -- E1 = {c}.
        pragma Assert (not Est_Vide (E1)); -- E1 n'est pas vide.
		Detruire (E1);  -- Libérer la mémoire.

        Init (E2); -- E2 = {A, B}.
        pragma Assert (not Est_Vide (E2)); -- E2 n'est pas vide.
		Detruire (E2);  -- Libérer la mémoire.
		
		Put_line("Fonction Est_Vide esttestée avec succès.");
		New_Line;
    end Tester_Est_Vide;


    -- Tester la procédure Taille avec deux ensembles différents.
    procedure Tester_Taille is
        E1, E2 : T_Ensemble;
    begin
        Initialiser (E1); -- E1 = {}.
        pragma assert ( Taille ( E1) = 0); -- E1.Taille = 0.
        Ajouter (E1, 'Z'); -- E1 = {Z}.
        pragma assert (Taille ( E1) /= 0); -- E1.Taille = 1.
		Detruire (E1);  -- Libérer la mémoire.

        Init (E2); -- E2 = {A, B}.
		pragma Assert (Taille (E2) = 2); -- E2.Taille = 2.
        Supprimer (E2, 'A'); -- E2 = {B}.
        pragma Assert (Taille (E2) /= 2); -- E2.Taille = 1.
    	Detruire (E2);  -- Libérer la mémoire.
    
		Put_line("Fonction Taille est testée avec succès.");
		New_Line;	
	end Tester_Taille;


    -- Tester la fonction Est_Present avec deux ensembles différents.
    procedure Tester_Est_Present is
        E1, E2 : T_Ensemble;
    begin
        Initialiser (E1); -- E1 = {}.
        pragma assert ( Not Est_Present ( E1, 'A')); -- A n'est pas dans E1.
        Ajouter (E1, 'Z'); -- E1 = {Z}.
        pragma assert ( Est_Present ( E1, 'Z')); -- Z est dans E1.
		Detruire (E1);  -- Libérer la mémoire.

        Init (E2); -- E2 = {A, B}.
        pragma Assert (Est_Present ( E2, 'A') and Est_Present ( E2, 'B')); -- A et B sont dans E2.
        Supprimer (E2, 'A'); -- E2 = {B}.
        pragma Assert (not Est_Present ( E2, 'A') and Est_Present ( E2, 'B')); -- A n'est pas dans E2, B est dans E2.
    	Detruire (E2);  -- Libérer la mémoire.

		Put_line("Fonction Est_Present est testée avec succès.");
		New_Line;
    end Tester_Est_Present;


    -- Tester la procédure Ajouter.     
    procedure Tester_Ajouter is
        E : T_Ensemble;
    begin
        Init (E); -- E = {A, B}.
        pragma Assert (not Est_Vide (E)); -- E n'est pas vide.
        Ajouter (E, 'N'); -- E = {A, B, N}.
        pragma Assert (Est_Present (E, 'N')); -- N est dans E.
        pragma Assert (not Est_Vide (E)); -- E n'est pas vide.
    	Detruire (E); -- Libérer la mémoire.
    
		Put_line("Procédure Ajouter est testée avec succès.");
		New_Line;
	end Tester_Ajouter;

    -- Tester la procédure Supprimer. 
    procedure Tester_Supprimer is
        E : T_Ensemble;
    begin
        Init (E); -- E = {A, B}.
        Supprimer (E, 'A'); -- E = {B}.
        pragma Assert (Est_Present (E, 'O') = False); -- 'O' n'est pas dans E.
        Supprimer (E, 'B'); -- E ={}.
        pragma Assert (Est_Vide (E)); -- E est vide.
    	Detruire (E);  -- Libérer la mémoire.
		
		Put_line("Procédure Supprimer est testée avec succès.");
		New_Line;
    end Tester_Supprimer;

begin
    New_Line;
    Put_Line("*************************** Début ****************************");
    New_Line;

    -- Tester la fonction Est_Vide.
    Tester_Est_Vide;

    -- Tester la fonction Taille.
    Tester_Taille;

    -- Tester la fonction Est_Present.
    Tester_Est_Present;

    -- Tester la procédure Ajouter.
    Tester_Ajouter;

    -- Tester la procédure Supprimer. 
    Tester_Supprimer;

    New_Line;
    Put_Line("***************************** Fin ****************************");
	New_Line;

end Test_Ensemble;

