import org.junit.*;
import static org.junit.Assert.*;

/** Programme de test JUnit pour les ensembles.
 *  @author	Xavier Crégut &lt;prenom.nom@enseeiht.fr&gt;
  */
abstract public class EnsembleTestAbstrait {

	protected Ensemble e1;

	private int[] tab0;	// pour faire les tests élémentaires

	@Before
	public void setUp() throws Exception {
		tab0 = new int[] { 10, 15, -5 };
		this.e1 = nouvelEnsemble(10);
		// System.out.println("e1 = " + e1);
	}

	abstract protected Ensemble nouvelEnsemble(int capacite);
		// la capacité sera utile dans le cas d'une ensemble tableau pour
		// choisir la capacité initiale du tableau utilisé pour stocker les
		// éléments.


	static void ajouterTous(Ensemble ens, int... elements) {
		for (int n : elements) {
			ens.ajouter(n);
		}
	}

	@Test
	public void testInitVide() {
		assertNotNull(e1);
		assertTrue(e1.estVide());
		assertEquals(0, e1.cardinal());
	}

	@Test
	public void testAjouterPremier() {
		assertTrue(e1.estVide());
		e1.ajouter(10);
		assertFalse(e1.estVide());
		assertEquals(1, e1.cardinal());
		assertTrue(e1.contient(10));
	}

	@Test
	public void testAjouterPlusieursFois() {
		assertTrue(e1.estVide());
		e1.ajouter(10);
		e1.ajouter(10);
		e1.ajouter(10);
		e1.ajouter(10);
		assertFalse(e1.estVide());
		assertEquals(1, e1.cardinal());
		assertTrue(e1.contient(10));
	}

	@Test
	public void testAjouterTroisElements() {
		e1.ajouter(10);
		e1.ajouter(15);
		e1.ajouter(-5);
		assertEquals(3, e1.cardinal());
		assertTrue(e1.contient(10));
		assertTrue(e1.contient(-5));
		assertTrue(e1.contient(15));
	}

	@Test
	public void testContient() {
		e1.ajouter(10);
		e1.ajouter(15);
		e1.ajouter(-5);
		assertEquals(3, e1.cardinal());
		assertTrue(e1.contient(10));
		assertTrue(e1.contient(-5));
		assertTrue(e1.contient(15));
		assertFalse(e1.contient(1));
		assertFalse(e1.contient(2));
		assertFalse(e1.contient(100));
		assertFalse(e1.contient(0));
	}

	@Test
	public void testSupprimerAbsent() {
		ajouterTous(e1, tab0);
		assertFalse(e1.contient(1));
		assertEquals(3, e1.cardinal());
		e1.supprimer(1);
		assertFalse(e1.contient(1));
		assertEquals(3, e1.cardinal());
		e1.supprimer(1);
		e1.supprimer(1);
		assertTrue(e1.contient(10));
		assertTrue(e1.contient(-5));
		assertTrue(e1.contient(15));
		assertFalse(e1.contient(1));
		assertFalse(e1.contient(2));
		assertEquals(3, e1.cardinal());
	}

	@Test
	public void testSupprimerPresent() {
		ajouterTous(e1, tab0);
		assertEquals(3, e1.cardinal());
		assertTrue(e1.contient(10));
		e1.supprimer(10);
		assertFalse(e1.contient(10));
		assertEquals(2, e1.cardinal());
		assertTrue(e1.contient(-5));
		assertTrue(e1.contient(15));
		assertFalse(e1.contient(1));
		assertFalse(e1.contient(2));
		assertEquals(2, e1.cardinal());
	}

	@Test
	public void testSupprimerDifferentsCas() {
		ajouterTous(e1, tab0);
		e1.supprimer(10);
		assertFalse(e1.contient(10));
		e1.supprimer(-5);
		assertFalse(e1.contient(10));
		assertFalse(e1.contient(-5));
		assertTrue(e1.contient(15));
		assertFalse(e1.contient(1));
		assertFalse(e1.contient(2));
		assertEquals(1, e1.cardinal());

		e1.supprimer(15);
		assertFalse(e1.contient(10));
		assertFalse(e1.contient(-5));
		assertFalse(e1.contient(15));
		assertFalse(e1.contient(1));
		assertFalse(e1.contient(2));
		assertEquals(0, e1.cardinal());
		assertTrue(e1.estVide());
	}

	/*@
	  	requires tab.length > 0;
		requires // éléments tous différents
		(\forall int i1; i1 >= 0 && i1 < tab.length;
			(\forall int i2; i2 >= 0 && i2 < i1;
			tab[i1] != tab[i2]));
	@*/
	protected void testerAvecTab(int... tab) {

		// Au fur et à mesure que l'on ajoute les éléments, on vérifie la
		// présence des éléments.
		for (int i = 0; i < tab.length; i++) {
			e1.ajouter(tab[i]);
			assertEquals(i+1, e1.cardinal());
			// vérifier la présence des éléments insérés
			for (int j = 0; j <= i; j++) {
				assertTrue(e1.contient(tab[j]));
			}
			// vérifier l'absence des éléments à insérer
			for (int j = i+1; j < tab.length; j++) {
				assertFalse(e1.contient(tab[j]));
			}
		}
	}

	@Test
	public void testerAvecTab1() {
		testerAvecTab(10, 15, 12, 5, 20, -5, 0);
	}

	@Test
	public void testerAvecTab2() {
		testerAvecTab(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
	}

	@Test
	public void testerAvecTab3() {
		testerAvecTab(10, 9, 8, 7, 6, 5, 4, 3, 2, 1);
	}

}
