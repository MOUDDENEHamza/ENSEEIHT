package simulation;

import java.lang.reflect.InvocationTargetException;

import java.io.IOException;
import java.io.FileNotFoundException;
import java.io.File;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.NoSuchElementException;

import java.util.Collections;
import java.util.Set;
import java.util.HashSet;
import java.util.Map;
import java.util.HashMap;
import java.util.List;
import java.util.LinkedList;
import java.util.Arrays;
import java.util.ArrayList;
import java.util.Random;
import java.util.Scanner;

import tm.*;

// Implémentation d'AbstractSimulation réalisant une simulation interprétée pas à pas.
public class StepByStepSimulation extends AbstractSimulation {

    // Ensemble des transactions bloquées.
    private Set<String> blocked;

    private boolean exit;

    public StepByStepSimulation() {
        this.exit = false;
        this.blocked = new HashSet<String>();
    }

    public void run()
    throws InterruptedException, IOException,
           ClassCastException,
           NumberFormatException, NoSuchMethodException,
           InvocationTargetException, NoSuchElementException {

        Scanner scan = new Scanner(System.in);
        String line;
        String[] commands;

        while (!exit) {
            System.out.print("> ");
            line = scan.nextLine();
            commands = this.clean(line.split(" "));
            if (commands.length > 0) {
                if (commands[0].equals("run")) {
                    FullSimulationBuilder builder = new FullSimulationBuilder();
                    builder.build(new File(commands[1]),true).run();
                } else {
                    System.out.println(this.handle(commands));
                }
            }
        }

        System.exit(0);
    }


    // Vérifie la bonne forme des instructions et les envoie à la mémoire transactionnelle.
    private String handle(String[] commands)
    throws InterruptedException, IOException, FileNotFoundException {
        String output = null;
        switch (commands[0]) {
            case "exit" :
                this.exit = true;
                output = "Arrêt de la mémoire transactionnelle.";
                break;
            case "init" :
                if (commands.length < 3) {
                    output = "L'initialisation a la forme 'init <tm> (t_object,valeur)'.";
                } else {
                    try {
                        Class<? extends AbstractTM> classTM =
                           Class.forName("tm."+commands[1]).asSubclass(AbstractTM.class);
                        Class<?>[] classArgs = {Map.class};
                        Map<String,Integer> t_objects = new HashMap<String,Integer>();
                        String buffer = null;
                        String[] buffers = null;
                        for (int i = 2; i < commands.length ; i++) {
                            buffer = commands[i];
                            buffers = buffer.replaceAll("[()]", "").split(",");
                            t_objects.put(buffers[0],Integer.parseInt(buffers[1]));
                        }
                        tm = classTM.getDeclaredConstructor(classArgs)
                                    .newInstance(t_objects);
                        this.transactions = new HashMap<String,TransactionObject>();
                        this.blocked =
                            new HashSet<String>();
                        output = "Initialisation de la mémoire transactionnelle.";
                    } catch (ClassNotFoundException | ClassCastException e) {
                        output =
                            "Cette classe de mémoire transactionnelle n'existe pas.\n ";
                        output += "Les choix possibles sont : " 
                        		+ Arrays.toString(this.findDerivedClasses("AbstractTM"));
                    } catch (NumberFormatException e) {
                        output =
                            "Les t_objets doivent contenir un entier.";
                    } catch (NoSuchMethodException |
                             InstantiationException |
                             IllegalAccessException |
                             InvocationTargetException e) {
                        output = "Erreur d'instanciation.";
                    }
                }
                break;
            case "new" :
                if (this.tm == null) {
                    output =
                        "La mémoire transactionnelle doit avoir été créée avant d'être utilisée.";
                } else if (commands.length != 2) {
                    output =
                        "L'ajout de transaction doit être de la forme 'new <transaction>'";
                } else {
                    BlockingQueue<String[]> instructions =
                                    new LinkedBlockingQueue<String[]>();
                    BlockingQueue<String> responses =
                                    new LinkedBlockingQueue<String>();
                    if (!tm.newTransaction(new Transaction(
                                          commands[1],
                                          this.tm,
                                          instructions,
                                          responses)))
                    {
                        output = "Nom déjà pris.";
                    } else {
                        output = "Transaction "+commands[1]+" créée.";
                        this.transactions.put(
                                commands[1],
                                new TransactionObject(new HashMap<Integer,String[]>(),
                                                      instructions,
                                                      responses));
                    }
                }
                break;
            case "help" :
                output =
                    "La liste des commandes disponibles est :\n"+
                    "  - 'init <tm> (t_object,valeur)' permet d'instancier une mémoire "+
                    "transactionnelle de la classe donnée avec les noms d'objets "+
                    "fournis. Choix possibles pour <tm> : "+
                    Arrays.toString(this.findDerivedClasses("AbstractTM"))+".\n"+
                    "  - 'new <transaction>' permet de créer une transaction.\n"+
                    "  - 'list' permet de lister les transactions et les objets.\n"+
                    "  - '<transaction> read <t_objet>' permet à une transaction "+
                    "de lire l'entier stocké dans un objet.\n"+
                    "  - '<transaction> write <t_objet> <valeur>' permet "+
                    "à une transaction d'écrire dans un objet.\n"+
                    "  - '<transaction> commit' permet à une transaction de valider.\n"+
                    "  - '<transaction> abort' permet à une transaction d'abandonner.\n"+
                    "  - 'run <script>' lance l'exécution pas à pas des opérations listées"
                    	+" dans le fichier de script.\n"+
                    "  - 'exit' permet de quitter le simulateur.";
                break;
            case "list" :
                if (this.tm == null) {
                    output =  "La mémoire transactionnelle n'a pas encore été créée !";
                } else if (commands.length != 1) {
                    output =
                        "La commande pour lister les transactions et t_objets est 'list'";
                } else {
                    Set<String> transactions = this.tm.getTransactions();
                    Map<String,Integer> t_objects = this.tm.getTObjects();
                    output =
                        "Transactions : "+this.tm.getTransactions()
                                                 .toString()
                                                 .replaceAll("\\[", "")
                                                 .replaceAll("\\]", "")+"\n"+
                        "T_objets : ";
                    for (String t_object : t_objects.keySet()) {
                        output = output+"\n"+t_object+" "+t_objects.get(t_object);
                    }
                }
                break;
            default :
                if (this.tm == null) {
                    output =
                         "La mémoire transactionnelle doit avoir été créée avant d'être utilisée.";
                } else if (!this.tm.getTransactions().contains(commands[0])) {
                    output =
                        "Transaction inconnue : "+commands[0];
                } else if (this.blocked.contains(commands[0])) {
                    output =
                        "Cette transaction est bloquée pour le moment. Essayez plus tard.";
                } else {
                    this.transactions.get(commands[0]).instructions
                    .put(Arrays
                         .copyOfRange(commands,1,commands.length)
                        );
                    Thread.sleep(100);
                    output = this.transactions.get(commands[0])
                             .responses.poll();
                    if (output == null) {
                        output = commands[0]+" bloquée";
                        this.blocked.add(commands[0]);
                    }
                }
                break;
        }
        String waitedOutput = null;
        for (String transaction : this.blocked) {
            waitedOutput = this.transactions.get(transaction)
                           .responses.poll();
            if (waitedOutput != null) {
                System.out.println(transaction+" débloquée : "+waitedOutput);
                this.blocked.remove(transaction);
            }
        }
        return output;
    }

    /**
     * @brief Given a class name it finds all the classes that can be instantiated and that
     * derive from it. It only looks for .class files in the 'tm' package.
     * @param baseClassName The name of the base class.
     * @return The list of classes derived from the input class.
     */
    private String[] findDerivedClasses(String baseClassName)
    {
        List<String> classList = new LinkedList<String>();
        // get the list of files
        String[] files = (new File("./tm/")).list();
        // The base class from which the different policy must derive
        Class<?> interf = null;
        try {
            interf = Class.forName ("tm."+baseClassName);
        } catch (ClassNotFoundException e) {
            System.err.println ("Panique : je ne trouve pas l'interface "+baseClassName+" :"+e);
            System.exit (1);
        }
        // look for the classes deriving from the give base class
        for (int i = 0; i < files.length; i++) {
            Class<?> implementation;
            final String extension = ".class";
            if (files[i].endsWith(extension)) {
                String classname = files[i].substring (0, files[i].length()-extension.length());
                try {
                    implementation = Class.forName ("tm."+classname);
                } catch (ClassNotFoundException e) {
                    implementation = null;
                }
                // add it to the list if it exists and it is a derived class 
                if ((implementation != null) && 
                		(! classname.equals(baseClassName)) && 
                		interf.isAssignableFrom (implementation)) {
                    classList.add (classname);
                }
            }
        }
        // if it is empty there's something wrong...
        if (classList.isEmpty()) {
            System.out.println ("Aucune implantation de "+baseClassName+" trouvée !");
            System.exit (1);
        }
        return classList.toArray (new String[0]);
    }
}
