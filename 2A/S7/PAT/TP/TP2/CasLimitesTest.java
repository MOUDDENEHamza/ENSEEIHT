/** Tester quelques cas limites.
  * @author	Xavier Crégut
  * @version	$Revision$
  */
public class CasLimitesTest {

	public void testOK() {
		// OK.
	}

	private void testMethodePrivee() {
		throw new RuntimeException("Une méthode privée n'est pas un test !");
	}

	protected void testMethodeProtegee() {
		throw new RuntimeException("Une méthode protected n'est pas un test !");
	}

	void testMethodePaquetage() {
		throw new RuntimeException("Une méthode de droit d'accès paquetage n'est pas un test !");
	}

	public static void testMethodeDeClasse() {
		throw new RuntimeException("Une méthode de classe n'est pas un test !");
	}

	public void testAvecParametre(int a) {
		throw new RuntimeException("Une méthode avec des paramètres n'est pas un test !");
	}

	public void testAvecParametre2(int a) {
		throw new RuntimeException("Une méthode avec des paramètres n'est pas un test !");
	}

}
