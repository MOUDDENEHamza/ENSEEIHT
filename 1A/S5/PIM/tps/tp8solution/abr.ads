package ABR is

	type T_ABR is limited private;

	Cle_Presente_Exception : Exception;	-- une clé est déjà présente dans un ABR
	Cle_Absente_Exception  : Exception;	-- une clé est absente d'un ABR

	-- Initialiser un ABR Abr.  L'ABR est vide.
	procedure Initialiser(Abr: out T_ABR) with
		Post => Est_Vide (Abr);


	-- Est-ce qu'un ABR Abr est vide ?
	function Est_Vide (Abr : T_Abr) return Boolean;


	-- Obtenir le nombre d'éléments d'un ABR. 
	function Taille (Abr : in T_ABR) return Integer with
		Post => Taille'Result >= 0
			and (Taille'Result = 0) = Est_Vide (Abr);


	-- Insérer la donnée Donnée associée à la clé Clé dans l'ABR Abr.
	-- Exception : Cle_Presente_Exception si la clé est déjà dans l'Abr.
	procedure Inserer (Abr : in out T_ABR ; Cle : in Character ; Donnee : in Integer) with
		Post => La_Donnee (Abr, Cle) = Donnee			-- donnée insérée
			; -- XXX and Taille (Abr) = Taille (Abr)'Old + 1; -- un élément de plus


	-- Modifier la donnée Donnée associée à la clé Clé dans l'ABR Abr.
	-- Exception : Cle_Absente_Exception si Clé n'est pas utilisée dans l'Abr
	procedure Modifier (Abr : in out T_ABR ; Cle : in Character ; Donnee : in Integer) with
		Post => La_Donnee (Abr, Cle) = Donnee;		-- donnée mise à jour


	-- Supprimer la donnée associée à la clé Clé dans l'ABR Abr.
	-- Exception : Cle_Absente_Exception si Clé n'est pas utilisée dans l'Abr
	procedure Supprimer (Abr : in out T_ABR ; Cle : in Character) with
		Post =>  Taille (Abr) = Taille (Abr)'Old - 1; -- un élément de moins


	-- Obtenir la donnée associée à la clé Cle dans l'ABR Abr.
	-- Exception : Cle_Absente_Exception si Clé n'est pas utilisée dans l'Abr
	function La_Donnee (Abr : in T_ABR ; Cle : in Character) return Integer;


	-- Supprimer tous les éléments d'un ABR.
	-- Doit être utilisée dès qu'on sait qu'un ABR ne sera plus utilisé.
	procedure Vider (Abr : in out T_ABR) with
		Post => Est_Vide (Abr);


	-- Afficher un ABR Abr dans l'ordre croissant des clés (parcours infixe)
	procedure Afficher (Abr : in T_Abr);

	-- Afficher un ABR Abr (en faisant apparaître la strucre grâce à une
	-- indendation et un signe '<', '>', '/' pour indiquer la sous-arbre
	-- gauche, '>' pour un sous arbre droit et '/' pour la racine)
	-- Exemple :
	--
	--  / Cle1 : Valeur1
	--      < Cle2 : Valeur2
	--          > Cle3 : Valeur3
	--      > Cle4 : Valeur 4
	--          < Cle5 : Valeur 5
	procedure Afficher_Debug (Abr : in T_Abr);

private

	type T_Noeud;
	type T_ABR is access T_Noeud;
	type T_Noeud is
		record
			Cle: Character;
			Donnee : Integer;
			Sous_Arbre_Gauche : T_ABR;
			Sous_Arbre_Droit : T_ABR;
			-- Invariant
			--    Pour tout noeud N dans Sous_Arbre_Gauche, N.Cle < Cle
			--    Pour tout noeud N dans Sous_Arbre_Droit,  N.Cle > Cle
		end record;

end ABR;
