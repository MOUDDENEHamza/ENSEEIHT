with Ada.Text_IO;
use  Ada.Text_IO;
with Dates;
use Dates;

procedure Exemple_Dates_Erreurs is
    Une_Date : T_Date;
    Mois_Suivant : T_Mois;
    Autre_Date : T_Date;
begin
    -- Initialiser une date
    Initialiser (Une_Date, 1, OCTOBRE, 2018);

    -- L'afficher
    Afficher (Une_Date);
    New_Line;

    -- Afficher un enter sur 2 positions
    Afficher_Deux_Positions (2); -- Afficher_Deux_Positions n'est pas définis dans le fichier Date.ads.
    New_Line;

    -- Afficher le mois suivant de Une_Date
    Mois_Suivant := T_Mois'succ (Le_Mois (Une_Date));
    Put ("Mois suivant : ");
    Put (T_Mois'image (Mois_Suivant));
    New_Line;
    -- OK car le type T_Mois est accessible de l'utilisateur.

    -- Modifier directement la date
    Une_Date.jour := 15; -- On peut pas la modifier directement, il faut utiliser les setters prédifinis (Une_Date est private).
    Une_Date.Mois := Mois_Suivant; -- On peut pas la modifier directement, il faut utiliser les setters prédifinis (Une_Date est private).
    Afficher (Une_Date);
    New_Line;

    -- Illustrer les opérations possibles sur T_Date, type privé
    Autre_Date := Une_Date; -- Si on met cette variable en limited private alors on ne peut plus copier ou comparer ou appliquer aucune operation.
    Put ("Autre date : ");
    Afficher (Autre_Date);
    New_Line;

    if Autre_Date = Une_Date then -- Si on met cette variable en limited private alors on ne peut plus copier ou comparer ou appliquer aucune operation.
        Put_Line ("Ce sont les mêmes dates !");
    else
        Put_Line ("Les dates sont différentes !");
    end if;

end Exemple_Dates_Erreurs;
