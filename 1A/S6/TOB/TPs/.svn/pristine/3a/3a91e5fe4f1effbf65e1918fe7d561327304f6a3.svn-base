/** Tester le polymorphisme (principe de substitution) et la liaison
 * dynamique.
 * @author	Xavier Crégut
 * @version	1.5
 */
public class TestPolymorphisme {

	/** Méthode principale */
	public static void main(String[] args) {
		// Créer et afficher un point p1
		// Oui, la classe Point possède un tel constructeur.
		Point p1 = new Point(3, 4);
		// Le translater exécuté est celui de la classe Point.
		p1.translater(10, 10);
		// Afficher : p1 = (3,4).
		System.out.print("p1 = "); 
		p1.afficher (); 
		System.out.println ();

		// Créer et afficher un point nommé pn1
		// Oui, la classe PointNomme possède un tel constructeur.
		PointNomme pn1 = new PointNomme (30, 40, "PN1");
		// Le translater exécuté est celui de la classe Point.
		pn1.translater (10, 10);
		/* afficher : pn1 = (30,40)
		    Texte {
		    	centre_x = x
			centre_y = y
			Couleur = couleur);
			pn1 = (30,40); 
			  }
		*/
		pn1.afficher();

		// Définir une poignée sur un point
		Point q;

		// Attacher un point à q et l'afficher
		q = p1;				// Oui, Parce qu'ils ont le meme type.
		System.out.println ("> q = p1;");
		// Afficher : q = (3,4).
		System.out.print ("q = "); q.afficher(); System.out.println ();

		// Attacher un point nommé à q et l'afficher
		q = pn1;			//  Oui, car PointNomme hérite de Point
		System.out.println ("> q = pn1;");
		// Afficher : q = (3,4).
		System.out.print ("q = "); q.afficher(); System.out.println ();
		
		// Définir une poignée sur un point nommé
		PointNomme qn;

		// Attacher un point à q et l'afficher
		qn = p1; // Non, ce n'est pas la meme poignée
		System.out.println ("> qn = p1;");
		/* afficher : qn = (30,40)
                    Texte {
                        centre_x = x
                        centre_y = y
                        Couleur = couleur);
                        qn = (30,40); 
                          }
                */
		System.out.print ("qn = "); qn.afficher(); System.out.println ();
									

		// Attacher un point nommé à qn et l'afficher
		qn = pn1; // Oui, c'est la meme poignée
		System.out.println ("> qn = pn1;");
		 /* afficher : qn = (30,40)
                    Texte {
                        centre_x = x
                        centre_y = y
                        Couleur = couleur);
                        qn = (30,40);
                          }
                */
		System.out.print ("qn = "); qn.afficher(); System.out.println ();
									

		double d1 = p1.distance (pn1);	//  Oui, car PointNomme hérite de Point
		System.out.println ("distance = " + d1);

		double d2 = pn1.distance (p1);	// Oui, c'est le meme type
		System.out.println ("distance = " + d2);

		double d3 = pn1.distance (pn1);	// oui, PointNomme hérite de Point
		System.out.println ("distance = " + d3);

		System.out.println ("> qn = q;");
		qn = q;	// Non, par ce que PointNomme hérite de Point
		/* afficher : qn = (30,40)
                    Texte {
                        centre_x = x
                        centre_y = y
                        Couleur = couleur);
                        qn = (30,40);
                          }
                */
		System.out.print ("qn = "); qn.afficher(); System.out.println ();

		System.out.println ("> qn = (PointNomme) q;");
		qn = (PointNomme) q;	// Oui, parce qu'on a casté.
		System.out.print ("qn = "); qn.afficher(); System.out.println ();

		System.out.println ("> qn = (PointNomme) p1;");
		qn = (PointNomme) p1;	// Oui, car PointNomme hérite de Point
		System.out.print ("qn = "); qn.afficher(); System.out.println ();
	}

}
