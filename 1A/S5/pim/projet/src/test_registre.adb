with Ada.Text_IO; use Ada.Text_IO;
with registre; use registre;
with Ada.Characters.Latin_1;    use Ada.Characters.Latin_1;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;


procedure test_registre is


    -- Création d'un registre avec un Id et ses données.
    procedure Initialiser_Le_Test (Registre : out T_Registre) is
        Donnee : T_Donnee;
        Date_N : T_Date;
        Date_D : T_Date;
    begin
        -- Initialisation du registre.
        Initialiser_R(Registre);

        -- Inscription d'une donnée.
        Date_N := Initialiser_Date(18,09,1999);
        Date_D := Initialiser_Date(0,0,0);
        Donnee := Initialiser_Donnee (To_Unbounded_String("Max"),To_Unbounded_String("Lili"),Date_N,To_Unbounded_String("Paris"),Date_D,To_Unbounded_String("Vivant"),'F',To_Unbounded_String("Lili.Max@gmail.com"),0678953421);

        Inserer_R(Registre, 3, Donnee);
    end Initialiser_Le_Test;


    -- Création d'un registre avec un Id et ses données.
    procedure Initialiser_Le_Test_Avec_3_Elts (Registre : in out T_Registre) is
        Donnee1 : T_Donnee;
        Donnee2 : T_Donnee;
        Donnee3 : T_Donnee;
        Date_N1, Date_D1, Date_N2, Date_D2, Date_N3, Date_D3 : T_Date;
    begin
        -- Initialisation du registre.
        Initialiser_R(Registre);

        -- Inscription de Donnee1.
        Date_N1 := Initialiser_Date(18,09,1999);
        Date_D1 := Initialiser_Date(0,0,0);
        Donnee1 := Initialiser_Donnee (To_Unbounded_String("Max"),To_Unbounded_String("Lili"),Date_N1,To_Unbounded_String("Paris"),Date_D1,To_Unbounded_String("Vivant"),'F',To_Unbounded_String("Lili.Max@gmail.com"),0678953421);

        -- Insertion de l'Id 3, avec Donnee1, dans Registre.
        Inserer_R(Registre, 3, Donnee1);

        -- Inscription de Donnee2.
        Date_N2 := Initialiser_Date(21,12,1925);
        Date_D2 := Initialiser_Date(01,09,2001);
        Donnee2 := Initialiser_Donnee (To_Unbounded_String("Dupont"),To_Unbounded_String("Baptiste"),Date_N2,To_Unbounded_String("Toulouse"),Date_D2,To_Unbounded_String("Toulouse"),'H',To_Unbounded_String("Dupont.Baptiste@gmail.com"),0656673421);
        -- Insertion de l'Id 8, avec Donnee2, dans Registre.
        Inserer_R(Registre, 8, Donnee2);

        -- Inscription de Donnee3.
        Date_D3 := Initialiser_Date(02,05,2019);
        Date_N3 := Initialiser_Date(11,02,1998);
        Donnee3 := Initialiser_Donnee (To_Unbounded_String("Halwani"),To_Unbounded_String("Jad"),Date_N3,To_Unbounded_String("Lille"), Date_D3,To_Unbounded_String("Toulouse"),'H',To_Unbounded_String("Halwani.Jad@gmail.com"),0656693421);
        -- Insertion de l'Id 20, avec Donnee3, dans Registre.
        Inserer_R(Registre, 20, Donnee3);

    end Initialiser_Le_Test_Avec_3_Elts;


    -- Tester les procédures Initialiser_R et Est_Vide_R
    procedure Tester_Initialiser_R_Et_Est_Vide_R is
        Registre : T_Registre;
    begin
        -- Initialisation du registre.
        Initialiser_R(Registre);

        pragma Assert (Est_Vide_R(Registre));

        -- Libération de la mémoire.
        Vider_R(Registre);

        New_Line;
        Put_Line (ESC & "[32m" & "RÉUSSI : " & ESC & "[0m" & "Procedure Tester_Initialiser_R_Et_Est_Vide_R est ");
        Put_Line ("         testée avec succès.");
        New_Line;
    end Tester_Initialiser_R_Et_Est_Vide_R;


    -- Tester la procédure Taille_R
    procedure Tester_Taille_R is
        Registre : T_Registre;
    begin
        -- Création d'un registre avec un 3 Id et leurs données.
        Initialiser_Le_Test_Avec_3_Elts(Registre);

        pragma Assert(Taille_R(Registre)=3);
        pragma Assert(not(Taille_R(Registre)=5));

        -- Suppression de l'Id 3 et de ses données du registre.
        Supprimer_R(Registre,3);
        pragma Assert(Taille_R(Registre)=2);
        pragma Assert(not(Taille_R(Registre)=8));

        -- Suppression de l'Id 8 et de ses données du registre.
        Supprimer_R(Registre,8);
        pragma Assert(Taille_R(Registre)=1);
        pragma Assert(not(Taille_R(Registre)=2));

        -- Libération de la mémoire.
        Vider_R(Registre);

        New_Line;
        Put_Line (ESC & "[32m" & "RÉUSSI : " & ESC & "[0m" & "Procedure Tester_Taille_R est testée avec succès.");
        New_Line;
    end Tester_Taille_R;


    -- Tester la procédure Inserer_R
    procedure Tester_Inserer_R is
        Registre : T_Registre;
        Donnee : T_Donnee;
        Date_D, Date_N : T_Date;
    begin
        -- Création d'un registre avec un Id et ses données.
        Initialiser_Le_Test(Registre);

        -- Inscription d'une donnée.
        Date_N := Initialiser_Date(21,12,1925);
        Date_D := Initialiser_Date(01,09,2001);
        Donnee := Initialiser_Donnee (To_Unbounded_String("Dupont"),To_Unbounded_String("Baptiste"),Date_N,To_Unbounded_String("Toulouse"),Date_D,To_Unbounded_String("Toulouse"),'H',To_Unbounded_String("Dupont.Baptiste@gmail.com"),0656673421);

        -- Insertion de l'Id 8 avec ses données dans le registre.
        Inserer_R(Registre, 8, Donnee);

        pragma Assert(La_Donnee_R(Registre,8)=Donnee);

        -- Libération de la mémoire.
        Vider_R(Registre);

        New_Line;
        Put_Line (ESC & "[32m" & "RÉUSSI : " & ESC & "[0m" & "Procedure Tester_Inserer_R est testée avec succès.");
        New_Line;
    end Tester_Inserer_R;


    -- Tester la procédure Modifier_R
    procedure Tester_Modifier_R is
        Registre : T_Registre;
        Donnee : T_Donnee;       -- la donnée avec laquelle on en modifie une autre.
        Date_D, Date_N : T_Date;
    begin
        -- Création d'un registre avec un Id et ses données.
        Initialiser_Le_Test(Registre);

        -- Inscription d'une donnée.
        Date_N := Initialiser_Date(21,12,1925);
        Date_D := Initialiser_Date(01,09,2001);
        Donnee := Initialiser_Donnee (To_Unbounded_String("Dupont"),To_Unbounded_String("Baptiste"),Date_N,To_Unbounded_String("Toulouse"),Date_D,To_Unbounded_String("Toulouse"),'H',To_Unbounded_String("Dupont.Baptiste@gmail.com"),0656673421);
        -- Modification des données de l'Id présent avec Donnee.
        Modifier_R(Registre, 3, Donnee);
        pragma Assert(La_Donnee_R(Registre, 3) = Donnee);

        New_Line;
        Put_Line (ESC & "[32m" & "RÉUSSI : " & ESC & "[0m" & "Procedure Tester_Modifier_R est testée avec succès.");
        New_Line;
    end Tester_Modifier_R;


    -- Tester la procédure Supprimer_R
    procedure Tester_Supprimer_R is
        Registre : T_Registre;
    begin
         -- Création d'un registre avec un 3 Id et leurs données.
        Initialiser_Le_Test_Avec_3_Elts(Registre);
        pragma Assert (Taille_R (Registre) = 3);

        -- Suppression de l'Id 3 et de ses données du registre.
        Supprimer_R(Registre, 3);
        pragma Assert (Taille_R (Registre) = 2);

        -- Suppression de l'Id 8 et de ses données du registre.
        Supprimer_R(Registre, 8);
        pragma Assert (Taille_R (Registre) = 1);

        -- Suppression de l'Id 20 et de ses données du registre.
        Supprimer_R(Registre, 20);
        pragma Assert (Taille_R (Registre) = 0);
        pragma Assert (Est_Vide_R (Registre));

        New_Line;
        Put_Line (ESC & "[32m" & "RÉUSSI : " & ESC & "[0m" & "Procedure Tester_Supprimer_R est testée avec succès.");
        New_Line;
    end Tester_Supprimer_R;


    -- Tester la procédure La_Donnee_R
    procedure Tester_La_Donnee_R is
        Registre : T_Registre;
        Donnee1 : T_Donnee;
        Donnee2 : T_Donnee;
        Donnee3 : T_Donnee;
        Date_N1, Date_D1, Date_N2, Date_D2, Date_N3, Date_D3 : T_Date;
    begin
         -- Création d'un registre avec un 3 Id et leurs données.
        Initialiser_Le_Test_Avec_3_Elts(Registre);
        Date_N1 := Initialiser_Date(18,09,1999);
        Date_D1 := Initialiser_Date(0,0,0);
        Date_N2 := Initialiser_Date(21,12,1925);
        Date_D2 := Initialiser_Date(01,09,2001);
        Date_D3 := Initialiser_Date(02,05,2019);
        Date_N3 := Initialiser_Date(11,02,1998);
        Donnee1 := Initialiser_Donnee (To_Unbounded_String("Max"),To_Unbounded_String("Lili"),Date_N1,To_Unbounded_String("Paris"),Date_D1,To_Unbounded_String("Vivant"),'F',To_Unbounded_String("Lili.Max@gmail.com"),0678953421);
        Donnee2 := Initialiser_Donnee (To_Unbounded_String("Dupont"),To_Unbounded_String("Baptiste"),Date_N2,To_Unbounded_String("Toulouse"),Date_D2,To_Unbounded_String("Toulouse"),'H',To_Unbounded_String("Dupont.Baptiste@gmail.com"),0656673421);
        Donnee3 := Initialiser_Donnee (To_Unbounded_String("Halwani"),To_Unbounded_String("Jad"),Date_N3,To_Unbounded_String("Lille"), Date_D3,To_Unbounded_String("Toulouse"),'H',To_Unbounded_String("Halwani.Jad@gmail.com"),0656693421);
        pragma Assert(La_Donnee_R(Registre,3) = Donnee1);
        pragma Assert(La_Donnee_R(Registre,8) = Donnee2);
        pragma Assert(La_Donnee_R(Registre,20) = Donnee3);

        New_Line;
        Put_Line (ESC & "[32m" & "RÉUSSI : " & ESC & "[0m" & "Procedure Tester_La_Donnee_R est testée avec succès.");
        New_Line;
    end Tester_La_Donnee_R;


    -- Tester la fonction Vider_R
    procedure Tester_Vider_R is
        Registre : T_Registre;
    begin
        -- Création d'un registre avec un Id et ses données.
        Initialiser_Le_Test(Registre);

        Vider_R(Registre);

        pragma Assert(Taille_R(Registre)=0);

        New_Line;
        Put_Line (ESC & "[32m" & "RÉUSSI : " & ESC & "[0m" & "Procedure Tester_Vider_R est testée avec succès.");
        New_Line;
    end Tester_Vider_R;


    -- Tester la fonction Ecart_Age_Parent_Enfant_R
    procedure Tester_Ecart_Age_Parent_Enfant_R is
        Registre : T_Registre;
        Id : constant Integer := 3;    -- Identifiant de l'enfant
        Parent_1 : T_Tab;              -- l'enfant a un parent
    begin
        -- Création d'un registre avec un Id et ses données.
        Initialiser_Le_Test_Avec_3_Elts(Registre);

        -- L'individu d'identifiant 3 a un parent d'identifiant 8.
        Parent_1.Taille := 1;
        Parent_1.Elt(1) := 8;


        pragma Assert(Ecart_Age_Parent_Enfant_R(Registre,Id, Parent_1));


        New_Line;
        Put_Line (ESC & "[32m" & "RÉUSSI : " & ESC & "[0m" & "Procedure Tester_Ecart_Age_Parent_EnfantSupprimer_R ");
        Put_Line("         est testée avec succès.");
        New_Line;
    end Tester_Ecart_Age_Parent_Enfant_R;



    -- Tester la fonction Age
    procedure Tester_Age is
        Registre : T_Registre;
        Age_Individu1, Age_Individu2, Age_Individu3 : Integer;
    begin
        Initialiser_Le_Test_Avec_3_Elts(Registre);
        Age_Individu1 := Age(Registre,3);
        Age_Individu2 := Age(Registre,8);
        Age_Individu3 := Age(Registre,20);

        pragma Assert(Age_Individu1 = 20);
        pragma Assert(Age_Individu2 = 75);
        pragma Assert(Age_Individu3 = 21);

        New_Line;
        Put_Line (ESC & "[32m" & "RÉUSSI : " & ESC & "[0m" & "Procedure Tester_Age est testée avec succès.");
        New_Line;
    end Tester_Age;


begin
    New_Line;
    Put_Line("*************************** Début ****************************");
    New_Line;

    Tester_Initialiser_R_Et_Est_Vide_R;
    Tester_Taille_R;
    Tester_Inserer_R;
    Tester_Modifier_R;
    Tester_Supprimer_R;
    Tester_La_Donnee_R;
    Tester_Vider_R;
    Tester_Age;
    Tester_Ecart_Age_Parent_Enfant_R;


    New_Line;
    Put_Line("***************************** Fin ****************************");
    New_Line;
end test_registre;
