-------------------------------------------------------------------------------
--  Fichier  : foret.adb
--  Auteur   : MOUDDENE Hamza & CAZES Noa
--  Objectif : Implantation du module Foret
--  Crée     : Jeudi Déc 12 2019
--------------------------------------------------------------------------------


with Ada.Text_IO; 		use Ada.Text_IO;

        
package body Foret is
    
    
    ----------------------------------Constuctor--------------------------------
    
    -- Initialiser Forest.  Forest est vide.
    procedure Initialize_Forest (F : out Forest) is
    begin
        Initialiser (F);
    end Initialize_Forest;
    
    
    -- Ajouter un Arbre dans la Forest.
    procedure Add_To_Forest (F : in out Forest; Ab : in T_ABG) is
    begin
        Ajouter (F, Ab);
    end Add_To_Forest;
    
    ----------------------------------------------------------------------------
    
    -- Vérifier si une foret donnée est vide.
    function Is_Empty_Forest (F : in Forest) return Boolean is
    begin
        return (Est_Vide (F));
    end Is_Empty_Forest;
    
    ----------------------------------------------------------------------------
    
    -- Vérifier si un arbre est dans la foret.
    function Is_Present_Forest (F : in Forest; ID : Integer) return Boolean is
        tmp : Forest;
    begin
        if (Is_Empty_Forest (F)) then
            return False;
        else
            Tmp := F;
            while (not (Is_Empty_Forest (Tmp))) loop
                if (Get_ID (Get_Element (Tmp)) = ID) then
                    return True;
                end if;
                Tmp := Get_Next (Tmp);
            end loop;
        end if;
        return False;
    end Is_Present_Forest;
    
    ----------------------------------------------------------------------------
    
    -- Trouver un ID dans la foret.
    procedure Find_Tree (F : in Forest; Ab : out T_ABG; ID : in Integer) is
        Tmp : Forest;
    begin
        if (Est_Vide (F)) then
            raise ABSENT_TREE_EXCEPTION;
        else
            Tmp := F;
            while (not (Est_Vide (Tmp))) loop
                if (Get_ID (Get_Element (Tmp)) = ID) then
                    Ab := Get_Element (Tmp);
                end if;
                Tmp := Get_Next (Tmp);
            end loop;
        end if;
    end Find_Tree;
    
    ----------------------------------------------------------------------------
    
    -- Mettre à jour la foret.
    procedure Update_Forest (F : in Forest; Old_Ab, New_Ab : in T_ABG) is
    begin
        Edit_Set (F, Old_Ab, New_Ab);
    end Update_Forest;
    
    ----------------------------------------------------------------------------
    
    -- Supprimer un arbre de la foret.
    procedure Remove_Tree (F : in out Forest; Ab : in T_ABG) is
    begin
        Supprimer (F, Ab);
    end Remove_Tree;
    
    ----------------------------------------------------------------------------

    -- Ajouter un concubain à un individu donné.
    procedure Get_Set_Cohabitant (F : in out Forest; ID, Child_ID : in Integer) is
        Tmp : Forest;
    begin
        if (Is_Empty_Forest (F)) then
            Null;
        else
            Tmp := F;
            while (not (Is_Empty_Forest (Tmp))) loop
                if (not (Is_Present_ID (Get_Element (F), Child_ID))) then
                    Tmp := Get_Next (Tmp);
                elsif ((Is_Present_ID (Get_Element (F), Child_ID))  and get_Child_ID (Get_Element(F), get_ID (Get_Element(F))) /= Child_ID and
                      ID /= get_ID (Get_Element(F))) then
                    Put (Integer'Image (get_ID (Get_Element(F))) & " ");
                    Tmp := Get_Next (Tmp);
                end if;
            end loop;
        end if;
    end Get_Set_Cohabitant;
  
    ----------------------------------------------------------------------------
    
    -- Obtenir l'ensemble des demis frères et demie-soeur d'un individu donné.
    procedure Get_Set_Half_Brother (F : in Forest; ID, Father_ID, Mother_ID : in Integer) is  
        Tmp : Forest;
    begin
        if (Is_Empty_Forest (F)) then
            Null;
        else
            Tmp := F;
            while (not (Is_Empty_Forest (Tmp))) loop
                if (not (Is_Present_ID (Get_Element (F), Father_ID)) and (not (Is_Present_ID (Get_Element (F), Mother_ID)))) then
                    Tmp := Get_Next (Tmp);
                elsif ((Is_Present_ID (Get_Element (F), Father_ID))  and get_Child_ID (Get_Element(F), Father_ID) /= ID) then
                    Put (Integer'Image (get_Child_ID (Get_Element(F),Father_ID)) & " ");
                    Tmp := Get_Next (Tmp);
                elsif ((Is_Present_ID (Get_Element (F), Mother_ID))  and get_Child_ID (Get_Element(F), Mother_ID) /= ID) then
                    Put (Integer'Image (get_Child_ID (Get_Element(F), Mother_ID)) & " ");
                    Tmp := Get_Next (Tmp);
                end if;
            end loop;
        end if;
    end Get_Set_Half_Brother;

    ----------------------------------------------------------------------------
    
    -- Détruire Forest.  Forest est vide.
    procedure Destruct_Forest (F : in out Forest) is
    begin
        Detruire (F);
    end Destruct_Forest;


end Foret;
