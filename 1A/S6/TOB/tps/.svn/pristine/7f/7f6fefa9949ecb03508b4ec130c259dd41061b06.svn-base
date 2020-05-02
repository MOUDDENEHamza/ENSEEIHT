package allumettes;

/**
 * La classe StrategieTricheur définit un joueur qui triche.
 *
 * @author Hamza MOUDDENE
 * @version 1.0
 */
public class StrategieTricheur implements Strategie {

    @Override
    public String getNom() {
        return "Tricheur";
    }

    @Override
    public int getPrise(Jeu jeu) throws CoupInvalideException {
        int i;
        int n = jeu.getNombreAllumettes() - 2;
        try {
            for (i = 0; i < n; i++) {
                jeu.retirer(1);
            }
        } catch (CoupInvalideException e) {
            System.out.println(e.getMessage());
        }
        return 1;
    }

}
