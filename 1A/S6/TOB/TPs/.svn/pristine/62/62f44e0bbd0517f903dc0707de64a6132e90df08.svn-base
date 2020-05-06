/** Un point nommé est un point avec un nom.
 * @author  Xavier Crégut
 * @version 1.7
 */
public class PointNomme extends Point {

	private String nom;		// le nom du point nommé

	/** Construire un point nommé à partir de son abscisse, son
	 * ordonnée et son nom.
	 * @param vx valeur de l'abscisse
	 * @param vy valeur de l'ordonnée
	 * @param sonNom nom à donner au point
	 */
	public PointNomme(double vx, double vy, String sonNom) {
		super(vx, vy);	// toujours en première ligne !
		this.setNom(sonNom);
	}

	/** Obtenir le nom du point nommé.
	 * @return le nom du point nommé
	 */
	public String getNom() {
		return this.nom;
	}

	/** Changer le nom du point nommé.
	 *  @param sonNom	le nouveau nom
	 */
	public void setNom(String sonNom) {
		this.nom = sonNom;
	}

	/** Afficher le point nommé. Le point est affiché sous la forme :
	 * <PRE>
	 *		nom:(x, y)
	 * </PRE>
	 */
	public void afficher() {
		System.out.print(this.getNom() + ":");
		super.afficher();		// utiliser afficher de Point
	}

	public void dessiner(afficheur.Afficheur afficheur) {
		super.dessiner(afficheur);	// utiliser dessiner de Point
		afficheur.dessinerTexte (this.getX(), this.getY(),
					this.getNom(), this.getCouleur());
	}

}
