with Ada.Text_IO;              use Ada.Text_IO;
with Ada.Characters.Handling;  use Ada.Characters.Handling; -- définit is_digit
with Piles;


package body Integer_IO is


    procedure Afficher (N : in Integer) is

        package Pile_Integer is
            new Piles (Integer'Width, Integer);
        use Pile_Integer;

        Nombre   : Integer;        -- le nombre à afficher (copie de N)
        Chiffre  : Integer;        -- un chiffre de Nombre
        Chiffres : T_Pile;           -- les chiffres de Nombre
        Caractere : Character;     -- le caractère correspondant à Chiffre.

    begin
        -- Empiler les chiffres de l'entier
        Initialiser (Chiffres);
        Nombre := N;
        loop
            -- récupérer le chiffre des unités
            Chiffre := Nombre Mod 10;

            -- l'empiler
            pragma Assert (not Est_Pleine (Chiffres));
            Empiler (Chiffres, Chiffre);

            -- réduire le nombre en supprimant les unités
            Nombre := Nombre / 10;
        exit when Nombre = 0;
        end loop;
        pragma Assert (Nombre = 0);
        pragma Assert (not Est_Vide (Chiffres));

        -- Afficher les chiffres de la pile
        loop
            -- Obtenir le chiffre en sommet de pile
            Chiffre := Sommet (Chiffres);

            -- le convertir en un caractère
            caractere := Character'Val (Character'Pos('0') + Chiffre);

            -- afficher le caractère
            Put (caractere);

            -- supprimer le caractère de la pile
            Depiler (Chiffres);
        exit when Est_Vide (Chiffres);
        end loop;
    end;

    -- Consommer les caratères blancs et indiquer le prochain caractère sur
    -- l'entrée standard.
    -- Assure : C /= ' '
    procedure Consommer_Blancs (Prochain_Caractere : out Character) with
        Post => Prochain_Caractere /= ' '
    is
        Fin_De_Ligne : Boolean;     -- fin de ligne atteinte ?
    begin
        Look_Ahead (Prochain_Caractere, Fin_De_Ligne); -- consulter le caractère suivant
        while Fin_De_Ligne or else Prochain_Caractere = ' ' loop
            -- consommer le caractère consulté
            if Fin_De_Ligne then
                Skip_Line;
            else
                Get (Prochain_Caractere);
            end if;

            -- Consulter le prochain caractère
            Look_Ahead (Prochain_Caractere, Fin_De_Ligne);
        end loop;

        pragma Assert (not Fin_De_Ligne and Prochain_Caractere /= ' ');
    end;


    procedure Saisir (N : out Integer) is
        C            : Character;   -- un caractère lu au clavier
        Fin_De_Ligne : Boolean;     -- fin de ligne atteinte ?
        Chiffre      : Integer;     -- le chiffre correspondant à C

    begin
        Consommer_Blancs (C);

        if Is_Digit (C) then    --{ Un chiffre, donc un entier }--
            -- reconnaître l'entier à partir des caractères de l'entrée standard
            N := 0;
            loop
                -- Mettre à jour N avec C
                Chiffre := Character'Pos (C) - Character'Pos ('0');
                N := N * 10 + Chiffre;

                -- Consulter le caractère suivant
                Get (C);
                Look_Ahead (C, Fin_De_Ligne);
            exit when Fin_De_Ligne or else not Is_Digit (C);
            end loop;
        else --{ Pas d'entier }--
            N := -1;
        end if;
    end;


end Integer_IO;
