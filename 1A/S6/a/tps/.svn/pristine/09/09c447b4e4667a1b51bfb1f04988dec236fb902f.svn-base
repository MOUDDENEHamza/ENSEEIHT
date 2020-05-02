package allumettes;

import org.junit.*;

import static org.junit.Assert.*;

/**
 * Classe de test de la classe StrategieExperte
 *
 * @author Hamza MOUDDENE
 * @version 1.0
 */
public class StrategieExperteTest {

    private Strategie s;

    @Before
    public void setUp() {
        this.s = new StrategieExperte();
    }

    @Test
    public void test1() {
        assertEquals(this.s.getNom(), "Experte");
    }

    @Test
    public void test2() throws CoupInvalideException {
        int i, k;
        k = 1;
        for (i = 2; i <= 4; i++) {
            assertTrue(this.s.getPrise(new Game(i)) == (i - 1));
        }
        for (i = 6; i <= 8; i++) {
            assertTrue(this.s.getPrise(new Game(i)) == k);
            k++;
        }
        k = 1;
        for (i = 10; i <= 12; i++) {
            assertTrue(this.s.getPrise(new Game(i)) == k);
            k++;
        }
    }

    /**
     * Méthode pricipale de la classe StrategieExperteTest
     *
     * @param args est la variable d'environnement qui est une table de caractères
     */
    public static void main(String[] args) {
        org.junit.runner.JUnitCore.main(StrategieExperteTest.class.getName());
    }

}