package TP4;

/** L'exception Echec permet de signaler l'erreur fonctionnelle d'un test.
 * @author	Xavier CrÃ©gut
 * @version	$Revision: 1.1 $
 */
public class Echec extends Error {
    public Echec() {
        super("condition non vÃ©rifiÃ©e");
    }
    public Echec(String message) {
        super(message);
    }
}
