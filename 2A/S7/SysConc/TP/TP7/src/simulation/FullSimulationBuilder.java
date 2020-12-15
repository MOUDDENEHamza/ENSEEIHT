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

// Classe d'initialisation pour FullSimulation, à partir d'un fichier scénario.
public class FullSimulationBuilder {

    private FullSimulation simu;
    private Integer offset;

    public FullSimulationBuilder() {
        this.simu = new FullSimulation();
        this.offset = 1;
    }

    public FullSimulation build(File spec, boolean meaningful)
    throws NumberFormatException, NoSuchMethodException
    {
        //Création du Scanner.
        Scanner scan = null;
        try {
            scan = new Scanner(spec);
        } catch (FileNotFoundException e) {
            System.err.println("Fichier scénario non trouvé.");
            System.exit(1);
        }


        // Analyser la ligne d'initialisation.
        String line = null;
        try {
            line = scan.nextLine();
        } catch (NoSuchElementException e) {
            System.err.println("Fichier scénario vide.");
            System.exit(1);
        }

        AbstractTM tm = this.initializeTM(line, meaningful);

        // Analyse des scénarios pour chacune des transactions.
        Map<String, TransactionObject> transactions =
            new HashMap<String, TransactionObject>();
        Map<Integer,Map<String,String[]>> planning =
            new HashMap<Integer,Map<String,String[]>>();
        Random rand = new Random();

        while(scan.hasNextLine()) {
            line = scan.nextLine();
            if (meaningful) {
                this.parseCommandLine(line, tm, transactions, planning);
            } else {
                this.offset = 1;
                this.parseTransLine(line, tm, transactions, planning, rand);
            }
        }

        // Build FullSimulation object.
        this.simu.setTM(tm);
        this.simu.setMeaningful(meaningful);
        this.simu.setPlanning(planning);
        this.simu.setTransactions(transactions);

        return this.simu;
    }

    private AbstractTM initializeTM(String line, boolean meaningful){
        AbstractTM tm = null;
        String[] splitLine = this.simu.clean(line.split(" "));

        Map<String,Integer> t_objects = new HashMap<String,Integer>();

        String nameTM = "";
        try {
            if (meaningful) {
                nameTM = "tm."+splitLine[1];
                Class<? extends AbstractTM> classTM =
                   Class.forName(nameTM).asSubclass(AbstractTM.class);
                Class<?>[] classArgs = {Map.class};
                String buffer = null;
                String[] buffers = null;
                for (int i = 2; i < splitLine.length ; i++) {
                    buffer = splitLine[i];
                    buffers = buffer.replaceAll("[()]", "").split(",");
                    t_objects.put(buffers[0],Integer.parseInt(buffers[1]));
                }
                tm = classTM.getDeclaredConstructor(classArgs)
                            .newInstance(t_objects);
            } else {
                nameTM = "tm."+splitLine[0];
                Class<? extends AbstractTM> classTM =
                    Class.forName(nameTM).asSubclass(AbstractTM.class);
                Class<?>[] classArgs = {Map.class};

                for (int i = 1; i < splitLine.length ; i++) {
                    t_objects.put(splitLine[i],0);
                }

                tm = classTM.getDeclaredConstructor(classArgs)
                                       .newInstance(t_objects);
            }
        } catch (ClassNotFoundException e) {
            System.err.println("La classe "+nameTM+" n'existe pas.");
            System.exit(1);
        } catch (ClassCastException e) {
            System.err.println("La classe "+nameTM+" n'hérite pas de AbstractTM.");
            System.exit(1);
        } catch (NoSuchMethodException e) {
            System.err.println("La classe "+nameTM+" n'a pas de constructeur"
                               +" ayant Map<String,Integer> en argument.");
            System.exit(1);
        } catch (InstantiationException e) {
            System.err.println("La classe "+nameTM+" ne peut être instanciée.");
            System.exit(1);
        } catch (IllegalAccessException e) {
            System.err.println("La classe "+nameTM+" ne peut être accédée.");
            System.exit(1);
        } catch (InvocationTargetException e) {
            System.err.println("Le constructeur de la classe "+nameTM+"a levé"
                               +" l'exception: "+e.getMessage());
            System.exit(1);
        }

        return tm;
    }


    private void parseCommandLine(String line,
                           AbstractTM tm,
                           Map<String, TransactionObject> transactions,
                           Map<Integer,Map<String,String[]>> planning) {

        String[] splitLine = this.simu.clean(line.split(" "));

        if (splitLine[0].equals("new")) {
            String name = splitLine[1];
            BlockingQueue<String[]> instructions = new LinkedBlockingQueue<String[]>();
            BlockingQueue<String> responses = new LinkedBlockingQueue<String>();
            AbstractTransaction trans;
            trans = new Transaction(name,
                                    tm,
                                    instructions,
                                    responses);
            tm.newTransaction(trans);
            transactions.put(name,
                             new TransactionObject(new HashMap<Integer,String[]>(),
                                                   instructions,
                                                   responses));
        } else if (transactions.keySet().contains(splitLine[0])) {
            String name = splitLine[0];

            String[] command = Arrays.copyOfRange(splitLine,
                                                1,
                                                splitLine.length);

            transactions.get(name).init.put(this.offset,command);
            planning.put(this.offset, new HashMap<String,String[]>());
            planning.get(this.offset).put(name,command);
            this.offset++;
        } else {
            System.err.println("Erreur de syntaxe dans le fichier scénario. ");

            System.err.println(splitLine[0]);
            System.err.println(splitLine[1]);
            for (String transaction : transactions.keySet()) {
                System.err.println(transaction);
            }

            System.exit(1);
        }

    }

    private void parseTransLine(String line,
                           AbstractTM tm,
                           Map<String, TransactionObject> transactions,
                           Map<Integer,Map<String,String[]>> planning,
                           Random rand) {

        String[] splitLine = line.split(":");
        String[] header = this.simu.clean(splitLine[0].split(" "));
        String name = header[0];
        String type = header[1];
        String[] commands = this.simu.clean(splitLine[1].split(";"));
        String[] command = null;

        BlockingQueue<String[]> instructions = new LinkedBlockingQueue<String[]>();
        BlockingQueue<String> responses = new LinkedBlockingQueue<String>();

        Map<Integer, String[]> init = new HashMap<Integer,String[]>();
        for (int i=0; i < commands.length; i++) {
            command = this.simu.clean(commands[i].split(" "));

            if (command[0].equals("process")) {
                this.offset += Integer.parseInt(command[1]);
            } else {
                init.put(this.offset,command);
                if (!planning.containsKey(this.offset))
                {
                    planning.put(this.offset,
                            new HashMap<String,String[]>());
                }
                planning.get(this.offset).put(name,command);
                this.offset++;
            }
        }

        AbstractTransaction trans;
        if (type.equals("S")) {
            trans = new SuperTransaction(name,
                                         tm,
                                         instructions,
                                         responses,
                                         rand);
        } else {
            trans = new Transaction(name,
                                    tm,
                                    instructions,
                                    responses,
                                    rand);
        }

        tm.newTransaction(trans);
        transactions.put(name,
                         new TransactionObject(init,
                                               instructions,
                                               responses));
    }
}
