/**
 * Définition d'une date dans le calendrier grégorien.
 *
 * @author	Xavier Crégut
 * @version	1.5
 */
public class Date {

	/*@ // le jour, le mois et l'année sont valides
		public invariant
		Date.estValide(this.getJour(), this.getMois(), this.getAnnee());
		
		// le quantième est valide
		public invariant
		Date.estQuantiemeValide(this.getQuantieme(), this.getAnnee());

		private invariant	// cumulJoursMois est cohérent avec nbJoursDansMois
			(\forall int mois; 0 <= mois && mois < Date.cumulJoursMois.length;
				Date.cumulJoursMois[mois] ==
						(\sum int m; 0 <= m && m < mois; Date.nbJoursMois[m]));
	@*/

	/** Tableau du nombre de jours par mois (sans prendre en compte les
		* années bissextiles). nbJoursMois[i] est le nombre de jours du
		* mois de numéro i+1.
		*/
	private static int nbJoursMois[] =
			{ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};

	/** Cumul des jours des mois précédents. cumulJoursMois[i] est le
		* nombre cumulé des jours des mois dont les numéros sont dans
		* l'intervalle 1..i-1.
		*/
	private static int cumulJoursMois[] =
			{ 0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334 };

	/** le numéro du jour dans le mois */
	private int jour;

	/** le numéro du mois dans l'année */
	private int mois;

	/** l'année */
	private int annee;

	/** Construire une date à partir du numéro du jour, du numéro du mois et de
		* l'année (qui doivent former une date valide).
		* @param j le numéro du jour dans le mois m
		* @param m le numéro du mois
		* @param a l'année
		*/
	//@ requires Date.estValide(j, m, a);
	//@ ensures getJour() == j;
	//@ ensures getMois() == m;
	//@ ensures getAnnee() == a;
	public Date(int j, int m, int a) {
		this._set(j, m, a);
			// On ne peut pas appeler directement set(j, m, a) car comme elle est
			// publique, elle provoque la vérification des invariants.
	}

	/** Construire une date à partir du quantième du jour dans l'année et de
	 * l'année.
	 * @param q le quantième du jour dans l'année
	 * @param a l'année
	 */
	//@ requires Date.estAnneeValide(a);
	//@ requires Date.estQuantiemeValide(q, a);
	//@ ensures getQuantieme() == q;
	//@ ensures getAnnee() == a;
	public Date(int q, int a) {
		this._set(q, a);
	}

	/** Changer la date à partir du numéro du jour, du numéro du mois et de
	 * l'année.
	 * @param j le numéro du jour dans le mois m
	 * @param m le numéro du mois
	 * @param a l'année
	 */
	// Cette méthode est privée et déclarée comme <em>helper</em> de manière à
	// ce que les invariants de la classe ne soient pas vérifiés quand elle
	// appelée depuis une autre méthode de la classe.
	//@ requires Date.estValide(j, m, a);
	//@ ensures this.jour == j;
	//@ ensures this.mois == m;
	//@ ensures this.annee == a;
	//@ helper
	private void _set(int j, int m, int a) {
		this.jour = j;
		this.mois = m;
		this.annee = a;
	}

	/** Changer la date à partir du numéro du jour, du numéro du mois et de
	 * l'année.
	 * @param j le numéro du jour dans le mois m
	 * @param m le numéro du mois
	 * @param a l'année
	 */
	//@ requires Date.estValide(j, m, a);
	//@ ensures getJour() == j;
	//@ ensures getMois() == m;
	//@ ensures getAnnee() == a;
	public void set(int j, int m, int a) {
		this._set(j, m, a);
	}

	/** Changer la date à partir du quantième du jour dans l'année et de
	 * l'année.
	 * @param q le quantième du jour dans l'année
	 * @param a l'année
	 */
	//@ requires Date.estAnneeValide(a);
	//@ requires Date.estQuantiemeValide(q, a);
	//@ ensures getQuantieme() == q;
	//@ ensures getAnnee() == a;
	//@ helper
	private void _set(int q, int a) {
		// Initialiser l'année
		this.annee = a;

		// Initialiser le mois
		this.mois = 1;
		while (q > nbJoursDansMois(this.mois, a)) { //  le mois est terminé
			q = q - nbJoursDansMois(this.mois, a);
			this.mois++;
		}

		// Initialiser les jours
		this.jour = q;
	}

	/** Changer la date à partir du quantième du jour dans l'année et de
	 * l'année.
	 * @param q le quantième du jour dans l'année
	 * @param a l'année
	 */
	//@ requires Date.estAnneeValide(a);
	//@ requires Date.estQuantiemeValide(q, a);
	//@ ensures getQuantieme() == q;
	//@ ensures getAnnee() == a;
	public void set(int q, int a) {
		this._set(q, a);
	}

	/** Obtenir le numéro du jour dans le mois.
	 * @return le numéro du jour dans le mois
	 */
	//@ pure
	//@ helper
	public int getJour() {
		return this.jour;
	}

	/** Obtenir le numéro du mois dans l'année.
	 * @return le numéro du mois dans l'année
	 */
	//@ pure
	//@ helper
	public int getMois() {
		return this.mois;
	}

	/** Obtenir l'année.
	 * @return l'année
	 */
	//@ pure
	//@ helper
	public int getAnnee() {
		return this.annee;
	}

	/** Obtenir le quantième du jour dans l'année.
	 * @return le quantième du jour dans l'année
	 */
	//@ pure
	//@ helper
	public int getQuantieme() {
		int resultat = this.jour	// nb de jours dans le mois en cours
				+ cumulJoursMois[this.mois-1]; // nb de jours des mois précédents
		// Prendre en compte le cas de l'année bissextile
		if (this.mois > 2 && estBissextile(this.annee)) {
			resultat++;
		}

		return resultat;
	}

	/** Obtenir le nombres de jours depuis l'an 0.
	 * @return nombres de jours depuis l'an 0.
	 */
	//@ pure
	public int getNbJoursDepuisAn0() {
		int a = this.annee - 1;	// nb d'années pleines
		return this.getQuantieme()	// nb de jours dans l'année en cours
				+ 365 * a				// années considérées non bissextiles
				+ (a / 4 - a / 100 + a / 400);	// nb d'années bissextiles
	}

	/** Afficher la date sous la forme jour/mois/année.  */
	public void afficher() {
		System.out.println(this);
	}

	// Méthode définie dans objet.  Je n'utilise pas un commentaire javadoc car
	// le commentaire défini dans la classe parente est le commentaire à
	// utiliser.
	public String toString() {
		return "" + int2String(this.jour)
						+ '/' + int2String(this.mois)
						+ '/' + this.annee;
				// le "" intial est là pour forcer la conversion en String,
				// les caractères sont en effet compatibles avec les entiers !
	}

	/** Obtenir la représentation d'un entier sous la forme d'une chaîne de
	 * caractères avec au moins 2 caractères.
	 * @param entier l'entier à convertir
	 * @return  la chaîne de caractères correspondant à entier
	 */
	private static String int2String(int entier) {
		String prefixe = (entier >= 0 && entier < 10) ? "0" : "";
		return  prefixe + entier;
	}

	/** L'année a est-elle bissextile ?
	 * @param a l'année
	 * @return vrai si l'année est bissextile
	 */
	//@ pure
	public static boolean estBissextile(int a) {
		return (a % 4 == 0)			// divisible par 4
				&& ((a % 100 != 0)		// et non divible par 100
					|| (a % 400 == 0));	// sauf si divisible par 400
	}

	/** Nombre de jours dans le mois m de l'année a.
	 * @param m le numéro du mois
	 * @param a l'année
	 * @return le nombre de jours dans le mois m de l'année a
	 */
	//@ pure
	public static int nbJoursDansMois(int m, int a) {
		int resultat = nbJoursMois[m-1];	// nb de jours dans le mois
		if (m == 2 && estBissextile(a)) {	// cas du mois de février
			resultat++;
		}
		return resultat;
	}

	/** Est-ce que le numéro de jour j est valide pour le mois m de l'année a ?
	 * @param j le numéro du jour dans le mois m
	 * @param m le numéro du mois
	 * @param a l'année
	 */
	//@ requires Date.estAnneeValide(a);
	//@ requires Date.estMoisValide(m);
	//@ pure
	public static boolean estJourValide(int j, int m, int a) {
		return 1 <= j && j <= nbJoursDansMois(m, a);
	}

	/** Est-ce que le numéro de mois m est valide ?
	 * @param m le numéro du mois
	 */
	//@ ensures \result <==> (1 <= m && m <= 12);
	//@ pure
	public static boolean estMoisValide(int m) {
		return 1 <= m && m <= 12;
	}

	/** Est-ce que le quantième est valide ?
		* @param q le numéro du jour dans l'année
		* @param a l'année
		*/
	//@ pure
	//@ helper
	public static boolean estQuantiemeValide(int q, int a) {
		boolean resultat = estAnneeValide(a);
		int nbJours = 365;	// nb de jours dans l'année a;
		if (estBissextile(a)) {
			nbJours++;
		}
		resultat = resultat && 1 <= q && q <= nbJours;
		return resultat;
	}

	/** Est-ce que l'année est valide ?
	 * @param a l'année
	 */
	//@ ensures \result <==> a > 0;
	//@ pure
	public static boolean estAnneeValide(int a) {
		return a > 0;
	}

	/** Est-ce que la date définie par le jour j, le mois m et l'année a est
	 * valide ?
	 * @param j le numéro du jour dans le mois m
	 * @param m le numéro du mois
	 * @param a l'année
	 */
	//@ pure
	//@ helper
	public static boolean estValide(int j, int m, int a) {
		return estAnneeValide(a)
				&&  estMoisValide(m)
				&&  estJourValide(j, m, a);
	}

//	Relation d'ordre sur les dates
//	------------------------------

	/** Déterminer si une date est antérieure strictement à une autre date.
	 * @param autre l'autre date (non nulle)
	 * @return cette date est-elle strictement antérieure à l'autre date ?
	 */
	/*@ requires autre != null;	// l'autre date est définie
	    ensures \result == this.getAnnee() < autre.getAnnee()
	   	 || (this.getAnnee() == autre.getAnnee()
	   	 	&& getMois() < autre.getMois())
	   	 || (this.getAnnee() == autre.getAnnee()
	   		   && this.getMois() == autre.getMois()
	   		   && this.getJour() < autre.getJour());
	    pure
	@*/
	public boolean lt(Date autre) {
		if (this.getAnnee() != autre.getAnnee()) {
			return this.getAnnee() < autre.getAnnee();
		} else if (this.getMois() != autre.getMois()) {
			return  this.getMois() < autre.getMois();
		} else {
			return  this.getJour() < autre.getJour();
		}
	}

	/** Déterminer si une date est postérieure ou égale à une autre date.
	 * @param autre l'autre date (non nulle)
	 * @return cette date est-elle postérieure ou égale à l'autre date
	 */
	//@ ensures \result == ! lt(autre);
	//@ pure
	public boolean ge(Date autre) {
		return ! this.lt(autre);
	}

	/** Déterminer si une date est strictement postérieure à une autre date.
	 * @param autre l'autre date (non nulle)
	 * @return cette date est-elle strictement postérieure à l'autre date
	 */
	//@ ensures \result == autre.lt(this);
	//@ pure
	public boolean gt(Date autre) {
		return autre.lt(this);
				// Utilisation obligatoire de this (on ne peut pas s'en passer).
	}

	/** Déterminer si une date est antérieure ou égale à une autre date.
	 * @param autre l'autre date (non nulle)
	 * @return cette date est-elle antérieure ou égale à l'autre date
	 */
	//@ ensures \result == !autre.lt(this);
	//@ pure
	public boolean le(Date autre) {
		return  ! autre.lt(this);
	}

//	Égalité de deux dates
//	---------------------

	/** Déterminer si deux dates sont égales.
	 * @param autre l'autre date
	 * @return cette date est égale à l'autre date
	 */
	//@ ensures \result == (le(autre) && ge(autre));
	//@ pure
	public boolean equals(Date autre) {
		return autre != null
				&& this.getAnnee() == autre.getAnnee()
				&& this.getMois() == autre.getMois()
				&& this.getJour() == autre.getJour();
	}

	/** Déterminer si cette date est égale à un autre objet.
	 * Ceci est une redéfinition de la méthode définie dans Object
	 * @param objet l'autre objet
	 * @return cette date est égale à l'autre objet
	 */
	//@ pure
	public boolean equals(/*@ nullable @*/ Object objet) {
		return objet != null
				&& (objet instanceof Date)
				// XXX on pourrait faire aussi objet.getClass() == this.getClass()
				&& equals((Date) objet);
	}

}
// vi: sw=4 ts=4
