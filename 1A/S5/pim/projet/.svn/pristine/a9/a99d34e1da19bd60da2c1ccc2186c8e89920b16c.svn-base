-- Programme de test du module Arbre_genealogique.


with Ada.Characters.Latin_1;    use Ada.Characters.Latin_1;
with Ada.Text_IO;          	use Ada.Text_IO;
with Arbre_Genealogique;	use Arbre_Genealogique;


procedure Test_Arbre_Genealogique is


    procedure Tester_Creer_Arbre_Minimal is
        Ab : T_ABG;
    begin
        Creer_Arbre_Minimal (Ab, 1);
        pragma assert (Nombre_Ancetres (Ab, 1) = 1);
        Supprimer (Ab, 1);
        
        New_Line;
        Put_Line (ESC & "[32m" & "RÉUSSI : " & ESC & "[0m" & "Procedure Creer_Arbre_Minimal est testée avec succés.");
        New_Line;
    end Tester_Creer_Arbre_Minimal;


    procedure Tester_ajouter_parent is
        Ab : T_ABG;
    begin
        Creer_Arbre_Minimal (Ab, 1);
        pragma assert (Nombre_Ancetres (Ab, 1) = 1);
        ajouter_parent (Ab, 1, 2, 0);
        pragma assert (Nombre_Ancetres (Ab, 1) = 2);
        ajouter_parent (Ab, 1, 3, 1);
        pragma assert (Nombre_Ancetres (Ab, 1) = 3);
        ajouter_parent (Ab, 2, 4, 0);
        pragma assert (Nombre_Ancetres (Ab, 1) = 4);
        ajouter_parent (Ab, 2, 5, 1);
        pragma assert (Nombre_Ancetres (Ab, 1) = 5);
        ajouter_parent (Ab, 3, 6, 0);
        pragma assert (Nombre_Ancetres (Ab, 1) = 6);
        ajouter_parent (Ab, 3, 7, 1);
        pragma assert (Nombre_Ancetres (Ab, 1) = 7);
        ajouter_parent (Ab, 4, 8, 0);
        pragma assert (Nombre_Ancetres (Ab, 1) = 8);
        Supprimer (Ab, 1);
        	
        New_Line;
        Put_Line (ESC & "[32m" & "RÉUSSI : " & ESC & "[0m" & "Procedure ajouter_parent est testée avec succés.");
        New_Line;
    end Tester_ajouter_parent;
	

    procedure Tester_Nombre_Ancetres is
        Ab : T_ABG;
    begin
        Creer_Arbre_Minimal (Ab, 1);
        pragma assert (Nombre_Ancetres (Ab, 1) = 1);
        ajouter_parent (Ab, 1, 2, 0);
        pragma assert (Nombre_Ancetres (Ab, 1) = 2);
        ajouter_parent (Ab, 2, 4, 0);
        pragma assert (Nombre_Ancetres (Ab, 2) = 2);
        Supprimer (Ab, 1);
        	
        New_Line;
        Put_Line (ESC & "[32m" & "RÉUSSI : " & ESC & "[0m" & "Procedure Nombre_Ancetres est testée avec succés.");
        New_Line;
    end Tester_Nombre_Ancetres;


    procedure Tester_Ancetres_N_Generation is
        Ab : T_ABG;
    begin
        Creer_Arbre_Minimal (Ab, 1);
        pragma assert (Nombre_Ancetres (Ab, 1) = 1);
        ajouter_parent (Ab, 1, 2, 0);
        ajouter_parent (Ab, 1, 3, 1);
        Supprimer (Ab, 1);
        
        New_Line;
        Put_Line (ESC & "[32m" & "RÉUSSI : " & ESC & "[0m" & "Procedure Ancetres_N_Generations est testée avec succés.");
        New_Line;
    end Tester_Ancetres_N_Generation;

    procedure Tester_Individus_1_Parent_Connu is
        Ab : T_ABG;
    begin
        Creer_Arbre_Minimal (Ab, 1);
        ajouter_parent (Ab, 1, 2, 0);
        ajouter_parent (Ab, 1, 3, 1);
        ajouter_parent (Ab, 2, 1, 0);
        Supprimer (Ab, 1);
        
        New_Line;
        Put_Line (ESC & "[32m" & "RÉUSSI : " & ESC & "[0m" & "Procedure Individus_1_Parent_Connu est testée avec succés.");
        New_Line;
    end Tester_Individus_1_Parent_Connu;


    procedure Tester_Individus_2_Parent_Connu is
        Ab : T_ABG;
    begin
        Creer_Arbre_Minimal (Ab, 1);
        ajouter_parent (Ab, 1, 2, 0);
        ajouter_parent (Ab, 1, 3, 1);
        ajouter_parent (Ab, 2, 0, 0);
        ajouter_parent (Ab, 2, 1, 0);
        Supprimer (Ab, 1);
        
        New_Line;
        Put_Line (ESC & "[32m" & "RÉUSSI : " & ESC & "[0m" & "Procedure Individus_2_Parent_Connu est testée avec succés.");
        New_Line;
    end Tester_Individus_2_Parent_Connu;

	
    procedure Tester_Ensemble_Feuilles is
        Ab : T_ABG;
    begin
        Creer_Arbre_Minimal (Ab, 1);
        ajouter_parent (Ab, 1, 2, 0);
        ajouter_parent (Ab, 1, 3, 1);
        ajouter_parent (Ab, 2, 4, 0);
        ajouter_parent (Ab, 2, 5, 1);
        Supprimer (Ab, 1);
        
        New_Line;
        Put_Line (ESC & "[32m" & "RÉUSSI : " & ESC & "[0m" & "Procedure Ensemble_Feuilles est testée avec succés.");
        New_Line;
    end Tester_Ensemble_Feuilles;

begin
    New_Line;
    Put_Line("*************************** Début ****************************");
    New_Line;

    -- Tester Creer_Arbre_Minimal.
    Tester_Creer_Arbre_Minimal;
	
    -- Tester Ajouter_Parent.
    Tester_Ajouter_Parent;
	
    -- Tester Nombre_Ancetres.
    Tester_Nombre_Ancetres;

    -- TesterAncetres_N_Generation.
    Tester_Ancetres_N_Generation;
	
    -- Tester Individus_1_Parent_Connu.
    Tester_Individus_1_Parent_Connu;
	
    -- Tester Individus_2_Parent_Connu.
    Tester_Individus_2_Parent_Connu;
	
    -- Tester_Ensemble_Feuilles.
    Tester_Ensemble_Feuilles;

    New_Line;	
    Put_Line("***************************** Fin ****************************");
    New_Line;

end Test_Arbre_Genealogique;
