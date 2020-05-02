import org.junit.*;
import static org.junit.Assert.*;
import java.time.LocalDateTime;

/**
 * {@code PointDeVenteTest} est une classe de test de {@code PointDeVente}.
 */

public class PointDeVenteTest {

	protected PointDeVente pdv;

	@Before public void setUp() {
		this.pdv = new PointDeVenteBuilder()
			.setIdentifiant(31075001)
			.setLatitude(4363166.59585)
			.setLongitude(148256.404804)
			.setAdresse("92 Chemin de Gabardie")
			.setVille("Toulouse")
			.setCodePostal("31200")
			.addService("Automate CB")
			.addService("Station de gonflage")
			.addService("GPL")
			.addPrix(Carburant.GAZOLE, LocalDateTime.parse("2017-01-02T09:02:33"), 1235)
			.addPrix(Carburant.GAZOLE, LocalDateTime.parse("2017-01-17T08:23:09"), 1239)
			.build();
	}

	@Test public void testerAttributs() {
		assertEquals(31075001, pdv.getIdentifiant());
		assertEquals(4363166.59585, pdv.getLatitude(), 10e-6);
		assertEquals(148256.404804, pdv.getLongitude(), 10e-6);
		assertEquals("92 Chemin de Gabardie", pdv.getAdresse());
		assertEquals("TOULOUSE", pdv.getVille());
		assertEquals("31200", pdv.getCodePostal());
	}

	@Test public void testerServices() {
		assertEquals(3, pdv.getServices().size());
		assertTrue(pdv.getServices().contains("GPL"));
		assertTrue(pdv.getServices().contains("Station de gonflage"));
		assertTrue(pdv.getServices().contains("Automate CB"));
		assertFalse(pdv.getServices().contains("Toilettes publiques"));
	}

	@Test public void testerPrix() {
		assertEquals("Nominal", 1235, pdv.getPrix(Carburant.GAZOLE,
					LocalDateTime.parse("2017-01-10T09:00:00")));
		assertEquals("Nominal", 1239, pdv.getPrix(Carburant.GAZOLE,
					LocalDateTime.parse("2017-01-21T09:00:00")));

		assertEquals("Limite", 1235, pdv.getPrix(Carburant.GAZOLE,
					LocalDateTime.parse("2017-01-17T08:23:08")));
		assertEquals("Limite", 1239, pdv.getPrix(Carburant.GAZOLE,
					LocalDateTime.parse("2017-01-17T08:23:09")));

		assertEquals("Date avant le premier changement de prix",
				0, pdv.getPrix(Carburant.GAZOLE,
					LocalDateTime.parse("2017-01-01T10:00:00")));

		assertEquals("Pas de prix pour ce carburant",
				0, pdv.getPrix(Carburant.GPLc,
					LocalDateTime.parse("2017-01-15T10:00:00")));
	}




	

}
