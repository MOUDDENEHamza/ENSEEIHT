package ordo;

import java.util.concurrent.Semaphore;

/**
 * Reminder called when the execution of map is done
 *
 * @author Hamza Mouddene
 * @version 1.0
 */
public class CallBack {

    /**
     * Attributes of Callback class
     */
    private final Semaphore semaphore;        // The semaphore we will use
    private int counter;                      // A counter where we will the number of tasks done
    private final int nbChunks;               // Total number of fragments

    /**
     * Constructor of Callback class
     *
     * @param nbChunks the total number of fragments
     */
    public CallBack(int nbChunks) {
        this.semaphore = new Semaphore(0);
        this.counter = 0;
        this.nbChunks = nbChunks;
    }

    /**
     * When the task is done, we increment the counter then if the counter is equal to the number of available fragments
     * it prevents that the process has finished
     */
    public void taskDone() {
        this.counter++;
        if (this.counter == this.nbChunks) {
            this.semaphore.release();
        }
    }
}
