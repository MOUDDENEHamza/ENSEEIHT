public interface Agenda {

	/** Le plus petit créneau possible. */
	int CRENEAU_MIN = 1;

	/** Le plus grand créneau possible. */
	int CRENEAU_MAX = 366;

	/**
	 * Obtenir le nom de l'agenda.
	 * @return le nom de l'agenda
	 */
	String getNom();

	/**
	 * Enregistrer un rendez-vous dans cet agenda.
	 *
	 * @param creneau le créneau du rendez-vous
	 * @param rdv le rendez-vous
	 * @throws CreneauInvalideException si le créneau est invalide
	 * @throws IllegalArgumentException si nom vaut null
	 * @throws OccupeException si le créneau n'est pas libre
	 */
	void enregistrer(int creneau, String rdv);

	/**
	 * Annuler le rendez-vous pris à une creneau donnée.
	 * Rien ne se passe si le créneau est libre.
	 * Retourne vrai si l'agenda est modifié (un rendez-vous est annulé),
	 * faux sinon.
	 * 
	 * @param creneau créneau du rendez-vous à annuler
	 * @return vrai si l'agenda est modifié
	 * @throws CreneauInvalideException si le créneau est invalide
	 */
	boolean annuler(int creneau);

	/**
	 * Obtenir le rendez-vous pris à une creneau donnée.
	 * 
	 * @param creneau le créneau du rendez-vous
	 * @return le rendez-vous à le créneau donnée
	 * @throw LibreException si pas de rendez-vous à ce créneau
	 */
	String getRendezVous(int creneau);

}
