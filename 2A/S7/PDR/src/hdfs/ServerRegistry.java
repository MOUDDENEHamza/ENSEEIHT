package hdfs;

import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Random;

public class ServerRegistry extends UnicastRemoteObject implements Register {
    HashMap<String, FileRecord> files;
    ArrayList<ServerRecord> servers;

    public ServerRegistry(HashMap<String, FileRecord> fileRecords, ArrayList<ServerRecord> serverRecords) throws RemoteException {
        this.files = fileRecords;
        servers = serverRecords;
    }

    private boolean isAttributed(int port) {
        for (ServerRecord sr : servers) {
            if (sr.getPort() == port) {
                return true;
            }
        }
        return false;
    }

    @Override
    public int getAvailablePort() {
        int port;
        Random r = new Random();
        while (isAttributed(port = NameProvider.SERVER_PORT_MIN + r.nextInt(NameProvider.SERVER_PORT_MAX-NameProvider.SERVER_PORT_MIN))) {}
        return port;
    }

    @Override
    public boolean addServer(ServerRecord serverToAdd) {
        System.out.println("The server " + serverToAdd.getName() + "(" + serverToAdd.getAddress() + ")" + " is being added");
        // If the server exists
        for (ServerRecord sr : servers) {
            if (sr.equals(serverToAdd) || sr.getName().equals(serverToAdd.getName())) {
                System.out.println("Trying to add an existing server... Aborting registration.");
                return false;
            }
        }
        servers.add(serverToAdd);
        System.out.println(serverToAdd.getName() + " has been added successfully.");
        return true;
    }

    @Override
    public void addChunk(ServerRecord sr, ChunkMetadata cm, String hash) {
        System.out.println(sr.getName() + " requested to register a new chunk (hash = " + hash + ") in the Name Provider.");

        // If the server is not registered
        if (!servers.contains(sr)) {
            System.out.println("The server is not registered ! request refused.");
            return;
        }

        // If the file is not already present
        if (!files.containsKey(cm.getFileName())) {
            files.put(cm.getFileName(), new FileRecord(cm.getFileName()));
        }
        files.get(cm.getFileName()).addChunkStoredInServer(hash, sr, cm.getChunkNumber(), cm.getTotalChunkNumber());
        System.out.println("Done.");
    }

    @Override
    public void deleteChunk(String fileName, ServerRecord server) {
        System.out.println("Deleting " + fileName + " from server " + server);
        if (files.containsKey(fileName)) {
            files.remove(fileName);
            System.out.println("File has been deleted.");
        } else {
            System.out.println("File has already been deleted.");
        }
        System.out.println("File deleted.");
    }
}
