-- Time-stamp: <22 oct 2012 09:38 queinnec@enseeiht.fr>

with Ada.Text_IO; use Ada.Text_IO;
with LR.Synchro;
with LR.Simu;
with LR.Affic;
with Ada.Numerics.Discrete_Random;
with Ada.Exceptions;

package body LR.Tasks is
   
   package Rand_Int is new Ada.Numerics.Discrete_Random(Positive);
   Generator : Rand_Int.Generator;
   
   -- Chaque lecteur lit entre MinDelayLit et MaxDelayLit secondes,
   -- pense entre MinDelayLRien et MaxDelayLRien (les deux bornes incluses).
   -- Chaque rédacteur écrit entre MinDelayEcrit et MaxDelayEcrit secondes, et
   -- pense entre MinDelayERien et MaxDelayERien (les deux bornes incluses).
   MinDelayLit   : constant Positive := 5;
   MaxDelayLit   : constant Positive := 20;
   MinDelayEcrit : constant Positive := 2;
   MaxDelayEcrit : constant Positive := 10;
   MinDelayLRien : Positive := MinDelayLit;
   MaxDelayLRien : Positive := MaxDelayLit;
   MinDelayERien : Positive := MinDelayEcrit;
   MaxDelayERien : Positive := MaxDelayEcrit;
   
   -- Suspend la simulation de la tâche pendant [bi..bs] unités
   procedure Random_Sleep(No: Proc_Id; Bi: Positive; Bs: Positive) is
      Duree : Positive;
   begin
      Duree := (Rand_Int.Random(Generator) mod (Bs - Bi + 1)) + Bi;
      LR.Simu.Sleep(No, Duree);
   end Random_Sleep;
   
   task body Lecteur is
      Id: Proc_Id;
   begin
      accept Init(MonId: Proc_Id) do Id:=MonId; end Init;
      loop
         Random_Sleep(Id, MinDelayLRien, MaxDelayLRien);
         
         Put_Line (Proc_Id'Image(Id) & " Calling DL");
         Lr.Affic.Changer_Etat(Id, LR.Affic.Lecteur_Demande);
         LR.Synchro.Demander_Lecture;
         
         Put_Line (Proc_Id'Image(Id) & " Got DL, sleeping");
         Lr.Affic.Changer_Etat(Id, LR.Affic.Lecteur_Lit);
         Random_Sleep(Id, MinDelayLit, MaxDelayLit);
         
         Put_Line (Proc_Id'Image(Id) & " Calling TL");
         LR.Synchro.Terminer_Lecture;
         Lr.Affic.Changer_Etat(Id, LR.Affic.Lecteur_Rien);
      end loop;
   exception
      when Error: others =>
         Put_Line("**** Tâche Lecteur: exception: " & Ada.Exceptions.Exception_Information(Error));
   end Lecteur;
   
   task body Redacteur is
      Id: Proc_Id;
   begin
      accept Init(MonId: Proc_Id) do Id:=MonId; end Init;
      loop
         Random_Sleep(Id, MinDelayERien, MaxDelayERien);
         
         Put_Line (Proc_Id'Image(Id) & " Calling DR");
         LR.Affic.Changer_Etat(Id, LR.Affic.Redacteur_Demande);
         LR.Synchro.Demander_Ecriture;
         
         Put_Line (Proc_Id'Image(Id) & " Got DR, sleeping");
         LR.Affic.Changer_Etat(Id, LR.Affic.Redacteur_Ecrit);
         
         Random_Sleep(Id, MinDelayEcrit, MaxDelayEcrit);
         
         Put_Line (Proc_Id'Image(Id) & " Calling TR");
         LR.Synchro.Terminer_Ecriture;
         LR.Affic.Changer_Etat(Id, LR.Affic.Redacteur_Rien);
      end loop;
   exception
      when Error: others =>
         Put_Line("**** LectRedTask: exception: " & Ada.Exceptions.Exception_Information(Error));
   end Redacteur;
   
begin
   Rand_Int.Reset(Generator);
end LR.Tasks;
