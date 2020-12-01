package TP2;

import java.rmi.*;

public interface Carnet extends Remote {
	public void Ajouter(SFiche sf) throws RemoteException;
	public RFiche Consulter(String n, boolean forward) throws RemoteException;
}
