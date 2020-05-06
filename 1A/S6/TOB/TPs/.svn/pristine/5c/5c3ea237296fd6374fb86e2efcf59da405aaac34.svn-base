import org.junit.*;
import static org.junit.Assert.*;

/**
  * Programme de test d'un agenda.
  */
abstract public class AgendaTestAbstrait extends ObjetNommeTest {

	protected Agenda agenda;
	final protected String jourAn = "Jour de l'an";
	final protected String premierFevrier = "Février commence";
	final protected String finAnnee = "Fin de l'année";


	protected abstract Agenda nouvelAgenda(String nom);

	@Override
	protected abstract ObjetNomme nouvelObjetNomme(String nom);


	@Before
	public void setUp() throws OccupeException {
		this.agenda = nouvelAgenda("Agenda");
		this.agenda.enregistrer(1, jourAn);
		this.agenda.enregistrer(32, premierFevrier);
		this.agenda.enregistrer(365, finAnnee);
	}

	@Test
	public void testerNom() {
		assertEquals("A1", nouvelAgenda("A1").getNom());
		assertEquals("A2", nouvelAgenda("A2").getNom());
	}

	@Test
	public void testerGetRendezVous() throws LibreException {
		assertEquals(jourAn, agenda.getRendezVous(1));
		assertEquals(premierFevrier, agenda.getRendezVous(32));
		assertEquals(finAnnee, agenda.getRendezVous(365));
	}

	@Test
	public void testerAnnuler() throws Exception {
		assertTrue(agenda.annuler(1));
		assertFalse(agenda.annuler(2));
	}

	@Test
	public void testerAnneeBissectile() throws LibreException, OccupeException {
		agenda.enregistrer(Agenda.CRENEAU_MAX, "OK");
		assertEquals("OK", agenda.getRendezVous(Agenda.CRENEAU_MAX));
	}


	@Test(expected=OccupeException.class)
	public void testerRobustesseEnregistrerOccupe() throws Exception {
		agenda.enregistrer(1, "UN");
	}

	@Test(expected=CreneauInvalideException.class)
	public void testerRobustesseEnregistrerCreneauPetit() throws Exception {
		agenda.enregistrer(Agenda.CRENEAU_MIN - 1, "UN");
	}

	@Test(expected=CreneauInvalideException.class)
	public void testerRobustesseEnregistrerCreneauGrand() throws Exception {
		agenda.enregistrer(Agenda.CRENEAU_MAX + 1, "UN");
	}


	@Test(expected=CreneauInvalideException.class)
	public void testerRobustesseAnnulerCreneauPetit() throws Exception {
		agenda.annuler(Agenda.CRENEAU_MIN - 1);
	}

	@Test(expected=CreneauInvalideException.class)
	public void testerRobustesseAnnulerCreneauGrand() throws Exception {
		agenda.annuler(Agenda.CRENEAU_MAX + 1);
	}


	@Test(expected=LibreException.class)
	public void testerRobustesseGetRendezVousLibre() throws Exception {
		agenda.getRendezVous(2);
	}

	@Test(expected=CreneauInvalideException.class)
	public void testerRobustesseGetRendezVousCreneauPetit() throws Exception {
		agenda.getRendezVous(Agenda.CRENEAU_MIN - 1);
	}

	@Test(expected=CreneauInvalideException.class)
	public void testerRobustesseGetRendezVousCreneauGrand() throws Exception {
		agenda.getRendezVous(Agenda.CRENEAU_MAX + 1);
	}

	@Test(expected=IllegalArgumentException.class)
	public void testerEnregistrerIllegalArgumentNull() throws Exception {
		agenda.enregistrer(10, null);
	}

	@Test(expected=IllegalArgumentException.class)
	public void testerEnregistrerIllegalArgumentVide() throws Exception {
		agenda.enregistrer(10, "");
	}


}
