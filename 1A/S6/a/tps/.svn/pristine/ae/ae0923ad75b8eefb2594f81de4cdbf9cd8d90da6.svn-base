import org.junit.*;
import static org.junit.Assert.*;

/**
  * GroupeAgendaTest 
  *
  * @author	Xavier Crégut <Prenom.Nom@enseeiht.fr>
  */

public class GroupeAgendaTest extends AgendaTestAbstrait {

	// groupe contient agenda1 et agenda2
	// superGroupe contient groupe et xavier
	protected GroupeAgenda groupe;
	protected Agenda agenda1, agenda2;	// les deux sous-groupes
	protected Agenda xavier;
	protected GroupeAgenda superGroupe;

	@Override
	protected GroupeAgenda nouvelAgenda(String nom) {
		this.groupe = new GroupeAgenda(nom);
		this.agenda1 = new AgendaIndividuel(nom + "-agenda1");
		this.agenda2 = new AgendaIndividuel(nom + "-agenda2");
		groupe.ajouter(agenda1);
		groupe.ajouter(agenda2);

		this.xavier	= new AgendaIndividuel(nom + "-Xavier");
		this.superGroupe = new GroupeAgenda(nom + "-superGroupe");
		this.superGroupe.ajouter(this.xavier);
		this.superGroupe.ajouter(this.groupe);
		return groupe;
	}

	@Override
	protected ObjetNomme nouvelObjetNomme(String nom) {
		return nouvelAgenda(nom);
	}


	@Test
	public void testerInitialisationCorrecte() {
		assertTrue(groupe == agenda);
	}


	@Test(expected=OccupeException.class)
	public void testerEnregistrerPasTousLibres() throws Exception {
		agenda2.enregistrer(10, "SEUL");
		agenda.enregistrer(10, "OK ?");
	}

	@Test(expected=OccupeException.class)
	public void testerEnregistrerPasTousLibresDansSousSousGroupe() throws Exception {
		agenda2.enregistrer(10, "SEUL");
		superGroupe.enregistrer(10, "OK ?");
	}

	private void testerAnnulerPasTousOccupe(Agenda a) throws Exception {
		agenda2.enregistrer(10, "SEUL");
		assertEquals(null, a.getRendezVous(10));
		assertTrue(a.annuler(10));
		String rdv = "OK ?";
		a.enregistrer(10, rdv);
		assertEquals(rdv, a.getRendezVous(10));
		assertTrue(a.annuler(10));
	}

	@Test
	public void testerAnnulerPasToutOccupe() throws Exception {
		testerAnnulerPasTousOccupe(this.groupe);
		testerAnnulerPasTousOccupe(this.superGroupe);
	}


}
