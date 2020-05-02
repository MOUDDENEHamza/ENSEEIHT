with Ada.Text_IO;                 use Ada.Text_IO;
with Ada.Integer_Text_IO;         use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;           use Ada.Float_Text_IO;
with Ada.Unchecked_Deallocation;

package body Vecteurs_Creux is


	procedure Free is
		new Ada.Unchecked_Deallocation (T_Cellule, T_Vecteur_Creux);


	procedure Initialiser (V : out T_Vecteur_Creux) is
	begin
		V := Null;
	end Initialiser;


	procedure Detruire (V: in out T_Vecteur_Creux) is
	begin
		if (V /= Null) then 
			Detruire (V.all.Suivant);
			free (V);
		else
			Null;
		end if;
	end Detruire;


	function Est_Nul (V : in T_Vecteur_Creux) return Boolean is
	begin
		return V = Null;
	end Est_Nul;


	function Composante_Recursif (V : in T_Vecteur_Creux ; Indice : in Integer) return Float is
	begin
		if (Est_Nul (V)) then
			return 0.0;
		end if;

		if (V.all.Indice > Indice) then
                        return 0.0;
		end if;
		if (V.all.Indice = Indice) then
			return V.all.Valeur;
		else
			return Composante_Recursif (V.all.Suivant , Indice); 
		end if;
	end Composante_Recursif;


	function Composante_Iteratif (V : in T_Vecteur_Creux ; Indice : in Integer) return Float is
		Temp : T_Vecteur_Creux;
	begin
		Temp := V;

		while (Temp /= Null and then Temp.all.Indice <= Indice) loop
			if (Temp.all.Indice = Indice) then
				return Temp.all.Valeur;
			end if;
			Temp := Temp.all.Suivant;
		end loop;
		return 0.0;
	end Composante_Iteratif;

	procedure Supprimer (V : in out T_Vecteur_Creux; Indice : in Integer) is
	begin
		if (V.all.Indice = Indice) then
			V := V.all.Suivant;
		else
			Supprimer (V.all.Suivant, Indice);
		end if;	
    	end Supprimer;


	procedure Modifier (V : in out T_Vecteur_Creux ; Indice : in Integer ; Valeur : in Float ) is
		Nouvelle_Cellule, Temp : T_Vecteur_Creux;
	begin
		Nouvelle_Cellule := New T_Cellule;
		Nouvelle_Cellule.all.Indice := Indice;
		Nouvelle_Cellule.all.Valeur := Valeur;
		if (V = Null or else V.all.Indice > Indice) then
			if (Valeur /= 0.0) then
				Nouvelle_Cellule.all.Suivant := v;
				V := Nouvelle_Cellule;
			end if;
		else
			Temp := V;
			while (Temp.all.Suivant /= Null and then Temp.all.Suivant.all.Indice <= Indice) loop
				Temp := Temp.all.Suivant;
			end loop;
			if (Temp.all.Indice = Indice) then
				if (Valeur /= 0.0) then
					temp.all.Valeur := Valeur;
				else 
					Supprimer(V, Indice);
				end if;
			else
				if (Valeur /= 0.0) then
					Nouvelle_Cellule.all.Suivant := Temp.all.Suivant; 
            				Temp.all.Suivant := Nouvelle_Cellule;
				end if;
			end if;
		end if;
	end Modifier;


	function Sont_Egaux_Recursif (V1, V2 : in T_Vecteur_Creux) return Boolean is
	begin
		if (Est_Nul (V1) and Est_Nul (V2)) then
			return True;
		end if;
		if (not (Est_Nul (V1)) and not (Est_Nul (V2))) then
			
		return (V1.all.Indice = V2.all.Indice and V1.all.Valeur = V2.all.Valeur) and Sont_Egaux_Recursif (V1.all.Suivant, V2.all.Suivant);
		end if;
		return false;
	end Sont_Egaux_Recursif;


	function Sont_Egaux_Iteratif (V1, V2 : in T_Vecteur_Creux) return Boolean is
		Temp1, Temp2 : T_Vecteur_Creux;
	begin
		if (Est_Nul (V1) /= Est_Nul (V2)) then 
			return False;
		else
			Temp1 := V1;
			Temp2 := V2;
			while (Temp1 /= Null and Temp2 /= Null) loop
				if (Temp1.all.Indice /= Temp2.all.Indice or Temp1.all.Valeur /= Temp2.all.Valeur) then
                        		return False;
				end if;
				Temp1 := Temp1.all.Suivant;
				Temp2 := Temp2.all.Suivant;
			end loop;
			if (Est_Nul (Temp1) /= Est_Nul (Temp2)) then       
	                        return False;
			else
				return True;
			end if;
		end if;
	end Sont_Egaux_Iteratif;


	procedure Additionner (V1 : in out T_Vecteur_Creux; V2 : in out T_Vecteur_Creux) is
		Temp1, Temp2 : T_Vecteur_Creux;
	begin
		Temp1 := V1;
                Temp2 := V2;
		if Temp1 = Null then
			Temp1 := Temp2;
		
		elsif Temp2 = Null then
			Temp2 := Temp1;

		elsif Nombre_Composantes_Non_Nulles (V1) >= Nombre_Composantes_Non_Nulles (V2) then
        		while (Temp1 /= Null) loop
				Modifier (V1, Temp1.all.Indice, Temp1.all.Valeur + Composante_Recursif (V2, Temp1.all.Indice));
            			Temp1 := Temp1.all.Suivant;
        		end loop;
        		while (Temp2 /= Null) or else (Composante_Recursif (V1, Temp2.all.Indice) = 0.0) loop
            			Modifier (V1, Temp2.all.Indice, Temp2.all.Valeur);
				Temp2 := Temp2.all.Suivant;
        		end loop;
		else
			while (Temp2 /= Null) loop
                                afficher (Temp1);
                        	Afficher (Temp2);
				Modifier (V2, Temp1.all.Indice, Temp2.all.Valeur + Composante_Recursif (V1, Temp2.all.Indice));
                                Temp2 := Temp2.all.Suivant;
                        end loop;
			afficher (Temp1);
                	Afficher (Temp2);
                        while (Temp1 /= Null) or else (Composante_Recursif (V1, Temp2.all.Indice) = 0.0) loop
				Modifier (V2, Temp1.all.Indice, Temp1.all.Valeur);
                                Temp1 := Temp1.all.Suivant;
                        end loop;
		end if;
		V1 := Temp1;
		V2 := Temp2;
	end Additionner;


	function Norme2 (V : in T_Vecteur_Creux) return Float is
	begin
		return 0.0;	-- TODO : à changer
	end Norme2;


	Function Produit_Scalaire (V1, V2: in T_Vecteur_Creux) return Float is
	begin
		return 0.0;	-- TODO : à changer
	end Produit_Scalaire;


	procedure Afficher (V : T_Vecteur_Creux) is
	begin
		if V = Null then
			Put_Line ("--E");
		else
			Put ("-->[ ");
			Put (V.all.Indice, 0);
			Put (" | ");
			Put (V.all.Valeur, Fore => 0, Aft => 1, Exp => 0);
			Put (" ]");
			Afficher (V.all.Suivant);
		end if;
	end Afficher;


	function Nombre_Composantes_Non_Nulles (V: in T_Vecteur_Creux) return Integer is
	begin
		if V = Null then
			return 0;
		else
			return 1 + Nombre_Composantes_Non_Nulles (V.all.Suivant);
		end if;
	end Nombre_Composantes_Non_Nulles;


end Vecteurs_Creux;
