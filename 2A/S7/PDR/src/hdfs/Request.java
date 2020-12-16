package hdfs;

import java.rmi.Remote;
import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.HashMap;

public interface Request extends Remote {
    ArrayList<ServerRecord> askWriting(ArrayList<ChunkMetadata> chunks) throws RemoteException;

    ArrayList<Pair<Integer, Pair<String, ServerRecord>>> askReading(String fileName) throws RemoteException;

    HashMap<String, ArrayList<ServerRecord>> askDeleting(String fileName) throws RemoteException;

    String askList() throws RemoteException;

    int getNumberOfServers() throws RemoteException;
}
