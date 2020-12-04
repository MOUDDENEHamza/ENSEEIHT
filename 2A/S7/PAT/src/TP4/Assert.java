package TP4;

/** La classe Assert dÃ©finit des mÃ©thodes de vÃ©rification.  Pour l'instant, la
 * seule mÃ©thode de vÃ©rification est assertTrue mais d'autres pourraient Ãªtre
 * dÃ©finies (voir JUnit).
 *
 * @author	Xavier CrÃ©gut
 * @version	$Revision: 1.1 $
 */
abstract public class Assert {

    /** VÃ©rifier que la condition est vraie.
     * @param condition la condition Ã  vÃ©rifier
     */
    static public void assertTrue(boolean condition) {
        if (! condition) {
            throw new Echec();
        }
    }

}
