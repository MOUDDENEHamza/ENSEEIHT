// Time-stamp: <02 mai 2013 10:16 queinnec@enseeiht.fr>

package Synchro;

/** Identification de processus.
 * Opérations: ProcId.getId(), equals(ProcId) et equals(int).
 *
 * En interne, contient un entier unique, non recyclé, utile pour les traces
 * (il ne sert à rien d'autre sinon).
 */
public class ProcId {

    private static ThreadLocal<ProcId> clefId;

    private static Object verrouLastId = new Object();
    private static int lastId = 0;
    
    private int id;

    private ProcId (int id) {
        this.id = id;
    }

    /** Obtention de l'identité du processus appelant.
     * S'il n'en avait pas, on lui en crée une.
     */
    public static ProcId getSelf()
    {
        if (clefId == null) {
            synchronized (verrouLastId) {
                if (clefId == null) {
                    clefId = new ThreadLocal<ProcId>() {
                            protected ProcId initialValue() {
                                synchronized (verrouLastId) {
                                    return new ProcId (lastId++);
                                }
                            }};
                }
            }
        }
        return clefId.get();
    }

    public boolean equals (Object o)
    {
        if (! (o instanceof ProcId))
          return false;
        return (((ProcId)o).id == this.id);
    }

    public boolean equals (int id)
    {
        return (id == this.id);
    }

    public String toString()
    {
        return ""+id;
    }
    
}
