package menu;

/** Définition d'une commande générale.
 * @author	Xavier Crégut
 * @version	1.4
 */
public interface Commande {

	/** Exécuter la commande.  */
	//@requires estExecutable();
	void executer();

	/** La commande est-elle exécutable ?
	 * @return la commande est-elle exécutable ?
	 */
	/*@ pure @*/ boolean estExecutable();

}
