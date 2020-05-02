with Piles;
with Ada.Text_IO;           use Ada.Text_IO;
-- with Ada.Integer_Text_IO;   use Ada.Integer_Text_IO;
-- with Afficher_Un_Entier;    use Afficher_Un_Entier;

procedure Parenthesage is


    -- L'indice dans la chaîne Meule de l'élément Aiguille.
    -- Si l'Aiguille n'est pas dans la Meule, on retroune Meule'Last + 1.
    Function Index(Meule : in String; Aiguille: Character) return Integer with
        Post => Index'Result > Meule'Last or else Meule (Index'Result) = Aiguille
    is
        Index : Integer;
    begin
        Index := Meule'First;
        while (Index <= Meule'Last and then Meule (Index) /= Aiguille) loop
            Index := Index + 1;
        end loop;
        return Index;
    end Index;


    -- Programme de test de Index.
    procedure Tester_Index is
        ABCDEF : constant String := "abcdef";
    begin
        pragma Assert (1 = Index (ABCDEF, 'a'));
        pragma Assert (3 = Index (ABCDEF, 'c'));
        pragma Assert (6 = Index (ABCDEF, 'f'));
        pragma Assert (7 = Index (ABCDEF, 'z'));
        pragma Assert (4 = Index (ABCDEF (1..3), 'z'));
        pragma Assert (3 = Index (ABCDEF (3..5), 'c'));
        pragma Assert (5 = Index (ABCDEF (3..5), 'e'));
        pragma Assert (6 = Index (ABCDEF (3..5), 'a'));
        pragma Assert (6 = Index (ABCDEF (3..5), 'g'));
    end;


    -- Vérifier les bon parenthésage d'une Chaîne (D).  Le sous-programme
    -- indique si le parenthésage est bon ou non (Correct : R) et dans le cas
    -- où il n'est pas correct, l'indice (Indice_Erreur : R) du symbole qui
    -- n'est pas appairé (symbole ouvrant ou fermant).
    --
    -- Exemples
    --   "[({})]"  -> Correct
    --   "]"       -> Non Correct et Indice_Erreur = 1
    --   "((()"    -> Non Correct et Indice_Erreur = 2
    --
    procedure Verifier_Parenthesage (Chaine: in String ; Correct : out Boolean ; Indice_Erreur : out Integer) is
        Capacite : Constant Integer := Chaine'Last - Chaine'First + 1;
        package PC is
            new Piles (Capacite, Character);
        use PC;
        package PI is
            new Piles (Capacite, Integer);
        use PI;

        Pile_Ouvrants : PC.T_Pile;  --// Préfixé par nom module sinon ambigu
        Pile_Indices : PI.T_Pile;
        Ouvrants : Constant String := "([{";
        Fermants : Constant String := ")]}";
        Indice   : Integer;         -- parcourir la chaîne
        Indice_Fermant : Integer;  -- Indice sur Fermants
    begin
        Initialiser (Pile_Ouvrants);
        Initialiser (Pile_Indices);

        Correct := True;
        Indice := Chaine'First;
        while Correct and then Indice <= Chaine'Last loop
            -- Traiter Chaine (Indice)
            if Index (Ouvrants, Chaine (Indice)) <= Ouvrants'LAST then 
                --{ C'est un symbole ouvrant }--
                -- Empiler le symbole ouvrant dans la pile
                Empiler (Pile_Ouvrants, Chaine (Indice));
                Empiler (Pile_Indices, Indice);
            else
                Indice_Fermant := Index (Fermants, Chaine (Indice));
                if Indice_Fermant <= Fermants'Last then
                    --{ C'est un sympole fermant }--
                    --- Vérifier le dernier ouvrant
                    if not Est_Vide (Pile_Ouvrants)
                        and then Sommet (Pile_Ouvrants) = Ouvrants (Indice_Fermant)
                    then
                        --{ Le dernier ouvrant correspondant }--
                        Depiler (Pile_Ouvrants);
                        Depiler (Pile_Indices);
                    else
                        --{ Pas d'ouvrant correspondant }--
                        Correct := False;
                        Indice_Erreur := Indice;
                    end if;
                else
                    --{ C'est un caractère quelconque }--
                    Null;
                end if;
            end if;

            -- Passer au suivant
            Indice := Indice + 1;
        end loop;

        if Correct then
            if Est_Vide (Pile_Ouvrants) then
                --{ Chaine bien parenthésée }--
                Null;
            else
                --{ Des symoboles ouvrants non fermés }--
                Indice_Erreur := Sommet (Pile_Indices);
                Correct := False;
            end if;
        else
            --{ Déjà incorrect }--
            Null;
        end if;
    end Verifier_Parenthesage;


    -- Programme de test de Verifier_Parenthesage
    procedure Tester_Verifier_Parenthesage is
        Exemple1 : constant String(1..2) :=  "{}";
        Exemple2 : constant String(11..18) :=  "]{[(X)]}";

        Indice : Integer;   -- Résultat de ... XXX
        Correct : Boolean;
    begin
        Verifier_Parenthesage ("(a < b)", Correct, Indice);
        pragma Assert (Correct);

        Verifier_Parenthesage ("([{a}])", Correct, Indice);
        pragma Assert (Correct);

        Verifier_Parenthesage ("(][{a}])", Correct, Indice);
        pragma Assert (not Correct);
        pragma Assert (Indice = 2);

        Verifier_Parenthesage ("]([{a}])", Correct, Indice);
        pragma Assert (not Correct);
        pragma Assert (Indice = 1);

        Verifier_Parenthesage ("([{}])}", Correct, Indice);
        pragma Assert (not Correct);
        pragma Assert (Indice = 7);

        Verifier_Parenthesage ("([{", Correct, Indice);
        pragma Assert (not Correct);
        pragma Assert (Indice = 3);

        Verifier_Parenthesage ("([{}]", Correct, Indice);
        pragma Assert (not Correct);
        pragma Assert (Indice = 1);

        Verifier_Parenthesage ("", Correct, Indice);
        pragma Assert (Correct);

        Verifier_Parenthesage (Exemple1, Correct, Indice);
        pragma Assert (Correct);

        Verifier_Parenthesage (Exemple2, Correct, Indice);
        pragma Assert (not Correct);
        pragma Assert (Indice = 11);

        Verifier_Parenthesage (Exemple2(12..18), Correct, Indice);
        pragma Assert (Correct);

        Verifier_Parenthesage (Exemple2(12..15), Correct, Indice);
        pragma Assert (not Correct);
        pragma Assert (Indice = 14);
    end Tester_Verifier_Parenthesage;

begin
    Tester_Index;
    Tester_Verifier_Parenthesage;
end Parenthesage;
