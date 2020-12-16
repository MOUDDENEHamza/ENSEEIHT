import hdfs.HdfsServer;
import hdfs.NameProvider;
import hdfs.Register;
import ordo.WorkerImpl;

import java.net.UnknownHostException;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;
import java.rmi.registry.LocateRegistry;

public class Main {

    public static void main(String[] args) throws RemoteException, UnknownHostException, NotBoundException {
        String[] arg = {"8000"};
        WorkerImpl.main(arg);
        NameProvider np = new NameProvider();
        HdfsServer server = new HdfsServer(
                (Register) LocateRegistry.getRegistry(NameProvider.NAME_PROVIDER_PORT).lookup("//localhost:" + NameProvider.NAME_PROVIDER_PORT + "/ServerRegistry"),
                "serverData", "server");
    }
}
