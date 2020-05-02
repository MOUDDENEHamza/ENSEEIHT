-- Spécification du module Ensembles.

generic
    type T_Element is private;  -- Type des éléments de l'ensemble.

package Ensembles_Chainage is

	type T_Ensemble is limited private;

        -- Initilaiser un ensemble.  L'ensemble est vide.
        procedure Initialiser (Ensemble : out T_Ensemble) with
                Post => Est_Vide (Ensemble);

        -- Détruire un ensemble (libérer les ressources qu’il utilise).
         procedure Detruire (Ensemble : in out T_Ensemble) with
             Post => Est_Vide (Ensemble);

        -- Est-ce que l'ensemble est vide ?
        function Est_Vide (Ensemble : in T_Ensemble) return Boolean;

        -- Obtenir la taille d'un ensemble ?
        function Taille (Ensemble : in T_Ensemble) return Integer;

        -- L'élément est-il présent dans l'ensemble.
        function Est_Present (Ensemble : in T_Ensemble; Element : in T_Element) return Boolean;

        -- Ajouter l'élément à l'ensemble.
        procedure Ajouter (Ensemble : in out T_Ensemble; Element : in T_Element) with
                Pre => not(Est_Present (Ensemble, Element)),
		Post => Est_Present (Ensemble, Element);

        -- Supprimer l'élément de l'ensemble.
        procedure Supprimer (Ensemble : in out T_Ensemble; Element : in T_Element) with
                Pre => not Est_Vide (Ensemble) and Est_Present (Ensemble, Element),
                Post => not(Est_Present (Ensemble, Element));

        -- Appliquer une opération sur les éléments de l'ensemble.
        generic
                with procedure Operation (Un_Element: in T_Element);
        procedure Appliquer_Sur_Tous (Ensemble : in T_Ensemble);

private
	type T_Cellule;
        
	-- T_Ensemble est un pointeur sur T_Cellule.
	type T_Ensemble is access T_Cellule;

	type T_Cellule is record
		Element: T_Element; -- la valeur de la cellule.
		Suivant: T_Ensemble; -- un pointeur sur la cellule suivante.
	end record;

end Ensembles_Chainage;
