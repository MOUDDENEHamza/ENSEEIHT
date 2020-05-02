with Ada.Text_IO;       use Ada.Text_IO;
with Vecteurs_Creux;    use Vecteurs_Creux;

-- Exemple d'utilisation des vecteurs creux.
procedure Exemple_Vecteurs_Creux is
	V : T_Vecteur_Creux;
begin
	Put_Line ("Début du scénario");
	New_Line;

	Initialiser (V); -- Initialiser un vecteur creux.  Il est nul.
	Afficher (V); -- Afficher le vecteur creux à des fins de mise au point.
        
	Put_Line ("Est-ce que le vecteur V est nul : " & Boolean'Image(Est_Nul (V)));
	Put ("Version récursive : la composante du vecteur V à l'indice Indice 18 : ");
	Put_Line (Float'Image(Composante_Recursif (V, 18)));
	Put ("Version itérative : la composante du vecteur V à l'indice Indice 18 : ");
        Put_Line (Float'Image(Composante_Iteratif (V, 18)));
	
	Modifier (V, 2, 5.9); -- Modifier la composante (2, 5.9).
	Put_Line ("Modifier la composante (2, 5.9)");
	Afficher (V); -- Afficher le vecteur creux à des fins de mise au point.
	
	Modifier (V, 3, 1.3); -- Modifier la composante (2, 1.93).
	Put_Line ("Modifier la composante (3, 1.3)");
	Afficher (V); -- Afficher le vecteur creux à des fins de mise au point.

	Modifier (V, 1, 99.15); -- Modifier la composante (1, 99.15).
	Put_Line ("Modifier la composante (1, 99.15)");
	Afficher (V); -- Afficher le vecteur creux à des fins de mise au point.
	
	Modifier (V, 1, 10.0); -- Modifier la composante (1, 99.15).
        Put_Line ("Modifier la composante (1, 99.15)");
        Afficher (V); -- Afficher le vecteur creux à des fins de mise au point.

	Detruire (V); -- Détruire le vecteur V.

	New_Line;
	Put_Line ("Fin du scénario");
end Exemple_Vecteurs_Creux;
