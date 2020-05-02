with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;

-- Objectif : Afficher un tableau trié suivant le principe du tri par sélection.

procedure Tri_Selection is

    CAPACITE: constant Integer := 10;   -- la capacité du tableau

    type Tableau_Entier is array (1..CAPACITE) of Integer;

    type Tableau is
	record
	    Elements : Tableau_Entier;
	    Taille   : Integer;         --{ Taille in [0..CAPACITE] }
	end record;


    -- Objectif : Afficher le tableau Tab.
    -- Paramètres :
    --     Tab : le tableau à afficher
    -- Nécessite : ---
    -- Assure : Le tableau est affiché.
    procedure Afficher (Tab : in Tableau) is
    begin
	Put ("[");
	if Tab.Taille > 0 then
	    -- Afficher le premier élément
	    Put (Tab.Elements (1), 1);

	    -- Afficher les autres éléments
	    for Indice in 2..Tab.Taille loop
		Put (", ");
		Put (Tab.Elements (Indice), 1);
	    end loop;
	end if;
	Put ("]");
    end Afficher;

    function Min_Index_Tableau ( Tab : in Tableau_Entier; Init_Index, Taille : in Integer) return Integer is
	Min : Integer;
    begin
	Min := Init_Index;
	for i in (Init_Index + 1)..Taille loop
	    if Tab(i) < Tab(Min) then
		Min := i;
	    end if;
	end loop;
	return Min;
    end Min_Index_Tableau;

    function Permute ( Tab : in out Tableau_Entier; Min, Init_Index : in Integer) return Tableau_Entier is
	Temp : Integer;
    begin 
	if Min /= Init_Index then
	    Temp := Tab(Init_Index);
	    Tab(Init_Index) := Tab(Min);
	    Tab(Min) := Temp;
	end if;
	return Tab;
    end Permute;

    function Tri_Tableau (Tab : In Out Tableau) return Tableau is
	Init_Index : Integer;
    begin
	Init_Index := 1;
	Put("Initial vector : ");
	Afficher (Tab);
	New_Line(1);
	Tri_Tab:
	loop
	    Tab.Elements := Permute(Tab.Elements, Min_Index_Tableau(Tab.Elements, Init_Index, Tab.Taille), Init_Index);
	    New_Line(1);
	    Put("After"& Integer'Image(Init_Index) & " step : ");
	    Afficher (Tab);
	    New_Line(1);
	    Init_Index := Init_Index + 1;
	    exit Tri_Tab when Init_Index = Tab.Taille;
	end loop Tri_Tab;
	New_Line(1);
	return Tab;
    end Tri_Tableau;

    procedure Verifier_tri (Tab : In Tableau) is
	begin
		for i in 1..(Tab.Taille - 1) loop
			if Tab.Elements(i) > Tab.Elements(i + 1) then
				Put_Line("Error in the program");
			end if;
		end loop;
	end Verifier_tri;
	
	function Occurrence ( Tab : In Tableau; Item : In Integer) return Integer is
		Count : Integer;
	begin
		Count := 0;
		for i in 1..Tab.Taille loop
			if Tab.Elements(i) = Item then
				Count := Count + 1;
			end if;
		end loop;
		return Count;
	end Occurrence;
	
	procedure Verifier_elements ( Tab_Trie, Tab : IN Tableau) is
	begin
		for i in 1..Tab.Taille loop
			for j in 1..Tab.Taille loop
				if Tab_Trie.Elements(i) = Tab.Elements(j) and Occurrence ( Tab, Tab.Elements(j)) /= Occurrence ( Tab_Trie, Tab_Trie.Elements(j)) then
					Put_Line("Error in the program");
				end if;
                	end loop;
		end loop;
	end Verifier_Elements;

	procedure Verifier_Taille ( Tab_Trie, Tab : In Tableau) is
        begin
                if Tab_Trie.Taille /= Tab.Taille then
                        Put_Line("Error in the program");
                end if;
        end Verifier_Taille;
	
	procedure Test ( Tab_Trie, Tab : In Tableau) is
        begin
		
		Verifier_Taille ( Tab_Trie, Tab );
		Verifier_Elements ( Tab_Trie, Tab );
		Verifier_Tri ( Tab );
	end Test;

    Tab1, Tab2, Tab3 , Trie1, Trie2, Trie3 : Tableau;
begin
    -- Initialiser le tableau
    Tab1 := ( (1, 3, 4, 2, others => 0), 4);
    Tab2 := ( (4, 3, 2, 1, others => 0), 4);
    Tab3 := ( (-5, 3, 8, 1, -25, 0, 8, 1, 1, 1), 10);
    
    -- Trier les tableaux
    Trie1 := Tri_Tableau (Tab1);
    Test ( Trie1, Tab1);
    Trie2 := Tri_Tableau (Tab2);
    Test ( Trie2, Tab2);
    Trie3 := Tri_Tableau (Tab3);
    Test ( Trie3, Tab3);

end Tri_Selection;
