import java.util.concurrent.locks.*;

/**
 * Implement a strategy without priority.
 * @author Hamza Mouddene
 */
public class LectRedEquity implements LectRed {
    
    /** Attributs of LectRedEquity. */	
    private ReentrantLock monitor;

    /** 
     * Constructor of LectRedEquity. 
     * Initialize the monitor.
     * */
    public LectRedEquity () {
        this.monitor = new ReentrantLock ();
    }
    
    /**
     * Ask for read.
     * @throws InteruptedException
     */
    public void demanderLecture () throws InterruptedException {

    }
    
    /**
     * Finish reading.
     * @throws InteruptedException
     */
    public void terminerLecture () throws InterruptedException {

    }
    
    /**
     * Ask for write.
     * @throws InteruptedException
     */
    public void demanderEcriture () throws InterruptedException {

    }
    
    /**
     * Finish writing.
     * @throws InterruptedException
     */
    public void terminerEcriture () throws InterruptedException {

    }
    
    /**
     * Display strategy's name.
     * @return strategy's name
     */
    public String nomStrategie () {
        return "Stratégie équitable";
    }

}
