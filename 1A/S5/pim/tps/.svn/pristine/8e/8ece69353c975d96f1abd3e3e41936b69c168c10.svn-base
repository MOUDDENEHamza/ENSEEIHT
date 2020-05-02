with Piles;
with Ada.Text_IO;            use Ada.Text_IO;
with Ada.Integer_Text_IO;    use Ada.Integer_Text_IO;
with Ada.Characters.Latin_1;  -- des constantes comme Apostrophe (Latin1 ?!?!)
use Ada.Characters.Latin_1;

-- Programme de test du module Pile.
procedure Utiliser_Piles is


    -- Utiliser la pile pour en montrer les possibilités sur un exemples.
    --// Attention, même si on utiliser « pragma Assert », on ne peut pas
    --// vraiment considérer cette procédure comme un programme de tests.
    --// Il est souhaitables que chaque programmes de test soit court,
    --// indépendant des autres et teste un aspect.
    procedure Utiliser_Pile_Caractere is

        package Pile_Caractere_3 is
            new Piles (Capacite => 3, T_Element => Character);
            --// On a nommé les paramètres de généricité.  On peut ne pas les
            --// nommer à condition de respecter l'ordre
            --//
            --//    package Pile_Caractere_3 is
            --//        new Piles (3, Character);

        use Pile_Caractere_3;

        procedure Afficher_Pile is new Afficher (Afficher_Element => Put);

        Pile : T_Pile;
    begin
        Put_Line ("Tester_Pile_Caractere");
        -- initilaiser la pile
        Initialiser (Pile);
        pragma Assert (Est_Vide (Pile));

        -- empiler un premier élément
        Empiler (Pile, 'A');
        pragma Assert (not Est_Vide (Pile));
        pragma Assert (not Est_Pleine (Pile));
        pragma Assert ('A' = Sommet (Pile));

        -- remplir la pile
        Empiler (Pile, 'B');
        pragma Assert ('B' = Sommet (Pile));
        Empiler (Pile, 'C');
        pragma Assert ('C' = Sommet (Pile));
        pragma Assert (not Est_Vide (Pile));
        pragma Assert (Est_Pleine (Pile));

        -- Afficher la pile
        Afficher_Pile (Pile);  New_Line;

        -- supprimer un éléments
        Depiler (Pile);
        pragma Assert (not Est_Pleine (Pile));
        pragma Assert ('B' = Sommet (Pile));

        -- ajouter un élément
        Empiler (Pile, 'D');
        pragma Assert ('D' = Sommet (Pile));
        pragma Assert (Est_Pleine (Pile));

        -- Afficher la pile
        Afficher_Pile (Pile);  New_Line;

        -- vider la pile
        Depiler (Pile);
        pragma Assert (not Est_Vide (Pile));
        pragma Assert ('B' = Sommet (Pile));
        Depiler (Pile);
        pragma Assert (not Est_Vide (Pile));
        pragma Assert ('A' = Sommet (Pile));
        Depiler (Pile);
        pragma Assert (Est_Vide (Pile));

        -- Afficher la pile
        Afficher_Pile (Pile);  New_Line;
    end Utiliser_Pile_Caractere;



    procedure Utiliser_Pile_Entier is
        -- Capacite de la pile de test.
        Capacite : constant Integer := 10;

        package Pile_Integer is
            new Piles(Capacite, Integer);
        use Pile_Integer;

        -- Afficher un entier.
        --// On ne peut pas directement utliser Put car cette procédure ne
        --// prend pas qu'un seul paramètre.  Elle n'a donc pas la bonne
        --// signature.
        --// Pour éviter de devoir définir cette procédure plusieurs fois, on
        --// pourrait la définir dans un autre module, par exemple
        --// afficher_un_entier.ads/.adb.
        procedure Afficher_Entier (N: in Integer) is
        begin
            Put (N, 1);
        end Afficher_Entier;

        procedure Afficher is new Pile_Integer.Afficher (Afficher_Entier);
        --// On pourrait ne pas mettre Pile_Integer et
        --// nommer Afficher_Entier simplement Afficher.

        P1 : T_Pile;
    begin
        Put_Line ("Tester_Pile_Entier");
        -- initilaiser la pile
        Initialiser (P1);
        pragma Assert (Est_Vide (P1));

        -- remplir la pile
        for I in 1..Capacite loop
            Empiler (P1, I);
        end loop;
        pragma Assert (Est_Pleine (P1));

        -- Afficher la pile
        Afficher (P1); New_Line;

        -- vider la pile
        for I in reverse 1..Capacite loop
            pragma Assert (I = Sommet (P1));
            Depiler (P1);
        end loop;
        pragma Assert (Est_Vide (P1));
    end Utiliser_Pile_Entier;



    procedure Illustrer_Surcharge is
        package Pile_Integer is
            new Piles(10, Integer);
        use Pile_Integer;

        procedure Afficher (N: in Integer) is
        begin
            Put (N, 1);
        end Afficher;

        procedure Afficher is new Pile_Integer.Afficher (Afficher);

        --// Il y a deux procédures qui s'appelle Afficher :
        --//    1. Afficher (Integer),
        --//    2. Afficher (Pile_Integer.T_Pile) : instance de la 1.
        --//
        --// Ceci ne pose pas de problème car en fonction du paramètre
        --// effectif fourni : entier ou T_Pile, le compilateur saura
        --// laquelle choisir.
        --// 
        --// Remarque : on doit mettre Pile_Integer.Afficher parce que
        --// Ada ne veut pas que l'instance Afficher (T_Pile) porte le même nom
        --// que la procédure générique (risque de masquage).
        P : T_Pile;

    begin
        Put_Line ("Illustrer_Surcharge");
        Initialiser (P);
        Empiler (P, 5);
        Put ("5 = "); Afficher (5); New_Line;   --// la 1 : afficher entier
        Put ("P = "); Afficher (P); New_Line;   --// la 2 : afficher pile
        --// Décommenter la ligne suivante et compiler pour voir l'erreur
        --// signalée par le compilateur et les versions de Afficher qu'il
        --// connait.
        -- Afficher("XXX");

    end Illustrer_Surcharge;


    -- Afficher le caractère C entre apostrophes.
    procedure Afficher(C : in Character) is
    begin
        Put (Apostrophe & C & Apostrophe);
    end Afficher;

    procedure Illustrer_Plusieurs_Afficher_Pour_Meme_Pile is
        package PPC3 is
            new Piles (Capacite => 3, T_Element => Character);
        use PPC3;

        procedure Afficher is new PPC3.Afficher (Put);
        procedure Afficher_Apostrophe is new PPC3.Afficher (Afficher);
        --// Ici, il faut un nom différent pour les deux procédures car
        --// elles ont la même signature : une T_Pile de PPC3.

        P: T_Pile;
    begin
        Put_Line ("Illustrer_Plusieurs_Afficher_Pour_Meme_Pile");
        Initialiser (P);
        Empiler (P, 'A');
        Put ("P = "); Afficher (P); New_Line;
        Put ("P = "); Afficher_Apostrophe (P); New_Line;
    end Illustrer_Plusieurs_Afficher_Pour_Meme_Pile;

    -- Montrer deux instances du même module dans le même sous-programme.
    procedure Illustrer_Plusieurs_Piles is

        package PPC1 is
            new Piles(3, Character);
        use PPC1;
        procedure Afficher is new PPC1.Afficher (Put);

        package PPC2 is
            new Piles(10, Character);
        use PPC2;
        procedure Afficher is new PPC2.Afficher (Put);
        procedure Afficher_Apostrophe is new PPC2.Afficher (Afficher);

        PC1 : PPC1.T_Pile;
        PC2 : PPC2.T_Pile;
    begin
        Put_Line ("Illustrer_Plusieurs_Piles");

        --// Décommenter la ligne suivante et compiler pour voir l'erreur
        --// signalée par le compilateur et les versions de Afficher qu'il
        --// connait.
        -- Afficher("XXX");

        -- Initialiser les piles
        Initialiser (PC1);
        Initialiser (PC2);

        -- Ajouter des éléments dans les piles
        for C in Character range 'A'..'C' loop
            Empiler (PC1, C);
            Empiler (PC2, C);
        end loop;

        -- Afficher les piles
        Put ("PC1 = "); Afficher (PC1); New_Line;
        Put ("PC2 = "); Afficher (PC2); New_Line;
        Put ("PC2 = "); Afficher_Apostrophe (PC2); New_Line;

        -- Ne pas respecter un contrat
        for C in Character range 'A'..'Z' loop
            Empiler (PC1, C);
        end loop;
        Afficher (PC1);
    end Illustrer_Plusieurs_Piles;


begin
    Utiliser_Pile_Caractere;
    Utiliser_Pile_Entier;
    Illustrer_Surcharge;
    Illustrer_Plusieurs_Afficher_Pour_Meme_Pile;
    Illustrer_Plusieurs_Piles;
end Utiliser_Piles;
