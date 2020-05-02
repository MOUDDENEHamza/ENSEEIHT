import org.junit.*;
import static org.junit.Assert.*;

/**
 * Classe de test pour la méthode proposer de GroupeAgenda.
 */
public class GroupeAgendaProposerTest extends GroupeAgendaTest {

	private void testerProposer(GroupeAgenda g) throws Exception {
		agenda2.enregistrer(15, "FAIT");
		g.proposer(15, "OK");
		assertEquals("OK", agenda1.getRendezVous(15));
		assertEquals(null, g.getRendezVous(15));
		if (g == superGroupe) {
			assertEquals("OK", xavier.getRendezVous(15));
		}
		assertTrue(g.annuler(15));	// remettre dans l'état initial
	}

	@Test
	public void testerProposer() throws Exception {
		testerProposer(groupe);
		testerProposer(superGroupe);
	}

	@Test(expected=IllegalArgumentException.class)
	public void testerProposerIllegalArgumentNull() throws Exception {
		groupe.proposer(10, null);
	}

	@Test(expected=IllegalArgumentException.class)
	public void testerProposerIllegalArgumentVide() throws Exception {
		groupe.proposer(10, "");
	}

	@Test(expected=CreneauInvalideException.class)
	public void testerProposerCreaneauInvalideMin() throws Exception {
		groupe.proposer(Agenda.CRENEAU_MIN - 1, "ERREUR");
	}

	@Test(expected=CreneauInvalideException.class)
	public void testerProposerCreaneauInvalideMax() throws Exception {
		groupe.proposer(Agenda.CRENEAU_MAX + 1, "ERREUR");
	}

}
