package menu;

// À NOTER : La classe n'est pas déclarée « public » car elle n'a
// pas à être utilisée à l'extérieur du paquetage.  Plus
// précisément, elle n'est utilisée que par la classe Menu.  À ce
// titre, il aurait été possible d'en faire une classe interne à
// la classe Menu.  Elle aurait alors été déclarée << static >>.

/** Définition d'une entrée de Menu.
 * @author	Xavier Crégut
 * @version	1.6
 */
class Entree {

	/** L'intitulé de l'entrée. */
	private String intitule;

	/** La commande associée à l'entrée. */
	private Commande commande;

	/** Construire une entrée à partir d'un intitulé et d'une commande.
	 * @param unIntitule l'intitulé de l'entrée
	 * @param uneCommande l'intitulé de la commande
	 */
	//@ requires uneCommande != null;	// la commande existe
	//@ requires unIntitule != null && unIntitule.length() > 0;
	//@					// l'intitulé existe
	//@ ensures getIntitule() == unIntitule;
	//@ ensures getCommande() == uneCommande;
	public Entree(String unIntitule, Commande uneCommande) {
		intitule = unIntitule;
		commande = uneCommande;
	}

	/** L'intitulé de l'entrée. */
	public /*@ pure @*/ String getIntitule() {
		return intitule;
	}

	/** La commande associée à l'entrée. */
	public /*@ pure @*/ Commande getCommande() {
		return commande;
	}

	/** Afficher l'entrée.
	 * @param numero le numéro de l'entrée dans le menu
	 */
	public /*@ pure @*/ void afficher(int numero) {
		if (commande.estExecutable()) {
			String num = "" + numero;
			if (num.length() < 2) {
				System.out.print(" ");
			}
			System.out.print(num);
		} else {
			System.out.print(" -");
		}
		System.out.print(") ");
		System.out.print(getIntitule());
		System.out.println();
	}

}
