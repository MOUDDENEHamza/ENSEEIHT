package tm;

// Etat d'exécution d'une transaction
public enum TransactionState {
    RUNNING, BLOCKED, ABORTED, COMMITTED
}
