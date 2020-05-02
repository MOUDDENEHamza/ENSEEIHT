with Ada.Text_IO;
use Ada.Text_IO;

procedure Dates is

    -- T_Date is a date type.
    type T_Date is record
        day : Integer; -- day >= 1 and day <= 31.
        month : Integer; -- month >= 1 and month <= 12.
        year : Integer; -- year >= 1.
    end record;

    -- Check if a given year is leap year.
    Function Is_Leap (Year : In Integer) return Boolean with
            Pre => Year > 0
    is
    begin
        if Year mod 4 = 0 Then -- Year is divisible by 4.
            if Year mod 100 = 0 Then -- Year is divisible by 100.
                if Year mod 400 = 0 Then -- Year is divisible by 400, hence the year is a leap year.
                    return True; -- Year is a leap year.
                else
                    return False;  -- Year is not a leap year.
                end if;
            else
                return True; -- Year is a leap year.
            end if;
        else
            return False;  -- Year is not a leap year.
        end if;
    end Is_Leap;

    -- Display date.
    procedure display_date (date : in T_Date) is
    begin
        Put_Line (Integer'Image(date.day) & " / " & Integer'Image(date.month) &
                          " / " & Integer'Image(date.year));
    end display_date;

    -- Calculate the number of days in a given months.
    function Calcul_Days_Of_Month (Month, Year: IN Integer) return Integer with
            Pre => Month >= 1 and Month <= 12 and Year >= 1,
            Post => Calcul_Days_Of_Month'Result >= 28 and Calcul_Days_Of_Month'Result <= 31
    is
        Days : Integer; -- The number of days that will be returned.
    begin
        Case Month is
            when 1 | 3 | 5 | 7 | 8 | 10 | 12 => Days := 31; -- The months that contain 31 days.
            when 4 | 6 | 9 | 11              => Days := 30; -- The months that contain 30 days.
            when 2                           =>
                if Is_Leap (Year) Then --  If the year is leap.
                    Days := 29; -- Febrary contains 29 days.
                else
                    Days := 28; -- Febrary contains 28 days.
                end if;
            when others => null;
        end Case;
        return Days;
    end Calcul_Days_Of_Month;

    function next_day (date : in out T_Date) return T_Date with
            Pre => date.day >= 1 and date.day <= 31 and date.month >= 1 and date.month <= 12 and
            date.year >= 1
    is
    begin
        if date.day >= 1 and date.day < 28 then -- if day is between 1 and 27.
            date.day := date.day + 1;
        elsif date.day >= 28 and date.day <= 31 then -- if day is between 28 and 31.
            if date.day = Calcul_Days_Of_Month (date.month, date.year) then -- if day equals to number of days of the month.
                if date.month = 12 then -- If the month is december.
                    date.day := 1;
                    date.month := 1;
                    date.year := date.year + 1;
                else
                    date.day := 1;
                    date.month := date.month + 1;
                end if;
            else
                if date.day = Calcul_Days_Of_Month (date.month, date.year) then -- if day least to number of days of the month.
                    date.day := date.day + 1;
                else
                    Put_Line ( "month" & Integer'Image(date.month) & " contains just "
                               & Integer'Image(Calcul_Days_Of_Month (date.month, date.year)) & " days.");
                end if;
            end if;
        end if;
        display_date (date);
        return date;
    end next_day;

    -- Procedure that tests the is_leap function.
    procedure test_is_leap is
    begin
        pragma assert(False = Is_Leap (2019));
        Pragma assert(True = Is_Leap (2020));
        Pragma assert(True = Is_Leap (2016));
        Pragma assert(False = Is_Leap (2021));
    end test_is_leap;

    -- Procedure that tests the Calcul_Days_Of_Month function.
    procedure test_calcul_days is
    begin
        pragma assert(28 = Calcul_Days_Of_Month (2, 2019));
        Pragma assert(31 = Calcul_Days_Of_Month (10, 2019));
        Pragma assert(30 = Calcul_Days_Of_Month (9, 2019));
        Pragma assert(31 = Calcul_Days_Of_Month (12, 2019));
    end test_calcul_days;


    -- Procedure that tests the next_day function.
    procedure test_next_day is
    temp, res : T_Date;
    begin
        -- Execute the precedent sub-programs.
        temp.day := 29;
        temp.month := 2;
        temp.year := 2019;
        pragma assert(temp = next_day (temp));
        temp.day:= 13;
        temp.month := 10;
        temp.year := 2019;
        res := temp;
        res.day := res.day + 1;
        pragma assert(res = next_day (temp));
    end test_next_day;

begin
    -- Test the sub-programs.
    test_calcul_days;
    test_is_leap;
    test_next_day;
end Dates;
