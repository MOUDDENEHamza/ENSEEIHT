-- Time-stamp: <01 oct 2012 15:40 queinnec@enseeiht.fr>

with LR.Tasks; use LR.Tasks;

package LR.Affic is
   
   type Proc_Etat is (Redacteur_Demande, Redacteur_Ecrit, Redacteur_Rien, Lecteur_Demande, Lecteur_Lit, Lecteur_Rien);
   
   procedure Init (Nomstrategie: String; Nblect : Natural; Nbred: Natural);
   
   -- Change l'état d'affichage : place du rond blanc/noir
   procedure Changer_Etat(Id : Proc_Id; Etat: Proc_Etat);
   
end LR.Affic;
