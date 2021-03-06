package allumettes;

/**
 * la classe Joueur a pour objectif de modéliser un joueur.
 *
 * @author Hamza MOUDDENE
 * @version 1.0
 */
public class Joueur {

    // Le nom du joueur.
    private String nom;

    // La stratégie du joueur.
    private Strategie strategie;

    /**
     * Constructeur de la classe Joueur qui construit un joueur avec un nom et
     * une stratègie donnée.
     *
     * @param nom       : Le nom du joueur
     * @param strategie : La stratégie du joueur
     */
    public Joueur(String nom, Strategie strategie) {
        assert (nom != null && nom.length() > 0);
        assert (strategie != null);
        this.nom = nom;
        this.strategie = strategie;
    }

    /**
     * Obtenir le nom du joueur.
     *
     * @return le nom du joueur
     */
    public String getNom() {
        return this.nom;
    }

    /**
     * Obtenir la stratégie du joueur
     *
     * @return la stratégie du joueur
     */
    public Strategie getStrategie() {
        return this.strategie;
    }

    /**
     * Obtenir la prise selon la stratégie du joueur
     *
     * @param jeu : un jeu donné
     * @return la prise selon la strategie
     * @throws CoupInvalideException lève une exception lors d'un coup invalide
     */
    public int getPrise(Jeu jeu) throws CoupInvalideException {
        assert (jeu != null);
        if (1 == 0) {
            throw new CoupInvalideException(0, "test");
        }
        return this.strategie.getPrise(jeu);
    }

    /**
     * Modifier le nom du joueur.
     *
     * @param newNom : Le nouveau nom
     */
    public void setNom(String newNom) {
        assert (newNom != null && newNom.length() > 0);
        this.nom = newNom;
    }

    /**
     * Modifier la startégie du joueur.
     *
     * @param newStrategie : La nouvelle stratégie
     */
    public void setStrategie(Strategie newStrategie) {
        assert (newStrategie != null);
        this.strategie = newStrategie;
    }

    /**
     * Verfifier si deux joueurs sont égaux
     *
     * @param obj passé en paramètre
     * @return true s'il y'a égalité, sinon faux
     */
    public boolean isEquals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (!(obj instanceof Joueur)) {
            return false;
        }
        Joueur j = (Joueur) obj;
        if (this.nom != j.getNom()
			|| this.strategie.getNom() != j.getStrategie().getNom()) {
            return false;
        }
        return true;
    }

}
