with Ada.Text_IO; use Ada.Text_IO;
with Ada.Exceptions;

-- Equitable
package body LR.Synchro.Equitable is
   
   function Nom_Strategie return String is
   begin
      return "Stratègie equitable";
   end Nom_Strategie;
   
   task LectRedTask is
      entry Demander_Lecture;
      entry Demander_Ecriture;
      entry Terminer_Lecture;
      entry Terminer_Ecriture;
   end LectRedTask;

   task body LectRedTask is
       type EtatType is (libre_prio_lect, libre_prio_rect, lecture_prio_lect, lecture_prio_rect, ecriture);
       etat : EtatType := libre_prio_lect;
       nbL : Natural := 0;
               
   begin
      loop
         -- ETAT LIBRE_PRIO_LECT
         if etat = libre_prio_lect then 
             select 
                accept Demander_Lecture ;
                    etat := lecture_prio_lect;
                    nbL := 1;
             or
                when Demander_Ecriture'count = 0 => accept Demander_Ecriture ;
                    etat := ecriture;
             or
                terminate;
             end select;

         -- ETAT LIBRE_PRIO_RECT
         elsif etat = libre_prio_rect then
             select 
                when Demander_Ecriture'count = 0 => accept Demander_Lecture ;
                    etat := lecture_prio_rect;
                    nbL := 1;
             or
                accept Demander_Ecriture ;
                    etat := ecriture;
             or
                terminate;
             end select;
        
         -- ETAT LECTURE_PRIO_LECT
         elsif etat = lecture_prio_lect then
             select
                accept Demander_Lecture;
                nbL := nbL +1;
             or 
                accept Terminer_Lecture;
                nbL := nbL -1;
                
                if nbL = 0 then
                    etat := libre_prio_rect;
                else 
                    etat := lecture_prio_rect;
                end if;
             end select;

         -- ETAT LECTURE_PRIO_RECT
         elsif etat = lecture_prio_rect then
             select
                when Demander_Ecriture'count = 0 => accept Demander_Lecture;
                    nbL := nbL +1;
             or 
                accept Terminer_Lecture;
                nbL := nbL -1;
                
                if nbL = 0 then
                    etat := libre_prio_rect;
                else 
                    etat := lecture_prio_rect;
                end if;
             end select;             

         -- ETAT ECRITURE
         elsif etat = ecriture then
             select
                accept Terminer_Ecriture;
                    etat := libre_prio_lect;
             end select;
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

end LR.Synchro.Equitable;
