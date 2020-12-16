package hdfs;

import java.io.IOException;
import java.net.Socket;

public class ThreadDeleteChunks implements Runnable {
    String hashChunkToDelete;
    ServerRecord serverToDeleteChunk;

    ThreadDeleteChunks(String hashChunkToDelete, ServerRecord serverToDeleteChunk) {
        this.hashChunkToDelete = hashChunkToDelete;
        this.serverToDeleteChunk = serverToDeleteChunk;
    }

    @Override
    public void run() {
        try {
            Socket communicationSocket = new Socket(serverToDeleteChunk.getAddress(), serverToDeleteChunk.getPort());
            ClientToServer.deleteToServer(hashChunkToDelete, communicationSocket);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
