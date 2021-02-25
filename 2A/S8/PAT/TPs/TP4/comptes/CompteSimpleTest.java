import org.junit.*;
import static org.junit.Assert.*;

/** Tests unitaires JUnit pour la classe CompteSimple.  */
public class CompteSimpleTest {

	public static final double EPSILON = 1e-6;
		// précision pour la comparaison entre réels.

	protected CompteSimple c1;
	protected CompteSimple c2;
	protected Personne p1;

	@Before
	public void setUp() {
		this.p1 = new Personne("Xavier", "Crégut", true);
		this.c1 = new CompteSimple(p1, 1000);
		this.c2 = new CompteSimple(p1);
	}

	@Test
	public void testerInitialisationC1() {
		assertEquals(this.c1.getTitulaire(), this.p1);
		assertEquals(1000, this.c1.getSolde(), EPSILON);
	}

	@Test
	public void testerInitialisationC2() {
		assertEquals(this.c2.getTitulaire(), this.p1);
		assertEquals(0, this.c2.getSolde(), EPSILON);
	}

	@Test
	public void testerCrediter() {
		this.c1.crediter(100);
		assertEquals(1100, this.c1.getSolde(), EPSILON);
	}

	@Test
	public void testerDebiter() {
		this.c1.debiter(100);
		assertEquals(900, this.c1.getSolde(), EPSILON);
		this.c1.debiter(250);
		assertEquals(650, this.c1.getSolde(), EPSILON);
	}

	@Test
	public void testerSoldeNegatif() {
		this.c1.debiter(1200);
		assertEquals(-200, this.c1.getSolde(), EPSILON);
		this.c1.crediter(300);
		assertEquals(100, this.c1.getSolde(), EPSILON);
	}

}
