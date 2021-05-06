/**
  * Constante entière.
  *
  * @author	Xavier Crégut
  * @version	$Revision$
  */
public class Constante implements Expression {

	private int valeur;

	public Constante(int valeur) {
		this.valeur = valeur;
	}

	public int getValeur() {
		return this.valeur;
	}


}
