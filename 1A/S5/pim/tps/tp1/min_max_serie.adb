with Text_IO;
use Text_IO;
with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;

-- Afficher le plus petit et le plus grand élément d'une série d'entiers
-- naturels lus au clavier.  La saisie de la série se termine par 0
-- (qui n'appartient pas à la série).
-- Exemple : 2, 9, 3, 6, 3, 0 -> min = 2 et max = 9
procedure Min_Max_Serie is
	Entier: Integer;	-- un entier lu au clavier
	Min, Max: Integer;	-- le plus petit et le plus grand élément de la série

begin
	-- Afficher la consigne
	Put("Saisir les valeurs de la série (-1 pour terminer) : ");

	-- Saisir un premier entier
	Put("Saisir les valeurs de la série (-1 pour terminer) : ");
	Get(Entier);

	if Entier = 0 then --{ entier n'est pas une valeur de la série }
		Put_Line("Pas de valeurs dans la série");
	else   -- Entier est le premier élément de la série
		-- initialiser Min et Max avec le premier entier
		Min := Entier;
		Max := Entier;

		-- traiter les autres éléments de la série
		Get(Entier);   -- saisir un nouvel entier
		while Entier /= 0 loop      -- Entier est une valeur de la série
			-- mettre à jour le Min et le Max
			if Entier > Max then  -- nouveau max
				-- mettre à jour le max avec Entier
				Max := Entier;
			elsif Entier < Min then  -- nouveau Min
				-- mettre à jour le min avec Entier
				Min := Entier;
			else
				null;
			end if;

			-- saisir un nouvel entier
			Get(Entier);
		end loop;

		-- afficher le min et le max de la série
		Put("Min = ");
		Put(Min, 1);
		New_Line;

		Put_Line("Max =" & Integer'Image(Max));
	end if;
end Min_Max_Serie;
