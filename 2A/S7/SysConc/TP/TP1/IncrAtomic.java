// V0.1.1 - PM 22/09/20
import java.util.concurrent.atomic.AtomicLong;


public class IncrAtomic  {

    static  AtomicLong cpt = new AtomicLong(0);
    static final long NB_IT = 1000L;			 //Nb d'itérations de la boucle externe
    static final long NB_IT_INTERNES = 1000000L; //Nb d'itérations de la boucle interne
    static long Attente_ms = 10L;
    static final int Attente_nano = 0;
    static Thread[] activités;          // Tableau des processus
    static Object mutex = new Object(); // pour les blocs synchronized

    static void lancer(int nbA, Incrémenteur r) {
        // Initialisation du/des compteur(s) incrémentés
        cpt = new AtomicLong(0);
        /* Création et lancement des threads.
         * Chaque thread exécute le même code, qui est la méthode run() d'une classe
         * implantant un Incrémenteur (autrement dit un schéma de réalisation particulier
         * de la boucle dincrémentation)
         */

        for (int i = 0; i < nbA ; i++) {
            try {
                               
                 IncrAtomic.activités[i] = new Thread(r,"t"+i);
                 
                  
            }
            catch (Exception e)
            {
                System.out.println(e);
            }
            
            IncrAtomic.activités[i].start();
            
        }
    }

    public long get() {
             return cpt.get();
     }

    public long incrementer (long a ){
            long courante = cpt.get();
            if (! cpt.compareAndSet(courante , courante +a)){
                    courante = cpt.get();
            }
            return cpt.incrementAndGet();
    }
    static void finir() {
        // Attente de la terminaison des différents threads lancés
        for (int i = 0; i < IncrAtomic.activités.length ; i++) {
            try {
                IncrAtomic.activités[i].join();
            }
            catch (InterruptedException e)
            {
                System.out.println(e);
            }
        }
    }

    public static void main(String[] args) {
        int nbActivités = 3;
        int nbMesures = 10;
        int i = 0;
        long départ, fin;
        boolean mutex = true;

        // Chargement des paramètres saisis en ligne de commande
        if (args.length == 3) {
            try {
                nbActivités = Integer.parseInt (args[0]);
                Attente_ms = Integer.parseInt (args[1]);
                nbMesures = Integer.parseInt (args[2]);
            }
            catch (NumberFormatException nfx) {
                Attente_ms = 0;
            }
            if ((nbActivités < 1) || (Attente_ms < 1) || (nbMesures < 1)) {
                System.out.println("Usage : IncrDemoSeq <Nb activités> <durée pause (ms)> <nbMesures>,"
                                   +"avec Nb activités, durée pause, nbMesures >= 1");
                System.exit (1);
            }
        } else {
            System.out.println("Nb d'arguments ≠ 3. Exécution avec 10 mesures, 3 activités et 10 ms de pause");
        }

        activités = new Thread[nbActivités];

        for (int it=1; it<=nbMesures; it++) { // 
        // Mesure itérée, pour éviter des écarts trop importants sur les premières mesures
        // (du fait de possibles optimisations (processeur, cache, compilateur).
        // Idée = retenir une moyenne des dernières mesures.
            // Boucle séquentielle : NB_IT x NB_IT_INTERNES x nbActivités itérations
 		        départ = System.nanoTime();
            for (long li = 0; li < nbActivités*IncrAtomic.NB_IT; li++) {
                for (long j = 1; j<=IncrAtomic.NB_IT_INTERNES; j++) {
                    
                       IncrAtomic.cpt.getAndIncrement();
                    // j/j pour tenter de déjouer les optimisations du compilateur
                }
                try {
                    Thread.sleep(IncrAtomic.Attente_ms, IncrAtomic.Attente_nano);
                    // sleep pour modéliser un temps de calcul sans conflit d'accès et...
                    // pour tenter de déjouer les optimisations du cache
                }
                catch (InterruptedException ie)
                {
                    System.out.println("InterruptedException : " + ie);
                }
            }
            fin = System.nanoTime();
            System.out.println("Durée exécution mono : " + (fin-départ)/1000000L);
            System.out.println();

            départ = System.nanoTime();
            // Lancement de nbActivités processus effectuant
            // chacun NB_IT x NB_IT_INTERNES itérations
            lancer(nbActivités, new IncrémenteurAtomicc());
            finir();
            fin = System.nanoTime();
            System.out.println("Durée exécution non synchronisée (ms): " + (fin-départ)/1000000L);
            System.out.println();
        }
        // Compléter ici, en définissant et mesurant différents Incrémenteur
        // de manière analogue à ce qui est fait pour IncrémenteurNonSync
    }
}

class IncrémenteurAtomicc implements Incrémenteur {
    /* Exemple d'incrémenteur :
     -la méthode incr effectue les incrémentations sans gérer les conflis d'accès au compteur
     - la méthode run() appelle incr()
     */
    public void incr() {
        for (long i = 0L; i < IncrAtomic.NB_IT; i++) {
            
            // boucle imbriquée pour permettre (éventuellement) de tester différents
            // grains de synchronisation
            for (long j = 1; j<=IncrAtomic.NB_IT_INTERNES; j++) {
                
                 IncrAtomic.cpt.getAndIncrement();
            }
            try {
                Thread.sleep(IncrAtomic.Attente_ms, IncrAtomic.Attente_nano);
            }
            // Attente depour éviter l'utilisation du cache et modéliser
            // une partie du calcul sans conflit.
            // Vous pouvez  (éventuellement) commenter l'attente
            // pour voir l'effet (intéressant) du mécanisme de cache,
            // ou encore modifier  la valeur de l'attente pour voir
            // l'effet du grain de l'exclusion mutuelle sur les temps
            // d'exécution
            catch (InterruptedException ie)
            {
                System.out.println("InterruptedException : " + ie);
            }
            
        }
            
    }

    public void run() {
        // afficher éventuellement la valeur du compteur avant/après
        // pour vérifier la cohérence des incrémentations
        System.out.println("avant le thread " + Thread.currentThread().getName() + " : " +IncrAtomic.cpt);
        this.incr();
        System.out.println("après le thread " + Thread.currentThread().getName() + " : "+ IncrAtomic.cpt);
    }
}

