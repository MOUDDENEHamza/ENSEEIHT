-- Spécification du module Ensembles.

generic
    Capacite : Integer;   -- Nombre maximal d'éléments qu'un ensemble peut contenir.
    type T_Element is private;  -- Type des éléments de l'ensemble.

package Ensembles_Tableau is
	
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
        	Pre => Taille (Ensemble) < Capacite and not(Est_Present (Ensemble, Element)),
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

    	type T_Tab is array (1..Capacite) of T_Element;

    	type T_Ensemble is record
            Tab : T_Tab;  	    -- les éléments de l'ensemble
            Taille: Integer;        -- Nombre d'éléments dans l'ensemble
        end record;

end Ensembles_Tableau;
