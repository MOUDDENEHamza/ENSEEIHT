with Ada.Text_IO; use Ada.Text_IO;
with Ada.Exceptions;

-- FIFO
package body LR.Synchro.Fifo is
   
   function Nom_Strategie return String is
   begin
      return "Stratègie FIFO";
   end Nom_Strategie;

   task LectRedTask is
      entry Demander_Lecture;
      entry Demander_Ecriture;
      entry Terminer_Lecture;
      entry Terminer_Ecriture;
   end LectRedTask;

   task body LectRedTask is
   begin
      loop
      	select
			accept Demander_Lecture; accept Terminer_Lecture;
    	or
			accept Demander_Ecriture; accept Terminer_Ecriture;
        or
        	terminate;
        end select;
        
      end loop;
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

end LR.Synchro.Fifo;
