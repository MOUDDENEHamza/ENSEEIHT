package tm;

import java.util.Set;
import java.util.HashSet;
import java.util.Map;
import java.util.HashMap;

// Classe abstraite pour les Mémoires Transactionnelles. 
// Définit les attributs et méthodes obligatoires.
public abstract class AbstractTM {

    // Map associant les identifiants d'objets transactionnels à leur valeur.
    public Map<String,Integer> t_objects;
    
    // Ensemble des identifiants de transactions en cours.
    public Set<String> transactions;

    public AbstractTM(Map<String,Integer> t_objects,
                      Set<String> transactions) {
        this.t_objects = t_objects;
        this.transactions = transactions;
    }

    // Fournit l'ensemble des identifiants de transactions en cours.
    public Set<String> getTransactions() {
        return new HashSet<String>(this.transactions);
    }

     // Fournit l'ensemble des identifiants d'objets transactionnels.
     public Map<String,Integer> getTObjects() {
        return new HashMap<String,Integer>(this.t_objects);
    }

    // Ajoute les variables nécessaires à une nouvelle transaction et l'instancie.
    // Renvoie true si la transaction n'existait pas déjà.
    abstract public boolean newTransaction(AbstractTransaction transaction);

    abstract public int  read(String transaction, String t_object)
                    throws AbortException;

    abstract public void write(String transaction, String t_object, int value)
                    throws AbortException;

    abstract public void abort(String transaction)
                    throws AbortException;

    abstract public void commit(String transaction)
                    throws AbortException;

}
