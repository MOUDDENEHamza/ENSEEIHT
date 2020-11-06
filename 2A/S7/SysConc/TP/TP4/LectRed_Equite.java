import java.util.concurrent.locks.*;
import java.util.Queue;
import java.util.LinkedList;
import Synchro.Assert;

/**
 * Implement a strategy without priority.
 * @author Hamza Mouddene
 */
public class LectRed_Equite implements LectRed {
    
    /** Attributs of LectRed_Equite. */
    private Queue<Integer> q;       // The queue containing the paused process.
    private Lock monitor;           // The monitor we will use.
    private Condition read;         // Read condition.
    private Condition write;        // Write condition.
    private boolean writing;        // True, if the current process is writing, otherwise false.
    private int redactorWaiting;    // The redactor waiting due to write.await.
    private int reader;             // Number of reader.

    /** 
     * Constructor of LectRed_Equite. 
     * Initialize the monitor, read and write condition.
     * */
    public LectRed_Equite () {
        this.q = new LinkedList<> (); 
        this.monitor = new ReentrantLock ();
        this.read = this.monitor.newCondition ();
        this.write = this.monitor.newCondition ();
        this.writing = false;
        this.reader = 0;
    }
    
    public void signal () {
        if (this.q.size () > 0 ) {
            if (this.q.peek () == 0) {
                this.q.remove ();
                this.read.signal ();
            } else {
                this.q.remove ();
                this.write.signal ();
            }
        }
        System.out.println ("signal = " + this.q);
    }

    /**
     * Ask for read.
     * @throws InteruptedException
     */
    public void demanderLecture () throws InterruptedException {
        this.monitor.lock ();
        while (this.writing) {
            this.q.add (0);
            System.out.println ("await = " + this.q);
            this.read.await (); 
        }
        this.reader ++;
        this.monitor.unlock ();
    }
    
    /**
     * Finish reading.
     * @throws InteruptedException
     */
    public void terminerLecture () throws InterruptedException {
        this.monitor.lock ();
        this.reader --; 
        this.signal ();
        this.monitor.unlock ();
    }
    
    /**
     * Ask for write.
     * @throws InteruptedException
     */
    public void demanderEcriture () throws InterruptedException {
        this.monitor.lock ();
        while (this.writing || this.reader > 0) {    
            this.q.add (1);
            System.out.println ("await = " + this.q);
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
        this.signal ();
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
