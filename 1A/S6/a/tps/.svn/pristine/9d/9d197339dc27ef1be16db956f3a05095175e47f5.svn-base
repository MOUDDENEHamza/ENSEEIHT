package allumettes;

/**
 * L'interface Strategie définit les différentes stratégies qu'un joueur
 * pourra choisir.
 *
 * @author Hamza MOUDDENE
 * @version 1.0
 */
public interface Strategie {

    /**
     * Obtenir le nom de la stratégie
     *
     * @return le nom de la stratégie
     */
    String getNom();

    /**
     * Demander à un joueur le nombre d’allumettes qu’il veut prendre pour
     * un jeu donné.
     *
     * @param jeu : un jeu donné
     * @return le nombre d’allumettes qu’il veut prendre
     * @throws CoupInvalideException tentative de prendre un nombre invalide d'alumettes
     */
    int getPrise(Jeu jeu) throws CoupInvalideException;

}
