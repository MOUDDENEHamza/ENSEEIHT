-- Time-stamp: <23 oct 2012 10:40 queinnec@enseeiht.fr>

with Ada.Text_IO;
with Ada.Command_Line;
with Ada.Exceptions;
use Ada;
with Gdk.Threads;
with Gtk.Main;
with LR.Affic;
with LR.Tasks;
with LR.Simu;
with LR.Synchro;

procedure LR.Main is
   Nb_Lecteurs : Natural;
   Nb_Redacteurs : Natural;
   
   procedure Start_Client_Tasks is
      Tl : LR.Tasks.Lecteur_Access;
      Tr : LR.Tasks.Redacteur_Access;
   begin
      for I in 1..Nb_Lecteurs loop
         Tl := new LR.Tasks.Lecteur;
         Tl.Init(I);
      end loop;
      for I in 1 .. Nb_Redacteurs loop
         Tr := new LR.Tasks.Redacteur;
         Tr.Init(Nb_Lecteurs + I);
      end loop;
   end Start_Client_Tasks;
   
begin
   if Ada.Command_Line.Argument_Count /= 2 then
      Text_IO.Put_Line("Expected two arguments : nblect nbred.");
      return;
   end if;
   
   Nb_Lecteurs := Natural'Value(Ada.Command_Line.Argument(1));
   Nb_Redacteurs := Natural'Value(Ada.Command_Line.Argument(2));
   
   if (Nb_Redacteurs + Nb_Lecteurs > LR.Tasks.MAXPROCS) then
      Text_IO.Put_Line("nblect >= 1, nbred >= 1, nblect+nbred <=" & Natural'Image(LR.Tasks.MAXPROCS));
      return;
   end if;
   
   Gdk.Threads.G_Init;
   Gdk.Threads.Init;
   Gtk.Main.Init;
   
   LR.Simu.Init(Nb_Redacteurs + Nb_Lecteurs);
   LR.Affic.Init(Nomstrategie => LR.Synchro.Nom_Strategie, Nblect => Nb_Lecteurs, Nbred => Nb_Redacteurs);
   Start_Client_Tasks;

   Gdk.Threads.Enter;
   Gtk.Main.Main;
   Gdk.Threads.Leave;
   
exception
   when Error: others =>
      Text_IO.Put_Line("**** LectRedTask: exception: " & Ada.Exceptions.Exception_Information(Error));
end LR.Main;
