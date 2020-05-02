with Ada.Numerics.Discrete_Random;

package body Alea is

	subtype Intervalle is Integer range Lower_Bound..Upper_Bound;

	package  Generateur_P is
		new Ada.Numerics.Discrete_Random (Intervalle);
	use Generateur_P;

	Generateur : Generateur_P.Generator;

	procedure Get_Random_Number (Resultat : out Integer) is
	begin
		Resultat := Random (Generateur);
	end Get_Random_Number;

begin
	Reset(Generateur);
end Alea;
