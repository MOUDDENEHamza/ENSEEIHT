-- PQ (10/12) ; PM (10/14)

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Exceptions;

-- Version radicale : exclusion mutuelle de tous
--  fournit une ossature pour l'approche "automate"
--  fournit un exemple de tâche proposant des entrées différentes de Demander_Lecture, ...

package body LR.Synchro.Exclusion2 is
   
   function Nom_Strategie return String is
   begin
      return "Simple et Stupide, par exclusion mutuelle";
   end Nom_Strategie;

   task LectRedTask is
      entry Demander;
      entry Terminer;
   end LectRedTask;

   task body LectRedTask is
   begin
      loop
         accept Demander;
         accept Terminer;
         -- Comme promis : simple et stupide
      end loop;
   exception
      when Error: others =>
         Put_Line("**** LectRedTask: exception: " & Ada.Exceptions.Exception_Information(Error));
   end LectRedTask;

   procedure Demander_Lecture is
   begin
      LectRedTask.Demander;
   end Demander_Lecture;

   procedure Demander_Ecriture is
   begin
      LectRedTask.Demander;
   end Demander_Ecriture;

   procedure Terminer_Lecture is
   begin
      LectRedTask.Terminer;
   end Terminer_Lecture;

   procedure Terminer_Ecriture is
   begin
      LectRedTask.Terminer;
   end Terminer_Ecriture;

end LR.Synchro.Exclusion2;