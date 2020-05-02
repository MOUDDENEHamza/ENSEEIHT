with Ensembles_Chainage;
with Ada.Text_IO; use Ada.Text_IO;

procedure Scenario_Chainage is

	-- Instancier le paquetage Ensembles_Chainage pour avoir un Ensemble
	-- d'entiers
	package Ensembles_Entiers is
            new Ensembles_Chainage (T_Element => Integer);
        use Ensembles_Entiers;

	-- Définir une opération Afficher qui affiche les éléments d'un ensemble
	-- d'entier en s'appuyant sur Appliquer_Sur_Tous.  L'ensemble {5, 28, 10}
	-- sera affiché :
	--           5         28         10
	procedure Afficher_Entier (e: in Integer) is
        begin
            Put ("     " & Integer'Image(e) & "     ");
        end Afficher_Entier;

        procedure Afficher is new Ensembles_Entiers.Appliquer_Sur_Tous (Afficher_Entier);

	Ens1 : T_Ensemble;

begin
	New_Line;
        Put_Line("*************************** Début ****************************");
        New_Line;

	-- Créer un ensemble vide Ens1
	Initialiser (Ens1);

	-- Afficher l'ensemble
	Put("Ens1 = ");
	Afficher (Ens1);
	New_Line;

	-- Vérifier si vide ou non, sa taille, la présence ou pas de 2, 5, 7, 10
	Put_line("Ens1 est vide : " & Boolean'Image(Est_Vide (Ens1)));
        Put_line("Taille de Ens1 : " & Integer'Image(Taille (Ens1)));
        Put_line("2 est présent dans Ens1 : " & Boolean'Image(Est_Present (Ens1, 2)));
        Put_line("5 est présent dans Ens1 : " & Boolean'Image(Est_Present (Ens1, 5)));
        Put_line("7 est présent dans Ens1 : " & Boolean'Image(Est_Present (Ens1, 7)));
        Put_line("10 est présent dans Ens1 : " & Boolean'Image(Est_Present (Ens1, 10)));

	-- Ajouter 5 dans Ens1
	Put_Line("Ajouter 5");
        Ajouter (Ens1, 5);

	-- Afficher l'ensemble
	Put("Ens1 = ");
	Afficher (Ens1);
	New_Line;

	-- Vérifier si vide ou non, sa taille, la présence ou pas de 2, 5, 7, 10
	Put_line("Ens1 est vide : " & Boolean'Image(Est_Vide (Ens1)));
        Put_line("Taille de Ens1 : " & Integer'Image(Taille (Ens1)));
        Put_line("2 est présent dans Ens1 : " & Boolean'Image(Est_Present (Ens1, 2)));
        Put_line("5 est présent dans Ens1 : " & Boolean'Image(Est_Present (Ens1, 5)));
        Put_line("7 est présent dans Ens1 : " & Boolean'Image(Est_Present (Ens1, 7)));
        Put_line("10 est présent dans Ens1 : " & Boolean'Image(Est_Present (Ens1, 10)));

	-- Ajouter 28 puis 10 dans Ens1
	Put_Line("Ajouter 28");
        Ajouter (Ens1, 28);
        Put_Line("Ajouter 10");
        Ajouter (Ens1, 10);

	-- Afficher l'ensemble
	Put("Ens1 = ");
	Afficher (Ens1);
	New_Line;

	-- Vérifier si vide ou non, sa taille, la présence ou pas de 2, 5, 7, 10
	Put_line("Ens1 est vide : " & Boolean'Image(Est_Vide (Ens1)));
        Put_line("Taille de Ens1 : " & Integer'Image(Taille (Ens1)));
        Put_line("2 est présent dans Ens1 : " & Boolean'Image(Est_Present (Ens1, 2)));
        Put_line("5 est présent dans Ens1 : " & Boolean'Image(Est_Present (Ens1, 5)));
        Put_line("7 est présent dans Ens1 : " & Boolean'Image(Est_Present (Ens1, 7)));
        Put_line("10 est présent dans Ens1 : " & Boolean'Image(Est_Present (Ens1, 10)));

	-- Ajouter 7 dans Ens1
	Put_Line("Ajouter 7");
        Ajouter (Ens1, 7);

	-- Afficher l'ensemble
	Put("Ens1 = ");
	Afficher (Ens1);
	New_Line;
	
	-- Vérifier si vide ou non, sa taille, la présence ou pas de 2, 5, 7, 10
	Put_line("Ens1 est vide : " & Boolean'Image(Est_Vide (Ens1)));
        Put_line("Taille de Ens1 : " & Integer'Image(Taille (Ens1)));
        Put_line("2 est présent dans Ens1 : " & Boolean'Image(Est_Present (Ens1, 2)));
        Put_line("5 est présent dans Ens1 : " & Boolean'Image(Est_Present (Ens1, 5)));
        Put_line("7 est présent dans Ens1 : " & Boolean'Image(Est_Present (Ens1, 7)));
        Put_line("10 est présent dans Ens1 : " & Boolean'Image(Est_Present (Ens1, 10)));

	-- Supprimer 10 en Ens1
	Put_Line("Supprimer 10");
        Supprimer (Ens1, 10);

	-- Afficher l'ensemble
	Put("Ens1 = ");
	Afficher (Ens1);
	New_Line;

	-- Vérifier si vide ou non, sa taille, la présence ou pas de 2, 5, 7, 10
	Put_line("Ens1 est vide : " & Boolean'Image(Est_Vide (Ens1)));
        Put_line("Taille de Ens1 : " & Integer'Image(Taille (Ens1)));
        Put_line("2 est présent dans Ens1 : " & Boolean'Image(Est_Present (Ens1, 2)));
        Put_line("5 est présent dans Ens1 : " & Boolean'Image(Est_Present (Ens1, 5)));
        Put_line("7 est présent dans Ens1 : " & Boolean'Image(Est_Present (Ens1, 7)));
        Put_line("10 est présent dans Ens1 : " & Boolean'Image(Est_Present (Ens1, 10)));

	-- Supprimer 7 en Ens1
	Put_Line("Supprimer 7");
        Supprimer (Ens1, 7);

	-- Afficher l'ensemble
        Put("Ens1 = ");
        Afficher (Ens1);
        New_Line;

	-- Vérifier si vide ou non, sa taille, la présence ou pas de 2, 5, 7, 10
	Put_line("Ens1 est vide : " & Boolean'Image(Est_Vide (Ens1)));
        Put_line("Taille de Ens1 : " & Integer'Image(Taille (Ens1)));
        Put_line("2 est présent dans Ens1 : " & Boolean'Image(Est_Present (Ens1, 2)));
        Put_line("5 est présent dans Ens1 : " & Boolean'Image(Est_Present (Ens1, 5)));
        Put_line("7 est présent dans Ens1 : " & Boolean'Image(Est_Present (Ens1, 7)));
        Put_line("10 est présent dans Ens1 : " & Boolean'Image(Est_Present (Ens1, 10)));

	-- Supprimer 5 en Ens1
	Put_Line("Supprimer 5");
        Supprimer (Ens1, 5);

	-- Afficher l'ensemble
	Put("Ens1 = ");
	Afficher (Ens1);
	New_Line;
	
	-- Vérifier si vide ou non, sa taille, la présence ou pas de 2, 5, 7, 10
	Put_line("Ens1 est vide : " & Boolean'Image(Est_Vide (Ens1)));
        Put_line("Taille de Ens1 : " & Integer'Image(Taille (Ens1)));
        Put_line("2 est présent dans Ens1 : " & Boolean'Image(Est_Present (Ens1, 2)));
        Put_line("5 est présent dans Ens1 : " & Boolean'Image(Est_Present (Ens1, 5)));
        Put_line("7 est présent dans Ens1 : " & Boolean'Image(Est_Present (Ens1, 7)));
        Put_line("10 est présent dans Ens1 : " & Boolean'Image(Est_Present (Ens1, 10)));

	-- Détruire l'ensemble
        Detruire (Ens1);
        
	New_Line;
        Put_Line("***************************** Fin ****************************");
        New_Line;

end Scenario_Chainage;
