package tm;

import java.util.Map;
import java.util.HashMap;
import java.util.concurrent.ConcurrentMap;
import java.util.concurrent.ConcurrentHashMap;
import java.util.Set;
import java.util.HashSet;

// Mémoire transactionnelle avec contrôle de concurrence pessimiste : 
// verrouillage non bloquant, abandon en cas de conflit.
public class TMPP extends AbstractTM {

    // Map qui associe chaque t_objet au verrou qui en protège l'accès.
    private ConcurrentMap<String,TrySharedLock> locks;

    // Map qui associe chaque transaction à son journal des valeurs avant.
    private Map<String,Map<String,Integer>> oldVals;

    // Map qui associe chaque transaction à l'ensemble des t_objects qu'elle a lus.
    private Map<String,Set<String>> readSets;

    // Map qui associe chaque transaction à l'ensemble des t_objects qu'elle a écrits.
    private Map<String,Set<String>> writeSets;

    public TMPP(Map<String,Integer> t_objects,
                Set<String> transactions) {

        super(t_objects, transactions);

        this.locks = new ConcurrentHashMap<String,TrySharedLock>();
        for (String name : this.t_objects.keySet()) {
            this.locks.put(name, new TrySharedLock());
        }

        this.oldVals = new HashMap<String,Map<String,Integer>>();
        this.readSets = new HashMap<String,Set<String>>();
        this.writeSets = new HashMap<String,Set<String>>();
        for (String name : this.transactions) {
            this.oldVals.put(name, new HashMap<String,Integer>());
            this.readSets.put(name, new HashSet<String>());
            this.writeSets.put(name, new HashSet<String>());
        }
    }

    public TMPP(Map<String,Integer> t_objects) {

        this(t_objects, new HashSet<String>());
    }


    // Nettoie de la mémoire transactionnelle les valeurs liées à la transaction en argument.
    private void remove(String transaction) {

        this.transactions.remove(transaction);
        this.oldVals.remove(transaction);
        this.readSets.remove(transaction);
        this.writeSets.remove(transaction);
    }

    // Libère les verrous pris par une transaction 
    // et en nettoie les variables de la mémoire transactionnelle.
    private void unlock_all(String transaction) {

        Set<String> readWriteSet = new HashSet<String>(this.readSets.get(transaction));
        readWriteSet.addAll(this.writeSets.get(transaction));

        for (String t_object : readWriteSet) {
            locks.get(t_object).release(transaction);
        }

        this.remove(transaction);
    }

    public boolean newTransaction(AbstractTransaction transaction) {

        if(this.transactions.contains(transaction.getName())) {
            return false;
        }

        this.transactions.add(transaction.getName());
        this.oldVals.put(transaction.getName(), new HashMap<String,Integer>());
        this.readSets.put(transaction.getName(), new HashSet<String>());
        this.writeSets.put(transaction.getName(), new HashSet<String>());
        (new Thread(transaction)).start();
        return true;
    }

    public int read(String transaction, String t_object) throws AbortException {

        Set<String> readWriteSet = new HashSet<String>(this.readSets.get(transaction));
        readWriteSet.addAll(this.writeSets.get(transaction));
        if (!readWriteSet.contains(t_object)) {
            boolean lock = locks.get(t_object).try_shared(transaction);
            if (!lock) {
                this.abort(transaction);
            }
            readSets.get(transaction).add(t_object);
        }

        return this.t_objects.get(t_object);
    }


    public void write(String transaction,
                      String t_object,
                      int value) throws AbortException {

        if (!writeSets.get(transaction).contains(t_object)) {
            boolean lock = locks.get(t_object).try_exclusive(transaction);
            if (!lock) {
                this.abort(transaction);
            }
            writeSets.get(transaction).add(t_object);
            this.oldVals.get(transaction)
                        .put(t_object,this.t_objects.get(t_object));
        }

        this.t_objects.put(t_object, value);
    }


    public void abort(String transaction) throws AbortException {

        System.out.println("Annulation des modifications de "+transaction+".");

        for (String t_object : writeSets.get(transaction)) {
            System.out.println(t_object+
                               " "+
                               oldVals.get(transaction).get(t_object));
            this.t_objects.put(t_object, oldVals.get(transaction)
                                                .get(t_object));
        }

        System.out.println("Annulation terminée pour "+transaction+".");

        this.unlock_all(transaction);

        throw new AbortException();
    }


    public void commit(String transaction) throws AbortException {

        this.unlock_all(transaction);
    }

}
