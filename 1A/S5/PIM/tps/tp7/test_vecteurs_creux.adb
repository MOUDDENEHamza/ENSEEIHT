with Ada.Text_IO;       use Ada.Text_IO;
with Vecteurs_Creux;    use Vecteurs_Creux;


procedure Test_Vecteurs_Creux is


	procedure Initialiser (VC0, VC1, VC2 : out T_Vecteur_Creux) is
	begin
		-- VC0 est un vecteur nul
		Initialiser (VC0);

		-- VC1 est un vecteur à deux composante
		Initialiser (VC1);
		Modifier (VC1, 10,  4.0);
		Modifier (VC1,  3, -3.0);

		Initialiser (VC2);
		Modifier (VC2,  100, 2.0);
		Modifier (VC2,    3, 3.0);
		Modifier (VC2,    1, 2.0);

		-- Afficher les vecteurs
		Put ("VC0 = "); Afficher (VC0); New_Line;
		Put ("VC1 = "); Afficher (VC1); New_Line;
		Put ("VC2 = "); Afficher (VC2); New_Line;
	end;


	procedure Detruire (VC0, VC1, VC2 : in out T_Vecteur_Creux) is
	begin
		Detruire (VC0);
		Detruire (VC1);
		Detruire (VC2);
	end;


	procedure Tester_Nul is
		VC0, VC1, VC2: T_Vecteur_Creux;
	begin
		Initialiser (VC0, VC1, VC2);

		pragma Assert (Est_Nul (VC0));
		pragma Assert (not Est_Nul (VC1));
		pragma Assert (not Est_Nul (VC2));

		Detruire (VC0, VC1, VC2);
	end Tester_Nul;


	procedure Tester_Norme2 is
		VC0, VC1, VC2: T_Vecteur_Creux;
	begin
		Initialiser (VC0, VC1, VC2);

		pragma Assert (0.0 = Norme2 (VC0));
		pragma Assert (25.0 = Norme2 (VC1));

		Detruire (VC0, VC1, VC2);
	end Tester_Norme2;


	type T_Fonction_Composante is
		access Function (VC : in T_Vecteur_Creux ; Indice : in Integer) return Float;
		--// Un pointeur sur un sous-programme permet de manipuler un
		--// sous-programme comme une donnée.

	Composante : constant T_Fonction_Composante := Composante_Recursif'Access;
		--// Composante est donc une constante qui pointe sur le sous-programme
		--// Composante_Recursif.


	procedure Tester_Composante(La_Composante : T_Fonction_Composante) is
		--// Remarque : On aurait pu arriver au même résultat en définissant un
		--// sous-programme générique.
		--// Voir Tester_Sont_Egaux pour une version générique.

		VC0, VC1, VC2: T_Vecteur_Creux;
	begin
		Initialiser (VC0, VC1, VC2);
		pragma Assert ( 0.0 = La_Composante (VC0, 1));
		pragma Assert ( 0.0 = La_Composante (VC1, 1));
		pragma Assert (-3.0 = La_Composante (VC1, 3));
		pragma Assert ( 0.0 = La_Composante (VC1, 4));
		pragma Assert ( 0.0 = La_Composante (VC1, 9));
		pragma Assert ( 4.0 = La_Composante (VC1, 10));
		pragma Assert ( 0.0 = La_Composante (VC1, 11));

		Detruire (VC0, VC1, VC2);
	end Tester_Composante;


	procedure Tester_Modifier is
		VC0, VC1, VC2: T_Vecteur_Creux;
	begin
		Initialiser (VC0, VC1, VC2);

		pragma Assert (2 = Nombre_Composantes_Non_Nulles (VC1));

		-- Changer des composantes non nulles
		-- * en première position
		Modifier (VC1, 3, 3.0);
		pragma Assert (3.0 = Composante (VC1, 3));
		pragma Assert (2 = Nombre_Composantes_Non_Nulles (VC1));

		-- * après la première
		Modifier (VC1, 10, 15.0);
		pragma Assert (15.0 = Composante (VC1, 10));
		pragma Assert (2 = Nombre_Composantes_Non_Nulles (VC1));

		-- Ajouter au début
		Modifier (VC1, 1, 1.5);
		pragma Assert (1.5 = Composante (VC1, 1));
		pragma Assert (3 = Nombre_Composantes_Non_Nulles (VC1));

		-- Ajouter au milieu
		Modifier (VC1, 7, 7.5);
		pragma Assert (7.5 = Composante (VC1, 7));
		pragma Assert (4 = Nombre_Composantes_Non_Nulles (VC1));

		-- Ajouter à la fin.
		Modifier (VC1, 111, 0.5);
		pragma Assert (0.5 = Composante (VC1, 111));
		pragma Assert (5 = Nombre_Composantes_Non_Nulles (VC1));

		-- Mettre à 0.0 une composante existante
		-- * Au milieu
		Modifier (VC1, 10, 0.0);
		pragma Assert (0.0 = composante (VC1, 10));
		pragma Assert (4 = Nombre_Composantes_Non_Nulles (VC1));

		-- * À la fin
		Modifier (VC1, 111, 0.0);
		pragma Assert (0.0 = composante (VC1, 111));
		pragma Assert (3 = Nombre_Composantes_Non_Nulles (VC1));

		-- * Au début
		Modifier (VC1, 1, 0.0);
		pragma Assert (0.0 = composante (VC1, 1));
		pragma Assert (2 = Nombre_Composantes_Non_Nulles (VC1));


		-- Mettre à 0.0 une composante déjà nulle
		Modifier (VC1, 6, 0.0);
		pragma Assert (2 = Nombre_Composantes_Non_Nulles (VC1));
		Modifier (VC1, 2, 0.0);
		pragma Assert (2 = Nombre_Composantes_Non_Nulles (VC1));
		Modifier (VC1, 56, 0.0);
		pragma Assert (2 = Nombre_Composantes_Non_Nulles (VC1));
		
		-- Supprimer toutes les composantes
		Modifier (VC1, 7, 0.0);
		pragma Assert (1 = Nombre_Composantes_Non_Nulles (VC1));
		Modifier (VC1, 3, 0.0);
		pragma Assert (0 = Nombre_Composantes_Non_Nulles (VC1));
		pragma Assert (Est_Nul (VC1));

		Detruire (VC0, VC1, VC2);
	end Tester_Modifier;


	generic
		with function Egaux (Vecteur1, Vecteur2 : in T_Vecteur_Creux) return Boolean;
	procedure Tester_Sont_Egaux;


	procedure Tester_Sont_Egaux is
		VC0, VC1, VC2, VC3: T_Vecteur_Creux;
	begin
		Initialiser (VC0, VC1, VC2);

		pragma Assert (Egaux (VC0, VC0));
		pragma Assert (Egaux (VC1, VC1));
		pragma Assert (Egaux (VC2, VC2));

		pragma Assert (not Egaux (VC0, VC1));
		pragma Assert (not Egaux (VC0, VC2));
		pragma Assert (not Egaux (VC1, VC2));

		pragma Assert (not Egaux (VC1, VC0));
		pragma Assert (not Egaux (VC2, VC0));
		pragma Assert (not Egaux (VC2, VC1));

		-- VC3 avec les mêmes composantes que VC1
		Initialiser (VC3);
		Modifier (VC3, 10,  4.0);
		Modifier (VC3,  3, -3.0);

		pragma Assert (Egaux (VC1, VC3));
		pragma Assert (Egaux (VC3, VC1));

		Detruire (VC0, VC1, VC2);
		Detruire (VC3);
	end Tester_Sont_Egaux;


	--// Remarque : si on instancie les deux sous-programmes suivant juste
	--// avant l'implantation de Tester_Sont_Egaux ci-dessus, on n'a pas
	--// d'erreur de compilation mais une erreur à l'exécution.
	procedure Tester_Sont_Egaux_Iteratif is
		new Tester_Sont_Egaux (Sont_Egaux_Iteratif);


	procedure Tester_Sont_Egaux_Recursif is
		new Tester_Sont_Egaux (Sont_Egaux_Recursif);


	procedure Tester_Produit_Scalaire is
		VC0, VC1, VC2, VC3: T_Vecteur_Creux;
	begin
		Initialiser (VC0, VC1, VC2);

		pragma Assert (0.0 = Produit_Scalaire (VC0, VC1));
		pragma Assert (0.0 = Produit_Scalaire (VC0, VC2));
		pragma Assert (0.0 = Produit_Scalaire (VC1, VC0));

		pragma Assert (-9.0 = Produit_Scalaire (VC1, VC2));

		pragma Assert (25.0 = Produit_Scalaire (VC1, VC1));

		Initialiser (VC3);
		Modifier (VC3, 150, 5.0);
		Modifier (VC3,  10, 4.0);
		Modifier (VC3,   3, 3.0);
		Modifier (VC3,   2, 2.0);
		Modifier (VC3,   1, 1.0);

		pragma Assert (11.0 = Produit_Scalaire (VC2, VC3));
		pragma Assert (11.0 = Produit_Scalaire (VC3, VC2));

		pragma Assert (7.0 = Produit_Scalaire (VC1, VC3));
		pragma Assert (7.0 = Produit_Scalaire (VC3, VC1));

		Detruire (VC0, VC1, VC2);
		Detruire (VC3);
	end Tester_Produit_Scalaire;


	procedure Tester_Additionner_Partage is
		VC0, VC1: T_Vecteur_Creux;
	begin
		-- Construire VC0
		Initialiser (VC0);
		for I in 1..5 loop
			Modifier (VC0, I, Float(I));
		end loop;

		-- Construire VC1
		Initialiser (VC1);
		for I in 4..15 loop
			Modifier (VC1, I, Float(I));
		end loop;

		-- Additionner
		Additionner (VC0, VC1);

		-- Vérifier qu'il n'y a pas de partage entre cellules de VC0 et VC1
		Modifier (VC1, 10, 111.0);
		pragma Assert (111.0 = Composante (VC1, 10));
		pragma Assert (10.0 = Composante (VC0, 10));

		Detruire (VC0);
		Detruire (VC1);
	end Tester_Additionner_Partage;


	procedure Tester_Additionner is
		VC0, VC1, VC2: T_Vecteur_Creux;
	begin
		Initialiser (VC0, VC1, VC2);
		Additionner (VC0, VC1);
		
		pragma Assert (Sont_Egaux_Recursif (VC0, VC1));
		pragma Assert (2 = Nombre_Composantes_Non_Nulles (VC0));
		pragma Assert (-3.0 = Composante (VC0,   3));
		pragma Assert ( 4.0 = Composante (VC0,  10));
		
		Additionner (VC0, VC2);
	
		pragma Assert (3 = Nombre_Composantes_Non_Nulles (VC0));
		pragma Assert (2.0 = Composante (VC0,   1));
		pragma Assert (0.0 = Composante (VC0,   3));
		pragma Assert (4.0 = Composante (VC0,  10));
		pragma Assert (2.0 = Composante (VC0, 100));

		Additionner (VC2, VC1);

		pragma Assert (Sont_Egaux_Recursif (VC0, VC2));

		Detruire (VC0, VC1, VC2);
	end Tester_Additionner;


begin
	New_Line;
    	Put_Line("*************************** Début ****************************");
    	New_Line;
	
	-- Tester la fonction Est_Null.
	Tester_Nul;
	Put_line("Fonction Est_Nul testé avec succès.");
	
	--Tester_Norme2;
	
	-- Tester la fonction Composante_Recursif.
	Tester_Composante (Composante_Recursif'Access);
	Put_line("Fonction Composante_Recursif testé avec succès.");

	-- Tester la fonction Composante_Iteratif.
	Tester_Composante (Composante_Iteratif'Access);
	Put_line("Fonction Composante_Iteratif testé avec succès.");

	-- Tester la fonction Composante_Iteratif.
	Tester_Modifier;
	Put_line("Fonction Tester_Modifier testé avec succès.");
	
	-- Tester la fonction Sont_Egaux_Recursif.
	Tester_Sont_Egaux_Recursif;
	Put_line("Fonction Sont_Egaux_Recursif testé avec succès.");

	-- Tester la fonction Sont_Egaux_Iteratif.
	Tester_Sont_Egaux_Iteratif;
	Put_line("Fonction Sont_Egaux_Iteratif testé avec succès.");

	--Tester_Produit_Scalaire;
	
	--Tester_Additionner_Partage;
	
	-- Tester la fonction Sont_Egaux_Iteratif.
	Tester_Additionner;
	Put_line("Fonction Additionner testé avec succès.");
	
	New_Line;
    	Put_Line("***************************** Fin ****************************");
end Test_Vecteurs_Creux;
