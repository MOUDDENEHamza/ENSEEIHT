import java.util.concurrent.locks.*;
import java.util.Queue;
import java.util.LinkedList;
import Synchro.Assert;

/**
 * Implement a fairness readers/writers.
 * @author Hamza Mouddene
 */
public class LectRed_Equite implements LectRed {
    
    /** Attributs of LectRed_Equite. */
    private Lock monitor;           // The monitor we will use.
    private Condition read;         // Read condition.
    private Condition write;        // Write condition.
    private boolean reading;        // True, if the current process is reading, otherwise false.
    private boolean writing;        // True, if the current process is writing, otherwise false.
    private int redactorWaiting;    // The redactor waiting due to write.await.
    private int reader;             // Number of reader.

    /** 
     * Constructor of LectRed_Equite. 
     * Initialize the monitor, read and write condition.
     * */
    public LectRed_Equite () {
        this.monitor = new ReentrantLock ();
        this.readPass = this.monitor.newCondition ();
        this.write = this.monitor.newCondition ();
    }

    /**
     * Ask for read.
     * @throws InteruptedException
     */
    public void demanderLecture () throws InterruptedException {
        this.monitor.lock ();
        while (this.reading || this.writing) {
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
        if (this.reading || this.reader > 0) {    
            this.redactorWaiting ++;
            this.read.await ();
            this.redactorWaiting --;
        }
        while (this.reader > 0) {
            this.writing = true;
            this.write.signal ();
            this.writing = false;
        }
        this.reading = true;
        this.monitor.unlock ();
    }
    
    /**
     * Finish writing.
     * @throws InterruptedException
     */
    public void terminerEcriture () throws InterruptedException {
        this.monitor.lock ();
        this.reading = false;
        if (this.writing) {
            this.write.signal ();
        } else {
            this.read.signal ();
        }
        this.monitor.unlock ();
    }
    
    /**
     * Display strategy's name.
     * @return strategy's name
     */
    public String nomStrategie () {
        return "Stratégie: Équité.";
    }

}
