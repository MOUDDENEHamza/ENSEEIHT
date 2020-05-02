package allumettes;

/**
 * La classe Game permet de transmettre directement le jeu au joueur sans
 * utiliser le proxy.
 *
 * @author Hamza MOUDDENE
 * @version 1.0
 */
public class Game implements Jeu {

    // le nombre d'allumettes.
    private int nombreAllumettes;

    /**
     * Constructeur de la classe Game.
     *
     * @param nombreAllumettes : Le nombre d'allumettes
     */
    public Game(int nombreAllumettes) {
        assert (nombreAllumettes >= 0);
        this.nombreAllumettes = nombreAllumettes;
    }

    @Override
    public int getNombreAllumettes() {
        return this.nombreAllumettes;
    }

    /**
     * Changer le nombre d'allumettes
     *
     * @param nombreAllumettes : le nombre d'allumettes
     */
    public void setNombreAllumettes(int nombreAllumettes) {
        this.nombreAllumettes = nombreAllumettes;
    }

    @Override
    public void retirer(int nbPrises) throws CoupInvalideException {
        if (nbPrises > Jeu.PRISE_MAX) {
            if (Jeu.PRISE_MAX < this.nombreAllumettes) {
                throw new CoupInvalideException(nbPrises, "> " + Jeu.PRISE_MAX);
            } else {
                throw new CoupInvalideException(nbPrises, "> " + this.nombreAllumettes);
            }
        } else if (nbPrises <= 0) {
            throw new CoupInvalideException(nbPrises, "< 1");
        } else if (nbPrises > this.nombreAllumettes) {
            throw new CoupInvalideException(nbPrises, "> " + this.nombreAllumettes);
        } else {
            this.nombreAllumettes -= nbPrises;
		}
	}

    /**
     * Verfifier si deux game sont égales
     *
     * @param obj passé en paramètre
     * @return true s'il y'a égalité, sinon faux
     */
    public boolean isEquals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (!(obj instanceof Game)) {
            return false;
        }
        Game g = (Game) obj;
        if (this.nombreAllumettes != g.getNombreAllumettes()) {
            return false;
        }
        return true;
    }

}
