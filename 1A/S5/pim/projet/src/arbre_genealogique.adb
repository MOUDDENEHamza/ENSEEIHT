--------------------------------------------------------------------------------
--  Fichier  : display_shell.adb
--  Auteur   : MOUDDENE Hamza & CAZES Noa
--  Objectif : Implantation du module Arbre_Genealogique
--  Crée     : Dimanche Nov 10 2019
--------------------------------------------------------------------------------


with Ada.Text_IO; 		use Ada.Text_IO;
with Alea;
with Display_Shell; 		use Display_Shell;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO.Unbounded_IO;  use Ada.Text_IO.Unbounded_IO;

package body Arbre_Genealogique is 
	
    
    package Mon_Alea is
            new Alea (1000, 9999);  -- Générateur de nombre dans l'intervalle [1000, 9999].
    use Mon_Alea;

--------------------------------------------------------------------------------
    
    -- Afficher un élement d'un ensemble.
    procedure Display_Item (Data : in T_Node) is
    begin
        Put (Integer'Image (Data.ID) & " ");
    end Display_Item;


    -- Afficher un ensemble.
    procedure To_String is new Afficher_Ensemble (Display_Item);
	
--------------------------------------Constuctor--------------------------------
    
    -- Initialiser List.  Tree est List.
    function Initialize_List (List : out T_List) return T_List is
    begin
        for i in 1..10 loop
            List(i) := 0;
        end loop;
        return List;
    end Initialize_List;
    
    
    -- Initialiser un Data.
    procedure Initialize_Data (Data : out T_Node; ID : in Integer) is
    begin
        Data.ID := ID;
    end Initialize_Data;
    

    -- Initialiser un arbre genéalogique. L'arbre est vide.
    procedure Initialize_Genealogical_Tree (Ab : out T_ABG) is
    begin
        Initialize (Ab);
    end Initialize_Genealogical_Tree;
    
------------------------------------Getters-------------------------------------
    
    -- Obtenir l'ID de Node.
    function Get_ID (Ab : in T_ABG) return Integer is
    begin
        return Get_Data (Ab).ID;
    end Get_ID;
    
    
    -- Obtenir la liste des concubains.
    function Get_Cohabitant (Ab : in T_ABG) return T_List is
    begin
        return Get_Data (Ab).Cohabitant;
    end Get_Cohabitant;
    
    
    -- Obtenir l'ensemble des demi-frères.
    function Get_Half_Brother (Ab : in T_ABG) return T_List is
    begin
        return Get_Data (Ab).Half_Brother;
    end Get_Half_Brother;
    
    -- Obtenir l'ensemble des demi-frères.
    function Get_ID_Father (Ab : in T_ABG) return Integer is
    begin
        return Get_ID (Get_Left (Ab));
    end Get_ID_Father;
    
    
    -- Obtenir l'ensemble des demi-frères.
    function Get_ID_Mother (Ab : in T_ABG) return Integer is
    begin
        return Get_ID (Get_Right (Ab));
    end Get_ID_Mother;
    
--------------------------------------------------------------------------------
    
    -- Vérifier si un ID donné est dans l'arbre.
    function Is_Present_ID (Tree : in T_ABG; ID : in Integer) return Boolean is
    begin
        if (Is_Empty (Tree)) then
            return False;
        elsif (Get_ID (Tree) = ID) then
            return True;
        else
            return Is_Present_ID (Get_Left (Tree), ID) or Is_Present_ID (Get_Right (Tree), ID);
        end if;
    end Is_Present_ID;
    
--------------------------------------------------------------------------------
    
    -- Générer un DATA unique.
    function Generate_ID (Ab : in T_ABG) return Integer is
        ID : Integer;
    begin
        loop
            Get_Random_Number (ID);
            exit when not (Is_Present_ID (Ab, ID));
        end loop;
        return ID;                  
    end Generate_ID;
    
--------------------------------------------------------------------------------
    
    -- Obtenir l'ID du fils.
    function Get_Child_ID (Ab : in T_ABG; Parent_ID : in Integer) return Integer is
    begin
        if (Is_Empty (Ab)) then
            return 0;
        else
            if (not (Is_Empty (Get_Left (Ab))) and then Get_ID (Get_Left (Ab)) = Parent_ID) then
                return Get_ID (AB);
            elsif (not (Is_Empty (Get_Right (Ab))) and then Get_ID (Get_Right (Ab)) = Parent_ID) then
                return Get_ID (AB);
            end if;
            return Get_Child_ID (Get_Left (Ab), Parent_ID) + Get_Child_ID (Get_Right (Ab), Parent_ID); 
        end if;
    end Get_Child_ID;  
    
--------------------------------------------------------------------------------
    
    procedure Creer_Arbre_Minimal (Ab : out T_ABG; DATA : in T_Node) is
    begin
        if (Is_Empty (Ab)) then
            Create_Node (Ab, DATA);
        else
            raise ARBRE_NON_VIDE_EXCEPTION;
        end if;
    end Creer_Arbre_Minimal;

--------------------------------------------------------------------------------

    procedure Ajouter_Parent (Ab : in out T_ABG; New_Data : in T_Node; ID, Flag : in Integer) is
    	
        
        procedure Find_Person (Ab : in out T_ABG; ID, Flag : in Integer) is
            L, R: T_ABG;
        begin
            if (Is_Empty (Ab)) then
                Null;
            else
                L := Get_Left (Ab);
                R := Get_Right (Ab);
                if (ID = Get_ID (Ab)) then
                    if ((not Is_empty (L)) and (not Is_empty (R))) then
                        raise DEUX_PARENTS_PRESENTS_EXCEPTION;
                    elsif (Flag = 0) then
                        Create_Node (L, New_Data);
                        Set_Left (Ab, L);   
                    elsif (Flag = 1) then 
                        Create_Node (R, New_Data);
                        Set_Right (Ab, R);
                    end if;
                else
                    Find_Person (L, ID, Flag);
                    Find_Person (R, ID, Flag);
                end if; 
            end if;
        end Find_Person;
	

    begin
        if (Is_Empty (Ab)) then
            raise ARBRE_VIDE_EXCEPTION;
        elsif (not ( Is_Present_ID (Ab, ID))) then
            Raise ID_ABSENT_EXCEPTION;
        else
            Find_Person (Ab, ID, Flag);
        end if;
    end Ajouter_Parent;

--------------------------------------------------------------------------------

    function Nombre_Ancetres (Ab : in T_ABG; ID : in Integer) return Integer is

        
        procedure Get_Sub_Tree (Ab : in T_ABG; DATA_Tree : out T_ABG) is
        begin
            if (Is_Empty (Ab)) then
                Null;
            else
                if (Get_ID (Ab) = ID) then
                    DATA_Tree := Ab;
                else
                    Get_Sub_Tree (Get_Left (AB), DATA_Tree);
                    Get_Sub_Tree (Get_Right (AB), DATA_Tree);
                end if;
            end if;
        end Get_Sub_Tree;
        

        DATA_Tree : T_ABG;
                
          
    begin
        if (Is_Empty (Ab)) then
            raise ARBRE_VIDE_EXCEPTION;
        elsif (not ( Is_Present_ID (Ab, ID))) then
            Raise ID_ABSENT_EXCEPTION;
        else
            Get_Sub_Tree (Ab, DATA_Tree);
            return Height (DATA_Tree);
        end if;
    end Nombre_Ancetres;
	
--------------------------------------------------------------------------------
	
    procedure Ancetres_N_Generation (Ab : in T_ABG; ID, Generation : in Integer) is
	

        procedure Ancestor_N_Generation (Ab : in T_ABG; E : in out T_Ensemble; Generation : in Integer) is
        begin
            if (Is_Empty (Ab)) then
                Null;
            elsif (Generation = 0 and not (Is_Empty (Ab))) then
                Ajouter (E, Get_data (Ab));
            else
                Ancestor_N_Generation (Get_Left (Ab), E, Generation - 1);
                Ancestor_N_Generation (Get_Right (Ab), E, Generation - 1);
            end if;
        end Ancestor_N_Generation;
	

        procedure Find_Person (Ab : in T_ABG; E : in out T_Ensemble; ID, Generation : in Integer) is
        begin
            if (Is_Empty (Ab)) then
                Null;
            else
                if (ID = Get_ID (Ab)) then
                    Ancestor_N_Generation (Ab, E, Generation);
                else
                    Find_Person (Get_Left (AB), E, ID, Generation);
                    Find_Person (Get_Right (AB), E, ID, Generation);
                end if;
            end if;
        end Find_Person;
	
        
        E : T_Ensemble;
	
    begin
        if (Is_Empty (Ab)) then
            raise ARBRE_VIDE_EXCEPTION;
        elsif (not ( Is_Present_ID (Ab, ID))) then
            Raise ID_ABSENT_EXCEPTION;
        else
            Initialiser (E);
            find_person (Ab, E, ID, Generation);
            Display_Title_Set ("L'ensemble des ancetres à ", Generation);
            To_String (E);
            Detruire (E);
        end if;
    end Ancetres_N_Generation;
	
--------------------------------------------------------------------------------

    procedure Afficher_Arbre_Noeud (Ab : in T_ABG; ID : in Integer) is
	

        procedure Indenter(Decalage : in Integer) is
        begin
            for i in 1..Decalage loop
                Put (' ');
            end loop;
        end Indenter;


        procedure Afficher_Profondeur (Ab : in T_ABG ; Profondeur : in Integer ; Cote : in String) is
        begin
            if (Is_Empty (Ab)) then
                Null;
            else
                Indenter (Profondeur * 4);
                Put (Cote);
                Put (Integer'Image (Get_ID (Ab)));
                New_Line;
                Afficher_Profondeur (Get_Left (Ab), Profondeur + 1, "-- père :");
                Afficher_Profondeur (Get_Right (Ab), Profondeur + 1, "-- mère :");
            end if;
        end Afficher_Profondeur;


        procedure Afficher_Generations (Ab : in T_ABG) is
        begin
            New_Line;
            for i in 1..depth(Ab) loop
                Put (Integer'Image(i - 1));
                Indenter(4);
            end loop;
            Put_Line ("Generation");
            for i in 0..depth (Ab) loop
                Put ("---------");
            end loop;
            New_Line;
        end Afficher_Generations;

        
        procedure Get_Sub_Tree (Ab : in T_ABG; DATA_Tree : out T_ABG) is
        begin
            if (Is_Empty (Ab)) then
                Null;
            else
                if (ID = Get_ID (Ab)) then
                    DATA_Tree := Ab;
                else
                    Get_Sub_Tree (Get_Left (AB), DATA_Tree);
                    Get_Sub_Tree (Get_Right (AB), DATA_Tree);
                end if;
            end if;
        end Get_Sub_Tree;
        

        DATA_Tree : T_ABG;
        
    begin
        if (Is_Empty (Ab)) then
            Null;
        else           
            Get_Sub_Tree (Ab, DATA_Tree);
            Afficher_Generations (DATA_Tree);
            Afficher_Profondeur (DATA_Tree, 0, "");
        end if;
    end Afficher_Arbre_Noeud;
	
--------------------------------------------------------------------------------

    procedure Supprimer (Ab : in out T_ABG; ID : in Integer) is
        
        
        procedure Get_Sub_Tree (Ab : in out T_ABG) is
            L, R : T_ABG;
        begin
            if (Is_Empty (Ab)) then
                Null;
            else
                L := Get_Left (Ab);
                R := Get_Right (Ab);
                if ((not (Is_Empty (L))) and then (ID = Get_ID (L))) then
                    Destruct (L);
                    Set_Left (Ab, L);
                elsif ((not (Is_Empty (R))) and then (ID = Get_ID (R))) then
                    Destruct (R);
                    Set_Right (Ab, R);
                else
                    Get_Sub_Tree (L);
                    Get_Sub_Tree (R);
                end if;
            end if;
        end Get_Sub_Tree;
     
        
    begin
        if (Is_Empty (Ab)) then
            raise ARBRE_VIDE_EXCEPTION;
        elsif (not ( Is_Present_ID (Ab, ID))) then
            Raise ID_ABSENT_EXCEPTION;
        else
            Get_Sub_Tree (Ab);
        end if;
    end Supprimer;

--------------------------------------------------------------------------------

    procedure Individus_1_Parent_Connu (Ab : in T_ABG) is
		

        procedure Person_1_Parent (Ab : in T_ABG; E : in out T_Ensemble) is
        begin
            if (Is_Empty (Ab)) then
                Null;
            else
                if (not (Is_Empty (Get_Left (AB))) and  Is_empty (Get_Right (AB))) then
                    Ajouter (E, Get_Data (Ab));
                elsif (Is_empty (Get_Left (AB)) and (not (Is_empty (Get_Right (AB))))) then
                    Ajouter (E, Get_Data (Ab));
                end if;
                Person_1_Parent (Get_Left (AB), E);
                Person_1_Parent (Get_Right (AB), E);
            end if;
        end Person_1_Parent;

        
        E : T_Ensemble;
                
           
    begin
        if (Is_Empty (Ab)) then
            raise ARBRE_VIDE_EXCEPTION;
        else
            Initialiser (E);
            Person_1_Parent (Ab, E);
            Display_Title_Set ("L'ensemble des individus qui n'ont qu'un parent connu", -1);
            To_String (E);
            Detruire (E);
        end if;
    end Individus_1_Parent_Connu; 
	
--------------------------------------------------------------------------------

    procedure Individus_2_Parent_Connu (Ab : in T_ABG) is

		
        procedure Person_2_Parent (Ab : in T_ABG; E : in out T_Ensemble) is
        begin
            if (Is_Empty (Ab)) then
                Null;
            elsif (not (Is_Empty (Get_Left (Ab))) and not(Is_Empty (Get_Right (Ab)))) then
                Ajouter (E, GeT_Data (Ab));
            else
                Person_2_Parent (Get_Left (Ab), E);
                Person_2_Parent (Get_Right (Ab), E);
            end if;
        end Person_2_Parent;
	
        
        E : T_Ensemble;
        
    begin
        if (Is_Empty (Ab)) then
            raise ARBRE_VIDE_EXCEPTION;
        else
            Initialiser (E);
            Person_2_Parent (Ab, E);
            Display_Title_Set ("L'ensemble des individus qui ont les deux parents connus", -1);
            To_String (E);
            Detruire (E);
        end if;
    end Individus_2_Parent_Connu;

--------------------------------------------------------------------------------

    procedure Ensemble_Feuilles (Ab : in T_ABG) is
	        
		
        procedure Person_0_Parent (Ab : in T_ABG; E : in out T_Ensemble) is
        begin 
            if (Is_Empty (Ab)) then
                Null;
            elsif (Is_Empty (Get_Left (Ab)) and Is_Empty (Get_Right (Ab))) then
                Ajouter (E, GeT_Data (Ab));
            else
                Person_0_Parent (Get_Left (Ab), E);
                Person_0_Parent (Get_Right (Ab), E);
            end if;
        end Person_0_Parent;
    
    
        E : T_Ensemble;
        
        
    begin
        if (Is_Empty (Ab)) then
            raise ARBRE_VIDE_EXCEPTION;
        else
            Initialiser (E);
            Person_0_Parent (Ab, E);
            Display_Title_Set ("L'ensemble des indivDATAus qui n'ont aucun parent connu", -1);
            To_String (E);
            Detruire (E);
        end if;
    end Ensemble_Feuilles;

--------------------------------------------------------------------------------
    
    -- Identifier les ancêtres d'un indivDATAu donné sur N generations données par un noeud donné.
    procedure Ancetres_Sur_N_Generation (Ab : in T_ABG; ID, Generation : in Integer) is
        
        
        procedure Ancestor_N_Generation (Ab : in T_ABG; E : in out T_Ensemble; Generation : in Integer) is
        begin
            if (Is_Empty (Ab)) then
                Null;
            elsif (Generation >= 0 and not (Is_Empty (Ab))) then
                Ajouter (E, GeT_Data (Ab));
            else
                Ancestor_N_Generation (Get_Left (Ab), E, Generation - 1);
                Ancestor_N_Generation (Get_Right (Ab), E, Generation - 1);
            end if;
        end Ancestor_N_Generation;
	

        procedure Find_Person (Ab : in T_ABG; E : in out T_Ensemble; ID, Generation : in Integer) is
        begin
            if (Is_Empty (Ab)) then
                Null;
            else
                if (ID = Get_ID (Ab)) then
                    Ancestor_N_Generation (Ab, E, Generation);
                else
                    Find_Person (Get_Left (AB), E, ID, Generation);
                    Find_Person (Get_Right (AB), E, ID, Generation);
                end if;
            end if;
        end Find_Person;
	
        
        E : T_Ensemble;
        
        
    begin
        Initialiser (E);
        find_person (Ab, E, ID, Generation);
        Display_Title_Set ("L'ensemble des ancetres sur", Generation);
        To_String (E);
    end Ancetres_Sur_N_Generation;

--------------------------------------------------------------------------------
    
    -- Vérifier que deux individus n et m ont un ou plusieurs ancêtres homonymes (mêmes non et prénom).
    function Ancetres_Homonymes (Ab1, Ab2 : in T_ABG; R : in T_Registre; ID1, ID2 : in Integer) return Boolean is
        
        
        procedure Get_Sub_Tree (Ab : in T_ABG; DATA_Tree : out T_ABG; ID : in Integer) is
        begin
            if (Is_Empty (Ab)) then
                Null;
            else
                if (ID = Get_ID (Ab)) then
                    DATA_Tree := Ab;
                else
                    Get_Sub_Tree (Get_Left (AB), DATA_Tree, ID);
                    Get_Sub_Tree (Get_Right (AB), DATA_Tree, ID);
                end if;
            end if;
        end Get_Sub_Tree;
        
        
        function Compare_DATA_Tree (ID : in Integer; Tmp2 : in T_ABG; R : in T_Registre) return Boolean is
        begin
            if (Is_Empty (Tmp2)) then
                return False;
            else   
                Put_Line (Get_Last_Name (La_Donnee_R (R, ID)) & Get_Last_Name (La_Donnee_R (R, Get_ID (Tmp2))));
                if (Get_Last_Name (La_Donnee_R (R, ID)) = Get_Last_Name (La_Donnee_R (R, Get_ID (Tmp2))) and 
                            Get_First_Name (La_Donnee_R (R, ID)) = Get_First_Name (La_Donnee_R (R, Get_ID (Tmp2))))  then
                    return True;
                else
                    return False or Compare_Data_Tree (ID, Get_Left (Tmp2), R) or Compare_Data_Tree (ID, Get_Right (Tmp2), R);
                end if;
            end if;
        end Compare_DATA_Tree;
            
            
        procedure homonym_research (Tmp1, Tmp2 : in T_ABG; R : in T_Registre; Res : in out Boolean) is
        begin
            if (Is_Empty (Tmp1)) then
                Null;
            else
                Res := Res or Compare_Data_Tree (Get_ID (Tmp1), Tmp2, R);
                homonym_research (Get_Left (Tmp1), Tmp2, R, Res);
                homonym_research (Get_Right (Tmp1), Tmp2, R, Res);
                Put_Line (boolean'Image(RES));
            end if;
        end homonym_research;
        
        
        Tmp1, Tmp2 : T_ABG;
        Res : Boolean;
        
        
    begin
        Res := False;
        Get_Sub_Tree (Ab1, Tmp1, ID1);
        Get_Sub_Tree (Ab2, Tmp2, ID2);
        homonym_research (Tmp1, Tmp2, R, Res);
        return Res;
    end Ancetres_Homonymes;

--------------------------------------------------------------------------------

end Arbre_Genealogique;
