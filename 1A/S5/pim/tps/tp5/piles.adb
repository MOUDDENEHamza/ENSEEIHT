-- Implantation du module Piles.

with Ada.Text_IO;  use Ada.Text_IO;
    --// Ce module est nécessaire parce qu'on a ajouté le SP Afficher.

package body Piles is


    procedure Initialiser (Pile : out T_Pile) is
    begin
        Pile.Taille := 0;
    end Initialiser;


    function Est_Vide (Pile : in T_Pile) return Boolean is
    begin
        return Pile.Taille = 0;
    end Est_Vide;


    function Est_Pleine (Pile : in T_Pile) return Boolean is
    begin
        return Pile.Taille >= Capacite;
    end Est_Pleine;


    function Sommet (Pile : in T_Pile) return T_Element is
    begin
        return Pile.Elements (Pile.Taille);
    end Sommet;


    procedure Empiler (Pile : in out T_Pile; Element : in T_Element) is
    begin
        Pile.Taille := Pile.Taille + 1;
        Pile.Elements (Pile.Taille) := Element;
    end Empiler;


    procedure Depiler (Pile : in out T_Pile) is
    begin
        Pile.Taille := Pile.Taille - 1;
    end Depiler;


    procedure Afficher (Pile : in T_Pile) is
    begin
        Put ('[');
        if not Est_Vide (Pile) then
            Put (' ');
            Afficher_Element (Pile.Elements (1));
            for I in 2..Pile.Taille loop
                Put (", ");
                Afficher_Element (Pile.Elements (I));
            end loop;
        else
            Null;
        end if;
        Put (" >");
    end Afficher;


end Piles;
