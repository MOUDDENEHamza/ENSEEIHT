package allumettes;

/**
 * La classe Proxy aide l'arbitre a détecter un joueur tricheur.
 *
 * @author Hamza MOUDDENE
 * @version 1.0
 */
public class Proxy implements Jeu {

    // le Proxy du jeu.
    private Jeu proxyJeu;

    /**
     * Constructeur de la classe Proxy.
     *
     * @param jeu : Le jeu courant
     */
    public Proxy(Jeu jeu) {
        assert (jeu != null);
        this.proxyJeu = jeu;
    }

    @Override
    public int getNombreAllumettes() {
        return this.proxyJeu.getNombreAllumettes();
    }

    @Override
    public void retirer(int nbPrises) throws OperationInterditeException {
        throw new OperationInterditeException("");
    }

}
