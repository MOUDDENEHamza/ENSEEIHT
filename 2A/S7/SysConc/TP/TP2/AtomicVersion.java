import java.util.concurrent.atomic.AtomicBoolean;
import java.time.*;

public class AtomicVersion {

	static Thread[] activities;
	static int nb = 50;
	public static AtomicBoolean occupied = new AtomicBoolean(false);

	public static void main(String[] args) {
		Instant start = Instant.now();
		activities = new Thread[nb];
		for (int i=0; i<nb; i++) {
			activities[i] = new Thread(new Process(occupied), "t"+i);
		}
		for (int i=0; i<nb; i++) {
			activities[i].start();
		}
		Instant finish = Instant.now();
    	System.out.println("Elapsed time = " + Duration.between(start, finish).toMillis() + " ms.");
	}
}
	
class Process implements Runnable {
	
	    AtomicBoolean occ;
	    
	    public Process(AtomicBoolean occ) {
	    	this.occ = occ;
	    }

	    public void run() {
	    	entrer();
	    	System.out.println("This is thread : "+Thread.currentThread().getName());
	    	System.out.println("This is thread : "+Thread.currentThread().getName());
	    	sortir();
	    }

		public void entrer() {
			while (occ.compareAndSet(false, true) == false) {
				;//System.out.println("......");
			}

		}
		
		public void sortir() {
			this.occ.set(false);
		}
}
