with Ada.Text_IO;          use Ada.Text_IO;
with Ada.Integer_Text_IO;  use Ada.Integer_Text_IO;

-- Objectif : Comprendre le comportement de Get et Skip_Line.

-- Saisir une longueur (valeur et unité) et l'afficher.
procedure Comprendre_Get_Skip_Line is
	Valeur: Integer;	-- la valeur du longeur
	Unite: Character;	-- l'unité de la longueur : (c)entimètre, (m)ètre...
begin
	-- saisir la longueur
	Put("Longueur = ");
	Get(Valeur);
	Skip_Line;
	Get(Unite);
	Skip_Line;

	-- afficher la longueur
	Put_Line("Valeur =" & Integer'Image(Valeur));
	Put_Line("Unité = >" & Unite & "<");

	-- afficher les caractères en attente sur l'entrée standard (fin de ligne)
	--Put_Line("Reste de la dernière ligne saisie : " & '"' & Get_Line & '"');
end Comprendre_Get_Skip_Line;
