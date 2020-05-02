with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

procedure puissance_mieux is

    x, res : Float;
    n, p : Integer;

begin
    -- Ask number who we will calculate it power with a exponent power.
    Put ("Enter your x : ");
    Get (x);
    res := Float(1);

    -- Ask the exponent of the number.
    Put ("Enter your exponent : ");
    Get (n);

    -- Display the power.
    for i in 1..abs(n) loop
        if n mod 2 = 0 then
            p := n / 2;
            if n >= 0 then -- If the exponent is greater than 0.
                res := (x ** 2) ** p ;
            else
                res := res * (Float(1) / (x ** 2) ** p);
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
    Put_Line (Float'Image(res));

end puissance_mieux;
