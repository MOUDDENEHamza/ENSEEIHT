with Ada.Text_IO;          use Ada.Text_IO;
with Ada.Integer_Text_IO;  use Ada.Integer_Text_IO;
with ABR;                  use ABR;

procedure Test_ABR is

	function Est_Cle_Utilisee (Abr : in T_Abr ; Cle : in Character) return Boolean is
		Donnee : Integer;
	begin
		Donnee := La_Donnee (Abr, Cle);
		return True;
	exception
			when Cle_Absente_Exception => return False;
	end Est_Cle_Utilisee;


	Nb_Donnees : constant Integer := 10;
	Cles : constant array (1..Nb_Donnees) of Character
			:= ('F', 'B', 'H', 'D', 'A', 'E', 'G', 'J', 'I', 'C');
	Donnees : constant array (1..Nb_Donnees) of Integer
			:= (56, 78, 76, 27, 90, 23, 12, 43, 24, 39);

	-- Initialise l'ABR Abr commen un ABR vide dans lequel ont été insérées
	-- les cles Cles et les données Données ci-dessus.  Attention, c'est à
	-- l'appelant de libérer la mémoire associée à l'arbre retourné en
	-- utilisant Vider.
	procedure Construire_Exemple_Arbre (Annuaire : out T_ABR) is
	begin
		Initialiser (Annuaire);
		pragma Assert (Est_Vide (Annuaire));
		pragma Assert (Taille (Annuaire) = 0);

		for I in 1..Nb_Donnees loop
			Inserer (Annuaire, Cles (I), Donnees (I));

			Put_Line ("Après insertion de la clé " & Cles (I));
			Afficher_Debug (Annuaire); New_Line;

			pragma Assert (not Est_Vide (Annuaire));
			pragma Assert (Taille (Annuaire) = I);

			for J in 1..I loop
				pragma Assert (La_Donnee (Annuaire, Cles (J)) = Donnees (J));
			end loop;

			for J in I+1..Nb_Donnees loop
				pragma Assert (not Est_Cle_Utilisee (Annuaire, Cles (J)));
			end loop;

		end loop;

		-- TODO à supprimer
		-- Vider (Annuaire);
		-- pragma Assert (Est_Vide (Annuaire));
		-- pragma Assert (Taille (Annuaire) = 0);
	end Construire_Exemple_Arbre;


	procedure Tester_Exemple_Arbre is
		Annuaire : T_ABR;
	begin
		Construire_Exemple_Arbre (Annuaire);
		Vider (Annuaire);
		pragma Assert (Est_Vide (Annuaire));
		pragma Assert (Taille (Annuaire) = 0);
	end Tester_Exemple_Arbre;


	-- Tester suppression en commençant par supprimer les feilles.
	procedure Tester_Supprimer_Inverse is
		Annuaire : T_ABR;
	begin
		Put("Tester_Supprimer_Inverse...");

		Construire_Exemple_Arbre (Annuaire);

		for I in reverse 1..Nb_Donnees loop

			Supprimer (Annuaire, Cles (I));

			Put_Line ("Après uppression de " & Cles (I) & " :");
			Afficher_Debug (Annuaire); New_Line;

			for J in 1..I-1 loop
				pragma Assert (Est_Cle_Utilisee (Annuaire, Cles (J)));
				pragma Assert (La_Donnee (Annuaire, Cles (J)) = Donnees (J));
			end loop;

			for J in I..Nb_Donnees loop
				pragma Assert (not Est_Cle_Utilisee (Annuaire, Cles (J)));
			end loop;
		end loop;

		Vider (Annuaire);
	end Tester_Supprimer_Inverse;


	-- Tester suppression. Suppression de noeuds avec deux fils.
	procedure Tester_Supprimer is
		Annuaire : T_ABR;
	begin
		Put("Tester_Supprimer...");

		Construire_Exemple_Arbre (Annuaire);

		for I in 1..Nb_Donnees loop
			Put_Line ("Suppression de " & Cles (I) & " :");

			Supprimer (Annuaire, Cles (I));

			Afficher_Debug (Annuaire); New_Line;

			for J in 1..I loop
				pragma Assert (not Est_Cle_Utilisee (Annuaire, Cles (J)));
			end loop;

			for J in I+1..Nb_Donnees loop
				pragma Assert (Est_Cle_Utilisee (Annuaire, Cles (J)));
				pragma Assert (La_Donnee (Annuaire, Cles (J)) = Donnees (J));
			end loop;
		end loop;

		Vider (Annuaire);
	end Tester_Supprimer;

begin
	Tester_Exemple_Arbre;
	Tester_Supprimer_Inverse;
	Tester_Supprimer;
end Test_ABR;
