-- Implantation du module Piles.

with Ada.Unchecked_Deallocation;
with Ada.Text_IO;  use Ada.Text_IO;
	--// Ce module est nécessaire parce qu'on a ajouté le SP Afficher.

package body Piles is

	procedure Free is
		new Ada.Unchecked_Deallocation (T_Cellule, T_Pile);


	procedure Initialiser (Pile : out T_Pile) is
	begin
		Pile := Null;
	end Initialiser;


	function Est_Vide (Pile : in T_Pile) return Boolean is
	begin
		return Pile = Null;
	end Est_Vide;


	function Sommet (Pile : in T_Pile) return T_Element is
	begin
		return Pile.all.Element;
	end Sommet;


	procedure Empiler (Pile : in out T_Pile; Element : in T_Element) is
		Nouvelle_Cellule: T_Pile;
	begin
		-- Créer une nouvelle cellule (allcoation puis initialisation)
		Nouvelle_Cellule := new T_Cellule;
		Nouvelle_Cellule.all.Element := Element;
		Nouvelle_Cellule.all.Suivant := Pile;
		
		-- Changer Pile (elle pointe sur la nouvelle cellule)
		Pile := Nouvelle_Cellule;
	end Empiler;


	procedure Depiler (Pile : in out T_Pile) is
		A_Detruire : T_Pile;
	begin
		A_Detruire := Pile;
		Pile := Pile.all.Suivant;
		Free (A_Detruire);
	end Depiler;


	procedure Detruire (P: in out T_Pile) is
	begin
		if P /= Null then
			Detruire (P.all.Suivant);
			Free (P);
		else
			Null;
		end if;
	end Detruire;


	procedure Afficher (Pile : in T_Pile) is

		-- Afficher les éléments de la pile. Le premier affiché est le fond de
		-- pile, le dernier le sommet, ils sont séparés par des virgules.
		procedure Afficher_Elements (Pile : in T_Pile) is
		begin
			if Pile = Null then
				Null;
			elsif Pile.all.Suivant = Null then
				Put (" ");
				Afficher_Element (Pile.all.Element);
			else 
				Afficher_Elements (Pile.all.Suivant);
				Put (", ");
				Afficher_Element (Pile.all.Element);
			end if;
		end Afficher_Elements;

	begin
		Put ('[');
		Afficher_Elements (Pile);
		Put (" >");
	end Afficher;


end Piles;
