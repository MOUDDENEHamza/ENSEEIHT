package hdfs;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class FileRecord {
    private String fileName;

    // HashMap<hash, <ArrayLisy<ServerRecord>, <chunkNumber, totalNumberChunks>>>
    HashMap<String, Pair<ArrayList<ServerRecord>, Pair<Integer, Integer>>> chunksHash;

    public FileRecord(String fileName) {
        this.fileName = fileName;
        this.chunksHash = new HashMap<>();
    }

    public String getFileName() {
        return fileName;
    }

    @Override
    public String toString() {
        String hashs = "";
        for (Map.Entry<String, Pair<ArrayList<ServerRecord>, Pair<Integer, Integer>>> p : chunksHash.entrySet()) {
            hashs += "\t- " + p.getKey() + " (" + (p.getValue().getRight().getLeft() + 1) + "/" + p.getValue().getRight().getRight() +") -> " + p.getValue().getLeft() + "\n";
        }

        return "file name : " + fileName + " | State : "
                + (this.allChunksAreRegistered() ? "ALL CHUNKS ARE REGISTERED" : "SOME CHUNKS ARE MISSING") + "\n" +
                hashs;
    }

    public HashMap<String, Pair<ArrayList<ServerRecord>, Pair<Integer, Integer>>> getChunksHash() {
        return chunksHash;
    }

    public void addChunkStoredInServer(String hash, ServerRecord server, int chunkNumber, int totalNumberChunk) {
        for (Map.Entry<String, Pair<ArrayList<ServerRecord>, Pair<Integer, Integer>>> p : chunksHash.entrySet()) {
            if (p.getKey().equals(hash)) {
                for (ServerRecord sr : p.getValue().getLeft()) {
                    if (sr.equals(server)) {
                        return;
                    }
                }
                p.getValue().getLeft().add(new ServerRecord(server));
                return;
            }
        }
        ArrayList<ServerRecord> srToStore = new ArrayList<>();
        srToStore.add(new ServerRecord(server));
        chunksHash.put(hash, new Pair<>(srToStore, new Pair(chunkNumber, totalNumberChunk)));
    }

    public boolean allChunksAreRegistered() {
        int somme = 0;
        boolean first = true;
        Pair<ArrayList<ServerRecord>, Pair<Integer, Integer>> somePair = null;
        for (Map.Entry<String, Pair<ArrayList<ServerRecord>, Pair<Integer, Integer>>> chunk : this.chunksHash.entrySet()) {
            if (first) {
                somePair = chunk.getValue();
                first = false;
            }
            somme += chunk.getValue().getRight().getLeft();
        }

        int total = somePair.getRight().getRight();

        System.out.println("checksum : " + somme + "\nTotal : " + total);

        return !this.chunksHash.isEmpty() && (total == 1 || somme == ((total-1)*total)/2);
    }

    public static void printFiles(HashMap<String, FileRecord> fileRecords) {
        for (Map.Entry<String, FileRecord> p : fileRecords.entrySet()) {
            System.out.println(p + "\n");
        }
    }
}