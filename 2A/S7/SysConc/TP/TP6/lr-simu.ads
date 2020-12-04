-- Time-stamp: <02 oct 2012 09:38 queinnec@enseeiht.fr>

with LR.Tasks;

-- Simulateur temporel, avec possibilité de suspendre l'écoulement du temps,
-- de varier la vitesse du temps, et d'interrompre un sommeil.
package LR.Simu is
   
   -- Initialise le simulateur de temps pour `Nbproc' processus. 
   procedure Init(Nbproc: Positive);
   
   -- Suspend l'exécution du processus appelant, qui s'identifie par `Id', pour la durée spécifiée.
   procedure Sleep(Id: LR.Tasks.Proc_Id; Duree: Positive);
   
   -- Interrompt le sommeil du processus `Id'. Sans effet si le processus ne dort pas.
   procedure Wakeup(Id: LR.Tasks.Proc_Id);
   
   -- Renvoie la situation courante d'écoulement du temps.
   function Get_Running return Boolean;
   
   -- Décide de l'écoulement du temps.
   procedure Set_Running(B: Boolean);
   
   -- Inverse la situation courante d'écoulement du temps.
   procedure Swap_Running;
   
   -- Positionne la vitesse d'écoulement du temps.
   procedure Set_Timespeed(Ts: Integer);
   
   -- Obtention de la vitesse d'écoulement du temps.
   function Get_Timespeed return Integer;
   
   -- Suspend l'écoulement du temps en sauvegardant la situation courante (running ou pas).
   -- Doit éventuellement être suivi par un appel à Resume_Time.
   procedure Suspend_Time;
   
   -- Restaure la situation de l'écoulement du temps avant le précédent `Suspend_Time'
   procedure Resume_Time;

end LR.Simu;
