with Ada.Text_IO;           use Ada.Text_IO;
with Ada.Integer_Text_IO;   use Ada.Integer_Text_IO;
with Alea;

-- Procédure qui illustre l'utilisation du paquetage Alea.
procedure Exemple_Alea is

    package Mon_Alea is
        new Alea (5, 15);  -- générateur de nombre dans l'intervalle [5, 15]
    use Mon_Alea;

    Nombre: Integer;
begin
    -- Afficher 10 nombres aléatoires
    Put_Line ("Quelques nombres aléatoires : ");
    for I in 1..10 loop
        Get_Random_Number (Nombre);
        Put (Nombre);
        New_Line;
    end loop;
end Exemple_Alea;
