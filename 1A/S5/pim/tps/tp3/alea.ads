generic
    Lower_Bound, Upper_Bound : Integer; -- bounds in which random numbers are generated
    -- { Lower_Bound <= Upper_Bound }

package Alea is

    -- Compute a random number in the range Lower_Bound..Upper_Bound.
    --
    -- Notice that Ada advocates the definition of a range type in such a case
    -- to ensure that the type reflects the real possible values.
    procedure Get_Random_Number (Resultat : out Integer);

end Alea;
