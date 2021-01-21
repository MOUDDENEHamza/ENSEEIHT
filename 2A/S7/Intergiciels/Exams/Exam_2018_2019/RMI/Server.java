import java.rmi.server.UnicastRemoteObject;
import java.rmi.RemoteException;
import java.rmi.*;
import java.rmi.registry.*;

public class Server extends UnicastRemoteObject implements CallBack {

	public Server() throws RemoteException {}

	public void handle(int level) throws RemoteException {
		if (level >= 90) {
			System.out.println("Vous etes abonnées");
		} else {
			System.out.println("Niveau insuffisant");
		}
	}

	public static void main(String[] args) throws RemoteException {
		try {
			CallBack s = new Server();
			Registry registry = LocateRegistry.createRegistry(8000);
			Naming.rebind("//localhost:8000/server", s);
		} catch (Exception e) {
			e.printStackTrace();	
		}
			
	}

}
