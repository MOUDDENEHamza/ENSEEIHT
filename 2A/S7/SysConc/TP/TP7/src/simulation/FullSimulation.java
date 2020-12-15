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

// Implémentation d'AbstractSimulation réalisant une simulation globale
public class FullSimulation extends AbstractSimulation {

    // Horloge globale
    private int clock;

    // Booléen : les valeurs lues ou écrites doivent-elles être prises en compte ?
    private boolean meaningful;

    // Accès restant à effectuer en cas de blocage.
    private Map<String,Map<Integer,String[]>> afterBlocking;

    // Echéancier : associe une date aux différentes actions des différentes transactions.
    private Map<Integer,Map<String,String[]>> planning;

    // L'essentiel de l'initialisation est réalisée par la classe FullSimulationBuilder.
    public FullSimulation() {
        this.clock = 0;
        this.afterBlocking = new HashMap<String,Map<Integer,String[]>>();
    }

    public void setMeaningful(boolean meaningful) {
        this.meaningful = meaningful;
    }

    public void setTM(AbstractTM tm) {
        this.tm = tm;
    }

    public void setPlanning(Map<Integer, Map<String,String[]>> planning) {
        this.planning = planning;
    }

    public void setTransactions(Map<String, TransactionObject> transactions) {
        this.transactions = transactions;
    }

    public void run()
        throws InterruptedException, IOException, FileNotFoundException {

        int min = 0;
        String output = null;
        Set<String> toWait = null;
        boolean stillRunning = true;
        // Epuiser l'échéancier jusqu'à la dernière opération.
        while (!this.planning.isEmpty() && stillRunning)
        {
            min = Collections.min(this.planning.keySet());
            this.clock = min;
            System.out.println("Date "+min);
            for (String transaction : this.planning.get(min).keySet()) {
                this.simulate(transaction,
                              this.planning.get(min)
                                           .get(transaction));
            }
            Thread.sleep(100);
            toWait =
                new HashSet<String>(this.planning.get(min).keySet());
            toWait.addAll(this.afterBlocking.keySet());
            for (String transaction : toWait) {
                if(this.planning.get(min).keySet().contains(transaction)) {
                    output = transaction + " : " + String.join(" ",
                                                               this.planning.get(min)
                                                                    .get(transaction));
                    System.out.println(output);
                }
                output = this.transactions.get(transaction).responses.poll();
                if (output != null) {
                    System.out.println(transaction+" : "+output);
                } else {
                    System.out.println(transaction+" bloquée");
                }
                this.updateState(transaction, output);
            }
            this.planning.remove(min);

        }

        this.display();
        stillRunning = false;
        for (String name : this.transactions.keySet()) {
            if (this.transactions.get(name).state == TransactionState.RUNNING){
                stillRunning = true;
                break;
            }
        }

    }


    // Envoie les instructions à la mémoire transactionnelle.
    private  void simulate(String transaction, String[] command)
        throws InterruptedException, IOException, FileNotFoundException
    {
        String output = null;
        if (this.transactions.get(transaction).state != TransactionState.ABORTED) {
            this.transactions.get(transaction).instructions.put(command);
        }
    }



    // Met à jour l'état de la transaction.
    private void updateState(String transaction, String output) {
        if (output == null &&
            this.transactions.get(transaction).state != TransactionState.BLOCKED)
        {
            this.block(transaction);
        } else if (output != null &&
                   this.transactions.get(transaction).state == TransactionState.BLOCKED)
        {
            this.unblock(transaction);
        } else if (output != null && output.contains("relancée")) {
            this.relaunch(transaction);
        } else if (output != null && output.contains("annulée")){
            this.abort(transaction);
        } else if (output != null && output.contains("validée")) {
            this.commit(transaction);
        }
    }



    // Retire du planning les instructions restantes d'une transaction bloquée.
    private void block(String transaction) {
        HashSet<Integer> emptyTimes = new HashSet<Integer>();

        this.afterBlocking.put(transaction, new HashMap<Integer,String[]>());
        for (Integer time : this.planning.keySet()) {
            if (time != this.clock &&
                this.planning.get(time).containsKey(transaction))
            {
                this.afterBlocking.get(transaction)
                            .put(time - this.clock,
                                 this.planning.get(time).remove(transaction));
                if (this.planning.get(time).isEmpty()) {
                    emptyTimes.add(time);
                }
            }
        }

        for (Integer time : emptyTimes) {
            this.planning.remove(time);
        }

        this.transactions.get(transaction).state = TransactionState.BLOCKED;
        this.transactions.get(transaction).whenBlocked = this.clock;
    }



    // Remet dans l'échéancier les instructions restantes d'une transaction débloquée.
    private void unblock(String transaction) {

        for (Integer time : this.afterBlocking.get(transaction).keySet()) {
            int newTime = this.clock+time;
            if (this.planning.containsKey(newTime)) {
                this.planning.get(newTime)
                    .put(transaction,
                            this.afterBlocking.get(transaction).get(time));
            } else {
                this.planning.put(newTime, new HashMap<String,String[]>());
                this.planning.get(newTime)
                    .put(transaction,
                            this.afterBlocking.get(transaction).get(time));
            }
        }

        this.transactions.get(transaction).state = TransactionState.RUNNING;
        this.transactions.get(transaction).blocked +=
            (this.clock - this.transactions.get(transaction).whenBlocked);
        this.afterBlocking.remove(transaction);
    }



    // Met à jour l'échéancier lorsqu'une superTransaction est relancée.
    private void relaunch(String transaction) {
        for (Integer time : this.planning.keySet()) {
            if (time != this.clock) {
                this.planning.get(time).remove(transaction);
            }
        }

        Map<Integer,String[]> init = this.transactions.get(transaction).init;
        for (Integer time : init.keySet()) {
            int newTime = this.clock+time;
            if (this.planning.containsKey(newTime)) {
                this.planning.get(newTime)
                    .put(transaction,
                         init.get(time));
            } else {
                this.planning.put(newTime, new HashMap<String,String[]>());
                this.planning.get(newTime)
                    .put(transaction,
                         init.get(time));
            }
        }

        this.transactions.get(transaction).useless = this.clock;
    }


    // Annule proprement une transaction.
    private void abort(String transaction) {
        for (Integer time : this.planning.keySet()) {
            if (time != this.clock) {
                this.planning.get(time).remove(transaction);
            }
        }

        this.transactions.get(transaction).state = TransactionState.ABORTED;
        this.transactions.get(transaction).useless = this.clock;
    }

    // Valide proprement une transaction.
    private void commit(String transaction) {
        this.transactions.get(transaction).state = TransactionState.COMMITTED;
        this.transactions.get(transaction).useful =
                        this.clock-
                        (this.transactions.get(transaction).useless
                         +this.transactions.get(transaction).blocked);
    }



    // Affiche les résultats de la simulation.
    private void display() {

        String output = "";

        int minTime = 0;
        int seqTime = 0;

        System.out.print(System.lineSeparator());

        for (String transaction : this.transactions.keySet()) {
            if (this.transactions.get(transaction).state ==
                TransactionState.COMMITTED) {
                System.out.println("Transaction "+transaction+" validée");
            } else if (this.transactions.get(transaction).state ==
                      TransactionState.ABORTED) {
                    System.out.println("Transaction "+transaction+" annulée");
            }

            if (!(this.meaningful)) {
                System.out.println(
                        this.transactions.get(transaction).useless+" unités de temps perdues");
                System.out.println(
                        this.transactions.get(transaction).blocked+"  unités de temps attendues");
                System.out.println(
                        this.transactions.get(transaction).useful+" unités de temps utiles");

                minTime = Math.max(minTime,
                                   Collections.max(this.transactions
                                                                 .get(transaction)
                                                                 .init
                                                                 .keySet()));
                seqTime += Collections.max(this.transactions
                                                         .get(transaction)
                                                         .init
                                                         .keySet());
            }
        }

        System.out.print(System.lineSeparator());

        if (!meaningful) {
            System.out.println("Temps total : "+this.clock);
            System.out.println("Temps optimal : "+minTime);
            System.out.println("Temps séquentiel : "+seqTime);
        } else {
            Map<String,Integer> t_objects = this.tm.getTObjects();
            output = "T_objets :";
            for (String t_object : t_objects.keySet()) {
                output = output+"\n"+t_object+" "+t_objects.get(t_object);
            }
            System.out.println(output);
        }

    }
}
