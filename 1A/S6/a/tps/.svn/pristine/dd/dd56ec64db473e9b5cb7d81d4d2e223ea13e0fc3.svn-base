package allumettes;

import org.junit.*;

import static org.junit.Assert.*;

/**
 * Classe de test de la robustesse de la classe Proxy
 *
 * @author Hamza MOUDDENE
 * @version 1.0
 */
public class RobustesseProxyTest {

    private Proxy p;

    @Before
    public void setUp() {
        this.p = new Proxy(new Game(13));
    }

    @Test(expected = AssertionError.class)
    public void test1() {
        this.p = new Proxy(null);
    }

    @Test(expected = OperationInterditeException.class)
    public void test2() {
        this.p.retirer(69);
    }

    /**
     * Méthode pricipale de la classe RobustesseProxyTest
     *
     * @param args est la variable d'environnement qui est une table de caractères
     */
    public static void main(String[] args) {
        org.junit.runner.JUnitCore.main(RobustesseProxyTest.class.getName());
    }

}