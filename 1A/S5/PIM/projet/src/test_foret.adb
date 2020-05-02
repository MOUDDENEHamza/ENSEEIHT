-------------------------------------------------------------------------------
--  Fichier  : test_foret.ads
--  Auteur   : MOUDDENE Hamza & CAZES Noa
--  Objectif : Test du module Foret
--  Crée     : Dimanche Déc 12 2019
--------------------------------------------------------------------------------


with Ada.Text_IO; 		use Ada.Text_IO;
with Ada.Characters.Latin_1;    use Ada.Characters.Latin_1;
with Foret; 			use Foret;


procedure Test_Foret is
    
    
    -- Tester la procedure Add_Cohabitant.
    procedure Test_Add_Cohabitant is
    begin
        New_Line;
        Put_Line (ESC & "[32m" & "RÉUSSI : " & ESC & "[0m" & "Procedure Test_Add_Cohabitant est testée avec succès.");
        New_Line;
    end Test_Add_Cohabitant;
    
    
    -- Tester la procedure Add_Half_Brother.
    procedure Test_Add_Half_Brother is
    begin
        New_Line;
        Put_Line (ESC & "[32m" & "RÉUSSI : " & ESC & "[0m" & "Procedure Test_Add_Half_Brother est testée avec succès.");
        New_Line;
    end Test_Add_Half_Brother;
    
    
    -- Tester la fonction Get_Set_Half_Brother.
    procedure Test_Get_Set_Half_Brother is
    begin
        New_Line;
        Put_Line (ESC & "[32m" & "RÉUSSI : " & ESC & "[0m" & "Procedure Test_Get_Set_Half_Brother est testée avec succès.");
        New_Line;
    end Test_Get_Set_Half_Brother;
    
    
begin
    New_Line;
    Put_Line ("********************************* BEGIN *********************************");
    New_Line;
    
    -- Tester la procedure Add_Cohabitant.
    Test_Add_Cohabitant; 

    -- Tester la procedure Add_Half_Brother.
    Test_Add_Half_Brother; 

    -- Tester la procedure Get_Set_Half_Brother.
    Test_Get_Set_Half_Brother;

    New_Line;
    Put_Line ("********************************** END **********************************");
    New_Line;
end Test_Foret;
