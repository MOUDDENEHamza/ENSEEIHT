import org.junit.*;
import static org.junit.Assert.*;

/**
 * Classe de test de ObjetNomme.
 */
public class ObjetNommeTest {

	/**
	 * Retourner un objet de type ObjetNomme qui sera utilisé pour les test.
	 * @param nom le nom à utiliser pour l'objet nommé
	 * @returns un objet nommé du nom fourni
	 */
	protected ObjetNomme nouvelObjetNomme(String nom) {
		return new ObjetNommeConcret(nom);
	}

	private static class ObjetNommeConcret extends ObjetNomme {
		public ObjetNommeConcret(String nom) {
			super(nom);
		}
	}

	@Test
	public void testerGetNom() {
		String unNom = "Petit nom";
		ObjetNomme o = nouvelObjetNomme(unNom);
		assertEquals(unNom, o.getNom());
		assertSame("Pourquoi ne pas garder le même nom ?",
				unNom, o.getNom());
	}

	@Test(expected=IllegalArgumentException.class)
	public void testerConstructeurNomNul() {
		nouvelObjetNomme(null);

	}

	@Test(expected=IllegalArgumentException.class)
	public void testerConstructeurNomVide() {
		nouvelObjetNomme("");

	}

}
