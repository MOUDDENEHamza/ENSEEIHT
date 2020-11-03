// Time-stamp: <02 mai 2013 10:16 queinnec@enseeiht.fr>

package Synchro;

/** À défaut d'un vrai assert...
 * @see AssertionViolation
 *
 * @author Philippe Quéinnec
 */
public class Assert {

    /** Lève l'exception <code>AssertionViolation</code> si la
     * condition <code>b</code> est fausse.
     */
    public static void check (boolean b) {
        if (! b)
          throw new AssertionViolation ();
    }
    
    /** Lève l'exception <code>AssertionViolation</code> avec le message
     * <code>msg</code> si la condition <code>b</code> est fausse.
     */
    public static void check (String msg, boolean b) {
        if (! b)
          throw new AssertionViolation (msg);
    }
}
