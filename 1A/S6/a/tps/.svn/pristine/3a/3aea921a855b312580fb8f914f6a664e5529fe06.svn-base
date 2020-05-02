package allumettes;

import org.junit.*;

import static org.junit.Assert.*;

/**
 * Classe de test de la classe StrategieRapide
 *
 * @author Hamza MOUDDENE
 * @version 1.0
 */
public class StrategieNaiveTest {

    private Strategie s;

    @Before
    public void setUp() {
        this.s = new StrategieNaive();
    }

    @Test
    public void test1() {
        assertEquals(this.s.getNom(), "Naive");
    }

    @Test
    public void test2() throws CoupInvalideException {
        int i;
        for (i = 1; i <= 13; i++) {
            if (i == 1) {
                assertTrue(this.s.getPrise(new Game(i)) == i);
            } else {
                assertTrue(this.s.getPrise(new Game(i)) >= 1 && this.s.getPrise(new Game(i)) <= 3);
            }
        }
    }

    /**
     * Méthode pricipale de la classe StrategieNaiveTest
     *
     * @param args est la variable d'environnement qui est une table de caractères
     */
    public static void main(String[] args) {
        org.junit.runner.JUnitCore.main(StrategieNaiveTest.class.getName());
    }

}