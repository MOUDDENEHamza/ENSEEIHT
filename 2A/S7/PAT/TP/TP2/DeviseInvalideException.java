/** L'exception DeviseInvalideException indique des devises incompatibles sur
 * des opérations entre monnaies.
 *
 * @author	Xavier Crégut
 * @version	$Revision: 1.1 $
 */
public class DeviseInvalideException extends Exception {

	public DeviseInvalideException(String message) {
		super(message);
	}

}
