package TP4;

/** Tester quelques cas limites.
 * @author	Xavier CrÃ©gut
 * @version	$Revision$
 */
public class CasLimitesTest {

    public void testOK() {
        // OK.
    }

    private void testMethodePrivee() {
        throw new RuntimeException("Une mÃ©thode privÃ©e n'est pas un test !");
    }

    protected void testMethodeProtegee() {
        throw new RuntimeException("Une mÃ©thode protected n'est pas un test !");
    }

    void testMethodePaquetage() {
        throw new RuntimeException("Une mÃ©thode de droit d'accÃ¨s paquetage n'est pas un test !");
    }

    public static void testMethodeDeClasse() {
        throw new RuntimeException("Une mÃ©thode de classe n'est pas un test !");
    }

    public void testAvecParametre(int a) {
        throw new RuntimeException("Une mÃ©thode avec des paramÃ¨tres n'est pas un test !");
    }

    public void testAvecParametre2(int a) {
        throw new RuntimeException("Une mÃ©thode avec des paramÃ¨tres n'est pas un test !");
    }

}
