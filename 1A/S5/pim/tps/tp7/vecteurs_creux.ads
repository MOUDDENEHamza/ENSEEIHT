-- Ce module définit un type Vecteur_Creux et les opérations associés. Un
-- vecteur creux est un vecteur qui contient essentiellement des 0. Aussi pour
-- économiser l'espace de stockage et les temps de calculs, on ne conserve que
-- les valeurs non nulles.

package Vecteurs_Creux is

	type T_Vecteur_Creux is private;


	-- Initialiser un vecteur creux.  Il est nul.
	procedure Initialiser (V : out T_Vecteur_Creux) with
		Post => Est_Nul (V);

	-- Détruire le vecteur V.
	procedure Detruire (V: in out T_Vecteur_Creux);


	-- Est-ce que le vecteur V est nul ?
	function Est_Nul (V : in T_Vecteur_Creux) return Boolean;


	-- Récupérer la composante (valeur) du vecteur V à l'indice Indice.
	function Composante_Recursif (V : in T_Vecteur_Creux ; Indice : in Integer) return Float
		with Pre => Indice >= 1;


	-- Récupérer la composante (valeur) du vecteur V à l'indice Indice.
	function Composante_Iteratif (V : in T_Vecteur_Creux ; Indice : in Integer) return Float
		with Pre => Indice >= 1;


	-- Modifier une composante (Indice, Valeur) d'un vecteur cregut V.
	procedure Modifier (V : in out T_Vecteur_Creux ;
				       Indice : in Integer ;
					   Valeur : in Float ) with
		pre => Indice >= 1,
		post => Composante_Recursif (V, Indice) = Valeur;


	-- Est-ce que deux vecteurs creux sont égaux ?
	function Sont_Egaux_Recursif (V1, V2 : in T_Vecteur_Creux) return Boolean;


	-- Est-ce que deux vecteurs creux sont égaux ?
	function Sont_Egaux_Iteratif (V1, V2 : in T_Vecteur_Creux) return Boolean;


	-- Additionner V1 avec V2. Ce sous-programme réalise l'opération suivante :
	--  V1 := V1 + V2
	procedure Additionner (V1 : in out T_Vecteur_Creux; V2 : in out T_Vecteur_Creux);


	-- Norme au carré du vecteur V.
	function Norme2 (V : in T_Vecteur_Creux) return Float;


	-- Le produit scalaire de deux vecteurs.
	function Produit_Scalaire (V1, V2: in T_Vecteur_Creux) return Float;


	-- Afficher le vecteur creux à des fins de mise au point.
	procedure Afficher (V : T_Vecteur_Creux);


	-- Nombre de composantes non nulles du vecteur V.
	--
	-- Ce sous-programme ne fait normalement pas partie de la spécification
	-- du module.  Il a été ajouté pour faciliter l'écriture des programmes
	-- de test.
	function Nombre_Composantes_Non_Nulles (V: in T_Vecteur_Creux) return Integer with
		Post => Nombre_Composantes_Non_Nulles'Result >= 0;


private

	type T_Cellule;

	type T_Vecteur_Creux is access T_Cellule;

	type T_Cellule is
		record
			Indice : Integer;
			Valeur : Float;
			Suivant : T_Vecteur_Creux;
			-- Invariant :
			--   Indice >= 1;
			--   Suivant = Null or else Suivant.all.Indice > Indice;
			--   	-- les cellules sont stockés dans l'ordre croissant des indices.
		end record;

end Vecteurs_Creux;
