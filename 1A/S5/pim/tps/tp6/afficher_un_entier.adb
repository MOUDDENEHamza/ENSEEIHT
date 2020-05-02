with Ada.Integer_Text_IO;

package body Afficher_Un_Entier is

	procedure Afficher (N: in Integer) is
	begin
		Ada.Integer_Text_IO.Put (N, 1);
	end;

end Afficher_Un_Entier;
