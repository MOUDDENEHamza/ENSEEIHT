with Ensembles_Chainage;
with Alea;
with Ada.Text_IO; use Ada.Text_IO;

-- Cette procédure calculera le nombre moyen de tirages qu’il faut
-- faire pour obtenir tous les nombres d’un intervalle entier Min..Max en
-- utilisant le générateur de nombre aléatoire.
procedure Nombre_Moyen_Tirages_Chainage is
    Min : Constant integer := 10; -- La borne inférieure.
    Max : Constant integer := 20; -- La borne supérieure.
    Essais : Constant integer := 100; -- Le nombre d'essais.

    package Mon_Alea is
        new Alea (Min, Max);  -- Générateur de nombre dans l'intervalle [1, 10].
    use Mon_Alea;

    package Ensembles_Entiers is -- Instantiation du package Ensembles_Chainage.
        new Ensembles_Chainage (T_Element => Integer);
    use Ensembles_Entiers;

    Ensemble : T_Ensemble; -- Déclarer une variable ensemble.
    Moyenne : Integer; -- La variable moyenne qui stockera le nombre moyen de tirages.
    n_alea: Integer; -- Le nombre aléatoire généré.
begin
    New_Line;
    Put_Line("*************************** Début ****************************");
    New_Line;
    Moyenne := 0; -- Initialiser Moyenne à 0.

    for i in 1..Essais loop
        Initialiser (Ensemble); -- Initialiser un ensemble vide.

        loop
            Get_Random_Number(n_alea); -- Obtenir un nombre aléatoire.
            Moyenne := Moyenne + 1; -- Incrementer Moyenne.

            if not(Est_Present (Ensemble, n_alea)) then
                ajouter (Ensemble, n_alea); -- Ajouter n_alea à l'ensemble.
            end if;
            exit when Taille (Ensemble) = Max - Min + 1;
        end loop;
	Detruire (Ensemble); -- Libérer la mémoire.
    end loop;
    
    Moyenne := Moyenne / Essais; -- Calculer la Moyenne.
    Put_Line("le nombre moyen de tirages qu’il faut faire pour obtenir tous");
    Put_Line("les nombres entre" & Integer'Image(Min) & " et" & Integer'Image(Max) & " est : " & Integer'Image(Moyenne));

   New_Line;
   Put_Line("***************************** Fin ****************************");
   New_Line;

end Nombre_Moyen_Tirages_Chainage;
