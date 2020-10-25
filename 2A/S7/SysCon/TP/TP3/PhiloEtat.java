// Time-stamp: <08 déc 2009 08:30 queinnec@enseeiht.fr>

import java.util.concurrent.Semaphore;

public class PhiloEtat implements StrategiePhilo {

    /** Attributs de classe */
    private Semaphore[] philosophes;
    private Semaphore mutex;
    private EtatPhilosophe[] philosophesEtats;

    /** Constructeur de classe */
    public PhiloEtat (int nbPhilosophes) {
        this.mutex = new Semaphore(1);
        this.philosophesEtats = new EtatPhilosophe[nbPhilosophes];
        this.philosophes = new Semaphore[nbPhilosophes];
        for (int i = 0; i < nbPhilosophes; i++) {
            this.philosophes[i] = new Semaphore(0);
            this.philosophesEtats[i] = EtatPhilosophe.Pense;
        }
    }

    /** Le philosophe no demande les fourchettes.
     *  Précondition : il n'en possède aucune.
     *  Postcondition : quand cette méthode retourne, il possède les deux fourchettes adjacentes à son assiette. */
    public void demanderFourchettes (int no) throws InterruptedException {
        boolean mange = false;
        
        while (!mange) {
            this.mutex.acquire();
            this.philosophesEtats[no] = EtatPhilosophe.Demande;

            if (this.philosophesEtats[Main.PhiloDroite(no)] != EtatPhilosophe.Mange && this.philosophesEtats[Main.PhiloGauche(no)] != EtatPhilosophe.Mange) {
                IHMPhilo.poser(Main.FourchetteDroite(no), EtatFourchette.AssietteGauche);
                IHMPhilo.poser(Main.FourchetteGauche(no), EtatFourchette.AssietteDroite);
                this.philosophesEtats[no] = EtatPhilosophe.Mange;
                this.mutex.release();
                mange = true;
            } else {
                this.mutex.release();
                this.philosophes[no].acquire();
            }
            
        }
    }

    /** Le philosophe no rend les fourchettes.
     *  Précondition : il possède les deux fourchettes adjacentes à son assiette.
     *  Postcondition : il n'en possède aucune. Les fourchettes peuvent être libres ou réattribuées à un autre philosophe. */
    public void libererFourchettes (int no) throws InterruptedException {
        this.mutex.acquire();

        IHMPhilo.poser(Main.FourchetteDroite(no), EtatFourchette.Table);
        IHMPhilo.poser(Main.FourchetteGauche(no), EtatFourchette.Table);
        this.philosophesEtats[no] = EtatPhilosophe.Pense;
        
        if (this.philosophesEtats[Main.PhiloGauche(no)] == EtatPhilosophe.Demande &&
        this.philosophesEtats[Main.PhiloDroite(Main.PhiloGauche(no))] != EtatPhilosophe.Mange &&
        this.philosophesEtats[Main.PhiloGauche(Main.PhiloGauche(no))] != EtatPhilosophe.Mange) {
            this.philosophes[Main.PhiloGauche(no)].release();
        }
        
        if (this.philosophesEtats[Main.PhiloDroite(no)] == EtatPhilosophe.Demande &&
         this.philosophesEtats[Main.PhiloDroite(Main.PhiloDroite(no))] != EtatPhilosophe.Mange &&
         this.philosophesEtats[Main.PhiloGauche(Main.PhiloDroite(no))] != EtatPhilosophe.Mange) {
            this.philosophes[Main.PhiloDroite(no)].release();
        }

        this.mutex.release();
    }

    /** Nom de cette stratégie (pour la fenêtre d'affichage). */
    public String nom() {
        return "Implantation Sémaphores, stratégie d'états";
    }

}