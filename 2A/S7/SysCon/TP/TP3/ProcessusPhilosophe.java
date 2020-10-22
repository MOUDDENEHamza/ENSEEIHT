// Time-stamp: v0.0 <28 Oct 2008 17:06 queinnec@enseeiht.fr>
// V0.1 6/9/13 (PM, correction de commentaires)

import Synchro.Simulateur;

/** Code d'un philosophe. */
public class ProcessusPhilosophe implements Runnable
{
    /** Identifiant du philosophe. */
    private int no;
    /** Quelle stratégie le philosophe utilise-t-il pour manipuler les fourchettes ? */
    private StrategiePhilo strategie;
    /** Le simulateur d'avancement du temps. */
    private Simulateur simu;

    /** Constructeur. */
    public ProcessusPhilosophe (int no, StrategiePhilo strategie, Simulateur simu) {
    	this.no = no;
        this.strategie = strategie;
        this.simu = simu;
    }

    /** Code d'un philosophe. */
    public void run() {
        try {
            simu.sleep (no, 0, Main.MaxDelayPense/2);
            for (;;) {
                // Demande
                IHMPhilo.changerEtat (no, EtatPhilosophe.Demande);
                strategie.demanderFourchettes (no);

                // Mange
                IHMPhilo.changerEtat (no, EtatPhilosophe.Mange);
                simu.sleep (no, Main.MinDelayMange, Main.MaxDelayMange);

                strategie.libererFourchettes (no);

                // Pense
                IHMPhilo.changerEtat (no, EtatPhilosophe.Pense);
                simu.sleep (no, Main.MinDelayPense, Main.MaxDelayPense);
            }
     	} catch (InterruptedException e) {
            // ok, die
            throw new RuntimeException(e);
        }
    }
}

