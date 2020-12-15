package tm;

import java.util.Set;
import java.util.HashSet;

// Verrou bloquant avec deux modes : 
// partagé pour des lectures en parallèle et exclusif pour une écriture seule.
public class SharedLock {

    private boolean exclusive;
    private Set<String> holders;

    public SharedLock() {
        this.exclusive = false;
        this.holders = new HashSet<String>();
    }

    // Demande (en exclusion mutuelle) le verrou en mode partagé.
    public synchronized void shared(String asker) {
        try {
            while (exclusive) {this.wait();}
            this.holders.add(asker);
        } catch (InterruptedException e) {
            System.out.println("Interruption de l'attente sur un verrou bloquant.");
        }
    }

     // Demande (en exclusion mutuelle) le verrou en mode exclusif.
    public synchronized void exclusive(String asker) {
        try {
            while (this.exclusive ||
                   (!this.holders.isEmpty() &&
                   !(this.holders.size() == 1 && this.holders.contains(asker))))
            {
                this.wait();
            }
            this.holders.add(asker);
            this.exclusive = true;
        } catch (InterruptedException e) {
            System.out.println("Interruption de l'attente sur un verrou bloquant.");
        }
    }

    // Relache (en exclusion mutuelle) le verrou.
    public synchronized void release(String holder) {
        if (this.holders.contains(holder)) {
            this.holders.remove(holder);
            this.exclusive = false;
            this.notify();
        }
    }

}
