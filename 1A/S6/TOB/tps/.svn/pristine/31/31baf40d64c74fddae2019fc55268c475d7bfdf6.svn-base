import java.awt.Color;

/** Point modélise un point géométrique dans un plan équipé d'un
 * repère cartésien.  Un point peut être affiché et translaté.
 * Sa distance par rapport à un autre point peut être obtenue.
 *
 * @author  Xavier Crégut <Prénom.Nom@enseeiht.fr>
 */
public class Point {
	/** Construire un point à partir de son abscisse et de son ordonnée.
	 * @param vx abscisse
	 * @param vy ordonnée
	 */
	public Point(double vx, double vy) {
		// System.out.println("CONSTRUCTEUR Point(" + vx + ", " + vy + ")");
		this.x = vx;
		this.y = vy;
		this.couleur = Color.green;
	}

	/** Obtenir l'abscisse du point.
	 * @return abscisse du point
	 */
	public double getX() {
		return this.x;
	}

	/** Obtenir l'ordonnée du point.
	 * @return ordonnée du point
	 */
	public double getY() {
		return this.y;
	}

	/** Changer l'abscisse du point.
	  * @param vx nouvelle abscisse
	  */
	public void setX(double vx) {
		this.x = vx;
	}

	/** Changer l'ordonnée du point.
	  * @param vy nouvelle ordonnée
	  */
	public void setY(double vy) {
		this.y = vy;
	}

	/** Afficher le point. */
	public void afficher() {
		System.out.print("(" + this.x + ", " + this.y + ")");
	}

	/** Distance par rapport à un autre point.
	 * @param autre l'autre point
	 * @return distance entre this et autre
	 */
	public double distance(Point autre) {
		return Math.sqrt(Math.pow(autre.x - this.x, 2)
					+ Math.pow(autre.y - this.y, 2));
	}

   /** Translater le point.
	* @param dx déplacement suivant l'axe des X
	* @param dy déplacement suivant l'axe des Y
	*/
	public void translater(double dx, double dy) {
		this.x += dx;
		this.y += dy;
	}

//  Gestion de la couleur

	/** Obtenir la couleur du point.
	 * @return la couleur du point
	 */
	public Color getCouleur() {
		return this.couleur;
	}

	/** Changer la couleur du point.
	  * @param nouvelleCouleur nouvelle couleur
	  */
	public void setCouleur(Color nouvelleCouleur) {
		this.couleur = nouvelleCouleur;
	}

/*
	// La méthode finalize est appelée avant que le récupérateur de
	// mémoire ne détruise l'objet.  Attention toutefois, on ne sait
	// pas quand ces ressources seront libérées et il est donc
	// dangereux de s'appuyer sur ce mécanisme pour libérer des
	// ressources qui sont en nombre limité.
	//
	// D'autre part, pour être sûr que les méthodes << finalize >>
	// sont appelées avant la fermeture de Java, il faut appeler la
	// méthode statique :
	//		System.runFinalizersOnExit(true)
	//
	protected void finalize() {
		System.out.print("DESTRUCTION du point : ");
		this.afficher();
		System.out.println();
	}
*/

//	Représentation interne d'un point
//	---------------------------------

// Remarque : en Java, il est conseillé (convention de programmation)
// de mettre les attributs au début de la classe.

	private double x;		// abscisse
	private double y;		// ordonnée
	private Color couleur;	// couleur du point

}
