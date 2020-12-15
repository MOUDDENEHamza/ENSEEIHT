package tm;

import java.util.concurrent.BlockingQueue;
import java.util.Random;

// Classe abstraite pour les transactions, qui sépare le code
// entre la transaction elle-même et sa procédure d'annulation.
public abstract class AbstractTransaction implements Runnable {

    public String name;

    public BlockingQueue<String[]> instructions;
    public BlockingQueue<String> response;

    protected AbstractTM tm;
    protected boolean committed;

    protected Random rand;

    public AbstractTransaction(String name,
                               AbstractTM tm,
                               BlockingQueue<String[]> instructions,
                               BlockingQueue<String> response,
                               Random rand) {
        this.name = name;
        this.tm = tm;
        this.instructions = instructions;
        this.response = response;
        this.committed = false;
        this.rand = rand;
    }



    public String getName() {
        return this.name;
    }

    // Activité de la transaction : lectures et écritures en mémoire transactionnelle.
    abstract public void transaction() throws AbortException, InterruptedException;

    // Annule proprement
    abstract public void aborted();

    // Intercepte AbortedException et appelle aborted.
    public void run() {
        try {
            this.transaction();
        } catch (AbortException e) {
            this.aborted();
        } catch (InterruptedException e) {
            System.out.println("C'est dommage!");
        }
    }
}
