package allumettes;

import org.junit.*;

import static org.junit.Assert.*;

/**
 * Classe de test de la classe StrategieLente
 *
 * @author Hamza MOUDDENE
 * @version 1.0
 */
public class StrategieLenteTest {

    private Strategie s;

    @Before
    public void setUp() {
        this.s = new StrategieLente();
    }

    @Test
    public void test1() {
        assertEquals(this.s.getNom(), "Lente");
    }

    @Test
    public void test2() throws CoupInvalideException {
        int i;
        for (i = 1; i <= 13; i++) {
            assertTrue(this.s.getPrise(new Game(i)) == 1);
        }
    }

    /**
     * Méthode pricipale de la classe StrategieLenteTest
     *
     * @param args est la variable d'environnement qui est une table de caractères
     */
    public static void main(String[] args) {
        org.junit.runner.JUnitCore.main(RobustesseProxyTest.class.getName());
    }

}