with Ada.Text_IO;
use Ada.Text_IO;

procedure Specifier_Et_Tester is

    -- Calculer le plus grand commun diviseur de deux entiers strictement
    -- positifs.
    -- Paramètres :
    --  A : in Entier
    --  B : in Entier
    -- Retour : Entier -- le pgcd de A et B
    -- Nécessite :
    --      A > 0
    --      B > 0
    -- Assure :
    --      Pgcd'Result >= 1
    --      A mod Pgcd'Résultat = 0    -- le pgcd divise A
    --      B mod Pgcd'Résultat = 0    -- le pgcd divise B
    --      -- c'est le plus grand des entiers qui divisent A et B
    --          // mais on ne sait pas l'exprimer simplement
    -- Exemples : voir Tester_Pgcd
    -- Efficacité : faible car on utilise une version naïve de l'algorithme
    -- d'Euclide.
    function Pgcd (A, B : in Integer) return Integer with
        Pre =>  A > 0 and B > 0,
        Post =>  Pgcd'Result >= 1
            and A mod Pgcd'Result = 0 -- Le Pgcd divise A
            and B mod Pgcd'Result = 0 -- Le Pgcd divise B
    is
        L_A, L_B: Integer;  -- variables correspondant à A et B
            -- A et B étant en in, on ne peut pas les modifier dans la
            -- fonction.  Or pour appliquer l'algortihme d'Euclide, il faut
            -- retrancher le plus petit au plus grand jusqu'à avoir deux
            -- nombres égaux.  Nous passons donc par des variables locales et
            -- utilisons le nom des paramètres formels préfixés par 'L_'.
    begin
        L_A := A;
        L_B := B;
        while L_A /= L_B loop
            -- soustraire au plus grand le plus petit
            if L_A > L_B then
                L_A := L_A - L_B;
            else
                L_B := L_B - L_A;
            end if;
        end loop;
        pragma Assert (L_A = L_B);  -- la condition de sortie de boucle.
        return L_A;
    end Pgcd;


    -- Exemple d'utilisation du Pgcd.
    -- Est-ce que le corps de cette procédure est correct ?  Pourquoi ?
    -- Que donne son exécution ?
    -- Non le corps de cette procédure n'est pas correct car A ET B doivent
    -- etre strictement positifs.
    -- Ça va boucler à l'infini lors de l'éxecution
    procedure Utiliser_Pgcd is
        Resultat: Integer;
    begin
        Resultat := Pgcd (0, 10);
        Put ("Pgcd (0, 10) = " & Integer'Image(Resultat));
    end Utiliser_Pgcd;


    -- Permuter deux entiers.
    -- Paramètres :
    --  A, B : in out Entier    -- les deux entiers à permuter
    -- Nécessite : Néant
    -- Assure :
    --  A = B'Avant et B = A'Avant  -- les valeurs de A et B sont bien permutées
    procedure Permuter (A, B: in out Integer) with
        Post => A = B'Old and B = A'Old
    is
        Copie_A : Integer;
    begin
        Copie_A := A;
        A := B;
        B := Copie_A;
    end Permuter;


    -- Procédure de test de Pgcd.
    -- -- Parce que c'est une procédure de test, elle n'a pas de paramètre,
    -- -- pas de type de retour, pas de précondition, pas de postcondition.
    procedure Tester_Pgcd is
    begin
        pragma Assert (4 = Pgcd (4, 4));       -- A = B
        pragma Assert (2 = Pgcd (10, 16));     -- A < B
        pragma Assert (1 = Pgcd (21, 10));     -- A > B
        pragma Assert (3  = Pgcd (105, 147));  -- un autre
    end Tester_Pgcd;


    -- Procédure de test pour mettre en évidence la faible efficacité de Pgcd.
    procedure Tester_Performance_Pgcd is
    begin
        pragma Assert (1 = Pgcd (1, 10 ** 9)); -- lent !
    end Tester_Performance_Pgcd;


    -- Procédure de test de Permuter.
    procedure Tester_Permuter is
        N1, N2: Integer;
    begin
        -- initialiser les données du test
        N1 := 5;
        N2 := 18;

        -- lancer la procédure à tester
        Permuter (N1, N2);

        -- contrôler que la procédure a eu l'effet escompté
        pragma Assert (18 = N1);
        pragma Assert (5 = N2);
    end Tester_Permuter;


begin
    --Utiliser_Pgcd;

    -- lancer les programmes de test.
    Tester_Pgcd;
    Tester_Performance_Pgcd;
    Tester_Permuter;
    Put_Line ("Fini.");

end Specifier_Et_Tester;
