with Ada.Text_IO; use Ada.Text_IO;
with Integer_IO;  use Integer_IO;

-- utiliser les opérations de Integer_IO.
procedure Exemple_Integer_IO is
    Nombre: Integer;
begin
    Put ("10 = ");
    Afficher (10);
    New_Line;

    Put ("0 = ");
    Afficher (0);
    New_Line;

    Put ("Integer'Last = ");
    Afficher (Integer'Last);
    New_Line;


    loop
        Put ("Nombre (0 pour quitter) : ");
        Saisir (Nombre);
        if Nombre /= -1 then
            Put ("Vous avez saisi : ");
            Afficher (Nombre);
            New_Line;
        else
            Put_Line ("Ce n'est pas un entier naturel !");
            Skip_Line;  -- vider le buffer d'entrée (jusqu'à EOL)
        end if;
        exit when Nombre = 0;
    end loop;
end Exemple_Integer_IO;
