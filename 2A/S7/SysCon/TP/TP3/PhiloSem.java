// Time-stamp: <08 déc 2009 08:30 queinnec@enseeiht.fr>

import java.util.concurrent.Semaphore;

public class PhiloSem implements StrategiePhilo {

    /** Attribut de classe */
    private static Semaphore[] fourchettes;

    /** Constructeur de classe */
    public PhiloSem (int nbPhilosophes) {
        this.fourchettes = new Semaphore[nbPhilosophes];
        for (int i = 0; i < nbPhilosophes; i++)
            this.fourchettes[i] = new Semaphore(1);
    }

    /** Le philosophe no demande les fourchettes.
     *  Précondition : il n'en possède aucune.
     *  Postcondition : quand cette méthode retourne, il possède les deux fourchettes adjacentes à son assiette. */
    public void demanderFourchettes (int no) throws InterruptedException{
        this.fourchettes[Main.FourchetteDroite(no)].acquire();
        IHMPhilo.poser(Main.FourchetteDroite(no), EtatFourchette.AssietteGauche);
        this.fourchettes[Main.FourchetteGauche(no)].acquire();
        IHMPhilo.poser(Main.FourchetteGauche(no), EtatFourchette.AssietteDroite);
    }

    /** Le philosophe no rend les fourchettes.
     *  Précondition : il possède les deux fourchettes adjacentes à son assiette.
     *  Postcondition : il n'en possède aucune. Les fourchettes peuvent être libres ou réattribuées à un autre philosophe. */
    public void libererFourchettes (int no) {
        this.fourchettes[Main.FourchetteDroite(no)].release();
        IHMPhilo.poser(Main.FourchetteDroite(no), EtatFourchette.Table);
        this.fourchettes[Main.FourchetteGauche(no)].release();
        IHMPhilo.poser(Main.FourchetteGauche(no), EtatFourchette.Table);
    }

    /** Nom de cette stratégie (pour la fenêtre d'affichage). */
    public String nom() {
        return "Implantation Sémaphores, stratégie ???";
    }

}

