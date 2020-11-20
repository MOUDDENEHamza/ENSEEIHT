import java.util.concurrent.RecursiveTask;
import java.util.concurrent.ForkJoinPool;


class TraiterProblème extends RecursiveTask<Integer> {

    private int resteAFaire = 0;
    private int résultat = 0;
    static final int SEUIL = 10;

    TraiterProblème(int resteAFaire) {
        this.resteAFaire = resteAFaire;
    }

    protected Integer compute() {

        //si la tâche est trop grosse, on la décompose en 2
        if(this.resteAFaire > SEUIL) {
            System.out.println("Décomposition de resteAFaire : " + this.resteAFaire);

            TraiterProblème sp1 = new TraiterProblème(this.resteAFaire / 2);
            TraiterProblème sp2 = new TraiterProblème(this.resteAFaire / 2);

            sp1.fork();
            résultat = sp2.compute();
            résultat = sp1.join()+résultat;
            return résultat;

        } else {
            System.out.println("Traitement direct de resteAFaire : " + this.resteAFaire);
            try {
                Thread.sleep(100,0);
            }
            catch (InterruptedException ie)
            {
                System.out.println("InterruptedException : " + ie);
            }
            return 10 * resteAFaire;
        }
    }
}

public class FJGPlus {
    static final int TAILLE = 1024; //Pour cet exemple, nécessairement une puissance de 2

    public static void main(String[] args) throws Exception {
        long fin,départ;
        TraiterProblème monProblème = new TraiterProblème(TAILLE);

        départ = System.nanoTime();
        int résultat = ForkJoinPool.commonPool().invoke(monProblème);
        fin = System.nanoTime();
        System.out.println("Résultat final = " + résultat);
        System.out.println("Durée exécution (ms): " + (fin-départ)/1000000L);
        System.out.println();
    }
}