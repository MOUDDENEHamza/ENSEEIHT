/** La classe Monnaie est caractérisée par une valeur et une devise.  Deux
 * monnaies peuvent être ajoutées ou retranchées.
 *
 * @author	Xavier Crégut
 * @version	$Revision: 1.1 $
 */
public class Monnaie {
	private int valeur;
	private String devise;

	/** Initialiser une monnaie à partir de sa valeur de et sa devise.
	 * @param valeur valeur de la monnaie
	 * @param devise devise de la monnaie
	 */
	public Monnaie(int valeur, String devise) {
		this.valeur = valeur;
		this.devise = devise;
	}

	/** Obtenir la valeur de cette monnaie.
	 * @param la valeur de cette monnaie
	 */
	public int getValeur() {
		return this.valeur;
	}

	/** Obtenir la devise de cette monnaie.
	 * @param la devise de cette monnaie
	 */
	public String getDevise() {
		return this.devise;
	}

	/** Ajouter une autre monnaie à cette devise.
	 * @param autre l'autre devise
	 * @depend - <send> - DeviseInvalideException
	 */
	public void ajouter(Monnaie autre) throws DeviseInvalideException {
		verifierMemesDevises(autre);
		this.valeur += autre.valeur;
	}

	/** Retrancher une autre monnaie à cette devise.
	 * @param autre l'autre devise
	 * @depend - <send> - DeviseInvalideException
	 */
	public void retrancher(Monnaie autre) throws DeviseInvalideException {
		verifierMemesDevises(autre);
		this.valeur -= autre.valeur;
	}

	private void verifierMemesDevises(Monnaie autre) throws DeviseInvalideException {
		if (! this.devise.equals(autre.devise)) {
			throw new DeviseInvalideException("Devises incompatibles : "
					+ this.devise + " et " + autre.devise);
		}
	}

}
