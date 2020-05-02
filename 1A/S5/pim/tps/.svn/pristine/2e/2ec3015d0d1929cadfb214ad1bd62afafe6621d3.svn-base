with Ada.Text_IO;
use Ada.Text_IO;

-- Implement the power exercise in the TD1.
procedure puissance is

    -- Naive version to calculate the power of a given number.
    function power (x : in Float; n : in Integer) return Float is
        res : Float;
    begin
        res := 1.0;
        -- Calculate the power.
        for i in 1..abs(n) loop
            if n >= 0 then -- If the exponent is greater than 0.
                res := res * x;
            else
                res := res * (Float(1) / x);
            end if;
        end loop;
        Put_Line (Float'Image(x)& " * " & Integer'Image(n) & " = " &
                          Float'Image(res));
        return res;
    end power;

    -- Intelligent version to calculate the power of a given number.
    function intelligent_power (x : in Float; n : in Integer) return Float is
        res : Float;
        p : Integer;
    begin
        res := 1.0;
        -- Display the power.
        for i in 1..abs(n) loop
            if n mod 2 = 0 then
                p := n / 2;
                if n >= 0 then -- If the exponent is greater than 0.
                    res := (x ** 2) ** p ;
                else
                    res := res * (1.0 / (x ** 2) ** p);
                end if;
            else
                p := n / 2;
                if n >= 0 then -- If the exponent is greater than 0.
                    res := ((x ** 2) ** p) * x;
                else
                    res := (res / (((x ** 2) ** p) * x));
                end if;
            end if;
        end loop;
        Put_Line (Float'Image(x)& " * " & Integer'Image(n) & " = " &
                          Float'Image(res));
        return res;
    end intelligent_power;

    -- Procedure that tests the power function.
    procedure test_power is
    begin
        pragma assert(2.0 ** 2 = power (2.0, 2));
        pragma assert(10.0 ** (-1) = power (10.0, -1));
        pragma assert(3.0 ** 3 = power (3.0, 3));
        pragma assert(4.0 ** 2 = power (4.0, 2));
    end test_power;

    -- Procedure that tests the intelligent_power function.
    procedure test_intelligent_power is
    begin
        pragma assert(2.0 ** 2 = intelligent_power (2.0, 2));
        pragma assert(10.0 ** (-1) = intelligent_power (10.0, -1));
        pragma assert(3.0 ** 3 = intelligent_power (3.0, 3));
        pragma assert(4.0 ** 2 = intelligent_power (4.0, 2));
    end test_intelligent_power;

begin
    -- Test the sub-programs.
    Put_Line("************************ TEST ****************************");
    test_power;
    test_intelligent_power;
    Put_Line("************************ END *****************************");
end puissance;
