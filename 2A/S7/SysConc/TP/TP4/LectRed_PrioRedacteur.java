import java.util.concurrent.locks.*;

/**
 * Implement a strategy that gives the priority to redactor.
 * @author Hamza Mouddene
 */
public class LectRed_PrioRedacteur implements LectRed {
    
    /** Attributs of LectRed_PrioRedacteur. */	
    private ReentrantLock monitor;  // The monitor we will use.
    private Condition read;         // Read condition.
    private Condition write;        // Write condition.
    private boolean writing;        // True, if the current process is writing, otherwise false.
    private int reader;             // Number of reader.
    
    /** 
     * Constructor of LectRed_PrioRedacteur. 
     * Initialize the monitor, read and write condition.
     * */
    public LectRed_PrioRedacteur () {
        this.monitor = new ReentrantLock ();
        this.read = this.monitor.newCondition ();
        this.write = this.monitor.newCondition ();
        this.writing = false;
        this.reader = 0;
    }
    
    /**
     * Ask for read.
     * @throws InteruptedException
     */
    public void demanderLecture () throws InterruptedException {
        this.monitor.lock ();
        while (this.monitor.getWaitQueueLength(this.write) > 0 || this.writing) {
            this.read.await (); 
        }
        this.reader ++;
        this.read.signal ();
        this.monitor.unlock ();
    }
    
    /**
     * Finish reading.
     * @throws InteruptedException
     */
    public void terminerLecture () throws InterruptedException {
        this.monitor.lock ();
        this.reader --; 
        if (this.reader == 0) {
            this.write.signal ();
        }
        this.monitor.unlock ();
    }
    
    /**
     * Ask for write.
     * @throws InteruptedException
     */
    public void demanderEcriture () throws InterruptedException {
        this.monitor.lock ();
        while (this.writing || this.reader > 0) {    
            this.write.await ();
        }
        this.writing = true;
        this.monitor.unlock ();
    }
    
    /**
     * Finish writing.
     * @throws InterruptedException
     */
    public void terminerEcriture () throws InterruptedException {
        this.monitor.lock ();
        this.writing = false;
        this.write.signal ();
        if (!this.writing) {
            this.read.signal ();
        }
        this.monitor.unlock ();
    }
    
    /**
     * Display strategy's name.
     * @return strategy's name
     */
    public String nomStrategie () {
        return "Stratégie: Priorité Rédacteurs.";
    }

}
