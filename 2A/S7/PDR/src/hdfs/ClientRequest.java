package hdfs;

import java.io.File;
import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class ClientRequest extends UnicastRemoteObject implements Request {
    HashMap<String, FileRecord> files;
    ArrayList<ServerRecord> servers;

    public ClientRequest(HashMap<String, FileRecord> fr, ArrayList<ServerRecord> s) throws RemoteException {
        files = fr;
        servers = s;
    }

    @Override
    public ArrayList<ServerRecord> askWriting(ArrayList<ChunkMetadata> chunks) {
        if (chunks.isEmpty() || this.containsFile(chunks.get(0).getFileName())) {
            return null;
        }

        String fileName = chunks.get(0).getFileName();

        System.out.print("Finding available servers for the chunks of " + fileName + ".");

        ArrayList<ServerRecord> serversToWrite = new ArrayList<>();

        // Assign a server for each chunk
        int i=0;
        for (ChunkMetadata cm : chunks) {
            if (i == servers.size()) {
                i = 0;
            }
            serversToWrite.add(servers.get(i++));
        }

        System.out.println("Done.");
        return serversToWrite;
    }

    private ServerRecord serverSelection(ArrayList<ServerRecord> servers) {
        if (servers.isEmpty()) {
            return null;
        }

        // Lazy selection... To improve someday
        return servers.get(0);
    }

    @Override
    public ArrayList<Pair<Integer, Pair<String, ServerRecord>>> askReading(String fileName) {
        System.out.println("check if the file is registered");
        if (files.containsKey(fileName)) {
            FileRecord toRead = files.get(fileName);

            // Handmade checksum to check if all chunks are registered
            if (!toRead.allChunksAreRegistered()) {
                System.out.println("Someone tried to read a file with each chunk not being registered.");
                return null;
            }
            ArrayList<Pair<Integer, Pair<String, ServerRecord>>> readingInformations = new ArrayList<>();

            // For each chunk of the file
            for (Map.Entry<String, Pair<ArrayList<ServerRecord>, Pair<Integer, Integer>>> chunk : toRead.getChunksHash().entrySet()) {
                // Select the best server to serve the client for a specific chunk
                ServerRecord serverToRequest = serverSelection(chunk.getValue().getLeft());
                if (serverToRequest == null) {
                    System.out.println("Impossible to serve chunk " + chunk.getKey() + " : no server gets it.");
                    return null;
                }
                readingInformations.add(new Pair(chunk.getValue().getRight().getLeft(), new Pair(chunk.getKey(), serverToRequest)));
            }
            return readingInformations;
        }
        System.out.println("Someone tried to read unregistered file.\nHere are the files state :\n");
        return null;
    }

    @Override
    public HashMap<String, ArrayList<ServerRecord>> askDeleting(String fileName) {
        if (files.containsKey(fileName)) {
            FileRecord toRead = files.get(fileName);
            if (!toRead.allChunksAreRegistered()) {
                System.out.println("Someone tried to delete a file with each chunk not being registered.");
                return null;
            }
            HashMap<String, ArrayList<ServerRecord>> deletingInformations = new HashMap<>();
            for (Map.Entry<String, Pair<ArrayList<ServerRecord>, Pair<Integer, Integer>>> chunk : toRead.getChunksHash().entrySet()) {
                if (chunk.getValue().getLeft().isEmpty()) {
                    System.out.println("Impossible to serve chunk " + chunk.getKey() + " : no server gets it.");
                    return null;
                }
                deletingInformations.put(chunk.getKey(), chunk.getValue().getLeft());
            }
            return deletingInformations;
        }
        System.out.println("Someone tried to delete an unregistered file.");
        return null;
    }

    @Override
    public String askList() throws RemoteException {
        String list = "";
        for (Map.Entry<String, FileRecord> p : files.entrySet()) {
            list += p.getValue().toString();
        }
        return list;
    }

    @Override
    public int getNumberOfServers() {
        return servers.size();
    }

    public boolean containsFile(String fileName) {
        return files.containsKey(fileName);
    }
}
