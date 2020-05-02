-------------------------------------------------------------------------------
--  Fichier  : arbre_genealogique.ads
--  Auteur   : MOUDDENE Hamza & CAZES Noa
--  Objectif : Spécification du module Arbre_Genealogique
--  Crée     : Dimanche Nov 10 2019
--------------------------------------------------------------------------------


with Arbre_Binaire;
with Ensemble;
with Registre; 		use Registre;


package Arbre_Genealogique is
	

    type T_ABG is private;  -- Type Arbre genealogique.

    type T_List is array(1..10) of Integer;
    
    type T_Node is record
        ID : Integer;
        Cohabitant : T_List;
        Half_Brother : T_List;
    end record;

    
    -- Instancier Ensemble avec T_Element comme Integer. 
    package Ens is
            New Ensemble (T_Element => T_Node);
    use Ens;


    ARBRE_VIDE_EXCEPTION : Exception;			-- Arbre est vDATAe.
    ARBRE_NON_VIDE_EXCEPTION : Exception;		-- Arbre n'est pas vDATAe.
    ID_PRESENT_EXCEPTION : Exception; 			-- ID Present.
    ID_ABSENT_EXCEPTION : Exception;   			-- ID Absent.
    DEUX_PARENTS_PRESENTS_EXCEPTION : Exception; 	-- Deux parents existants.
    
    ----------------------------------Constuctor--------------------------------
    
    -- Nom : Initialize_List
    -- Sémantique : Initialiser List.  Tree est List.
    -- Paramètres :
    --     List  -- List que l'on va initialiser.
    function Initialize_List (List : out T_List) return T_List; 
    
    
    -- Nom : Initialize_Data
    -- Sémantique : Initialiser Data.  Tree est Data.
    -- Paramètres :
    --     Tree    --Tree que l'on va initialiser.
    procedure Initialize_Data (Data : out T_Node; ID : in Integer);
    
    
    -- Nom : Initialize_Genealogical_Tree
    -- Sémantique : Initialiser un arbre genéalogique. L'arbre est vide.
    -- Paramètres :
    --     Ab    -- Ab que l'on va initialiser.
    procedure Initialize_Genealogical_Tree (Ab : out T_ABG);
    
    
    -- Nom : Creer_Arbre_Minimal
    -- Sémantique : Initialiser un Ab.  L'Ab contient la racine.
    -- Exception : ARBRE_NON_VDATAE_EXCEPTION.
    -- Paramètre : 
    --     Ab     -- L'Ab que l'on va initialiser avec sa racine.
    procedure Creer_Arbre_Minimal (Ab : out T_ABG; DATA : in T_Node);


    -- Nom : Ajouter_Parent
    -- Sémantique : Ajouter un parent (mère ou père) à un noeud donné.
    -- Exception : 
    --     ARBRE_VDATAE_EXCEPTION.
    --     DATA_ABSENT_EXCEPTION.
    --     DEUX_PARENTS_PRESENTS_EXCEPTION.
    -- Paramètre : 
    --     Ab     -- L'Ab auquel on va ajouter un parent.
    --     ID	  -- ID de l'individu qu'on va lui ajouter un parent.
    --     New_ID -- ID du parent.
    -- 	   Flag	  -- Un entier binaire pour désigner si c'est un père ou une mère.
    procedure Ajouter_Parent (Ab : in out T_ABG; New_Data : in T_Node; ID, Flag : in Integer);

    -----------------------------------Getters----------------------------------
    
    -- Nom : Get_ID
    -- Sémantique : Obtenir l'ID de Node.
    -- Type_De_Retour : Integer est l'ID du noeud.
    -- Paramètres
    --     Ab  : L'arbre qu'on va parcourir.
    function Get_ID (Ab : in T_ABG) return Integer;
    
    
    -- Nom : Get_Cohabitant
    -- Sémantique : Obtenir la liste des concubains.
    -- Type_De_Retour : T_List est la liste des concubains.
    -- Paramètres
    --     Ab  : Arbre qu'on va parcourir.
    function Get_Cohabitant (Ab : in T_ABG) return T_List;
    
    
    -- Nom : Get_Half_Brother.
    -- Sémantique : Obtenir l'ensemble des demi-frères.
    -- Type_De_Retour : T_List est la liste des demi_frères.
    -- Paramètres
    --     Ab  : Arbre qu'on va parcourir.
    function Get_Half_Brother (Ab : in T_ABG) return T_List;
    
    -- Nom        	: Get_ID_Father
    -- Sémantique 	: Obtenir l'ensemble des demi-frères.
    -- Type_De_Retour   : Integer est l'ID du père.
    -- Paramètres
    --     Ab  		: Arbre qu'on va parcourir.
    function Get_ID_Father (Ab : in T_ABG) return Integer;
    
    
    -- Nom        	: Get_ID_Father
    -- Sémantique 	: Obtenir l'ensemble des demi-frères.
    -- Type_De_Retour   : Integer est l'ID du mère.
    -- Paramètres
    --     Ab  		: Arbre qu'on va parcourir.
    function Get_ID_Mother (Ab : in T_ABG) return Integer;
    
    ----------------------------------------------------------------------------
    
    -- Nom : Is_Present_ID
    -- Sémantique : Vérifier qu'un ID passé en paramètre est dans l'arbre.
    -- Type_De_Retour : Boolean  -- True si l'ID est dans Tree, False sinon.
    -- Paramètres : 
    --     Tree        -- Tree que l'on va parcourir.
    --     ID          -- L'DATA pour lequel on voudra savoir s'il est dans Tree.
    function Is_Present_ID (Tree : in T_ABG; ID : in Integer) return Boolean;
    
    
    -- Nom : Generate_ID
    -- Sémantique : Générer un ID unique.
    -- Type_De_Retour : Integer  -- l'ID généré
    -- Paramètre : 
    --     Ab : L'Ab que l'on va parcourir.
    function Generate_ID (Ab : in T_ABG) return Integer;

    
    -- Nom 	      : Get_Child_ID
    -- Sémantique     : Obtenir l'ID du fils.
    -- Type_De_Retour : Integer  -- Integer l'ID du fils. 
    -- Paramètres     : 
    --     Ab         -- Tree que l'on va parcourir.
    --     Parent_ID  -- L'ID du parent passé en paramètre.
    function Get_Child_ID (Ab : in T_ABG; Parent_ID : in Integer) return Integer;
            
    
    -- Nom : Nombre_Ancetres
    -- Sémantique : Obtenir le nombre d'ancêtres connus (lui compris) d'un indivDATAu donné.
    -- Type_De_Retour : Integer -- nombre d'ancêtres, entier strictement positif
    -- Exception : DATA_ABSENT_EXCEPTION.
    -- Paramètres : 
    --     Ab : L'Ab que l'on va parcourir.
    --     ID : ID unique d'un indivDATAu dans l'Ab.
    function Nombre_Ancetres (Ab : in T_ABG; ID : in Integer) return Integer;
            
	
    -- Nom : Ancetres_N_Generation
    -- Sémantique : Obtenir l'ensemble des ancêtres situé à une certaine génération d'un noeud donné.
    -- Type_De_Retour : T_Ensemble : Retourne un ensemble non vDATAe d'ancêtres.
    -- Exception : ID_ABSENT_EXCEPTION.
    -- Paramètres : 
    --     Ab          --  L'Ab que l'on va parcourir.
    --     ID          --  DATAentifiant unique d'un indivDATAu dans l'Ab.
    --     Generation  -- le niveau d'ancêtres que l'on cherche. 
    procedure Ancetres_N_Generation (Ab : in T_ABG; ID, Generation : in Integer);
    

    -- Nom : Afficher_Arbre_Noeud
    -- Sémantique : Afficher l'arbre à partir d'un noeud donné.
    -- Paramètres :
    --     Ab          --  L'Ab que l'on va parcourir.
    --     DATA          --  DATAentifiant unique d'un indivDATAu dans l'Ab.
    procedure Afficher_Arbre_Noeud (Ab : in T_ABG; ID : in Integer);
	

    -- Nom : Supprimer
    -- Sémantique : Supprimer, pour un arbre, un noeud et ses ancêtres.
    -- Exception : DATA_ABSENT_EXCEPTION.
    -- Paramètres : 
    --     Ab          --  L'Ab que l'on va parcourir.
    --     DATA          --  DATAentifiant unique d'un indivDATAu dans l'Ab.
    procedure Supprimer (Ab : in out T_ABG; ID : in Integer);


    -- Nom : Individus_1_Parent_Connu
    -- Sémantique : Obtenir l'ensemble des individus qui n'ont qu'un parent connu.
    -- Type_De_Retour : T_Ensemble  -- ensemble vide ou non vide de parents.
    -- Paramètre : 
    --     Ab          --  L'Ab que l'on va parcourir.
    procedure Individus_1_Parent_Connu (Ab : in T_ABG);


    -- Nom : Individus_2_Parent_Connu
    -- Sémantique : Obtenir l'ensemble des individus dont les deux parents sont connus.
    -- Type_De_Retour : T_Ensemble  -- ensemble vide ou non vide de parents.
    -- Paramètre : 
    --     Ab          --  L'Ab que l'on va parcourir.
    procedure Individus_2_Parent_Connu (Ab : in T_ABG);


    -- Nom : Ensemble_Feuilles
    -- Sémantique : Obtenir l'ensemble des individus dont les deux parents sont inconnus.
    -- Type_De_Retour : T_Ensemble  -- ensemble vide ou non vide de parents.
    -- Paramètre : 
    --     Ab          --  L'Ab que l'on va parcourir.
    procedure Ensemble_Feuilles (Ab : in T_ABG);


    -- Nom : Ancetres_Sur_N_Generation
    -- Sémantique : Identifier les ancêtres d'un individu donné sur N generations données par un noeud donné.
    -- Type_De_Retour : T_Ensemble  -- ensemble vide ou non vide de parents.
    -- Exception : ID_ABSENT_EXCEPTION.
    -- Paramètres : 
    --     Ab          --  L'Ab que l'on va parcourir.
    --     ID          --  Identifiant unique d'un indivDATAu dans l'Ab.
    --     Generation  --  Le niveau d'ancêtres que l'on cherche. 
    procedure Ancetres_Sur_N_Generation (Ab : in T_ABG; ID, Generation : in Integer);
    

    -- Nom : Ancetres_Homonymes
    -- Sémantique : Vérifier que deux individus n et m ont un ou plusieurs ancêtres homonymes (mêmes non et prénom).
    -- Type_De_Retour :  Boolean   -- True si ID1 et ID2 ont des ancêtres homonymes, sinon False.
    -- Exception : ID_ABSENT_EXCEPTION.
    -- Paramètres : 
    --     Ab                      --  L'Ab que l'on va parcourir.
    --	   R			   -- Le registre des arbres genealogiques.
    --     ID1|2                   --  iDentifiant unique d'un indivDATAu dans l'Ab.
    function Ancetres_Homonymes (Ab1, Ab2 : in T_ABG; R : in T_Registre; ID1, ID2 : in Integer) return Boolean;
    
    
private
    
    -- Instancier Arbre_Binaire avec T_DATA comme Integer.
    package Ab_Genealogique is
            New Arbre_Binaire (T_DATA => T_Node);
    use Ab_Genealogique;

    type T_ABG is new T_BT;


end Arbre_Genealogique;
