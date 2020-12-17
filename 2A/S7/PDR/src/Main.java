import hdfs.NameProvider;
import ordo.WorkerImpl;

import java.net.UnknownHostException;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;

public class Main {

    public static void main(String[] args) throws RemoteException, UnknownHostException, NotBoundException {
        String[] arg = {"8000"};
        WorkerImpl.main(arg);
        System.out.println("\n\n");
        System.out.println("\n\n");
        NameProvider np = new NameProvider();
        String[] args1 = {"server"};

    }
}
