package allumettes;

/** Exception qui indique qu'un coup invalide est joué.
 * @author	Xavier Crégut
 * @version	$Revision: 1.3 $
 */
public class CoupInvalideException extends Exception {

	/** Nombre d'allumettes prises. */
	private int nbAllumettes;

	/** Initialiser CoupInvalideException à partir du nombre d'allumettes
	 * prises.
	 * @param nb le nombre d'allumettes prises
	 * @param message le message qui explique pourquoi nb est invalide.
	 */
	public CoupInvalideException(int nb, String message) {
		super("Prise invalide : " + nb + " (" + message + ")");
		this.nbAllumettes = nb;
	}

	/** Indiquer le nombre d'allumettes qu'un joueur a voulu prendre.
	  * @return le nombre d'allumettes qu'un joueur a voulu prendre. */
	public int getNombreAllumettes() {
		return this.nbAllumettes;
	}

}
