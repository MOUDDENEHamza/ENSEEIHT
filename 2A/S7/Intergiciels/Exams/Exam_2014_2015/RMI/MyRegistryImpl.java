import java.rmi.*;
import java.rmi.server.UnicastRemoteObject;
import java.rmi.RemoteException;
import java.rmi.registry.*;

public class MyRegistryImpl extends UnicastRemoteObject implements MyRegistry {

	public MyRegistryImpl() throws RemoteException {}

	public static void main(String[] args) throws RemoteException {
		try {
			Registry r = LocateRegistry.createRegistry(8000);
			Naming.rebind("//localhost:8000/server", new MyRegistryImpl());	
	
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
