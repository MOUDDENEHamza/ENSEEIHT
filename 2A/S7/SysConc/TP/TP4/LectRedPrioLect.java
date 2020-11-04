import java.util.concurrent.locks.*;

/**
 * Implement a strategy that gives the priority to reader.
 * @author Hamza Mouddene
 */
public class LectRedPrioLect implements LectRed {
    
    /** Attributs of LectRedPrioLect. */	
    private Lock monitor;

    /** 
     * Constructor of LectRedPrioLect. 
     * Initialize the monitor.
     * */
    public LectRedPrioLect () {
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
        return "Stratégie priorité aux lecteurs";
    }

}
