package editeur.commande;

import editeur.Ligne;

/** Reculer le curseur d'une position.
 * @author	Xavier Crégut
 * @version	1.4
 */
public class CommandeCurseurReculer
	extends CommandeLigne
{

	/** Initialiser la ligne sur laquelle travaille
	 * cette commande.
	 * @param l la ligne
	 */
	//@ requires l != null;	// la ligne doit être définie
	public CommandeCurseurReculer(Ligne l) {
		super(l);
	}

	public void executer() {
		ligne.reculer();
	}

	public boolean estExecutable() {
		return ligne.getCurseur() > 1;
	}

}
