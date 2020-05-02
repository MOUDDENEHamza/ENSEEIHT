/**
 * Définition d'un agenda individuel.
 */
public class AgendaIndividuel extends AgendaAbstrait {

	private String[] rendezVous;	// le texte des rendezVous


	/**
	 * Créer un agenda vide (avec aucun rendez-vous).
	 *
	 * @param nom le nom de l'agenda
	 * @throws IllegalArgumentException si nom nul ou vide
	 */
	public AgendaIndividuel(String nom) {
		super(nom);
		this.rendezVous = new String[Agenda.CRENEAU_MAX + 1];
			// On gaspille une case (la première qui ne sera jamais utilisée)
			// mais on évite de nombreux « creneau - 1 »
	}


	@Override
	public void enregistrer(int creneau, String rdv) throws CreneauInvalideException, OccupeException {
		if (creneau > Agenda.CRENEAU_MAX || creneau < Agenda.CRENEAU_MIN) {
			throw new CreneauInvalideException("Creneau Invalide");
		}
		if (this.rendezVous[creneau] != null) {
			throw new OccupeException("Occupe");
		}
		if (rdv == null || rdv.length() == 0) {
			throw new IllegalArgumentException();
		}
		this.rendezVous[creneau] = rdv;
	}


	@Override
	public boolean annuler(int creneau) throws CreneauInvalideException {
		if (creneau > Agenda.CRENEAU_MAX || creneau < Agenda.CRENEAU_MIN) {
			throw new CreneauInvalideException("Creneau Invalide");
		}
		boolean modifie = this.rendezVous[creneau] != null;
		this.rendezVous[creneau] = null;
		return modifie;
	}


	@Override
	public String getRendezVous(int creneau) throws LibreException, CreneauInvalideException {
		if (creneau > Agenda.CRENEAU_MAX || creneau < Agenda.CRENEAU_MIN) {
			throw new CreneauInvalideException("Creneau Invalide");
		}
		if (this.rendezVous[creneau] == null) {
			throw new LibreException("LibreException");
		}
		return this.rendezVous[creneau];
	}


	@Override
	public boolean verifierCreneauValide(int creneau) throws CreneauInvalideException {
		if (this.rendezVous[creneau] != null) {
			throw new CreneauInvalideException("Creneau Invalide");
		}
		return true;	
	}


}
