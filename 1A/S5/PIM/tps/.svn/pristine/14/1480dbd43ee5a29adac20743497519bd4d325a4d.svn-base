with Ada.Text_IO; use Ada.Text_IO;

procedure Drone is
    -- Create program that handles drone.
    Choice: Character;
    Altitude: Integer;
    Start: Integer;
    
begin
    -- Initialize variables.
    Altitude := 0;
    Start := 0; 
    
    -- Print menu for the first time.
    Put_Line("Current Altitude :" &Integer'Image(Altitude));
    Put_Line("Menu");
    Put_Line("s -- Start");
    Put_Line("u -- Up");
    Put_Line("d-- Down");
    Put_Line("q -- Quit");
    
    -- Get the action to do.
    Put("What to do : ");
    get(Choice);
    
    -- Handle drone.
    while true loop
        
	case Choice is
            when 's' | 'S' =>  -- Start engine.
                Start := 1;
                
	    when 'u' | 'U' =>  -- Go up. 
		if Altitude = 4 then -- Drone out of reach.
		    Altitude := 5;
		    Put_line("drone out of reach");
		    exit;  -- Exit the program.
		end if;
		
                if Start = 0 then -- Engine shutting down.
		    Put_line("Engine shutting down");
		else    
		    Altitude := Altitude + 1; -- Increment altitude.
                end if;
                
	    when 'd' | 'D' =>	-- Go down.
		if Start = 0 then  -- Engine shutting down.
		    Put_line("Engine shutting down");
		end if;
		if Altitude = 0 then -- Impossible to go down when Altitude = 0.
		    Put_line("Impossible move");
		else
		    Altitude := Altitude - 1; -- Decrement altitude.
                end if;
                
	    when 'q' | 'Q' =>  -- Quit program.
		Put_Line("GOODBYE");
		exit; -- Exit the program.
	    
            when others => null;
        end case;
        
        -- Print menu for the seconde time.
	Put_Line("Current Altitude :" &Integer'Image(Altitude));
	Put_Line("Menu");
	Put_Line("s -- Start");
	Put_Line("u -- Up");
	Put_Line("d-- Down");
        Put_Line("q -- Quit");
        
        -- Get choice for the second time.
	Put("What to do : ");
	get(Choice);
    end loop;

end Drone;
