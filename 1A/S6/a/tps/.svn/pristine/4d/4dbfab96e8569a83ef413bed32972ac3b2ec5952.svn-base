/**
  * ModeleMorpionSimple est une réalisation de l'interface ModeleMorpion en
  * utilisant un damier (tableau 3 par 3) pour stocker les symboles...
  *
  * @author	Xavier Crégut
  * @version	$Revision: 1.2 $
  */

public class ModeleMorpionSimple implements ModeleMorpion {

	/** La zone de jeu */
	private Etat[][] cases;

	/** Le joueur dont c'est le tour de jouer */
	private Etat joueur;

	/** Le nombres de cases cochées */
	private int nbCoups;

	/** Est-ce que la partie est gagnée ? */
	private boolean gagnee;

	public ModeleMorpionSimple() {
		// Créer le damier
		this.cases = new Etat[ModeleMorpion.TAILLE][ModeleMorpion.TAILLE];

		// Commencer une partie
		initialiser();
	}

	/** Est-ce que la partie est terminée ? */
	public boolean estTerminee() {
		return estGagnee()
			|| this.nbCoups >= ModeleMorpion.TAILLE * ModeleMorpion.TAILLE;
	}

	/** Est-ce qu'il y a un gagnant ? */
	public boolean estGagnee() {
		return gagnee;
	}

	/** Est-ce que la case (i,j) est vide ? */
	private boolean estVide(int i, int j) {
		return getValeur(i,j) == Etat.VIDE;
	}

	public Etat getValeur(int x, int y) {
		return this.cases[x][y];
	}

	/** Initialiser le jeu pour faire une nouvelle partie */
	private void initialiser() {
		// Initialiser les cases
		for (int i = 0; i < this.cases.length; i++) {
			for (int j = 0; j < this.cases[i].length; j++) {
				this.cases[i][j] = Etat.VIDE;
			}
		}

		// Initialiser le nb de coups
		this.nbCoups = 0;

		// Initialiser gagnée
		gagnee = false;

		// Initialiser le joueur
		this.joueur = Etat.CROIX;
	}

	public Etat getJoueur() {
		return this.joueur;
	}

	/** Changer de joueur */
	private void changer() {
		if (this.joueur == Etat.CROIX) {
			this.joueur = Etat.ROND;
		} else {
			this.joueur = Etat.CROIX;
		}
	}

	/** Jouer en (i,j) pour le joueur */
	//@ requires estVide(i,j);
	//@ ensures getValeur(i,j) == joueur;
	private void jouer(int i, int j) {
		this.cases[i][j] = this.joueur;
		this.nbCoups++;

		// Mettre à jour gagnee
		// XXX: Ceci ne marche que pour un Morpion de taille 3 !
		gagnee = gagnee ||
				((cases[i][0] == cases[i][1]	// ligne pleine
					&& cases[i][1] == cases[i][2])
				|| (cases[0][j] == cases[1][j]	// colonne pleine
					&& cases[1][j] == cases[2][j])
				|| (i == j	// première diagonale pleine
					&& cases[0][0] == cases[1][1]
					&& cases[1][1] == cases[2][2])
				|| (i + j == 2	// deuxième diagonale pleine
					&& cases[0][2] == cases[1][1]
					&& cases[1][1] == cases[2][0]));
	}


/////// « Événements » de haut niveau déclenchées par l'utilisateur ////////////


	// Remarque : dans cette partie j'ai laissé le paramètre implicite this car
	// il me semble qu'il faudrait mettre tout ceci dans une classe spécifique,
	// par exemple LogiqueMorpion.  Dans ce cas, this serait remplacé par
	// getModele() ou getMorpion().


	public void quitter() {
	}

	public void recommencer() {
		this.initialiser();
	}

	public void cocher(int x, int y) throws CaseOccupeeException {
		if (!this.estTerminee()) {	// La partie est en cours
			if (this.estVide(x, y)) {
				// Jouer la case
				this.jouer(x, y);

				// Passer à la suite
				if (! this.estTerminee()) {
					// Faire jouer l'autre joueur
					this.changer();
				}
			} else {
				throw new CaseOccupeeException("Impossible, la case est occupée !");
			}
		}
	}

}
