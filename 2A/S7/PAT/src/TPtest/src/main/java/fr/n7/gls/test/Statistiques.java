/**
 * Statistiques, classe utilitaire.
 *
 * @author Xavier Crégut &lt;Prenom.Nom@enseeiht.fr&gt;
 */

package fr.n7.gls.test;

import java.util.*;

public class Statistiques {

    /** La classe Resultat permet de regrouper les résultats de la méthode
     * statistiques dans un seul objet.
     */
    static public class Resultat<T extends Comparable<T>> {
        final public T min, max;
        final public int nbMin, nbMax;

        /** Constructeur naturel.
         * @param min le plus petit élément
         * @param max le plus grand élément
         * @param nbMin le nombre d'occurrence de min
         * @param nbMax le nombre d'occurrence de max
         */
        public Resultat(T min, T max, int nbMin, int nbMax) {
			/*
			// Ces assert sont commentés car ils se traduisent dans le code
			// intermédiaire par des conditionnelles (une pour savoir si les
			// assertions sont activitées et un pour savoir si la condition
			// est vraie) ce qui conduit à une non couverture en décisions.
			assert (min == null) == (max == null);
			assert min == null || min.compareTo(max) <= 0;
			assert nbMax >= 0;
			assert nbMax >= 0;
			assert (nbMin == 0) == (min == null);
			assert (nbMax == 0) == (max == null);
			*/

            this.min = min;
            this.max = max;
            this.nbMin = nbMin;
            this.nbMax = nbMax;
        }
    }

    /** Calculer quelques statistiques sur une suite de données.
     *
     * <p>
     * Les statistiques calculées sont :
     * la plus petite valeur (min), la plus grande valeur (max),
     * le nombre de min, le nombre de max.  Ces données sont
     * regroupées dans un objet de type Resultat.
     *
     * <p>
     * Si la valeur <code>null</code> apparaît dans les données, l'exception
     * <code>IllegalArgumentException</code> est levée.
     *
     * <p>
     * S'il n'y a aucune données, le min et le max sont null et
     * leur nombre d'occurrences est 0.
     *
     * @param iterable les données à analyser
     * @param <D> le type des données
     * @return les statistiques
     * @throws IllegalArgumentException si null apparaît dans les données
     */
    public <D extends Comparable<D>>
    Resultat<D> statistiques(Iterable<? extends D> iterable) {
        D min = null;
        D max = null;
        int nbMin = 0;
        int nbMax = 0;
        for (D x : iterable) {
            if (min == null) {
                min = max = x;
                nbMax = nbMax = 1;
            } else if (x.compareTo(min) < 0) {
                min = x;
                nbMin = 1;
            } else if (x.compareTo(max) > 0) {
                max = x;
                nbMax = 1;
            } else if (x.compareTo(min) == 0) {
                nbMin++;
            } else if (x.compareTo(max) == 0) {
                nbMax++;
            }
        }
        return new Resultat<D>(min, max, nbMax, nbMax);
    }

}
