import java.awt.Color;
import org.junit.*;
import static org.junit.Assert.*;

/**
  * Classe de test des constructeurs de la classe Cercle
  *
  * @author	Hamza MOUDDENE
  */
public class CercleTest {
	
	// précision pour les comparaisons réelle
	public final static double EPSILON = 0.001;

    	/**
	 * Une méthode de test pour l'exigence E12 qui est un constructeur d'un 
	 * cercle à partir de deux points diamétralement opposés, sa couleur est
	 * considérée comme étant le bleu par défaut
	 */
    	@Test public void testerE12() {
		// Création des points
		Point A = new Point(4, 1);
		Point B = new Point(6, 1);
		Point C = new Point(2, 3);

		// Construire des cercles
		Cercle C1 = new Cercle(A, B);
		Cercle C2 = new Cercle(B, C);
		Cercle C3 = new Cercle(C, A);
		
		// Tests sur C1
		assertEquals("E12 sur C1 : abcisse du centre", C1.getCentre().getX(), 5.0, EPSILON);
		assertEquals("E12 sur C1 : ordonné du centre", C1.getCentre().getY(), 1.0, EPSILON);
		assertEquals("E12 sur C1 : rayon", C1.getRayon(), 1.0, EPSILON);
		assertEquals("E12 sur C1 : couleur", C1.getCouleur(), Color.blue);
		
		// Tests sur C2
		assertEquals("E12 sur C2 : abcisse du centre", C2.getCentre().getX(), 4.0, EPSILON);
                assertEquals("E12 sur C2 : ordonné du centre", C2.getCentre().getY(), 2.0, EPSILON);
		assertEquals("E12 sur C2 : rayon", C2.getRayon(), 2.236, EPSILON);
                assertEquals("E12 sur C2 : couleur", C2.getCouleur(), Color.blue);
		
		// Tests sur C3
		assertEquals("E12 sur C3 : abcisse du centre", C3.getCentre().getX(), 3, EPSILON);
                assertEquals("E12 sur C3 : ordonné du centre", C3.getCentre().getY(), 2, EPSILON);
		assertEquals("E12 sur C3 : rayon", C3.getRayon(), 1.414, EPSILON);
		assertEquals("E12 sur C3 : couleur", C3.getCouleur(), Color.blue);
	}

	/**
	 * Une méthode de test pour l'exigence E13 qui est un constructeur d'un 
	 * cercle à partir de deux points diamétralement opposés et de sa couleur
	 */
	@Test public void testerE13() {
		// Création des points
		Point A = new Point(10, 6);
		Point B = new Point(32, 7);
		Point C = new Point(287, 12);

		// Construire des cercles
		Cercle C1 = new Cercle(A, B, Color.white);
		Cercle C2 = new Cercle(B, C, Color.green);
		Cercle C3 = new Cercle(C, A, Color.red);
		
		// Tests sur C1
		assertEquals("E13 sur C1 : abcisse du centre", C1.getCentre().getX(), 21.0, EPSILON);
                assertEquals("E13 sur C1 : ordonné du centre", C1.getCentre().getY(), 6.5, EPSILON);
		assertEquals("E13 sur C1 : rayon", C1.getRayon(), 11.011, EPSILON);
		assertEquals("E13 sur C1 : couleur", C1.getCouleur(), Color.white);
		
		// Tests sur C2
		assertEquals("E13 sur C2 : abcisse du centre", C2.getCentre().getX(), 159.5, EPSILON);
                assertEquals("E13 sur C2 : ordonné du centre", C2.getCentre().getY(), 9.5, EPSILON);
		assertEquals("E13 sur C2 : rayon", C2.getRayon(), 127.524, EPSILON);
                assertEquals("E13 sur C2 : couleur", C2.getCouleur(), Color.green);
		
		// Tests sur C3
		assertEquals("E13 sur C3 : abcisse du centre", C3.getCentre().getX(), 148.5, EPSILON);
                assertEquals("E13 sur C3 : ordonné du centre", C3.getCentre().getY(), 9.0, EPSILON);
		assertEquals("E13 sur C3 : rayon", C3.getRayon(), 138.532, EPSILON);
		assertEquals("E13 sur C3 : couleur", C3.getCouleur(), Color.red);
	}

	/**
	 * Une méthode de test pour l'exigence E14 qui est un constructeur d'un
	 * cercle à partir de deux points, le premier correspond au centre du cercle
	 * et le deuxième est un point du cercle de sa circonférence, ces deux 
	 * points forment donc un rayon du cercle, avec une couleur bleu par défaut
	 */ 
	@Test public void testerE14() {
		// Création des points
		Point A = new Point(10, 6);
		Point B = new Point(32, 7);
		Point C = new Point(287, 12);

		// Construire des cercles
		Cercle C1 = new Cercle(new Point(0, 0), 0.1); 
		C1 = C1.creerCercle(A, B);
		Cercle C2 = new Cercle(new Point(0, 0), 0.1);
		C2 = C2.creerCercle(B, C);
		Cercle C3 = new Cercle(new Point(0, 0), 0.1);
		C3 = C3.creerCercle(C, A);
		
		// Tests sur C1
		assertEquals("E14 sur C1 : abcisse du centre", C1.getCentre().getX(), 10.0, EPSILON);
                assertEquals("E14 sur C1 : ordonné du centre", C1.getCentre().getY(), 6.0, EPSILON);
		assertEquals("E14 sur C1 : rayon", C1.getRayon(), 22.022, EPSILON);
		assertEquals("E14 sur C1 : couleur", C1.getCouleur(), Color.blue);
		
		// Tests sur C2
		assertEquals("E14 sur C2 : abcisse du centre", C2.getCentre().getX(), 32.0, EPSILON);
                assertEquals("E14 sur C2 : ordonné du centre", C2.getCentre().getY(), 7.0, EPSILON);
		assertEquals("E14 sur C2 : rayon", C2.getRayon(), 255.049, EPSILON);
                assertEquals("E14 sur C2 : couleur", C2.getCouleur(), Color.blue);
		
		// Tests sur C3
                assertEquals("E14 sur C3 : abcisse du centre", C3.getCentre().getX(), 287.0, EPSILON);
                assertEquals("E14 sur C3 : ordonné du centre", C3.getCentre().getY(), 12.0, EPSILON);
		assertEquals("E14 sur C3 : rayon", C3.getRayon(), 277.064, EPSILON);
		assertEquals("E14 sur C3 : couleur", C3.getCouleur(), Color.blue);
	}

    	/**
	* Méthode pricipale de la classe CercleTest
	*
	* @param args est la variable d'environnement qui est une table de caractères
	*/
	public static void main(String[] args) {
		org.junit.runner.JUnitCore.main("CercleTest");
	}

}
