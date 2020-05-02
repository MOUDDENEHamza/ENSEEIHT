package allumettes;

import java.util.Scanner;


/**
 * Une stratègie qui modélise un joueur humain
 *
 * @author Hamza MOUDDENE
 * @version 1.0
 */

public class StrategieHumaine implements Strategie {

    // le scanner pour lire le nombre d'allumettes
    private Scanner scan;

    /**
     * Constructeur de la classe StrategieHumaine
     */
    public StrategieHumaine() {
        this.scan = new Scanner(System.in);
    }

    @Override
    public String getNom() {
        return "Humaine";
    }

    @Override
    public int getPrise(Jeu jeu) {
        assert (jeu != null);
        int n = 0;
        try {
            System.out.print("Combien prenez-vous d'allumettes ? ");
            n = Integer.parseInt(this.scan.nextLine());
        } catch (NumberFormatException e) {
            System.out.println("Vous devez donner un entier.");
            return getPrise(jeu);
        }
        return n;
    }
}
