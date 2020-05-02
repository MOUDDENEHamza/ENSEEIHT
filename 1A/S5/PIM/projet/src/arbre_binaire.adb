--------------------------------------------------------------------------------
--  Fichier  : arbre_binaire.adb
--  Auteur   : MOUDDENE Hamza & CAZES Noa
--  Objectif : Implantation du module Arbre_Binaire.
--  Créé     : Dimanche Nov 25 2019
--------------------------------------------------------------------------------
 

with Ada.Unchecked_Deallocation;


package body Arbre_Binaire is


    ----------------------------------Constuctor--------------------------------

    -- Initialiser Tree.  Tree est vide.
    procedure Initialize (Tree: out T_BT) is
    begin
        Tree := Null;
    end Initialize;

    -----------------------------------Getters----------------------------------

    -- Obtenir à l'DATA de la racine de Tree.
    function Get_Data (Tree : in T_BT) return T_DATA is
    begin
        return Tree.all.Data;
    end Get_DATA;


    -- Obtenir à le sous arbre gauche de Tree.
    function Get_Left (Tree : in T_BT) return T_BT is
    begin
        return Tree.all.Left;
    end Get_Left;


    -- Obtenir à le sous arbre droit de Tree.
    function Get_Right (Tree : in T_BT) return T_BT is
    begin
        return Tree.all.Right;
    end Get_Right;

    -----------------------------------Setters----------------------------------

    -- Modifier l'DATA de la racine de Tree.
    procedure Set_Data (Tree : in T_BT; Data : in T_DATA) is
    begin
        Tree.all.Data := Data;
    end Set_DATA;

    -- Modifier le sous arbre gauche de Tree.
    procedure Set_Left (Tree, Left : in T_BT) is
    begin
        Tree.all.Left := Left;
    end Set_Left;

    -- Modifier le sous arbre droit de Tree.
    procedure Set_Right (Tree, Right : in T_BT) is
    begin
        Tree.all.Right := Right;
    end Set_Right;

    ----------------------------------------------------------------------------

    -- Libérer la mémoire.
    procedure Free is
            new Ada.Unchecked_Deallocation (Object => T_Node, Name => T_BT);

	
    -- Est-ce qu'un Tree est vDATAe ?
    function Is_Empty (Tree : T_BT) return Boolean is
    begin
        return (Tree = Null);
    end Is_Empty;

	
    -- Obtenir le nombre d'éléments d'un Tree.
    function Height (Tree : in T_BT) return Integer is
    begin
        if Is_Empty (Tree) then
            return 0;
        else
            return 1 + Height (Tree.all.Left) + Height (Tree.all.Right);
        end if;
    end Height;


    -- Vérifier qu'un DATA passé en paramètre est dans l'arbre.
    function Is_Present (Tree : in T_BT; DATA : in T_DATA) return Boolean is 
    begin 
        if (Is_Empty (Tree)) then
            return False;
        elsif (Get_DATA (Tree) = DATA) then
            return True;
        else
            return Is_Present (Get_Left (Tree), DATA) or Is_Present (Get_Right (Tree), DATA);
        end if;
    end Is_Present;

    
    -- Obtenir la profondeur d'un Tree.
    function Depth (Tree : in T_BT) return Integer is
		
        
        -- Nom : max
        -- Sémantique : Obtenir le max de deux entiers.
        -- Paramètres : 
        --    a      -- L'élement qu'on va comparer avec b.
        --    b      -- L'élement qu'on va comparer avec a. 	
        function max (a, b : in Integer) return Integer is
        begin 
            if (a > b) then
                return a;
            else 
                return b;
            end if;
        end max;
	
	
    begin
        if (Is_Empty (Tree)) then
            return 0;
        else
            return 1 + max (depth (Get_Left (Tree)), depth (Get_Right (Tree)));
        end if;
    end Depth;


    -- Créer un arbre avec un seul noeud.
    procedure Create_Node (Node : out T_BT; DATA : T_DATA) is
    begin
        Node := New T_Node'(DATA, Null, Null);
    end Create_Node;
	

    -- Insérer un DATA associé à un nouveau noeud dans Tree.
    procedure Insert (Tree : in out T_BT ; DATA : T_DATA) is
    begin
        if (Is_Empty(Tree)) then 
            Create_Node (Tree, DATA); 
        elsif (Tree.all.DATA = DATA) then
            raise PRESENT_DATA_EXCEPTION;
        elsif (gt (Tree.all.DATA, DATA)) then   -- Tree.all. DATA > DATA
            Insert(Tree.all.Left, DATA); 
        elsif (gt (DATA, Tree.all.DATA)) then
            Insert(Tree.all.Right, DATA);   
        end if;
    end Insert;

	
    -- Supprimer tous les éléments d'un Tree.
    procedure Destruct (Tree : in out T_BT) is
    begin
        if  Is_Empty (Tree) then
            Null;
        else
            Destruct (Tree.all.Left);
            Destruct (Tree.all.Right);
            Free (Tree);
        end if;
    end Destruct;

	
    -- Afficher un Tree dans l'ordre croissant des DATAs.
    procedure Display (Tree : in T_BT) is
    begin
        if (not Is_Empty (Tree)) then
            Display (Tree.all.Left);
            Display_DATA (Tree.all.DATA);
            Display (Tree.all.Right);
        end if;
    end Display;


end Arbre_Binaire;
