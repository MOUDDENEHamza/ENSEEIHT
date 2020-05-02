with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

procedure puissance is

    x, res : Float;
    n : Integer;

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
        if n >= 0 then -- If the exponent is greater than 0.
            res := res * x;
        else
            res := res * (Float(1) / x);
        end if;

    end loop;
    Put_Line (Float'Image(res));

end puissance;

