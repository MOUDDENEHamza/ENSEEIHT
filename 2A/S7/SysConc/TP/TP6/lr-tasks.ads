-- Time-stamp: <01 oct 2012 15:37 queinnec@enseeiht.fr>

-- Tâches clients : lecteurs, rédacteurs
package LR.Tasks is
   
   MAXPROCS : constant Integer := 30;
   
   subtype Proc_Id is Positive range 1..MAXPROCS;
   
   task type Lecteur is
      entry Init(MonId: Proc_Id);
   end Lecteur;
   
   task type Redacteur is
      entry Init(MonId: Proc_Id);
   end Redacteur;
   
   type Lecteur_Access is access Lecteur;
   type Redacteur_Access is access Redacteur;
   
end LR.Tasks;
