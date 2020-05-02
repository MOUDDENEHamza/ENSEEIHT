--------------------------------------------------------------------------------
--  Fichier  : input.ads
--  Auteur   : MOUDDENE Hamza & CAZES Noa
--  Objectif : Implantation du module Input
--  Crée     : Dimanche Déc 01 2019
--------------------------------------------------------------------------------


with Ada.Text_IO; 	  	use Ada.Text_IO;
with Ada.Characters.Latin_1; 	use Ada.Characters.Latin_1;
with Ada.Integer_Text_IO; 	use Ada.Integer_Text_IO;
with Ada.Strings.Unbounded; 	use Ada.Strings.Unbounded;
with Ada.Text_IO.Unbounded_IO;  use Ada.Text_IO.Unbounded_IO;


package body Input is


    -- lire au clavier un entier quelconque.
    procedure Input_Integer (value : out Integer) is
    begin
        Get (value);
    exception
        when Data_Error =>
            New_Line;
            Put_Line (ESC & "[31m" & "ERREUR : " & ESC & "[0m" & "Vous n'avez pas saisi un entier.");
            Skip_Line;
            New_Line;
            Put ("Réessayez encore une fois : ");
            Input_Integer (value);
    end Input_Integer;


    -- Entrer le choix du menu.
    procedure Input_Choice (Choice : out Integer) is
    begin
        Put ("Entrez votre choix : ");
        loop
            Input_Integer (Choice);
            if (Choice < 0 or  Choice > 13) then
                Put_Line(ESC & "[31m" & "ERREUR : " & ESC & "[0m" & "Il faut entrer un entier entre 0 et 11.");
                New_Line;
                Put ("Réessayez encore une fois : ");
            end if;
            exit when Choice >= 0 and Choice <= 13;
        end loop;
    end Input_Choice;


    -- Entrer le sex d'un individu.
    function Input_Sex return Character is


        Sex : Character;


    begin
        loop
            Get (Sex);
            if (Sex /= 'H' and Sex  /= 'F' and Sex /= 'U') then
                New_Line;
                Put_Line (ESC & "[31m" & "ERREUR : " & ESC & "[0m" & "sexe introuvable.");
                New_Line;
                Put ("Veuillez saisir " & ESC & "[31m" & "F" & ESC & "[0m" & " pour une femme, " & ESC & "[32m" & "H" & ESC & "[0m" &  " pour un homme ou " & ESC & "[34m" & "U" & ESC & "[0m" & " pour tout autre type de sexe : ");
            end if;
            exit when (Sex = 'H' or Sex  = 'F' or Sex = 'U');
        end loop;
        return Sex;
    end Input_Sex;


    -- Entrer les données personnelles d'une personne.
    function Demander_Donnee return T_Donnee is


        Nom, Prenom, Lieu_N, Lieu_D, Email : Unbounded_String;
        Tel, N_Jour, N_Mois, N_Annee, D_Jour, D_Mois, D_Annee: Integer;
        Sexe : Character;

    begin
        New_Line;
        Put ("Veuillez saisir un nom : ");
        Nom := Get_Line;
        Skip_Line;

        New_Line;
        Put ("Veuillez saisir un prenom : ");
        Prenom := Get_Line;

        New_Line;
        Put ("Veuillez saisir un jour de naissance : ");
        Input_Integer (N_Jour);

        New_Line;
        Put ("Veuillez saisir un mois de naissance : ");
        Input_Integer (N_Mois);

        New_Line;
        Put ("Veuillez saisir une année de naissance : ");
        Input_Integer (N_Annee);

        New_Line;
        Put ("Veuillez saisir un lieu de naissance : ");
        Lieu_N := Get_Line;
        Skip_Line;

        New_Line;
        Put ("Veuillez saisir un jour de décès : ");
        Input_Integer (D_Jour);

        New_Line;
        Put ("Veuillez saisir un mois de décès : ");
        Input_Integer (D_Mois);

        New_Line;
        Put ("Veuillez saisir une année de décès : ");
        Input_Integer (D_Annee);

        New_Line;
        Put ("Veuillez saisir un lieu de décès : ");
        Lieu_D := Get_Line;
        Skip_Line;

        New_Line;
        Put ("Veuillez saisir " & ESC & "[31m" & "F" & ESC & "[0m" & " pour une femme, " & ESC & "[32m" & "H" & ESC & "[0m" &  " pour un homme ou " & ESC & "[34m" & "U" & ESC & "[0m" & " pour tout autre type de sexe : ");
        Sexe := Input_Sex;

        New_Line;
        Put ("Veuillez saisir un email : ");
        Email := Get_Line;
        Skip_Line;

        New_Line;
        Put ("Veuillez saisir un numéro de téléphone sous la forme 0612345678 : ");
        Input_Integer (Tel);

        return Initialiser_Donnee (Nom, Prenom, Initialiser_Date(N_Jour, N_Mois, N_Annee), Lieu_N, Initialiser_Date(D_Jour, D_Mois, D_Annee), Lieu_D, Sexe, Email, Tel);

    end Demander_Donnee;


    -- Entrer l'ID d'un individu.
    procedure Input_ID (ID : out Integer; Message : in String) is
    begin
        New_Line;
        Put (Message);
        Input_Integer (ID);
    end Input_ID;


    -- Entrer si le parent que vous souhaiterez ajouter est le père ou la mère.
    -- Entrer 0 s'il s'agit d'un père, 1 si c'est la mère.
    procedure Input_Flag (Flag : out Integer) is
    begin
        loop
            New_Line;
            Put_Line ("Entrez " & ESC & "[32m" & "0" & ESC & "[0m" & " s'il s'agit du père, si c'est la mère entrez " & ESC & "[31m" & "1" & ESC & "[0m" & ".");
            New_Line;
            Put ("Entrez Votre choix : ");
            Input_Integer (Flag);
            if (Flag /=0 and Flag /= 1) then
                New_Line;
                Put_Line (ESC & "[31m" & "ERREUR : " & ESC & "[0m" & "Entrée éronnée.");
            end if;
            exit when (Flag = 0 or Flag = 1);
        end loop;
    end Input_Flag;


    -- Entrez la géneration des ancetres.
    procedure Input_Generation (Generation : out Integer) is
    begin
        New_Line;
        Put ("Entrez la géneration des ancetres que vous souhaitez les trouver : ");
        Input_Integer (Generation);
    end Input_Generation;


end Input;
