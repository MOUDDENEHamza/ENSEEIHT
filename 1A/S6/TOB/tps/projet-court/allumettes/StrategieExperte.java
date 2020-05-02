package allumettes;

import java.util.Random;

/**
 * Une stratègie qui essaye de gagner à tous les coups
 *
 * @author Hamza MOUDDENE
 * @version 1.0
 */
public class StrategieExperte implements Strategie {

    @Override
    public String getNom() {
        return "Experte";
    }

    @Override
    public int getPrise(Jeu jeu) {
        Random r = new Random();

        if ((jeu.getNombreAllumettes() - 1) % (Jeu.PRISE_MAX + 1) == 0) {
            return r.nextInt(Jeu.PRISE_MAX) + 1;
        } else {
            return (jeu.getNombreAllumettes() - 1) % (Jeu.PRISE_MAX + 1);
        }
    }

}
