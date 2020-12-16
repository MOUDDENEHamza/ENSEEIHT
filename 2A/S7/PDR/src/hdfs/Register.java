package hdfs;

import java.rmi.Remote;
import java.rmi.RemoteException;

public interface Register extends Remote {
    int getAvailablePort() throws RemoteException;

    boolean addServer(ServerRecord sr) throws RemoteException;

    void addChunk(ServerRecord sr, ChunkMetadata cm, String hash) throws RemoteException;

    void deleteChunk(String fileName, ServerRecord server) throws RemoteException;
}
