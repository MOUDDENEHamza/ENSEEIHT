package tm;

import java.lang.reflect.InvocationTargetException;

import java.io.IOException;
import java.io.FileNotFoundException;
import java.io.File;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.NoSuchElementException;

import java.util.Collections;
import java.util.Set;
import java.util.HashSet;
import java.util.Map;
import java.util.HashMap;
import java.util.List;
import java.util.LinkedList;
import java.util.Arrays;
import java.util.ArrayList;

import java.util.Random;

import java.util.Scanner;

// Classe collectant les données associées à l'exécution d'une transaction.
public class TransactionObject {

    // Temps consommé, mais perdu (transaction annulée).
    public Integer useless;
    // Date de blocage (éventuelle).
    public Integer whenBlocked;
    // Temps d'attente.
    public Integer blocked;
    // Temps utile.
    public Integer useful;

    // Séquence d'instructions de la transaction.
    public Map<Integer,String[]> init;

    // Etat d'exécution courant.
    public TransactionState state;
    // Queue contenant les instructions à exécuter.
    public BlockingQueue<String[]> instructions;
    // Queue contenant le résultat des opérations.
    public BlockingQueue<String> responses;

    public TransactionObject(Map<Integer,String[]> init,
                             BlockingQueue<String[]> instructions,
                             BlockingQueue<String> responses) {
        this.useless = 0;
        this.whenBlocked = 0;
        this.blocked = 0;
        this.useful = 0;
        this.init = new HashMap<Integer,String[]>(init);
        this.state = TransactionState.RUNNING;
        this.instructions = instructions;
        this.responses = responses;
    }

}
