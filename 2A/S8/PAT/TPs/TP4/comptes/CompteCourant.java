/** Un compte courant est un compte simple avec un historique des
 * opérations effectuées.
 * @author  Xavier Crégut
 */
public class CompteCourant extends CompteSimple {

	/** L'historique des opérations de crédit et débit réalisées. */
	private Historique operations;
	
	/** Construction d'un compte courant dont le solde est nul.
	 * @param titulaire le titulaire du compte
	 */
	//@ requires titulaire != null;		// le titulaire existe
	//@ ensures getSolde() == 0;		// pas de dépôt initial
	//@ ensures getTitulaire() == titulaire;	// titulaire initialisé
	public CompteCourant(Personne titulaire) {
		this(titulaire, 0);
	}

	/** Construction d'un compte courant avec un montant initial.
	 * @param titulaire le titulaire du compte
	 * @param depotInitial le montant initial du compte
	 */
	//@ requires titulaire != null;	// le titulaire existe
	//@ requires depotInitial >= 0;	// montant initial strictement positif
	//@ ensures getSolde() == depotInitial;	// solde initialisé
	//@ ensures getTitulaire() == titulaire;	// titulaire initialisé
	public CompteCourant(Personne titulaire, double depotInitial) {
		super(titulaire, depotInitial);
		this.operations = new Historique();
		if (depotInitial > 0) {
			this.operations.enregistrer(depotInitial);
		}
	}

	/** Créditer le compte du montant (exprimé en euros). L'opération
	 * est enregistrée.
	 * @param montant montant déposé sur le compte en euros
	 */
	@Override public void crediter(double montant) {
		super.crediter(montant);
		this.operations.enregistrer(montant);
	}

	/** Débiter le compte du montant (exprimé en euros). L'opération
	 * est  enregistrée.
	 * @param montant montant retiré du compte en euros
	 */
	@Override public void debiter(double montant) {
		super.debiter(montant);
		this.operations.enregistrer(-montant);
	}

	/** Éditer le relevé du compte. */
	public void editerReleve() {
		System.out.println("----------------------------------------");

		// afficher les caractéristiques du compte
		System.out.print("Titulaire : ");
		this.getTitulaire().afficher();
		System.out.println();

		// Afficher l'historique des opérations
		System.out.println("Historique des opérations : ");
		for (int i = 1, nb = this.operations.getNbValeurs(); i <= nb; i++) {
			if (this.operations.getValeur(i) > 0) {
				System.out.println("  o  Dépôt de " + this.operations.getValeur(i));
			} else {
				System.out.println("  o  Retrait de " + -this.operations.getValeur(i));
			}
		}

		// Afficher le solde du compte
		System.out.println("----------------------------------------");
		System.out.println("Solde du compte : " + getSolde());
		System.out.println("----------------------------------------");
		System.out.println();
	}

	@Override public String toString() {
		return super.toString() + ", opérations=" + this.operations;
	}

}
