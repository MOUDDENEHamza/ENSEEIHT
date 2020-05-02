with Ada.Text_IO;
use Ada.Text_IO;

-- Dans ce programme, les commentaires de spécification
-- ont **volontairement** été omis !

procedure Comprendre_Mode_Parametre is

    function Double (N : in Integer) return Integer is
    begin
        return 2 * N;
    end Double;

    procedure Incrementer (N : in out Integer) is
    begin
        N := N + 1;
    end Incrementer;

    procedure Mettre_A_Zero (N : out Integer) is
    begin
        N := 0;
    end Mettre_A_Zero;

    procedure Comprendre_Les_Contraintes_Sur_L_Appelant is
        A, B, R : Integer;
    begin
        A := 5;
        -- Indiquer pour chacune des instructions suivantes si elles sont
        -- acceptées par le compilateur.
        R := Double (A);--OK
        R := Double (10);--OK
        R := Double (10 * A);--OK
        R := Double (B);--B N'EST PAS INITIALSÉ

        Incrementer (A);--OK
        Incrementer (10);--ON'EST PAS UNE VARIABLE
        Incrementer (10 * A);--N'EST PAS UNE VARIABLE
        Incrementer (B);--B N'EST PAS INITIALSÉ

        Mettre_A_Zero (A);--OK
        Mettre_A_Zero (10);--10 N'EST PAS UNE VARIABLE
        Mettre_A_Zero (10 * A);--10 * A N'EST PAS UNE VARIABLE
        Mettre_A_Zero (B);--B N'EST PAS INITIALSÉ
    end Comprendre_Les_Contraintes_Sur_L_Appelant;


    procedure Comprendre_Les_Contrainte_Dans_Le_Corps (
            A      : in Integer;
            B1, B2 : in out Integer;
            C1, C2 : out Integer)
    is
        L: Integer;
    begin
        -- pour chaque affectation suivante indiquer si elle est autorisée
        L := A;--OK MAIS DANS LA LIGNE 60 ON RÉINITIALISE L ALORS UNITILE
        A := 1;--A N'EST PAS EN OUT

        B1 := 5;--OK

        L := B2;--OK
        B2 := B2 + 1;--OK

        C1 := L;--OK

        L := C2;--NON C2 N'EST PAS EN IN

        C2 := A;--OK
        C2 := C2 + 1;--
    end Comprendre_Les_Contrainte_Dans_Le_Corps;


begin
    Comprendre_Les_Contraintes_Sur_L_Appelant;
    Put_Line ("Fin");
end Comprendre_Mode_Parametre;
