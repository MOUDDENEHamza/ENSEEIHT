/** Une personne est simplement définie par son nom, son prénom et son sexe qui
 *  sont les informations nécessaires pour pouvoir la construire.
 */
public class Personne {

	//@ public invariant	// prénom défini
	//@		getPrenom() != null && getPrenom().length() > 0;
	//@ public invariant 	// nom défini
	//@		getNom() != null && getNom().length() > 0;

	/** le nom */
	private String nom;
	/** le prénom */
	private String prenom;
	/** est-ce un homme ? */
	private boolean masculin;

	/** Construire une personne à partir de nom, son prénom et son sexe.
	 * @param prenom_ le prénom de la personne
	 * @param nom_ le nom de la personne
	 * @param masculin_ est-ce un homme ?
	 */
	//@ requires nom != null && nom.length() > 0;	// nom défini
	//@ requires prenom != null && prenom.length() > 0;	// prénom défini
	//@
	//@ ensures getPrenom() == prenom;
	//@ ensures getNom() == nom;
	//@ ensures masculin ==> estHomme();
	//@ ensures !masculin ==> estFemme();
	public Personne(String prenom, String nom, boolean masculin) {
		this.nom = nom;
		this.prenom = prenom;
		this.masculin = masculin;
	}

	/** Le nom de la personne.
	 * @return le nom de la personne
	 */
	/*@ pure @*/ public String getNom() {
		return this.nom;
	}

	/** Le prénom de la personne.
	 * @return le prénom de la personne
	 */
	/*@ pure @*/ public String getPrenom() {
		return this.prenom;
	}

	/** La personne est-elle un homme ?
	 * @return la personne est-elle un homme ?
	 */
	/*@ pure @*/ public boolean estHomme() {
		return this.masculin;
	}

	/** La personne est-elle une femme ?
	 * @return la personne est-elle une femme ?
	 */
	/*@ pure @*/ public boolean estFemme() {
		return ! this.estHomme();
	}

	/** Afficher le nom et le prénom.  */
	public void afficher() {
		System.out.print(this);
	}

	/*@ pure @*/ public String toString() {
		return (this.masculin ? "M." : "Mme")
			+ ' ' + this.prenom + ' ' + this.nom;
	}

}
