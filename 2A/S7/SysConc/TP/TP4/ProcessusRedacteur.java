// Time-stamp: <02 Apr 2008 16:27 queinnec@enseeiht.fr>
// v1 (10/14, PM) : Ajout d'une petite temporisation sur les transitions critiques (accès)
//  pour éviter un décalage entre l'état de l'application et l'état des objets grqphiques
//	au moment du test de cohérence réalisé par l'IHM graphique. Pas très glorieux, mais
//  a priori inévitable, à partir du moment où l'affichage et la simulation sont découplés

import Synchro.Simulateur;
import Synchro.ProcId;

public class ProcessusRedacteur extends Thread
{
    private int no;
    private LectRed lr;
    private Simulateur simu;
    private IHMLectRed ihm;
    private int SYNCHRO_AFFICHAGE = 10;

    public ProcessusRedacteur(LectRed lr, Simulateur simu, IHMLectRed ihm) {
        super (simu.getThreadGroup(), "");
    	this.no = no;
    	this.lr = lr;
        this.simu = simu;
        this.ihm = ihm;
    }

    public void run() {
        setName ("Redacteur-"+ProcId.getSelf());
        ihm.ajouterRedacteur();
        try {
            simu.sleep (0, Main.MaxDelayERien/2);
            while (true) {
                // demande à écrire
                ihm.changerEtat (LectRedEtat.Redacteur_Demande);
                lr.demanderEcriture ();
                Thread.sleep(SYNCHRO_AFFICHAGE);
                ihm.changerEtat (LectRedEtat.Redacteur_Ecrit);
                
                // utilise
                simu.sleep (Main.MinDelayEcrit, Main.MaxDelayEcrit);
                
                lr.terminerEcriture();
                ihm.changerEtat (LectRedEtat.Redacteur_Rien);
                
                // pense
                simu.sleep (Main.MinDelayERien, Main.MaxDelayERien);
            }
        } catch (Synchro.Suicide e) {
            // nothing
        } catch (InterruptedException e2) {
            // nothing
        } finally {
            ihm.enlever();
        }
    }
}

