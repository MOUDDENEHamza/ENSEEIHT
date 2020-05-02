--------------------------------------------------------------------------------
--  Fichier  : multiplications.adb
--  Auteur   : MOUDDENE Hamza
--  Objectif : Réviser les tables de multiplications
--  Crée     : Lundi Sept 23 2019
--------------------------------------------------------------------------------

with Ada.Text_IO;           use Ada.Text_IO;
with Ada.Integer_Text_IO;   use Ada.Integer_Text_IO;
with Ada.Calendar;          use Ada.Calendar;
With Alea;

-- Procédure qui sert à réaliser le programme principal. 
procedure Multiplications is

    package Mon_Alea is
            new Alea (1, 10);  -- générateur de nombre dans l'intervalle [1, 10]
    use Mon_Alea;

    -- Définitions de toutes les variables
    --
    n_table: Integer;		-- Lu au clavier désigne la table à réviser.
    n_table_a_reviser: Integer;	-- Un entier correspondant à la table 
                                -- qu'il faut réviser.
    nombre_alea: Integer;	-- Le nombre aléatoire généré lors de la question.
    reponse: Integer;		-- Contient la réponse de l'utilisateur.
    erreurs: Integer;		-- Nombre d'erreurs commises par l'utilisateur.
    stop: Integer;		-- Une variable qui sert à définir si l'utilisateur 
                   		-- souhaite continuer si stop = 1 sinon elle reçoit 0.
    Debut: Time;         	-- Heure de début de l'opération.
    Fin: Time;           	-- Heure de fin de l'opération.
    Delai : Duration;    	-- Durée de l'opération.
    Max_Delai: Duration;	-- Le temps maximal écoulé pour répondre
                                -- une question.
    Total_Delai: Duration;	-- Le temps total de toutes les
                                -- les réponses.
    Moyen_Delai: Duration;	-- Le temps moyen pour que
                                -- L'utilisateur réponde à une 
                                -- questions plus une seconde.
    
begin
    
    -- R1 : Comment "Réviser les tables de multiplications".
    --
    -- R2 : Comment"Initialisation des variables".
    --
    n_table_a_reviser := 0;
    Max_Delai := Duration(0);
    Total_Delai := Duration(0);
    Moyen_Delai := Duration(0);

    -- Afficher un message convivial au démarage du programme.
    put_Line("------------Bienvenue dans votre espace de travail-------------");
    New_Line;

    Repeter :
    loop
	
        -- R2 : Comment "réviser une table de multiplications".
        --
        -- R3 : Comment "Demander à l'utilisateur la table qu'il veut réviser".
        erreurs := 0;
	Repeter_1 :
        loop
            put("Table à réviser : "); -- Afficher un message avant la lecture.
            Get(n_table); -- Obtenir la table que l'utilisateur veut réviser.    
            New_Line;
	    if (n_table < 1 or  n_table > 10) then
		Put_Line("Error : Faut entrer une table entre 1 et 10.");
		New_Line;
	    end if;
            exit Repeter_1 when n_table >= 1 and n_table <= 10;
        end loop Repeter_1;

        -- Afficher le message permettant de signaler l'existance de
        -- l'option abondonner avant de commencer une table de multiplications.
        Put_Line("Si vous voulez abondonner, tapez 0 dans le résultat.");
        New_Line;

        for i in 1..10 loop

            -- R3 : Comment "Réviser une question de la table de multiplications".
            --
            -- R4 :  Comment "Poser une question de la table de multiplications"
            --
            -- R5 : Comment "Génerer la question".
            --
            -- Obtenir et stocker un nombre aléatoire dans nombre_alea entre 1 et 10.
            Get_Random_Number(nombre_alea);

            -- Affichage de la question.
            Put("(M" &Integer'Image(i) & ")" & Integer'Image(n_table) & " * " & Integer'Image(nombre_alea) & " ? ");

            -- R5 : Comment "Démarrer le chrono".
            --
            Debut := Clock; -- Récupérer l'heure (heure de début).

            Get(reponse); -- Obtenir la réponse.

            -- R5 : Comment "possibilité d'abondonner la révision".
            --
            if reponse = 0 then -- Si l'utilisateur souhaite abondonner le programme.
                New_Line;
                GOTO QUIT; -- Quitter le programme.
            end if;

            -- R5 : Comment "Arreter le chrono".
            --
            Fin := Clock; -- Récupérer l'heure (heure de fin).
            Delai := Fin - Debut; -- Calculer la durée de l'opération.

            -- R5 : Comment "Calculer les délais".
            --
            if Delai > Max_Delai then 
                n_table_a_reviser := nombre_alea;
                Total_Delai := Total_Delai + Delai;
                Max_Delai := Delai;
            else
                Total_Delai := Moyen_Delai + Delai;
            end if;

            -- R4 : Comment "évaluer la réponse".
            --
            if reponse = n_table * nombre_alea then
                Put_Line("Bravo !");
            else
                erreurs := erreurs + 1;
                Put_Line("Mauvaise réponse.");
            end if;

            New_Line;
        end loop;

        -- R3 : Comment "évaluer la prestation de l'utilisateur".
        --
        case erreurs is
        	when 0      => Put_Line("Aucune erreur. Excellent!");
        	when 1      => Put_Line("Une seule  erreur. Très bien.");
        	when 2 | 3	=> Put_Line(Integer'Image(erreurs) & " erreurs. Bien!");
        	when 10     => Put_Line("Tout est faux! Volontaire?");
        	when others	=> null;
        end case;
        New_Line;

        -- R4 : Comment "Incitation à réviser".
        --
        if  erreurs > 5 then
            Put_Line(Integer'Image(erreurs) & " erreurs. Il faut apprendre la table de " & Integer'Image(n_table) & ".");
        else
            Put_Line(Integer'Image(erreurs) & " erreurs. Il faut encore travailler la table de " & Integer'Image(n_table) & ".");
        end if;
        New_Line;

        -- R5 : Comment "Recommandations".
        --
        Moyen_Delai := (Total_Delai / 10) + Duration(1); -- Calcul du delai moyen.
        Put_Line("Des hésitations sur la table de " & Integer'Image(n_table_a_reviser) & " : " & Duration'Image(Max_Delai) & " secondes contre " & Duration'Image(Moyen_Delai) & " secondes en moyenne.");
        New_Line;

        -- R3 : Comment "proposer de continuer la révision".
        --
        Repeter_2 :
        loop
            Put_Line("Vous voulez continuer de réviser ?");
            Put_Line("Si oui tapez 1, sinon tapez 0");
            Put("Votre choix : ");
            get(stop);             
            New_Line;
            exit Repeter_2 when stop = 1 or stop = 0;
        end loop Repeter_2;

        exit repeter when stop = 0;
    end loop repeter;

    <<QUIT>>
    -- Afficher un message convivial à la fin du programme.
    put_Line("--------------------------AU REVOIR----------------------------");
    New_Line;

end Multiplications;
