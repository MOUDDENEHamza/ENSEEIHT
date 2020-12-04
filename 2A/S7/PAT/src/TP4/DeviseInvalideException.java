package TP4;

/** L'exception DeviseInvalideException indique des devises incompatibles sur
 * des opÃ©rations entre monnaies.
 *
 * @author	Xavier CrÃ©gut
 * @version	$Revision: 1.1 $
 */
public class DeviseInvalideException extends Exception {

    public DeviseInvalideException(String message) {
        super(message);
    }

}
