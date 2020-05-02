with Ada.Text_IO;use Ada.Text_IO;
with Ada.Float_Text_IO;use Ada.Float_Text_IO;

procedure newton is
    	Number: Float;
	Accuracy: Float;
	a0: Float;
	ak: Float;

begin
    put("Enter your number : ");
    get(Number);
    put("Enter the accuracy : ");
    get(Accuracy);
    a0 := 1.0;
    ak := 1.0;
    loop 
        a0 := ak; 
	ak := (a0 + Number / a0) / 2.0;
	exit when ak - a0 < Accuracy or (ak ** 2) - Number < Accuracy;
    end loop;

    put("the square root is : " &Float'Image(ak));
end newton;
