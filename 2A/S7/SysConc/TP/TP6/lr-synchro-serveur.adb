with Ada.Text_IO; use Ada.Text_IO;
with Ada.Exceptions;

-- Lecteurs concurrents, approche serveur. Pas de politique d'accès.
package body LR.Synchro.Serveur is
   
   function Nom_Strategie return String is
   begin
      return "Serveur, lecteurs concurrents, sans politique d'accès";
   end Nom_Strategie;
   
   task LectRedTask is
      entry Demander_Lecture;
      entry Demander_Ecriture;
      entry Terminer_Lecture;
      entry Terminer_Ecriture;
   end LectRedTask;

   task body LectRedTask is
       reader : Integer := 0;
       writer : Integer := 0;
   begin
      loop
      	select

        when writer = 0 =>
			accept Demander_Lecture;
			reader := reader + 1;
	
	or when reader > 0 =>
              accept Terminer_Lecture;
              reader := reader - 1;

    	or when reader = 0 and writer = 0 =>
                accept Demander_Ecriture;
		writer := writer + 1;
        
	or when writer > 0 =>
            accept Terminer_Ecriture;
	    writer := writer - 1;
        
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

end LR.Synchro.Serveur;
