/** La classe Assert définit des méthodes de vérification.  Pour l'instant, la
 * seule méthode de vérification est assertTrue mais d'autres pourraient être
 * définies (voir JUnit).
 *
 * @author	Xavier Crégut
 * @version	$Revision: 1.1 $
 */
abstract public class Assert {

	/** Vérifier que la condition est vraie.
	 * @param condition la condition à vérifier
	 */
	static public void assertTrue(boolean condition) {
		if (! condition) {
			throw new Echec();
		}
	}

}
