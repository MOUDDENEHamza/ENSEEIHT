with Ada.Text_IO; use Ada.Text_IO;
with Ada.Exceptions;

-- Priorité aux rédacteurs
package body LR.Synchro.prioredacteur is
   
   function Nom_Strategie return String is
   begin
      return "Priorité aux rédacteurs";
   end Nom_Strategie;
   
   task LectRedTask is
      entry Demander_Lecture;
      entry Demander_Ecriture;
      entry Terminer_Lecture;
      entry Terminer_Ecriture;
   end LectRedTask;

   task body LectRedTask is
       type state_enum is (READING, WRITING, FREE);
       state : state_enum := FREE;
       reader : Integer := 0;
   begin
      loop

		if state = FREE then
			select
				when Demander_Ecriture'count = 0 =>
                        accept Demander_Lecture;
                        state := READING;
			reader := 1;
                or
                accept Demander_Ecriture;
		state := WRITING;
			 end select;

		elsif state = READING then
			  select 
                    when Demander_Ecriture'count = 0 =>
                        accept Demander_Lecture;
                        reader := reader + 1;
                 or
                    accept Terminer_Lecture;
                        reader :=  reader - 1;
                    if reader = 0 then  
                        state := FREE;
                    else
                        state := READING;
                    end  if;
			 end select;
		
	         else
			  accept Terminer_Ecriture;
			  state := FREE;
        end if;
      end loop;
   exception
      when Error: others =>
         Put_Line("**** LectRedTask: exception: " & Ada.Exceptions.Exception_Information(Error));
   end LectRedTask;

   procedure Demander_Lecture is
   begin
      LectRedTask.Demander_Lecture;
   end Demander_Lecture;

   procedure Demander_Ecriture is
   begin
      LectRedTask.Demander_Ecriture;
   end Demander_Ecriture;

   procedure Terminer_Lecture is
   begin
      LectRedTask.Terminer_Lecture;
   end Terminer_Lecture;

   procedure Terminer_Ecriture is
   begin
      LectRedTask.Terminer_Ecriture;
   end Terminer_Ecriture;

end LR.Synchro.prioredacteur;
