import java.util.concurrent.locks.*;

/**
 * Implement a fairness readers/writers.
 * @author Hamza Mouddene
 */
public class LectRed_Equite implements LectRed {

    /** Attributs of LectRed_Equite. */
    private ReentrantLock lock;
    private Condition readPass;
    private Condition writePass;
    private int writers;
    private int readers;
    
    /** 
     * Constructor of LectRed_Equite. 
     * Initialize the lock, read and write condition.
     */
    public LectRed_Equite () {
    	this.lock = new ReentrantLock (true);
    	this.readPass = this.lock.newCondition ();
    	this.writePass = this.lock.newCondition ();
    	this.writers = 0;
    	this.readers = 0;
    }

    /**
     * Ask for read.
     * @throws InteruptedException
     */
    public void demanderLecture () throws InterruptedException {
        this.lock.lock ();
        if(this.lock.getWaitQueueLength (this.writePass) > 0 
        || this.lock.getWaitQueueLength (this.readPass) > 0 
        || this.writers > 0) {
            this.readPass.await ();
        }
        this.readers ++;
        this.readPass.signal ();
    	this.lock.unlock ();
    }

    /**
     * Finish reading.
     * @throws InteruptedException
     */
    public void terminerLecture  () throws InterruptedException {
        this.lock.lock ();
        this.readers --;
        if(this.readers == 0) {
            if(this.lock.getWaitQueueLength (this.writePass) > 0) {
                this.writePass.signal ();
            } else {
                this.readPass.signal ();
            }
        }
        this.lock.unlock ();
    }

    /**
     * Ask for write.
     * @throws InteruptedException
     */
    public void demanderEcriture () throws InterruptedException {
    	this.lock.lock ();
    	if(this.readers > 0 || this.writers > 0) {
    	    this.readPass.await ();
    	    if(this.readers > 0) {
    	        this.writePass.await ();
    	    }
    	}
    	this.writers ++;
    	this.lock.unlock ();
    }

    /**
     * Finish writing.
     * @throws InterruptedException
     */
    public void terminerEcriture () throws InterruptedException {
        this.lock.lock ();
    	this.writers --;
        this.readPass.signal ();
        this.lock.unlock ();
    }
    
    /**
     * Display strategy's name.
     * @return strategy's name
     */
    public String nomStrategie () {
        return "Stratégie: Équité.";
    }

}
