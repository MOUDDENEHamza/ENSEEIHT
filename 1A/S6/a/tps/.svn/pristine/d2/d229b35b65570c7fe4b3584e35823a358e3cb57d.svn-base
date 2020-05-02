/** Programme de test de la classe Segment.
  * @author  Xavier Crégut
  * @version 1.4
  */
public class TestSegment {

	public static void main(String[] args) {
		// Créer deux points et un segment à partir de ces points
		Point p1 = new Point(0, 0);
		Point p2 = new Point(3, 4);
		Segment s = new Segment(p1, p2);

		// Afficher le segment
		System.out.print("s = "); s.afficher(); System.out.println();

		// Afficher la longueur du segment
		System.out.println("longueur de s = " + s.longueur());
		if (s.longueur() != 5) {
			System.out.println("ERREUR : la longueur devrait être 5 !");
		}

		// Translater le segment
		System.out.println("> s.translater(10, 100);");
		s.translater(10, 100);
		if (p1.getX() != 10) {
			System.out.println("ERREUR pour translater extrémité1.x  !");
		}
		if (p1.getY() != 100) {
			System.out.println("ERREUR pour translater extrémité1.y  !");
		}
		if (p2.getX() != 13) {
			System.out.println("ERREUR pour translater extrémité2.x  !");
		}
		if (p2.getY() != 104) {
			System.out.println("ERREUR pour translater extrémité2.y  !");
		}

		// Afficher le segment
		System.out.print("s = "); s.afficher(); System.out.println();

		// Afficher la longueur du segment
		System.out.println("longueur de s = " + s.longueur());
		if (s.longueur() != 5) {
			System.out.println("ERREUR : la longueur devrait être 5 !");
		}
	}
}
