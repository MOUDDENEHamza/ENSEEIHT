--------------------------------------------------------------------------------
--  File        : first_negative_or_null.adb
--  Author      : MOUDDENE Hamza
--  Target      : Réviser les tables de multiplications
--  Created     : Saturday Nov 30 2019
--------------------------------------------------------------------------------


-- Create a simple program that calculate the first null or negatif term of a
-- sequence defined like this :
-- Un+1 = (1/2) * Un - 3 *n
-- U0   = a
-- a is a real number entred by the user


with Ada.Text_IO;               use Ada.Text_IO;
with Ada.Float_Text_IO;   use Ada.Float_Text_IO;

procedure First_Negative_Or_Null is

        U0, Un : Float;
        Rank : Integer;

begin
        Rank := 0;

        Put ("Please enter the initial term : ");
        Get (U0);

        Un := U0;

        while (Un > 0.0) loop
		Un := 0.5 * Un - 3.0 * Float (Rank);
		Rank := Rank + 1;
        end loop;

        Put_Line ("This sequence becomes null or negative from the" & Integer'Image (Rank) &  " term.");

end First_Negative_Or_Null;
