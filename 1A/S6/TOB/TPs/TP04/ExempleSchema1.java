import java.awt.Color;

import afficheur.AfficheurSVG;
import afficheur.Ecran;

/** Construire le schéma proposé dans le sujet de TP avec des points,
 * et des segments.
 *
 * @author	Xavier Crégut
 * @version	$Revision: 1.7 $
 */
public class ExempleSchema1 {

	/** Construire le schéma et le manipuler.
	 * Le schéma est affiché.
	 * @param args les arguments de la ligne de commande
	 */
	public static void main(String[] args)
	{
		// Créer les trois segments
		Point p1 = new Point(3, 2);
		Point p2 = new Point(6, 9);
		Point p3 = new Point(11, 4);
		Segment s12 = new Segment(p1, p2);
		Segment s23 = new Segment(p2, p3);
		Segment s31 = new Segment(p3, p1);

		// Créer le barycentre
		double sx = p1.getX() + p2.getX() + p3.getX();
		double sy = p1.getY() + p2.getY() + p3.getY();
		Point barycentre = new Point(sx / 3, sy / 3);

		// Afficher le schéma
		System.out.println("Le schéma est composé de : ");
		s12.afficher();		
		System.out.println();
		s23.afficher();		
		System.out.println();
		s31.afficher();		
		System.out.println();
		barycentre.afficher();	
		System.out.println();

		//Creation de l'écran et dessin
		Ecran display = new Ecran("ExempleSchema1", 600, 400, 20);

		//Creation des axes
		display.dessinerAxes();

		//Dessin des différents objets
		p1.dessiner(display);
		p2.dessiner(display);
		p3.dessiner(display);
		s12.dessiner(display);
		s23.dessiner(display);
		s31.dessiner(display);
		barycentre.dessiner(display);
		
		//Translation du schéma.
		s12.translater(4,-3);
		s23.translater(4,-3);
		s31.translater(4,-3);
		barycentre.translater(4,-3);


		//Dessin des différents objets.
		p1.dessiner(display);
		p2.dessiner(display);
		p3.dessiner(display);
		s12.dessiner(display);
		s23.dessiner(display);
		s31.dessiner(display);
		barycentre.dessiner(display);

		//Affichage SVG.
		AfficheurSVG svgtest = new AfficheurSVG("TESTSVG","Schéma SVG 1",600,400);

		//Dessin des objets		
		svgtest.dessinerLigne(p1.getX(),p1.getY(),p2.getX(),p2.getY(),Color.green);
		svgtest.dessinerLigne(p2.getX(),p2.getY(),p3.getX(),p3.getY(),Color.green);
		svgtest.dessinerLigne(p3.getX(),p3.getY(),p1.getX(),p1.getY(),Color.green);
		svgtest.dessinerPoint(p1.getX(),p1.getY(),Color.green);
		svgtest.dessinerPoint(p2.getX(),p2.getY(),Color.green);
		svgtest.dessinerPoint(p3.getX(),p3.getY(),Color.green);
		svgtest.dessinerPoint(barycentre.getX(),barycentre.getY(),Color.green);

		//Ecrire dans schema.svg.
		svgtest.ecrire();
		svgtest.ecrire("schema.svg");	
	}

}
