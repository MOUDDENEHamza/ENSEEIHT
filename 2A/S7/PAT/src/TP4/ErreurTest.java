package TP4;

/** ErreurTest est un programme de test qui dÃ©finit trois mÃ©thodes de test
 * dont une provoque une erreur.
 */
public class ErreurTest {

    public void tester1() {
    }

    public void tester2() {
        Assert.assertTrue(false);
    }

    public void tester3() {
        Assert.assertTrue(true);
    }

}
