/** Une erreur à la compilation !
  * Lorsque on définit un constructeur dans une classe le constructeur par 
  * défaut n'est plus réutilisable, alors pour corriger l'erreur, il faut 
  * rajouter des paramètres au constructeur dans la méthode main pour que 
  * ça soit conforme avec la définition dans la classe Point.
  * @author	Xavier Crégut
  * @version	1.3
  */
public class ExempleErreur {

	/** Méthode principale */
	public static void main(String[] args) {
		Point p1 = new Point(0, 0);
		p1.setX(1);
		p1.setY(2);
		p1.afficher();
		System.out.println();
	}

}
