import java.awt.Color;

/**Implantation de la classe Cercle Un cercle est une courbe plane fermée
 * constituée des points situés à égale distance d’un point nommé centre, La
 * valeur de cette distance est appelée rayon du cercle, On appelle diamètre la
 * distance entre deux points diamétralement opposés.
 * @author Hamza MOUDDENE
 */
public class Cercle implements Mesurable2D {
	/**Constante PI = 3.14.*/
	public static final double PI = Math.PI;
	/**Centre du cercle.*/
	private Point centre;
	/**Rayon du cercle.*/
	private double rayon;
	/**Couleur du cercle.*/
	private Color couleur;

	/**Un constructeur de la classe Cercle à partir d’un point qui désigne son
	 * centre et d’un réel correspondant à la valeur de son rayon, le cercle créé
	 * aura une couleur bleu par défaut.
	 * @param c est le centre du cercle qu'on souhaite créer
	 * @param r est le rayon du cercle qu'on souhaite créer
	 */
	public Cercle(Point c, double r) {
		assert (c != null && r > 0);
		this.centre = new Point(c.getX(), c.getY());
		this.setRayon(r);
		this.setCouleur(Color.blue);
	}

	/**Un constructeur de la classe Cercle à partir de deux points diamétralement
	 * opposés, sa couleur est considérée comme étant le bleu.
	 * @param p1 est un point diamétralement opposés à p2
	 * @param p2 est un point diamétralement opposés à p1
	 */
	public Cercle(Point p1, Point p2) {
		assert (p1 != null && p2 != null);
		assert (p1.getX() != p2.getX() || p1.getY() != p2.getY());
		this.centre = new Point((p1.getX() + p2.getX()) / 2,
			(p1.getY() + p2.getY()) / 2);
		this.setRayon(p1.distance(p2) / 2);
		this.setCouleur(Color.blue);
	}

	/**Un constructeur de la classe Cercle à partir de deux points diamétralement
	 * opposés et de sa couleur.
	 * @param p1 est un point diamétralement opposés à p2
	 * @param p2 est un point diamétralement opposés à p1
	 * @param c  est la couleur du cercle qu'on souhaite créer
	 */
	public Cercle(Point p1, Point p2, Color c) {
		assert (p1 != null && p2 != null && (p1.getX() != p2.getX()
			|| p1.getY() != p2.getY()) && c != null);
		this.centre = new Point((p1.getX() + p2.getX()) / 2,
			(p1.getY() + p2.getY()) / 2);
		this.setRayon(p1.distance(p2) / 2);
		this.setCouleur(c);
	}

	/**Otenir le centre du cercle.
	 * @return Point est le centre du cercle
	 */
	public Point getCentre() {
		return new Point(this.centre.getX(), this.centre.getY());
	}

	/**Otenir le rayon du cercle.
	 * @return double est le rayon du cercle
	 */
	public double getRayon() {
		return this.rayon;
	}

	/**Otenir la couleur du cercle.
	 * @return Color est la couleur du cercle
	 */
	public Color getCouleur() {
		return this.couleur;
	}

	/**Otenir le diamètre du cercle.
	 * @return double est le diamètre du cercle
	 */
	public double getDiametre() {
		return this.getRayon() * 2;
	}

	/**Changer le centre du cercle.
	 * @param c est le nouveu centre du cercle
	 */
	public void setCentre(Point c) {
		assert (c != null);
		this.centre = c;
	}

	/**Changer le rayon du cercle.
	 * @param r est le nouveau rayon du cercle
	 */
	public void setRayon(double r) {
		assert (r > 0);
		this.rayon = r;
	}

	/**Changer la couleur du cercle.
	 * @param c est la nouvelle couleur du cercle
	 */
	public void setCouleur(Color c) {
		assert (c != null);
		this.couleur = c;
	}

	/**changer le diamètre du cercle.
	 * @param d est le diamètre du cercle
	 */
	public void setDiametre(double d) {
		assert (d > 0);
		this.rayon = d / 2;
	}

	/**Translater un cercle avec un déplacement suivant l’axe des X et un
	 * déplacement suivant l’axe des Y.
	 * @param dx est le déplacement suivant l’axe des X
	 * @param dy est le déplacement suivant l’axe des Y
	 */
	public void translater(double dx, double dy) {
		this.centre.translater(dx, dy);
	}

	/**Vérifier si un point passé en paramètre est à l'intérieur au sens large d'un
	 * cercle.
	 * @param p est le point qu'on va vérifié
	 * @return boolean vrai si le point est à l'intérieu du cercle, sinon faux
	 */
	public boolean contient(Point p) {
		assert (p != null);
		return (p.distance(this.getCentre()) <= this.getRayon());
	}

	/**Obtenir le perimètre du cercle.
	 * @return double est le perimètre du cercle
	 */
	public double perimetre() {
		return 2 * this.rayon * PI;
	}

	/**Obtenir l'aire du cercle.
	 * @return double est l'aire du cercle
	 */
	public double aire() {
		return PI * Math.pow(this.rayon, 2);
	}

	/**Créer un cercle à partir de deux points, le premier correspond au centre du
	 * cercle et le deuxième est un point du cercle de sa circonférence), ces deux
	 * points forment donc un rayon du cercle, avec une couleur bleue par défaut.
	 * @param p1 est le point correspond au centre du cercle
	 * @param p2 est un point du cercle de sa circonférence
	 * @return Cercle est le cercle créé à partir du p1 et p2
	 */
	public static Cercle creerCercle(Point p1, Point p2) {
		assert (p1 != null && p2 != null && p1 != p2);
		Cercle newCercle = new Cercle(p1, p1.distance(p2));
		return newCercle;
	}

	/**Afficher un cercle sous la forme suivante Cr(a, b) où r est la valeur du
	 * rayon et (a, b) le centre du cercle.
	 * @return String[] est une chaine de caractère sous la forme C@r(a, b)
	 */
	public String toString() {
		String str = "C" + this.rayon + "@" + this.centre.toString();
		return str;
	}

}
