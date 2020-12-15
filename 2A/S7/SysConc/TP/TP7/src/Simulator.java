import java.lang.reflect.InvocationTargetException;

import java.io.IOException;
import java.io.FileNotFoundException;
import java.io.File;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.NoSuchElementException;

import simulation.*;
import tm.*;

// Main class running the transactional memory.
public class Simulator {

    public static void main(String[] args)
    throws InterruptedException, IOException, NoSuchMethodException,
           InvocationTargetException {

        if (args.length > 1) {
            System.err.println("L'application se lance soit sans argument"
                              +" (pour une exécution en mode interprété, pas à pas),"
                              +" soit avec un seul argument "
                              +"(le fichier de scénario à traiter, en mode simulation).");
            System.exit(1);
        }

        AbstractSimulation simu;

        if (args.length == 1) {
            File spec = new File(args[0]);
            FullSimulationBuilder builder = new FullSimulationBuilder();
            simu = builder.build(spec, false);
        } else {
            simu = new StepByStepSimulation();
        }

        simu.run();
    }

}
