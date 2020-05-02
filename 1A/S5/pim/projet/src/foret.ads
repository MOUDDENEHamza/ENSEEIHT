--------------------------------------------------------------------------------
--  Fichier  : foret.ads
--  Auteur   : MOUDDENE Hamza & CAZES Noa
--  Objectif : Spécification du module Foret
--  Crée     : Jeudi Déc 12 2019
--------------------------------------------------------------------------------


with Ensemble;
with Arbre_Genealogique;	use Arbre_Genealogique;


package Foret is


    -- Type du package Foret qui est privé.
    type Forest is private;


    ABSENT_TREE_EXCEPTION : Exception; -- Arbre inexistant.


    ----------------------------------Constuctor--------------------------------

    -- Nom : Initialize_Forest
    -- Sémantique : Initialiser Forest.  Forest est vide.
    -- Paramètres :
    --     F   -- Forest que l'on va initialiser.
    procedure Initialize_Forest (F : out Forest);


    -- Nom : Add_To_Forest
    -- Sémantique : Ajouter un Arbre dans la Forest.
    -- Paramètres :
    --     F   -- Forest que l'on va initialiser.
    --	   Ab  -- L'arbre qu'on va ajouter
    procedure Add_To_Forest (F : in out Forest; Ab : in T_ABG);

    ----------------------------------------------------------------------------

    -- Nom            : Is_Empty_Forest
    -- Sémantique     : Vérifier si une foret donnée est vide.
    -- Type_De_Retour : Boolean True si la foret est vide, sinon False.
    -- Paramètre      :
    --     F          : La foret qu'on va parcourir.
    function Is_Empty_Forest (F : in Forest) return Boolean;


    -- Nom            : Is_Present_Forest
    -- Sémantique     : Vérifier si un arbre est dans la foret.
    -- Type_De_Retour : Boolean True si un arbre est dans la foret, sinon False.
    -- Paramètre      :
    --     F          : La foret qu'on va parcourir.
    --    ID          : identifiant unique d'un individu dans la foret.
    function Is_Present_Forest (F : in Forest; ID : Integer) return Boolean;


    -- Nom        : Find_Tree
    -- Sémantique : Trouver un ID dans la foret.
    -- Paramètre  :
    --     F      : La foret qu'on va parcourir.
    --    ID      : L'ID d'une racine d'arbre dans la foret.
    procedure Find_Tree (F : in Forest; Ab : out T_ABG; ID : in Integer);


    -- Nom        : Update_Forest
    -- Sémantique : Mettre à jour la foret.
    -- Paramètre  :
    --     F      : La foret qu'on va parcourir.
    --   Old_Ab   : L'arbre avant la modification.
    --   New_Ab   : L'arbre après la modification.
    procedure Update_Forest (F : in Forest; Old_Ab, New_Ab : in T_ABG);


    -- Nom        : Remove_Tree
    -- Sémantique : Supprimer un arbre de la foret.
    -- Paramètre  :
    --     F      : La foret qu'on va parcourir.
    --   Old_Ab   : L'arbre avant la modification.
    --   New_Ab   : L'arbre après la modification.
    procedure Remove_Tree (F : in out Forest; Ab : in T_ABG);


    -- Nom        : Get_Set_Cohabitant
    -- Sémantique : Ajouter un concubain à un individu donné.
    -- Paramètre  :
    --     F      : La foret qu'on va parcourir.
    --    Ab      : L'arbre d'un individu dans la foret.
    procedure Get_Set_Cohabitant (F : in out Forest; ID, Child_ID : in Integer);


    -- Nom        : Get_Set_Half_Brother
    -- Sémantique : Obtenir l'ensemble des demis frères et demie-soeur d'un individu donné.
    -- Paramètre  :
    --     F      : La foret qu'on va parcourir.
    --    ID      : identifiant unique d'un individu dans la foret.
    procedure Get_Set_Half_Brother (F : in Forest; ID, Father_ID, Mother_ID : in Integer);


    -- Nom        : Destruct_Forest
    -- Sémantique : Détruire Forest.  Forest est vide.
    -- Paramètres :
    --     F      -- Forest que l'on va détruire.
    procedure Destruct_Forest (F : in out Forest);


private


    -- Instancier Ensemble avec T_Element comme T_ABG.
    package Ens is
            New Ensemble (T_Element => T_ABG);
    use Ens;


    -- Déclaration du type forest comme une liste chainée.
    type Forest is new T_Ensemble;


end Foret;
