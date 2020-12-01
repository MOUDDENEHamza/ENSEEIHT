package TP2;

import java.rmi.*;
import java.rmi.server.*;

public class RFicheImpl extends UnicastRemoteObject implements RFiche{

    private String nom;
    private String email;

    public RFicheImpl (String nom, String email) throws RemoteException {
        this.nom = nom;
        this.email = email;
    }

    public String getNom () throws RemoteException {
        return nom;
    }

    public String getEmail () throws RemoteException {
        return email;
    }
}
