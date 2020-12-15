package tm;

import java.util.concurrent.BlockingQueue;
import java.util.Random;

// Une super transaction se relance à chaque abandon,
// jusqu'à soit terminer ou atteindre sa borne supérieure d'essais.
public class SuperTransaction extends AbstractTransaction {

    // Nombre de fois où la SuperTransaction a été relancée.
    private int nbRetry;

    public SuperTransaction(
        String name,
        AbstractTM tm,
    	// Queue contenant les instructions à exécuter.
        BlockingQueue<String[]> instructions,
  		// Queue contenant le résultat des opérations.
        BlockingQueue<String> response,
		// Générateur de nombres aléatoires utilisé pour fixer les valeurs
		// écrites lorsque celles-ci ne sont pas précisées.
        Random rand)
    {
        super(name, tm, instructions, response, rand);
        this.nbRetry = 0;
    }

    public SuperTransaction(
        String name,
        AbstractTM tm,
        BlockingQueue<String[]> instructions,
        BlockingQueue<String> response,
        int nbRetry,
        Random rand)
    {
        super(name, tm, instructions, response, rand);
        this.nbRetry = nbRetry;
    }

    public void transaction() throws AbortException {
        try {
            while (!committed) {
                String[] instruction = this.instructions.take();
                this.handle(instruction);
            }
        } catch (InterruptedException e) {
            System.out.println("Interruption de la transaction "+this.getName());
        }
    }

    // Traite la commande reçue, selon son type (premier élément de la commande)
    public void handle(String[] instruction) throws AbortException {
        try {
            String responseTM = null;
            switch (instruction[0]) {
                case "read" : if(instruction.length == 2 &&
                                  this.tm.getTObjects().keySet().contains(instruction[1]))
                              {
                                  responseTM = instruction[1]+
                                               " -> "+
                                               this.tm.read(this.name,
                                                            instruction[1]);
                              } else {
                                  responseTM = "Les lectures doivent être de la forme "
                                               + "'<transaction> read <t_object>'";
                              }
                              break;
                case "write" : if(instruction.length == 2 &&
                                   this.tm.getTObjects().keySet().contains(instruction[1]))
                               {
                                   int value = this.rand.nextInt(100);
                                   this.tm.write(this.name,
                                                 instruction[1],
                                                 value);
                                   responseTM = instruction[1]+
                                                " <- "+
                                                value;
                               } else {
                                   responseTM = "Les écritures doivent être de la forme "
                                               + "'<transaction> write <t_object>'";
                               }
                               break;
                case "commit" : if(instruction.length == 1) {
                                    this.tm.commit(this.name);
                                    responseTM = this.name + " validée";
                                    this.committed = true;
                                } else {
                                    responseTM = "Les validations doivent être de la forme"
                                                 + " '<transaction> commit'";
                                }
                                break;
                case "abort" : this.tm.abort(this.name);
                               break;
                default : responseTM = "Commande inconnue.";
                          break;
            }
            this.response.put(responseTM);
        } catch (InterruptedException e) {
            System.out.println("Interruption de la transaction "+this.getName());
        }
    }


    public void aborted() {
        try {
            if (this.nbRetry < 20) {
                SuperTransaction next =
                    new SuperTransaction(
                            this.name,
                            this.tm,
                            this.instructions,
                            this.response,
                            this.nbRetry+1,
                            this.rand);
                this.tm.newTransaction(next);
                this.response.put(this.name + " relancée");
            } else {
                this.response.put(this.name + " annulée");
            }
        } catch (InterruptedException e) {
            System.out.println("Interruption de la transaction "+this.getName());
        }
    }
}