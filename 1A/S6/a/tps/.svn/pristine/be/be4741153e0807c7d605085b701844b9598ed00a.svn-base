package TP08;

/**L'implantation de la classe Cellule
 * @author Hamza MOUDDENE
 */

public class Cellule<T extends Comparable<T>> {

	// Valeur de la cellule
	private T valeur;

	// Cellule suivante
	private Cellule<T> suiv;

	/** Constructeur de la classe Cellule
	 */
	public Cellule(T valeur, Cellule<T> suiv) {
		this.valeur = valeur;
		this.suiv = suiv;
	}

	/**Obtenir la valeur de la cellule
	 * @return T : la valeur de la celule
	 */
	public T getValeur() {
		return this.valeur;
	}

	/**Obtenir la cellule suivante
	 * @return Cellule : la celule suivante
	 */
	//@ requires this.suiv != null;
	public Cellule<T> getSuiv() {
		return this.suiv;
	}

	/**Changer la valeur de la cellule
	 * @param valeur : la valeur qu'on souhaite mettre dans la celule
	 */
	public void setValeur(T valeur) {
		this.valeur = valeur;
	}

	/**Changer la cellule suivante
	 * @param Cellule : la valeur de la celule
	 */
	public void setSuiv(Cellule<T> suiv) {
		this.suiv = suiv;
	}

}
