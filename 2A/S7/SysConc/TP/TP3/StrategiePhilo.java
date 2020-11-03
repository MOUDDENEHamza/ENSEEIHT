// Time-stamp: <28 Oct 2008 17:09 queinnec@enseeiht.fr>

/** Interface commune aux implantations de la gestion des fourchettes. */
public interface StrategiePhilo {
    /** Le philosophe no demande les fourchettes.
     *  Précondition : il n'en possède aucune.
     *  Postcondition : quand cette méthode retourne, il possède les deux fourchettes adjacentes à son assiette. */
    public void demanderFourchettes (int no) throws InterruptedException;

    /** Le philosophe no rend les fourchettes.
     *  Précondition : il possède les deux fourchettes adjacentes à son assiette.
     *  Postcondition : il n'en possède aucune. Les fourchettes peuvent être libres ou réattribuées à un autre philosophe. */
    public void libererFourchettes (int no) throws InterruptedException;

    /** Nom de cette stratégie (pour la fenêtre d'affichage). */
    public String nom();
}
