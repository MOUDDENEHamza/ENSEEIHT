// Time-stamp: <02 mai 2013 10:16 queinnec@enseeiht.fr>

package Synchro;

import java.util.Random;
import java.util.Set;
import java.util.HashSet;
import java.util.Iterator;

/** Simulateur temporel, avec possibilité de suspendre l'écoulement du temps,
 * de varier la vitesse du temps, et d'interrompre un sommeil.
 *
 * @author Philippe Quéinnec
 */
public class Simulateur implements Runnable {

    // Utilisée pour bloquer un processus
    private class Proc {
        public ProcId id;
        public int duree_sommeil = -1;
        public boolean do_wakeup = false;
        public boolean must_die = false;
        public Proc (ProcId _id) {
            id = _id;
        }
    };

    /** Le groupe de thread où se trouve le simulateur. */
    private ThreadGroup thg;

    /** L'ensemble des processus actuellement bloqués. */
    private Set<Proc> procs;

    static private Random random = new Random();
        
    // one system tick = 5ms
    // one simulated tick = (1000/timespeed) system tick
    // sleep(n) = Dormir n simulated ticks.

    private int timespeed= 1;
    private int system_ticks = 1;

    // Le temps s'écoule-t-il ou pas ?
    private boolean running = true;

    // private en fait
    public void run ()
    {
        while (true) {
            try {
                Thread.sleep (1);
            } catch (InterruptedException e) { }
            synchronized (this) {
                if (running) {
                    if (system_ticks == 0) {
                        //System.err.println (".");
                        /* Décrémenter et réveiller les processus concernés, */
                        Iterator<Proc> it = procs.iterator();
                        while (it.hasNext()) {
                            Proc p = it.next();
                            synchronized (p) {
                                if (p.duree_sommeil == 0) {
                                    //System.out.println ("wakeup1 "+p.id);
                                    it.remove();
                                    p.do_wakeup = true;
                                    p.notify();
                                }
                                //System.out.println (i+"->"+procs[i].duree_sommeil);
                                p.duree_sommeil--;
                            }
                        }
                        system_ticks = 1000 / timespeed;
                    } else {
                        system_ticks--;
                    }
                } else { // not running
                    try {
                        this.wait();
                    } catch (InterruptedException e) { // nop
                    }
                }
            } // sync
        } // while
    } // run

    /** Initialise le simulateur de temps. */
    public Simulateur (ThreadGroup thg)
    {
        this.procs = new HashSet<Proc>();
        this.thg = thg;
    }

    /** Active le simulateur. */
    public void start ()
    {
        (new Thread (this.thg, this, "Simulateur")).start();
    }

    /** Renvoie le groupe de thread dans lequel se trouve le simulateur. */
    public ThreadGroup getThreadGroup()
    {
        return thg;
    }

    /** Suspend l'exécution du processus appelant, qui s'identifie par
     * <code>noproc</code>, pour la durée spécifiée. */
    public void sleep (int duree)
    {
        Proc p = new Proc (ProcId.getSelf());
        synchronized (this) {
            procs.add (p);
            p.duree_sommeil = duree;
            p.do_wakeup = false;
        }
        synchronized (p) {
            while (! p.do_wakeup) {
                try {
                    p.wait();
                } catch (InterruptedException e) {}
            }
        }
        if (p.must_die)
          throw new Suicide();
    }

    /** Suspend l'exécution du processus appelant pour une durée aléatoire
     * comprise entre <code>bi</code> et <code>bs</code>. */
    public void sleep (int bi, int bs)
    {
        if (bi <= bs)
          sleep (random.nextInt(bs - bi + 1) + bi);
    }


    /** Interrompt le sommeil du processus <code>noproc</code>. Sans effet si
     * le processus ne dort pas. */
    private void wakeupAndDie (ProcId id, boolean mustDie)
    {
        synchronized (this) {
            Iterator<Proc> it = procs.iterator();
            while (it.hasNext()) {
                Proc p = it.next();
                synchronized (p) {
                    if (p.id.equals (id)) {
                        //System.out.println ("wakeup2 "+p.id);
                        it.remove();
                        p.do_wakeup = true;
                        p.must_die = mustDie;
                        p.notify();
                    }
                }
            }
        }
    }

    /** Interrompt le sommeil du processus <code>noproc</code>. Sans effet si
     * le processus ne dort pas. */
    public void wakeup (ProcId id)
    {
        wakeupAndDie (id, false);
    }
    public void wakeupAndDie (ProcId id)
    {
        wakeupAndDie (id, true);
    }
    
    /** Renvoie la situation courante d'écoulement du temps. */
    public boolean getRunning ()
    {
        synchronized (this) {
            return running;
        }
    }

    /** Décide de l'écoulement du temps. */
    public void setRunning (boolean _running)
    {
        synchronized (this) {
            running = _running;
            if (running)
              this.notify();
        }
    }

    /** Inverse la situation courante d'écoulement du temps. */
    public void swapRunning ()
    {
        synchronized (this) {
            running = !running;
            if (running)
              this.notify();
        }
    }

    /** Positionne la vitesse d'écoulement du temps. */
    public void setTimespeed (int _timespeed)
    {
        synchronized (this) {
            timespeed = _timespeed;
            system_ticks = 1000 / timespeed;
            //System.out.println("Timespeed: "+timespeed);
        }
    }

    /** Obtention de la vitesse d'écoulement du temps. */
    public int getTimespeed ()
    {
        synchronized (this) {
            return timespeed;
        }
    }

    private boolean previous_running;

    /** Suspend l'écoulement du temps en sauvegardant la situation courante.
     * Plusieurs appels successifs à <code>suspendTime</code> sans
       alternance de <code>resumeTime</code> produisent un
       comportement non spécifié. */
    public void suspendTime ()
    {
        synchronized (this) {
            previous_running = running;
            running = false;
        }
    }

    /** Restaure la situation de l'écoulement du temps avant le précédent
     * <code>suspendTime</code>. */
    public void resumeTime ()
    {
        synchronized (this) {
            running = previous_running;
            if (running)
              this.notify();
        }
    }

}
