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
            sp2.fork();

            résultat = sp1.join()+ sp2.join();

            return résultat;

        } else {
            System.out.println("Traitement direct de resteAFaire : " + this.resteAFaire);
            return 10 * resteAFaire;
        }
    }
}

public class FJG {
    static ForkJoinPool fjp = new ForkJoinPool();
    static final int TAILLE = 1024; //Attention : nécessairement une puissance de 2

    public static void main(String[] args) throws Exception {
        TraiterProblème monProblème = new TraiterProblème(TAILLE);
        int résultat = fjp.invoke(monProblème);
        System.out.println("Résultat final = " + résultat);
    }
}