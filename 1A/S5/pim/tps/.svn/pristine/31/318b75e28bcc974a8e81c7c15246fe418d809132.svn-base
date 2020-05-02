-- Spécification du module Piles.

generic
	type T_Element is private;  -- Type des éléments de la pile

package Piles is

	type T_Pile is limited private;


	-- Initilaiser une pile.  La pile est vide.
	procedure Initialiser (Pile : out T_Pile) with
		Post => Est_Vide (Pile);


	-- Est-ce que la pile est vide ?
	function Est_Vide (Pile : in T_Pile) return Boolean;



	-- L'élément en sommet de la pile.
	function Sommet (Pile : in T_Pile) return T_Element with
		Pre => not Est_Vide (Pile);


	-- Empiler l'élément en somment de la pile.
	-- Exception : Storage_Exception s'il n'y a plus de mémoire.
	procedure Empiler (Pile : in out T_Pile; Element : in T_Element) with
		Post => Sommet (Pile) = Element;


	-- Supprimer l'élément en sommet de pile
	procedure Depiler (Pile : in out T_Pile) with
		Pre => not Est_Vide (Pile);


	-- Détruire la pile.
	-- Elle ne doit plus être utilisée sauf à être de nouveau initialisée.
	procedure Detruire (P: in out T_Pile);


	-- Afficher les éléments de la pile
	generic
		with procedure Afficher_Element (Un_Element: in T_Element);
	procedure Afficher (Pile : in T_Pile);


private

	type T_Cellule;

	type T_Pile is access T_Cellule;

	type T_Cellule is
		record
			Element: T_Element;
			Suivant: T_Pile;
		end record;

end Piles;
