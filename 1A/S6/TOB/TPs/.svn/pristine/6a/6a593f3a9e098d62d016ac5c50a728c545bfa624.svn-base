package allumettes;

public interface Jeu {

	/** Nombre maximal d'allumettes pouvant Ãªtre prises. */
	int PRISE_MAX = 3;

	/** Obtenir le nombre d'allumettes encore en jeu.
	 * @return nombre d'allumettes encore en jeu
	 */
	int getNombreAllumettes();

	/** Retirer des allumettes.  Le nombre d'allumettes doit Ãªtre compris
	 * entre 1 et PRISE_MAX, dans la limite du nombre d'allumettes encore
	 * en jeu.
	 * @param nbPrises nombre d'allumettes prises.
	 * @throws CoupInvalideException tentative de prendre un nombre invalide d'alumettes
	 */
	void retirer(int nbPrises) throws CoupInvalideException;

}
