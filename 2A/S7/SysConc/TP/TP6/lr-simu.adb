-- Time-stamp: <08 nov 2019 13:21 queinnec@enseeiht.fr>

with Ada.Text_IO; use Ada.Text_IO;
with LR.Tasks; use LR.Tasks;

package body LR.Simu is
   
   Is_Running : Boolean := True;
   Nb_Procs : Positive;
   Timespeed : Positive := 1; -- in 1..100
   Basefreq : constant Positive := 100; -- sleep unit : 1/Basefreq
   
   type Proc_Sleep_Record is
      record
         Duree: Natural := 0;
         Wakeup: Boolean := False;
      end record;
   
   Infos_Proc : array(Proc_Id) of Proc_Sleep_Record;

   procedure Init(Nbproc: Positive) is
   begin
      Nb_Procs := Nbproc;
      Timespeed := 1;
   end Init;

   procedure Sleep(Id: Proc_Id; Duree: Positive) is
   begin
      Infos_Proc(Id).Duree := Duree * Basefreq;
      Infos_Proc(Id).Wakeup := False;
      while (not Infos_Proc(Id).Wakeup) and (Infos_Proc(Id).Duree > 0) loop
         if (Is_Running) then
            Infos_Proc(Id).Duree := Infos_Proc(Id).Duree - 1;
         end if;
         delay (1.0 / Basefreq) / Timespeed;
      end loop;
   end Sleep;

   procedure Wakeup(Id: Proc_Id) is
   begin
      Put_Line (Proc_Id'Image(Id) & " Wakeup by user");
      Infos_Proc(Id).Wakeup := True;
   end Wakeup;

   function Get_Running return Boolean is
   begin
      return Is_Running;
   end Get_Running;

   procedure Set_Running(B: Boolean) is
   begin
      Is_Running := B;
   end Set_Running;
   
   procedure Swap_Running is
   begin
      Is_Running := not Is_Running;
   end Swap_Running;

   procedure Set_Timespeed(Ts: Integer) is
   begin
      Timespeed := TS;
   end Set_Timespeed;

   function Get_Timespeed return Integer is
   begin
      return Timespeed;
   end Get_Timespeed;
   
   Previous_Running : Boolean;
   
   procedure Suspend_Time is
   begin
      Previous_Running := Is_Running;
      Is_Running := False;
   end Suspend_Time;
   
   procedure Resume_Time is
   begin
      Is_Running := Previous_Running;
   end Resume_Time;

end LR.Simu;
