--------------------------------------------------------------------------------
--  Fichier  : arbre_binaire.ads
--  Auteur   : MOUDDENE Hamza & CAZES Noa
--  Objectif : Spécification du module Arbre_Binaire.
--  Créé     : Dimanche Nov 25 2019
--------------------------------------------------------------------------------


-- Mettre T_Data comme un type générique.
Generic
    type T_Data is private; -- T_DATA est génerique.


package Arbre_Binaire is
	

    type T_BT is private; -- Mettre T_BT comme un type privé.

	
    PRESENT_DATA_EXCEPTION : Exception; -- DATA déjà présent dans Tree.

    
    ----------------------------------Constuctor--------------------------------

    -- Nom : Initialize
    -- Sémantique : Initialiser Tree.  Tree est vide.
    -- Paramètres :
    --     Tree    --Tree que l'on va initialiser.
    procedure Initialize (Tree : out T_BT) with
            Post => Is_Empty (Tree);	-- Tree := Null.

    -----------------------------------Getters----------------------------------
	
    -- Nom : Get_DATA
    -- Sémantique : Obtenir DATA de la racine de Tree.
    -- Type_De_Retour : T_DATA est DATA de la racine de Tree.
    -- Paramètres
    --     Tree  : Tree que l'on va parcourir.
    function Get_Data (Tree : in T_BT) return T_Data;

    -- Nom : Get_Left
    -- Sémantique : Obtenir le sous arbre gauche de Tree.
    -- Type_De_Retour : T_BT : T_BT est le sous arbre gauche de Tree.
    -- Paramètre :
    --     Tree     -- Tree que l'on va parcourir.
      
    function Get_Left (Tree : in T_BT) return T_BT;
	

    -- Nom : Get_Right
    -- Sémantique : Obtenir le sous arbre droit de Tree.
    -- Type_De_Retour : T_BT   -- T_BT est le sous arbre droit de Tree.
    -- Paramètre :
    --     Tree     -- Tree que l'on va parcourir.
    function Get_Right (Tree : in T_BT) return T_BT;

    -----------------------------------Setters----------------------------------
	
    -- Nom : Set_DATA
    -- Sémantique : Modifier l'DATA de la racine de Tree.
    -- Paramètres : 
    --    Tree      -- Tree que l'on va parcourir.
    --    DATA        -- L'DATA que l'on va mettre dans Tree.all.DATA.
    procedure Set_DATA (Tree : in T_BT; DATA : in T_DATA);

    -- Nom : Set_Left
    -- Sémantique : Modifier le sous arbre gauche de Tree.
    -- Paramètres : 
    --    Tree      -- Tree que l'on va parcourir.
    --    Left      -- Le sous arbre gauche que l'on va mettre dans Tree.all.Left. 
    procedure Set_Left (Tree, Left : in T_BT);

    -- Nom : Set_Right
    -- Sémantique : Modifier le sous arbre droit de Tree.
    -- Paramètres : 
    --    Tree      -- Tree que l'on va parcourir.
    --    Left      -- Le sous arbre droit que l'on va mettre dans Tree.all.Right. 
    procedure Set_Right (Tree, Right : in T_BT);

    ----------------------------------------------------------------------------
	
    -- Nom : Is_Empty
    -- Sémantique : Savoir si un arbre est vie.
    -- Type_De_Retour :  Boolean -- Retourne True si Tree est vide, sinon False.
    -- Paramètre :
    --     Tree                  -- L'arbre pour lequel on cherche à savoir s'il est vDATAe.
    function Is_Empty (Tree : in T_BT) return Boolean;
	
    -- Nom : Height
    -- Sémantique : Obtenir le nombre d'éléments d'un Tree.
    -- Type_De_Retour : Integer représentant la taille de Tree.
    -- Paramètre :
    --     Tree -- L'arbre pour lequel on cherche sa taille.

    function Height (Tree : in T_BT) return Integer with
            Post => Height'Result >= 0    -- Retourne une taille positive.
            and (Height'Result = 0) = Is_Empty (Tree); -- If Height (Tree) = 0 then Tree := Null.
	
	
    -- Nom : Is_Present
    -- Sémantique : Vérifier qu'un DATA passé en paramètre est dans l'arbre.
    -- Type_De_Retour : Boolean  -- True si l'DATA est dans Tree, False sinon.
    -- Paramètres : 
    --     Tree      -- Tree que l'on va parcourir.
    --     DATA        -- L'DATA pour lequel on voudra savoir s'il est dans Tree.
    function Is_Present (Tree : in T_BT; Data : in T_Data) return Boolean;
    
    
    -- Nom : Depth
    -- Sémantique : Obtenir la profondeur d'un Tree.
    -- Type_De_Retour : Integer  -- La profondeur de Tree.
    -- Paramètres : 
    --     Tree      -- Tree que l'on va parcourir.
    function Depth (Tree : in T_BT) return Integer;
        
        
    -- Nom : Create_Node
    -- Sémantique : Créer un arbre avec un seul noeud.
    -- Paramètres : 
    --     Node       -- Le nouveau noeud à créer.
    --     DATA         -- L'DATA que l'on va placer dans Node.all.DATA. 
    procedure Create_Node (Node : out T_BT; DATA : in T_DATA);


    -- Nom : Insert
    -- Sémantique : Insérer un DATA associé à un nouveau noeud dans Tree.
    -- Exception  : Present_DATA_Exception si l'DATA est déjà dans Tree.
    -- Paramètres :
    --     Tree     -- Tree où on veut insérer un noeud.
    --     DATA       -- L'DATA correspondant au noeud que l'on veut insérer.
    generic
        -- Nom : gt
        -- Sémantique : Vérifie si DATA1 est supérieur à DATA2.
        -- Type_De_Retour : Boolean -- True si DATA1 > DATA2 ,sinon False.
        -- Paramètres
        --     DATA 1|2   : Les DATAs que l'on voudra comparer.
        with function gt (DATA1, DATA2 : in T_DATA) return Boolean;
    procedure Insert (Tree : in out T_BT ; DATA : in T_DATA) with
            Post => Height (Tree) = Height (Tree)'Old + 1; -- Un élément de plus.

    -- Nom : Destruct
    -- Sémantique : Supprimer tous les éléments d'un Tree.
    -- Paramètre
    --     Tree   -- Tree à détruire.
    procedure Destruct (Tree : in out T_BT) with
            Post => Is_Empty (Tree); -- Tree = Null.

    -- Nom : Display
    -- Sémantique : Afficher un Tree dans l'ordre croissant des DATAs.
    -- Paramètre
    --     Tree    -- Tree à afficher.
    generic
        -- Nom : Display_DATA
        -- Sémantique : Afficher un DATA passé en paramètre.
        -- Paramètre : 
        --     DATA    -- DATA à afficher.
        with procedure Display_DATA (DATA1 : in T_DATA);
    procedure Display (Tree : in T_BT);


private

    type T_Node; -- Un noeud d'un arbre

    type T_BT is access T_Node; -- Pointeur sur T_Node.
	
    type T_Node is record
        Data : T_DATA; 	-- les données du noeud.
        Left : T_BT;    -- Sous arbre gauche du noeud.
        Right : T_BT;	-- Sous arbre droit du noeud.
    end record;

end Arbre_Binaire;
