package editeur.commande;

import editeur.Ligne;

/** Avancer le curseur d'une position.
 * @author	Xavier Crégut
 * @version	1.4
 */
public class CommandeCurseurAvancer
	extends CommandeLigne
{

	/** Initialiser la ligne sur laquelle travaille
	 * cette commande.
	 * @param l la ligne
	 */
	//@ requires l != null;	// la ligne doit être définie
	public CommandeCurseurAvancer(Ligne l) {
		super(l);
	}

	public void executer() {
		ligne.avancer();
	}

	public boolean estExecutable() {
		return ligne.getCurseur() < ligne.getLongueur();
	}

}
