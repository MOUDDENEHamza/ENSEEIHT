/** Tests unitaires JUnit pour la classe CompteSimple.
  * Les comptes courants doivent réussir les tests de compte simple
  * @author	Xavier Crégut
  */
public class CompteCourantTest extends CompteSimpleTest {

	@Override
	public void setUp() {
		this.p1 = new Personne("Xavier", "Crégut", true);
		this.c1 = new CompteCourant(p1, 1000);
		this.c2 = new CompteCourant(p1);
	}

	public static void main(String[] args) {
		org.junit.runner.JUnitCore.main(CompteCourantTest.class.getName());
	}

}
