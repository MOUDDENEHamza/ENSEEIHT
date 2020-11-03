import java.time.*;

public class SynchronizedVersion2 {

	static Thread[] activities;
	static int nb = 2;
	
	public static void main(String[] args) {
		Instant start = Instant.now();
		activities = new Thread[nb];
		for (int i = 0; i < nb; i++) {
			activities[i] = new Thread(new Processus(), "t"+ i);
		}
		for (int i = 0; i < nb; i++) {
			activities[i].start();
		}
		Instant finish = Instant.now();
    	System.out.println("Elapsed time = " + Duration.between(start, finish).toMillis() + " ms.");
	}
}
	
class Processus implements Runnable {
	
	static Object mutex = new Object();

	public void run() {
		synchronized(mutex) {
			System.out.println("This is thread : "+ Thread.currentThread().getName());
			System.out.println("This is thread : "+ Thread.currentThread().getName());
		}
	}
}
