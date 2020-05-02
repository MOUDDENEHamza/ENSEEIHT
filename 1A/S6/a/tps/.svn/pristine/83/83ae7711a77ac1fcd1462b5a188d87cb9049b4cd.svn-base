package allumettes;

import java.util.Random;

/**
 * La classe StrategieHumaine définit un joueur qui prend aleatoirement sa prise.
 *
 * @author Hamza MOUDDENE
 * @version 1.0
 */
public class StrategieNaive implements Strategie {

    @Override
    public String getNom() {
        return "Naive";
    }

    @Override
    public int getPrise(Jeu jeu) {
        Random r = new Random();
        if (jeu.getNombreAllumettes() > Jeu.PRISE_MAX) {
            return r.nextInt(Jeu.PRISE_MAX) + 1;
        } else {
            return r.nextInt(jeu.getNombreAllumettes()) + 1;
        }
    }

}
