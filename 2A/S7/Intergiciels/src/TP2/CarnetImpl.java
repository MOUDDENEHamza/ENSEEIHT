package TP2;

import java.rmi.*;
import java.rmi.server.*;
import java.util.*;

public class CarnetImpl extends UnicastRemoteObject implements Carnet {

    private Map<String, RFiche> agenda;
    private int nCarnet;
    private Carnet other = null;

    protected CarnetImpl(int n) throws RemoteException {
        this.agenda = new HashMap<>();
        this.nCarnet = n;
    }

    @Override
    public void Ajouter(SFiche sf) throws RemoteException {
        try {
            RFiche rf = new RFicheImpl(sf.getNom(), sf.getEmail());
            this.agenda.put(sf.getNom(), rf);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public RFiche Consulter(String n, boolean forward) throws RemoteException {
        RFiche tmp = agenda.get(n);
        if (tmp == null && forward) {
            if (other == null) {
                try {
                    other = (Carnet) Naming.lookup("//localhost/carnet" + (this.nCarnet % 2) + 1);
                } catch (Exception e) {
                    System.out.println(e.toString());
                }
            } else {
                tmp = other.Consulter(n, false);
            }

        } else {
            if (tmp == null) {
                return null;
            } else {
                return tmp;
            }
        }
        return null;
    }

    public static void main(String[] args) {
        Integer i = new Integer(args[0]);
        int n = i.intValue();
        if (n != 1 && n != 2) {
            System.out.println("n faux");
            return;
        }
        try {
            Naming.rebind("//localhost:4000/Carnet" + n, new CarnetImpl(n));
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
