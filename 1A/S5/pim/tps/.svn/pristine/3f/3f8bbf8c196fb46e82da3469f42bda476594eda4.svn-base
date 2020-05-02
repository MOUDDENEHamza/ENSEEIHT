with Ada.Text_IO;          use Ada.Text_IO;
with Ada.Integer_Text_IO;  use Ada.Integer_Text_IO;
with ABR;                  use ABR;

-- Afficher la fréquence absolue des caractères d'une chaîne de caractère.
procedure Frequences_Caracteres is


	-- Calculer la fréquence absolue (Frequences) de chaque caractère de Texte.
	procedure Calculer_Frequences_Absolues (Texte : in String ; Frequences : out T_ABR) is
	begin
		Initialiser (Frequences);
		for I in Texte'Range loop
			declare
				C : constant Character := Texte (I);
			begin
				Modifier (Frequences, C, La_Donnee (Frequences, C) + 1);
			exception
				when Cle_Absente_Exception =>
					Inserer (Frequences, C, 1);
			end;
		end loop;
	end Calculer_Frequences_Absolues;

	Frequences: T_ABR;
begin
	Calculer_Frequences_Absolues ("DCEFABCCAABAA", Frequences);

	-- afficher les résultats
	Put_Line ("Nombre de caractères différents : "
			& Integer'Image (Taille (Frequences)));
	Afficher (Frequences);
	Afficher_Debug (Frequences);

	-- vérifier les résulats
	pragma Assert (Taille (Frequences) = 6);
	pragma Assert (La_Donnee (Frequences, 'A') = 5);
	pragma Assert (La_Donnee (Frequences, 'B') = 2);
	pragma Assert (La_Donnee (Frequences, 'C') = 3);
	for C in Character range 'D'..'F' loop
		pragma Assert (La_Donnee (Frequences, C) = 1);
	end loop;

end Frequences_Caracteres;
