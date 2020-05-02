package allumettes;

import org.junit.*;

import static org.junit.Assert.*;

/**
 * Classe de test de la robustesse de la classe Game
 *
 * @author Hamza MOUDDENE
 * @version 1.0
 */
public class RobustesseGameTest {

    private Game g;

    @Before
    public void setUp() {
        this.g = new Game(13);
    }

    @Test(expected = AssertionError.class)
    public void test1() {
        this.g = new Game(-4);
    }

    @Test
    public void test2() {
        assertTrue(this.g.isEquals(new Game(13)));
        this.g.setNombreAllumettes(0);
        assertTrue(this.g.isEquals(new Game(0)));
        this.g.setNombreAllumettes(1);
        assertTrue(this.g.isEquals(new Game(1)));
    }

    /**
     * Méthode pricipale de la classe RobustesseGameTest
     *
     * @param args est la variable d'environnement qui est une table de caractères
     */
    public static void main(String[] args) {
        org.junit.runner.JUnitCore.main(RobustesseGameTest.class.getName());
    }

}