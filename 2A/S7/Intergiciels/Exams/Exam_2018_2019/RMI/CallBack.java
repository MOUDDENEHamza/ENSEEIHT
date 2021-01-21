import java.rmi.Remote;
import java.rmi.RemoteException;

public interface CallBack extends Remote {

    public void handle(int level) throws RemoteException;

}
