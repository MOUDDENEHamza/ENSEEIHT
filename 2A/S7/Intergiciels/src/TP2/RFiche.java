package TP2;

import java.rmi.*;

public interface RFiche extends Remote {
	public String getNom () throws RemoteException;
	public String getEmail () throws RemoteException;
}



