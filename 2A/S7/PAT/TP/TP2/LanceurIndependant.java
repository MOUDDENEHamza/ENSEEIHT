package TP2;

import java.lang.reflect.*;
import java.util.*;

/**
 * L'objectif est de faire un lanceur simple sans utiliser toutes les clases
 * de notre architecture JUnit.   Il permet juste de valider la compréhension
 * de l'introspection en Java.
 */
public class LanceurIndependant {
    private int nbTestsLances;
    private int nbErreurs;
    private int nbEchecs;
    private List<Throwable> erreurs = new ArrayList<>();

    public LanceurIndependant(String... nomsClasses) {
        System.out.println("test 1");

        // Lancer les tests pour chaque classe
        for (String nom : nomsClasses) {
            try {
                System.out.print(nom + " : ");
                this.testerUneClasse(nom);
                System.out.println();
            } catch (ClassNotFoundException e) {
                System.out.println(" Classe inconnue !");
            } catch (Exception e) {
                System.out.println(" Problème : " + e);
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
        System.out.printf("%d tests lancés dont %d échecs et %d erreurs.\n",
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


    private void testerUneClasse(String nomClasse) throws ClassNotFoundException, InstantiationException,
			IllegalAccessException, NoSuchMethodException, InvocationTargetException {
        // Récupérer la classe
		Class c = Class.forName(nomClasse);

        // Récupérer les méthodes "preparer" et "nettoyer"
        Method preparer = c.getMethod("preparer");
        Method nettoyer = c.getMethod("netoyer");

        // Instancier l'objet qui sera le récepteur des tests
        Object objet = c.getDeclaredConstructor().newInstance();


		// Exécuter les méthods de test
		for(int i = 0; i < c.getMethods().length; i++) {
			System.out.println(c.getMethods()[i]);
		}
    }

    public static void main(String[] args) {
        LanceurIndependant lanceur = new LanceurIndependant(args);
    }

}
