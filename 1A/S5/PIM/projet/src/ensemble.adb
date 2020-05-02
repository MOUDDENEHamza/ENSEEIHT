--------------------------------------------------------------------------------
--  Fichier  : foret.ads
--  Auteur   : MOUDDENE Hamza & CAZES Noa
--  Objectif : Implantation du module Ensemble
--  Crée     : Dimanche Nov 10 2019
--------------------------------------------------------------------------------


with Ada.Text_IO; use Ada.Text_IO;
with Ada.Unchecked_Deallocation;


package body Ensemble is
    
    -- Libérer la mémoire alloué auparavant.
    procedure Free is
            new Ada.Unchecked_Deallocation (T_Cellule, T_Ensemble);


    ----------------------------------Constuctor--------------------------------

    procedure Initialiser (Ensemble : out T_Ensemble) is
    begin
        Ensemble := Null;
    end Initialiser;
	
	
    procedure Copy (E1 : in out T_Ensemble; E2 : in T_Ensemble) is
        Tmp1, Tmp2 : T_Ensemble;
    begin
        if (Est_Vide (E2)) then
            Initialiser (E1);
        else
            Tmp1 := E1;
            Tmp2 := E2;
            while (Tmp2 /= NULL) loop
                Ajouter (Tmp1, Tmp2.all.Element);
                Tmp2 := Tmp2.all.Suivant;
            end loop;
        end if;
    end Copy;
    
    procedure Ajouter (Ensemble : in out T_Ensemble; Element : in T_Element) is
        Nouvelle_Cellule, Temp : T_Ensemble;
    begin
        Nouvelle_Cellule := New T_Cellule'(Element, Null);
        if ( Ensemble = Null) then -- Si l'ensemble est vide.
            Ensemble := Nouvelle_Cellule; --Créer une nouvelle cellule.
        else -- Sinon, on ajoute à la fin de l'ensemble.
            Temp := Ensemble;

            while (Temp.all.Suivant /= Null) loop
              
                Temp := Temp.all.Suivant;
            end loop;
            Temp.all.Suivant := Nouvelle_Cellule; --Créer une nouvelle cellule.;
        end if;
    end Ajouter;
    
    -----------------------------------Getters----------------------------------
	
    -- Obtenir le noeud du pointeur.
    function Get_Element (E : in T_Ensemble) return T_Element is
    begin
        return E.all.Element;
    end Get_Element;
    

    -- Obtenir le pointeur suivant.
    function Get_Next (E : in T_Ensemble) return T_Ensemble is
    begin
        return E.all.Suivant;
    end Get_Next;

    -----------------------------------Setters----------------------------------
	
    -- Changer le noeud du pointeur. 
    procedure Set_Element (E : in T_Ensemble; Element : in T_Element) is
    begin
        E.all.Element := Element;
    end Set_Element;


    -- Changer le pointeur suivant.
    procedure Set_Next (E : in T_Ensemble; Next : in T_Ensemble) is
    begin
        E.all.Suivant := Next;
    end Set_Next;

    ----------------------------------------------------------------------------

    procedure Detruire (Ensemble : in out T_Ensemble) is
    begin
        if (Ensemble /= Null) then
            Detruire (Ensemble.all.Suivant);
            Free (Ensemble);
        else
            null;
        end if;
    end Detruire;


    function Est_Vide (Ensemble : in T_Ensemble) return Boolean is
    begin
        return Ensemble = Null;
    end Est_Vide;


    function Taille (Ensemble : in T_Ensemble) return Integer is
    begin
        if (Ensemble = Null) then
            return 0;
        else
            return 1 + Taille (Ensemble.all.suivant);
        end if;
    end Taille;


    function Est_Present (Ensemble : in T_Ensemble; Element : in T_Element) return Boolean is
        present : Boolean;
        Temp : T_Ensemble;
    begin
        present := False;
        Temp := Ensemble;
        while (Temp /= Null) loop
            if (Temp.all.Element = Element) then
                present := True;
            end if;
            Temp := Temp.all.Suivant;
        end loop;
        return present;
    end Est_Present;
    
    
    -- Modifier un element de l'ensemble.
    procedure Edit_Set (Ensemble : in T_Ensemble; Old_Element, New_Element : in T_Element) is
        Tmp : T_Ensemble;
    begin
        if (Est_Vide (Ensemble)) then
            Null;
        else
            Tmp := Ensemble;
            while (not (Est_Vide (Tmp))) loop
                if (Get_Element (Tmp) = Old_Element) then
                    Set_Element (Tmp, New_Element);
                end if;
                Tmp := Get_Next (Tmp);
            end loop;
        end if;
    end Edit_Set;
        
    
    -- Supprimer un element de l'ensemble.
    procedure Supprimer (Ensemble : in out T_Ensemble; Element : in T_Element) is
        Temp : T_Ensemble;
    begin
        if (Ensemble.all.Element = Element) then
            Temp := Ensemble.all.Suivant;
            Free (Ensemble);
            Ensemble := Temp;
        else
            Supprimer (Ensemble.all.Suivant, Element);
        end if;
    end Supprimer;

    
    procedure Afficher_Ensemble (Ensemble : in T_Ensemble) is
        Temp : T_Ensemble;
    begin
        Temp := Ensemble;
        Put ("[");
        while (Temp /= NULL) loop
            Afficher_Elt (Temp.all.Element);
            if (Taille (Temp) > 1) then
                Put (",");
            end if;
            Temp := Temp.all.Suivant;
        end loop;
        Put_Line ("]");
    end Afficher_Ensemble;
    
    
end Ensemble;
