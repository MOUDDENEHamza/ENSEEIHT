-- Implantation du module Ensembles.
   
package body Ensembles_Tableau is
	
    procedure Initialiser (Ensemble : out T_Ensemble) is
    begin
    	Ensemble.Taille := 0;
    end Initialiser;

    procedure Detruire (Ensemble : in out T_Ensemble) is
    begin
 	Ensemble.Taille := 0;
    end Detruire;

    function Est_Vide (Ensemble : in T_Ensemble) return Boolean is
    begin
	return Ensemble.Taille = 0;
    end Est_Vide;

    function Taille (Ensemble : in T_Ensemble) return Integer is
    begin
	return Ensemble.Taille;
    end Taille;

    function Est_Present (Ensemble : in T_Ensemble; Element : in T_Element) return Boolean is
    	present : Boolean;
    begin
	present := False;
	for i in 1..Taille (Ensemble) loop
	    if (Ensemble.Tab(i) = Element) then
		present := True;
	    end if;
	end loop;
	return present;
    end Est_Present;

    procedure Ajouter (Ensemble : in out T_Ensemble; Element : in T_Element) is
    begin
	Ensemble.Taille := Ensemble.Taille + 1;
	Ensemble.Tab(Ensemble.Taille) := Element;
    end Ajouter;
 
    procedure Supprimer (Ensemble : in out T_Ensemble; Element : in T_Element) is
    	i : Integer;
    begin
	i := 1;
	while ( i <= Taille (Ensemble)) loop
	    if (Ensemble.Tab(i) = Element) Then
		Ensemble.Tab(i) := Ensemble.Tab(Ensemble.Taille);
		Ensemble.Taille := Ensemble.Taille - 1;
	    end if;
	    i := i + 1;
    	end loop;
    end Supprimer;

    procedure Appliquer_Sur_Tous (Ensemble : in T_Ensemble) is
    begin
	for i in 1..Ensemble.Taille loop
	    Operation (Ensemble.Tab (i));
	end loop;
    end Appliquer_Sur_Tous;

end Ensembles_Tableau;
