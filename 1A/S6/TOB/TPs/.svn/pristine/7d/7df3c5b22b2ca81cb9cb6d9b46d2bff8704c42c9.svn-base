package editeur;

/** Une ligne de texte représentée par un StringBuffer.
  * @author	Xavier Crégut (cregut@enseeiht.fr)
  * @version	1.4
  */
public class LigneStringBuffer implements Ligne {

	//@ private invariant this.curseur == this.getCurseur();
	//@ private invariant this.getLongueur() == this.caracteres.length();
	//@ private invariant (\forall int i; i >= 1 && i <= this.getLongueur();
	//@			this.ieme(i) == this.caracteres.charAt(i-1));
	//@ private invariant caracteres != null;

	/** Les caractères de la ligne. */
	private StringBuffer caracteres;

	/** La position du curseur. */
	private int curseur;

	/** Créer une ligne vide.
	 */
	//@ ensures getLongueur() == 0;	// la ligne est vide
	public LigneStringBuffer() {
		caracteres = new StringBuffer();
		curseur = 0;
	}

	public int getLongueur() {
		return caracteres.length();
	}

	public int getCurseur() {
		return curseur;
	}

	public char ieme(int i) {
		return caracteres.charAt(i-1);
	}

	public char getCourant() {
		return ieme(curseur);
	}

	public void avancer() {
		curseur++;
	}

	public void reculer() {
		curseur--;
	}

	public void raz() {
		curseur = 1;
	}

	public void remplacer(char c) {
		caracteres.setCharAt(curseur-1, c);
	}

	public void supprimer() {
		// Supprimer le caractère
		caracteres.deleteCharAt(curseur-1);

		// Mettre à jour le curseur
		if (curseur > caracteres.length()) {
			curseur = caracteres.length();
		}
	}

	public void ajouterAvant(char c) {
		caracteres.insert(curseur-1, c);
		curseur++;
	}

	public void ajouterApres(char c) {
		caracteres.insert(curseur, c);
	}

	public void afficher() {
		if (caracteres.length() == 0) {	// La chaîne est vide
			System.out.print("~");
		} else {
			// Afficher les caractères avant le curseur
			System.out.print(caracteres.substring(0, curseur-1));

			// Afficher le caractère sous le curseur
			System.out.print("" + '[' + ieme(curseur) + ']');

			// Afficher les caractères après le curseur
			System.out.print(caracteres.substring(curseur));
		}
		System.out.println();
	}

	public String toString() {
		return "caractères = \"" + caracteres + '"'
					+ " et curseur = " + curseur;
	}

	public void ajouterFin(char c) {
		caracteres.append(c);
		if (curseur == 0) {
			curseur = 1;
		}
	}

	public void ajouterDebut(char c) {
		caracteres.insert(0, c);	// Ajouter le caractère
		curseur++;			// Rétablir le curseur
	}

	public void supprimerPremier() {
		caracteres.deleteCharAt(0);

		// Mettre à jour le curseur
		if (caracteres.length() == 0) {
			curseur = 0;
		} else if (curseur > 1) {
			curseur--;
		}
	}

	public void supprimerDernier() {
		caracteres.deleteCharAt(caracteres.length() - 1);
		if (curseur > caracteres.length()) {
			curseur--;
		}
	}

}
