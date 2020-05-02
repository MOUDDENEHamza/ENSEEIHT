with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Float_Text_IO;
use Ada.Float_Text_IO;
with Alea;

-- Évaluer la qualité du générateur aléatoire dans plusieurs
-- configurations.
procedure Evaluer_Alea is
    Capacity : Constant Integer := 10000;
    Type T_List is array(1..Capacity) of Integer;
    Type T_Generator is record
	List : T_List;
	Length : Integer; -- { 10 <= Length <= Capacity }
    end record;

    function Init_Generator ( Length : In Integer) return T_Generator is
	package Mon_Alea is
	    new Alea (1, Length);
	use Mon_Alea;

	Generator : T_Generator;
    begin
	Generator.Length := Length;
	for i in 1..Generator.Length loop
	    Get_Random_Number (Generator.List(i));
	end loop;
	return Generator;
    end Init_Generator;

    procedure Print_Generator( Generator : In T_Generator) is
    begin
	for i in 1 .. Generator.Length loop
	    Put(Integer'Image(Generator.List(i)));
	end loop;
    end Print_Generator;

    function Occurrence ( Generator : In T_Generator; Item : In Integer) return Integer is
	Count : Integer;
    begin
	Count := 0;
	for i in 1..Generator.Length loop
	    if Generator.List(i) = Item then
		Count := Count + 1;
	    end if;
	end loop;
	return Count;
    end Occurrence;
 
    function Max_Frequency (Generator : In T_Generator) return Integer is
	Maxi_Frequency : Integer;
    begin
	Maxi_Frequency := Occurrence (Generator, Generator.List(1));
	for i in 2..Generator.Length loop
	    if Occurrence (Generator, Generator.List(i)) > Maxi_Frequency then
		Maxi_Frequency := Occurrence (Generator, Generator.List(i));
	    end if;
	end loop;
	return Maxi_Frequency;
    end Max_Frequency;

    function Min_Frequency (Generator : In T_Generator) return Integer is
	Mini_Frequency : Integer;
    begin
	Mini_Frequency := Occurrence (Generator, Generator.List(1));
	for i in 2..Generator.Length loop
	    if Occurrence (Generator, Generator.List(i)) < Mini_Frequency then
		Mini_Frequency := Occurrence (Generator, Generator.List(i));
	    end if;
	end loop;
	return Mini_Frequency;
    end Min_Frequency;

    -- Évaluer la qualité du générateur de nombre aléatoire Alea sur un
    -- intervalle donné en calculant les fréquences absolues minimales et
    -- maximales des entiers obtenus lors de plusieurs tirages aléatoire
    -- ainsi que la fréquence moyenne théorique.
    --
    -- Paramètres :
    --    Borne: in Entier  -- le nombre aléatoire est dans 1..Borne
    --    Taille: in Entier -- nombre de tirages à faire (taille de l'échantillon)
    --    Min, Max: out Entier -- fréquence minimale et maximale
    --    Moyenne: out Float   -- fréquence moyenne théorique
    --
    -- Nécessite :
    --    Borne > 1
    --    Taille > 1
    --
    -- Assure : -- poscondition peu intéressante !
    --    0 <= Min Et Min <= Taille
    --    0 <= Max Et Max <= Taille
    --    Min + Max <= Taille
    --    Moyenne = Réel(Taille) / Réel(Borne)
    --    Min <= Moyenne Et Moyenne <= Max
    --
    -- Remarque : On ne peut ni formaliser les 'vraies' postconditions,
    -- ni écrire de programme de test car on ne maîtrise par le générateur
    -- aléatoire.  Pour écrire un programme de test, on pourrait remplacer
    -- le générateur par un générateur qui fournit une séquence connue
    -- d'entiers et pour laquelle on pourrait déterminer les données
    -- statistiques demandées.
    -- Ici, pour tester on peut afficher les nombres aléatoires et refaire
    -- les calculs par ailleurs pour vérifier que le résultat produit est
    -- le bon.
    procedure Calculer_Statistiques (
	Generator : In T_Generator;
	Borne    : in Integer;  -- Borne supérieur de l'intervalle de recherche
	Taille   : in Integer;  -- Taille de l'échantillon
	Min, Max : out Integer; -- min et max des fréquences de l'échantillon
	Moyenne  : out Float    -- moyenne des fréquences
	) with
	Pre => Borne > 1 and Taille > 1,
	Post => 0 <= Min and Min <= Taille
	and 0 <= Max and Max <= Taille
	and Min + Max <= Taille
	and Moyenne = Float (Taille) / Float (Borne)
	and Float (Min) <= Moyenne and Moyenne <= Float (Max)
    is

    begin
	Moyenne :=  Float(Taille) / Float(Borne);
	Min := Min_Frequency (Generator);
	Max := Max_Frequency (Generator);
    end Calculer_Statistiques;


    -- Afficher les données statistiques
    -- Paramètres:
    --   Min, Max : in Entier -- le min et le max
    --   Moyenne : in Réel -- la moyenne
    procedure Afficher_Statistiques (Min, Max: Integer; Moyenne: in Float) is
    begin
	New_Line;
	Put_Line ("Min     =" & Integer'Image (Min));
	Put_Line ("Max     =" & Integer'Image (Max));
	Put ("Moyenne = ");
	Put (Moyenne, 1, 2, 0);
	-- Put d'un réel accepte trois paramètres supplémentaires
	-- le nombre de positions à utiliser avant le '.' (ici 1)
	-- le nombre de positions pour la partie décimale (ici 2)
	-- le nombre de positions pour l'exposant (ici 0)
	New_Line;
    end Afficher_Statistiques;

    Generator : T_Generator;
    Min, Max: Integer; -- fréquence minimale et maximale d'un échantillon
    Moyenne: Float;    -- fréquences moyenne de l'échantillon
begin
    -- Calculer les statistiques pour un dé à 6 faces et un petit échantillon
    Generator := Init_Generator (20);
    Print_Generator (Generator);
    Calculer_Statistiques (Generator, 6, 20, Min, Max, Moyenne);
    Afficher_Statistiques (Min, Max, Moyenne);
    New_Line;

    --  -- Calculer les statistiques pour un dé à 6 faces et un échantillon grand
    Generator := Init_Generator (10000);
    Calculer_Statistiques (Generator, 6, 10000, Min, Max, Moyenne);
    Afficher_Statistiques (Min, Max, Moyenne);
    New_Line;
    
    --  -- Calculer les statistiques pour un dé à 6 faces et un échantillon
    -- très grand
    Generator := Init_Generator (10e6);
    Calculer_Statistiques (Generator,6, 10e6, Min, Max, Moyenne);
    Afficher_Statistiques (Min, Max, Moyenne);
    New_Line;
    
    --  -- Calculer les statistiques pour un dé à 6 faces et un échantillon
    -- très, très grand
    Generator := Init_Generator (10e8);
    Calculer_Statistiques (Generator, 6, 10e8, Min, Max, Moyenne);
    Afficher_Statistiques (Min, Max, Moyenne);
    New_Line;

end Evaluer_Alea;
