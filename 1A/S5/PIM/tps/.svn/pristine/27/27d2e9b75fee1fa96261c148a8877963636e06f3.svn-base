-- Implantation d'un module Dates très simplifié.

with Ada.Text_IO;
use  Ada.Text_IO;
with Ada.Integer_Text_IO;
use  Ada.Integer_Text_IO;

package body Dates is

    procedure Initialiser ( Date  : out T_Date  ;
                            Jour  : in  Integer ;
                            Mois  : in  T_Mois  ;
                            Annee : in  Integer ) is
    begin
        Date.Jour := Jour;
        Date.Mois := Mois;
        Date.Annee := Annee;
    end Initialiser;

    -- Afficher un entier sur 2 positons au moins (avec des zéros
    -- supplémentaires si nécessaires)
    --
    -- Paramètres :
    --     Nombre : le nombre à afficher
    --
    -- Nécessite :
    --     Nombre >= 0
    --
    procedure Afficher_Deux_Positions (Nombre : in Integer) with
        Pre => Nombre >= 0
    is
    begin
        Put (Nombre / 10, 1);
        Put (Nombre mod 10, 1);
    end Afficher_Deux_Positions;

    procedure Afficher (Date : in T_Date) is
    begin
        Afficher_Deux_Positions (Date.Jour);
        Put ('/');
        Afficher_Deux_Positions (T_Mois'pos (Date.Mois) + 1);
        Put ('/');
        Afficher_Deux_Positions (Date.Annee / 100);
        Afficher_Deux_Positions (Date.Annee mod 100);
    end Afficher;


    function Le_Jour (Date : in T_Date) return Integer is
    begin
        return Date.Jour;
    end Le_Jour;


    function Le_Mois(Date : in T_Date) return T_Mois is
    begin
        return Date.Mois;
    end Le_Mois;


    function L_Annee (Date : in T_Date) return Integer is
    begin
        return Date.Annee;
    end L_Annee;


end Dates;
