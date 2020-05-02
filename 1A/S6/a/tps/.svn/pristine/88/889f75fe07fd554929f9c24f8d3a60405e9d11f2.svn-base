package editeur;

/** Spécification d'une ligne de texte.
  * @author	Xavier Crégut (cregut@enseeiht.fr)
  * @version	1.5
  */
public interface Ligne {
	//@ public invariant 0 <= getLongueur();	// La longueur est positive
	//@
	//@ // Le curseur est toujours sur un caractère sauf si la ligne est vide.
	//@ public invariant 0 <= getCurseur()  && getCurseur() <= getLongueur();
	//@ public invariant getCurseur() == 0 <==> getLongueur() == 0;

	/** nombre de caractères dans la ligne */
	/*@ pure @*/ int getLongueur();

	/** Position du curseur sur la ligne */
	/*@ pure @*/ int getCurseur();

	/** le ième caractère de la ligne
	 * @param i l'indice du caractère
	 * @return le ième caractère de la ligne
	 */
	//@ requires 1 <= i && i <= getLongueur();	// indice valide
	/*@ pure @*/ char ieme(int i);

	/** Le caractère sous le curseur
	 */
	//@ requires getLongueur() > 0;	// la ligne est non vide
	/*@ pure @*/ char getCourant();

	/** Avancer le curseur d'une position à droite.  */
	//@ requires getCurseur() < getLongueur();		// pas à la fin
	//@ ensures getCurseur() == \old(getCurseur()) + 1;	// curseur avancé
	void avancer();

	/** Avancer le curseur d'une position à gauche. */
	//@ requires getCurseur() > 1;			// pas en début de ligne
	//@ ensures getCurseur() == \old(getCurseur()) - 1;	// curseur reculé
	void reculer();

	/** Placer le curseur sur le premier caractère.  */
	//@ requires getLongueur() > 0;	// ligne non vide
	//@ ensures getCurseur() == 1;	// curseur sur la première position
	void raz();

	/** Remplacer le caractère sous le curseur par le caractère c. */
	//@ requires getLongueur() > 0;
	//@ ensures getCourant() == c;
	void remplacer(char c);

	/** Supprimer le caractère sous le curseur.  La position du curseur reste
	 * inchangée.
	 */
	//@ requires getLongueur() > 0;
	//@ ensures getLongueur() == \old(getLongueur()) - 1; // un caractère ôté
	//@ ensures getCurseur() == Math.min(\old(getCurseur()), getLongueur());
	void supprimer();

	/** Ajouter le caractère c avant le curseur.
	 * Le curseur reste sur le même caractère.
	 */
	//@ requires getLongueur() > 0;		// curseur positionné
	//@ 
	//@ ensures getLongueur() == \old(getLongueur()) + 1; // un caractère ajouté
	//@ ensures getCurseur() == \old(getCurseur()) + 1;   // curseur inchangé
	//@ ensures getCourant() == \old(getCourant());
	void ajouterAvant(char c);

	/** Ajouter le caractère c après le curseur.
	 * Le curseur reste sur le même caractère.
	 */
	//@ requires getLongueur() > 0;		// curseur positionné
	//@ ensures getLongueur() == \old(getLongueur()) + 1;   // caractère ajouté
	//@ ensures getCurseur() == \old(getCurseur());	    // curseur inchangé
	//@ ensures getCourant() == \old(getCourant());
	void ajouterApres(char c);

	/** Afficher la ligne en mettant entre crochets [] le caractère courant.
	 * Si la ligne est vide, un seul caractère tilde(~) est affiché.
	 */
	/*@ pure @*/ void afficher();

	/** Ajouter le caractère c à la fin de la ligne.
	 * Le curseur reste sur le même caractère.
	 */
	//@ ensures getLongueur() == \old(getLongueur()) + 1;    // caractère ajouté
	//@ ensures ieme(getLongueur()) == c;		     // à la fin
	//@ ensures (\forall int i; 1 <= i && i <= \old(getLongueur());
	//@						ieme(i) == \old(ieme(i)));
	//@ ensures getLongueur() > 1 ==> getCourant() == \old(getCourant());
	//@ ensures getCurseur() == Math.max(1, \old(getCurseur()));
	void ajouterFin(char c);

	/** Ajouter le caractère c au début de la ligne
	 * Le curseur reste sur le même caractère.
	 */
	//@ ensures getLongueur() == \old(getLongueur()) + 1;   // caractère ajouté
	//@ ensures ieme(1) == c;				// en première position
	//@  ensures (\forall int j; j >= 2 && j <= getLongueur();
	//@					ieme((int)j) == \old(ieme((int)(j-1))));
	//@ ensures getLongueur() > 1 ==> getCourant() == \old(getCourant());
	//@ ensures getCurseur() == \old(getCurseur()) + 1;
	void ajouterDebut(char c);

	/** supprimer le premier caractère de la ligne.  Le curseur reste sur le
	 * même caractère.
	 */
	//@ requires getLongueur() > 0;
	//@ ensures getLongueur() == \old(getLongueur()) - 1;
	//@ ensures \old(getCurseur()) != 1 ==> getCourant() == \old(getCourant());
	//@ ensures getCurseur()
	//@		== Math.min(Math.max((int)(\old(getCurseur())-1), 1), getLongueur());
	void supprimerPremier();

	/** supprimer le dernier caractère de la ligne. Le curseur reste sur le même
	  * caractère.
	  */
	//@ requires getLongueur() > 0;
	//@ ensures getLongueur() == \old(getLongueur()) - 1;
	//@ ensures \old(getCurseur()) < \old(getLongueur())
	//@				==> getCourant() == \old(getCourant());
	//@ ensures getCurseur() == Math.min(\old(getCurseur()), getLongueur());
	void supprimerDernier();

}
