package TP4;

import java.lang.reflect.*;
import java.util.*;

/** L'objectif est de faire un lanceur simple sans utiliser toutes les clases
 * de notre architecture JUnit.   Il permet juste de valider la comprÃ©hension
 * de l'introspection en Java.
 */
public class LanceurIndependant {
    private int nbTestsLances;
    private int nbErreurs;
    private int nbEchecs;
    private List<Throwable> erreurs = new ArrayList<>();

    public LanceurIndependant(String... nomsClasses) {
        System.out.println();

        // Lancer les tests pour chaque classe
        for (String nom : nomsClasses) {
            try {
                System.out.print(nom + " : ");
                this.testerUneClasse(nom);
                System.out.println();
            } catch (ClassNotFoundException e) {
                System.out.println(" Classe inconnue !");
            } catch (Exception e) {
                System.out.println(" ProblÃ¨me : " + e);
                e.printStackTrace();
            }
        }

        // Afficher les erreurs
        for (Throwable e : erreurs) {
            System.out.println();
            e.printStackTrace();
        }

        // Afficher un bilan
        System.out.println();
        System.out.printf("%d tests lancÃ©s dont %d Ã©checs et %d erreurs.\n",
                nbTestsLances, nbEchecs, nbErreurs);
    }


    public int getNbTests() {
        return this.nbTestsLances;
    }


    public int getNbErreurs() {
        return this.nbErreurs;
    }


    public int getNbEchecs() {
        return this.nbEchecs;
    }


    private void testerUneClasse(String nomClasse)
            throws ClassNotFoundException, InstantiationException,
            IllegalAccessException
    {
        // RÃ©cupÃ©rer la classe

        // RÃ©cupÃ©rer les mÃ©thodes "preparer" et "nettoyer"
        Method preparer = null;
        Method nettoyer = null;

        // Instancier l'objet qui sera le rÃ©cepteur des tests
        Object objet = null;

        // ExÃ©cuter les mÃ©thods de test
    }

    public static void main(String... args) {
        LanceurIndependant lanceur = new LanceurIndependant(args);
    }

}
