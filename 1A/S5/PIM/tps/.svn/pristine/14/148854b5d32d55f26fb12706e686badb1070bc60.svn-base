with Piles;
with Ada.Text_IO;            use Ada.Text_IO;
with Ada.Unchecked_Deallocation;	--// Pour libérer la mémoire allouée dynamiquement

procedure Exemples_Memoire_Dynamique is


	type T_Pointeur_Integer is access Integer;


	procedure Free
		is new Ada.Unchecked_Deallocation (Integer, T_Pointeur_Integer);
		-- ou Ada.Unchecked_Deallocation (Object => Integer, Name => T_Pointeur_Integer);

	-- Allocation dynamique de mémoire et libération de cette mémoire.
	procedure Illustrer_Memoire_Dynamique is
		Ptr1 : T_Pointeur_Integer;
	begin
		Ptr1 := new Integer;			-- Allocation dyamique de mémoire
		Ptr1.all := 5;					-- Utilisation de cette mémoire
		Put_Line ("Ptr1.all = " & Integer'Image (Ptr1.all));
		Free (Ptr1);					-- Libération de la mémoire
		pragma Assert (Ptr1 = Null);	-- Free met le pointeur à Null
	end Illustrer_Memoire_Dynamique;


	-- Mémoire allouée dynamiquement et non libérée.
	procedure Illustrer_Memoire_Dynamique_Sans_Free is
		Ptr1 : T_Pointeur_Integer;
	begin
	    	Ptr1 := new Integer;
	    	Ptr1.all := 5;
		Put_Line ("Ptr1.all = " & Integer'Image (Ptr1.all));
		Free (Ptr1);
	end Illustrer_Memoire_Dynamique_Sans_Free;


	-- Illustrer la libération explicite de la mémoire et les précautions à
	-- prendre...
	procedure Illustrer_Memoire_Dynamique_Erreur is

		Ptr1, Ptr2 : T_Pointeur_Integer;
	begin
		Ptr1 := new Integer;
		Ptr2 := Ptr1;
		Ptr1.all := 5;
		pragma Assert (Ptr1.all = 5);
		pragma Assert (Ptr2.all = 5);

		Free (Ptr1);

		pragma Assert (Ptr1 = Null);	-- le pointeur est bien mis à Null
		pragma Assert (Ptr2 /= Null);

		-- XXX Quelle est la valeur de Ptr2.all ? Null.
		--Put_Line ("Ptr2.all = " & Integer'Image (Ptr2.all));

		--Ptr2.all := 7;
		--pragma Assert (Ptr2.all = 7);

		-- XXX A-t-on le droit de manipuler Ptr2.all ? Non.
		-- Si on éxucute le programme une exception est levée.
		-- XXX Que se passe-t-il si on exécute le programme avec valkyrie ?
		--
		--
		-- Le terme "Unchecked" dans Unchecked_Deallocation vient de là.  Ada
		-- n'a pas de moyen de contrôler que quand on libère de la mémoire il
		-- n'y a plus aucun pointeur dans le programme qui la référence.  C'est
		-- à la charge du programmeur !  Utiliser un ramasse-miettes (garbage
		-- collector) résoud ce problème car il ne libèrera la mémoire que s'il
		-- n'y a plus aucune référence dessus.
	end Illustrer_Memoire_Dynamique_Erreur;



	-- Illustrer les conséquence d'avoir un paramètre en in qui est un pointeur.
	procedure Illustrer_Pointeur_In is

		procedure SP (Ptr : in T_Pointeur_Integer) is
		begin
			Ptr.all := 123;
		end SP;

		Ptr : T_Pointeur_Integer;

	begin
		Ptr := new Integer;
		Ptr.all := 111;
		SP (Ptr);
		-- XXX Quelle est la valeur de Ptr.all ? 123
		Put_Line ("valeur de Ptr.all ? " & Integer'Image (Ptr.all));

		Free (Ptr);
	end Illustrer_Pointeur_In;


	-- Illustrer la question "Faut-il Detruire un pile chaînée si c'est
	-- une variable locale d'un sous-programme ?".
	procedure Illustrer_Pile_Locale is

		package Pile is
			new Piles (Integer);
		use Pile;

		P : T_Pile;
	begin
		Initialiser (P);
		Empiler (P, 4);
		Put_Line ("Sommet = " & Integer'Image (Sommet (P)));
		Empiler (P, 2);
		Put_Line ("Sommet = " & Integer'Image (Sommet (P)));
		Detruire (P);
		-- XXX P étant une variable locale du sous-programme, a-t-on besoin
		-- d'appeler Detruire dessus ? OUI
	end Illustrer_Pile_Locale;


begin
	Illustrer_Memoire_Dynamique;
	Illustrer_Memoire_Dynamique_Sans_Free;
	Illustrer_Memoire_Dynamique_Erreur;
	Illustrer_Pointeur_In;
	Illustrer_Pile_Locale;
end Exemples_Memoire_Dynamique;
