package simulation;

import java.lang.reflect.InvocationTargetException;

import java.util.NoSuchElementException;
import java.io.IOException;
import java.io.FileNotFoundException;

import java.util.Map;
import java.util.HashMap;
import java.util.List;
import java.util.Arrays;
import java.util.ArrayList;

import tm.*;

// Classe abstraite : objets et méthodes d'une simulation
public abstract class AbstractSimulation {

    // Mémoire transactionnelle
    protected AbstractTM tm;

    // Map associant un identifiant aux données conservées pour chaque transaction
    protected Map<String, TransactionObject> transactions;

    // Fonction principale : lance la simulation
    public abstract void run()
    throws InterruptedException, IOException,
           ClassCastException,
           NumberFormatException, NoSuchMethodException,
           InvocationTargetException, NoSuchElementException;

    // Fonction utilitaire qui enlève les éléments vides d'un tableau de String
    // (pour l'analyse syntaxique des lignes de commande).
    public static String[] clean(String[] dirty) {
        List<String> clean =
            new ArrayList<String>(Arrays.asList(dirty));
        clean.removeAll(Arrays.asList(""));
        return clean.toArray(new String[clean.size()]);
    }
}
