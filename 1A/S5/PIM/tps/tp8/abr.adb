with Ada.Text_IO;            use Ada.Text_IO;
with Ada.Unchecked_Deallocation;

package body ABR is

	procedure Free is
		new Ada.Unchecked_Deallocation (Object => T_Noeud, Name => T_ABR);


	procedure Initialiser(Abr: out T_ABR) is
	begin
		Abr := Null;
	end Initialiser;


	function Est_Vide (Abr : T_Abr) return Boolean is
	begin
		return Abr = Null;
	end;


	function Taille (Abr : in T_ABR) return Integer is
	begin
		if Est_Vide (Abr) then
			return 0;
		else
			return 1 + Taille (Abr.all.Sous_Arbre_Gauche) + Taille (Abr.all.Sous_Arbre_Droit);
		end if;
	end Taille;

	procedure Inserer (Abr : in out T_ABR ; Cle : in Character ; Donnee : in Integer) is
	begin
		if (Est_Vide(Abr)) then 
			Abr := New T_Noeud'(Cle, Donnee, Null, Null); 
    		elsif (ABR.all.Cle = Cle) then
			raise Cle_Presente_Exception;
		elsif (Cle < Abr.all.Cle) then
        		Inserer(Abr.all.Sous_Arbre_Gauche, Cle, Donnee); 
    		elsif (Cle > Abr.all.Cle) then
        		Inserer(Abr.all.Sous_Arbre_Droit, Cle, Donnee);   
		end if;
	end Inserer;


	procedure Modifier (ABR : in out T_ABR ; Cle : in Character ; Donnee : in Integer) is
	begin
		if Est_Vide (ABR) then
                        raise Cle_Absente_Exception;
                else
			if ABR.all.Cle = Cle then
				ABR.all.Donnee := Donnee;
			elsif ABR.all.Cle < Cle then
				Modifier (ABR.all.Sous_Arbre_Droit, Cle, Donnee);
			else
                                Modifier (ABR.all.Sous_Arbre_Gauche, Cle, Donnee);
			end if;
		end if;	
	end Modifier;


	function La_Donnee (Abr : in T_ABR ; Cle : in Character) return Integer is
	begin
		if Est_Vide (ABR) then
			raise Cle_Absente_Exception;
		else
                        if ABR.all.Cle = Cle then
                                return ABR.all.Donnee;
                        elsif ABR.all.Cle < Cle then
                                return La_Donnee (ABR.all.Sous_Arbre_Droit, Cle);
                        else
                                return La_Donnee (ABR.all.Sous_Arbre_Gauche, Cle);
                        end if;
		end if;
	end La_Donnee;


	procedure Supprimer (Abr : in out T_ABR ; Cle : in Character) is
		tmp1 ,tmp2 : T_ABR;
	begin
		if (Abr = Null) then
			Null;
		else
			if (Cle < Abr.all.Cle) then 
        			Supprimer (Abr.all.Sous_Arbre_Gauche, Cle); 
 			elsif (Cle > Abr.all.Cle) then
                        	Supprimer (Abr.all.Sous_Arbre_Droit, Cle);
    			else
 
        			if (Abr.all.Sous_Arbre_Gauche = Null) then  
					tmp1 := Abr.all.Sous_Arbre_Droit; 
           				Free (Abr); 
            				Abr := tmp1; 
       
        			elsif (Abr.all.Sous_Arbre_Droit = Null) then 
            				tmp1 := Abr.all.Sous_Arbre_Gauche; 
            				Free (Abr); 
            				Abr := tmp1; 
				else 
					tmp2 := Abr.all.Sous_Arbre_Droit;
					while (not Est_Vide (tmp2) and tmp2.all.Sous_Arbre_Gauche /= Null) loop
        					tmp2 := tmp2.all.Sous_Arbre_Gauche;
					end loop;
					tmp1 := tmp2;

					Abr.all.Cle := tmp1.all.Cle;
					Supprimer (Abr.all.Sous_Arbre_Droit, tmp1.all.Cle);
				end if;
			end if;
		end if;
	end Supprimer;


	procedure Vider (Abr : in out T_ABR) is
	begin
		if not Est_Vide (ABR) then
			Vider (ABR.all.Sous_Arbre_Gauche);
			Vider (ABR.all.Sous_Arbre_Droit);
			free (ABR);
		end if;
	end Vider;


	procedure Afficher (ABR : in T_Abr) is
	begin
		if Est_Vide (ABR) then
        		Afficher( Abr.all.Sous_Arbre_Gauche);
        		Put_Line(Character'Image(ABR.all.Cle) & " : " & Integer'Image(ABR.all.Donnee));
        		Afficher( ABR.all.Sous_Arbre_Droit);
		end if;
	end Afficher;


	procedure Afficher_Debug (Abr : in T_Abr) is
	begin
		if not Est_Vide (ABR) then
			Put_Line (Character'Image(ABR.all.Cle) & " : " & Integer'Image(ABR.all.Donnee));
			Afficher_Debug ( ABR.all.Sous_Arbre_Gauche);
			Afficher_Debug ( ABR.all.Sous_Arbre_Droit);
		end if;
	end Afficher_Debug;

end ABR;
