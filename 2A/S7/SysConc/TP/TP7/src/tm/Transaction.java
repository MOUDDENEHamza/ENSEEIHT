package tm;

import java.util.concurrent.BlockingQueue;
import java.util.Random;

// Transaction standard : traite les instructions qui lui sont soumises 
// et dépose les réponses correspondantes.
// Permet de simuler pas à pas les accès concurrents à la mémoire transactionnelle.
public class Transaction extends AbstractTransaction {

    public Transaction(String name,
                       AbstractTM tm,
    				   // Queue contenant les instructions à exécuter.
                       BlockingQueue<String[]> instructions,
  					   // Queue contenant le résultat des opérations.
                       BlockingQueue<String> response,
					   // Générateur de nombres aléatoires utilisé pour fixer les valeurs
					   // écrites lorsque celles-ci ne sont pas précisées.
                       Random rand) {
        super(name, tm, instructions, response, rand);
    }

    public Transaction(String name,
            AbstractTM tm,
            BlockingQueue<String[]> instructions,
            BlockingQueue<String> response){
        super(name, tm, instructions, response, null);
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
                				   this.rand != null &&
                                   this.tm.getTObjects().keySet().contains(instruction[1]))
                               {
                                   int value = this.rand.nextInt(100);
                                   this.tm.write(this.name,
                                                 instruction[1],
                                                 value);
                                   responseTM = instruction[1]+
                                                " <- "+
                                                value;
                               } else if(instruction.length == 3 &&
                            		     this.rand == null &&
                                         this.tm.getTObjects().keySet().contains(instruction[1]))
                               {
                                   this.tm.write(this.name,
                                                 instruction[1],
                                                 Integer.parseInt(instruction[2]));
                                   responseTM = instruction[1]+
                                                " <- "+
                                                instruction[2];
                               } else {
                                    responseTM = "Les écritures doivent être de la forme "
                                               + "'<transaction> write <t_object>";
                                   if(this.rand == null)
                                	   responseTM += " <valeur>";
                                   responseTM += "'";
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
            this.response.put(this.name + " annulée");
        } catch (InterruptedException e) {
        }
    }


}
