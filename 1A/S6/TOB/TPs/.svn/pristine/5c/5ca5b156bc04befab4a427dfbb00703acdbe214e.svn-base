import java.awt.Color;
import org.junit.*;
import static org.junit.Assert.*;

/** Classe de test pour la robustesse de la classe Cercle.
  * @author	Xavier Crégut
  */
public class RobustesseCercleTest {

	protected Cercle c1;

	@Before public void setUp() {
		c1 = new Cercle(new Point(1, 2), 10);
	}


	@Test
	public void testerOptionEnableAssertion() {
		try {
			assert false;
		} catch (AssertionError e) {
			// C'est normal !
			return;
		} catch (Throwable e) {
			// C'est pas normal !
		}
		fail("Il faut exécuter avec l'option -ea de java !");
	}

	@Test(expected=AssertionError.class)
	public void testerE5a() {
		this.c1.contient(null);
	}

	@Test(expected=AssertionError.class)
	public void testerE10a() {
		this.c1.setCouleur(null);
	}

	@Test(expected=AssertionError.class)
	public void testerE11a() {
		this.c1 = new Cercle(null, 10);
	}

	@Test(expected=AssertionError.class)
	public void testerE11b() {
		this.c1 = new Cercle(new Point(1, 2), -10);
	}

	@Test(expected=AssertionError.class)
	public void testerE11c() {
		this.c1 = new Cercle(new Point(1, 2), 0);
	}

	@Test(expected=AssertionError.class)
	public void testerE12a() {
		this.c1 = new Cercle(new Point(1, 2), null);
	}

	@Test(expected=AssertionError.class)
	public void testerE12b() {
		this.c1 = new Cercle(null, new Point(1, 2));
	}

	@Test(expected=AssertionError.class)
	public void testerE12c() {
		this.c1 = new Cercle(new Point(1, 2), new Point(1, 2));
	}

	@Test(expected=AssertionError.class)
	public void testerE13a() {
		this.c1 = new Cercle(new Point(1, 2), null, Color.red);
	}

	@Test(expected=AssertionError.class)
	public void testerE13b() {
		this.c1 = new Cercle(null, new Point(1, 2), Color.red);
	}

	@Test(expected=AssertionError.class)
	public void testerE13c() {
		this.c1 = new Cercle(new Point(1, 2), new Point(1, 2), Color.red);
	}

	@Test(expected=AssertionError.class)
	public void testerE13d() {
		this.c1 = new Cercle(new Point(1, 2), new Point(1, 2), null);
	}

	@Test(expected=AssertionError.class)
	public void testerE14a() {
		this.c1 = Cercle.creerCercle(new Point(1, 2), null);
	}

	@Test(expected=AssertionError.class)
	public void testerE14b() {
		this.c1 = Cercle.creerCercle(null, new Point(1, 2));
	}

	@Test(expected=AssertionError.class)
	public void testerE14c() {
		this.c1 = Cercle.creerCercle(new Point(1, 2), new Point(1, 2));
	}

	@Test(expected=AssertionError.class)
	public void testerE16a() {
		this.c1.setRayon(-10);
	}

	@Test(expected=AssertionError.class)
	public void testerE16b() {
		this.c1.setRayon(0);
	}

	@Test(expected=AssertionError.class)
	public void testerE17a() {
		this.c1.setDiametre(-10);
	}

	@Test(expected=AssertionError.class)
	public void testerE17b() {
		this.c1.setDiametre(0);
	}

}
