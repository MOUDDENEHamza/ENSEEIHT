--------------------------------------------------------------------------------
--  Fichier  : foret.ads
--  Auteur   : MOUDDENE Hamza & CAZES Noa
--  Objectif : Spécification du module Ensemble
--  Crée     : Dimanche Nov 10 2019
--------------------------------------------------------------------------------


generic
    type T_Element is private;  -- Type des éléments de l'ensemble.

package Ensemble is


    type T_Ensemble is private;


    ----------------------------------Constuctor----------------------------------

    -- Initilaiser un ensemble.  L'ensemble est vide.
    --
    -- Param Ensemble : Ensembe qu'on va initialiser.
    procedure Initialiser (Ensemble : out T_Ensemble) with
            Post => Est_Vide (Ensemble);


    -- Copier un ensemble dans un autre.
    --
    -- Param E1 : E1 dont on va lui copier un deuxième ensemble.
    -- Param E2 : E2 l'ensemble copié dans E1.
    procedure Copy (E1 : in out T_Ensemble; E2 : in T_Ensemble);
    

    -- Ajouter l'élément à l'ensemble.
    procedure Ajouter (Ensemble : in out T_Ensemble; Element : in T_Element) with
            Pre => not(Est_Present (Ensemble, Element)),
            Post => Est_Present (Ensemble, Element);

    -----------------------------------Getters----------------------------------
	
    -- Nom : Get_Element
    -- Sémantique : Obtenir le noeud du pointeur.
    -- Type_De_Retour : T_Element est la valeur du pointeur.
    -- Paramètres
    --     E : E que l'on va parcourir.
    function Get_Element (E : in T_Ensemble) return T_Element;

    -- Nom : Get_Next
    -- Sémantique : Obtenir le pointeur suivant.
    -- Type_De_Retour : T_Ensemble : Est le pointeur sur la case suivante.
    -- Paramètre :
    --     E     -- L'ensemble qu'on va parcourir.
    function Get_Next (E : in T_Ensemble) return T_Ensemble;

    -----------------------------------Setters----------------------------------
	
    -- Nom : Set_Element
    -- Sémantique : Changer le noeud du pointeur.
    -- Paramètres
    --     E    : E que l'on va parcourir.
    -- Element  : L'element qu'on va mettre dans Element. 
    procedure Set_Element (E : in T_Ensemble; Element : in T_Element);

    -- Nom : Set_Next
    -- Sémantique : Changer le pointeur suivant.
    -- Paramètre :
    --     E     -- L'ensemble qu'on va parcourir.
    --	Next	 -- Le pointeur suivant
    procedure Set_Next (E : in T_Ensemble; Next : in T_Ensemble);

    ----------------------------------------------------------------------------

    -- Détruire un ensemble (libérer les ressources qu’il utilise).
    procedure Detruire (Ensemble : in out T_Ensemble) with
            Post => Est_Vide (Ensemble);


    -- Est-ce que l'ensemble est vide ?
    function Est_Vide (Ensemble : in T_Ensemble) return Boolean;


    -- Obtenir la taille d'un ensemble ?
    function Taille (Ensemble : in T_Ensemble) return Integer;


    -- L'élément est-il présent dans l'ensemble.
    function Est_Present (Ensemble : in T_Ensemble; Element : in T_Element) return Boolean;
    

    -- Nom : Edit_Set
    -- Sémantique : Modifier un element de l'ensemble.
    -- Paramètre :
    --    Ensemble     : L'ensemble qu'on va parcourir.
    --    Old_Element  : L'element qu'on va changer.
    --    New_Element  : L'element qu'on va mettre en place.
    procedure Edit_Set (Ensemble : in T_Ensemble; Old_Element, New_Element : in T_Element); 


    -- Nom 		: Supprimer
    -- Sémantique 	: Supprimer un element de l'ensemble.
    -- Paramètre        :
    --   Ensemble       : L'ensemble qu'on va parcourir.
    --   Ab	        : L'arbre avant la modification.
    procedure Supprimer (Ensemble : in out T_Ensemble; Element : in T_Element) with
            Pre => not Est_Vide (Ensemble) and Est_Present (Ensemble, Element),
            Post => not(Est_Present (Ensemble, Element));


    -- Appliquer une opération sur les éléments de l'ensemble.
    generic
        with procedure Afficher_Elt (Un_Element: in T_Element);
    procedure Afficher_Ensemble (Ensemble : in T_Ensemble);


private
    type T_Cellule;
        
    -- T_Ensemble est un pointeur sur T_Cellule.
    type T_Ensemble is access T_Cellule;

    type T_Cellule is record
        Element: T_Element; -- la valeur de la cellule.
        Suivant: T_Ensemble; -- un pointeur sur la cellule suivante.
    end record;

end Ensemble;
