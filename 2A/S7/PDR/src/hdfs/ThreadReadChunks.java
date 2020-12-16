package hdfs;

import java.io.IOException;
import java.net.ConnectException;
import java.net.Socket;
import java.util.concurrent.Callable;

public class ThreadReadChunks implements Callable<String> {
    String hashChunkToRead;
    String baseDir;
    ServerRecord serverToRead;

    ThreadReadChunks(String hash, String baseDir, ServerRecord server) {
        this.hashChunkToRead = hash;
        this.baseDir = baseDir;
        this.serverToRead = server;
    }

    @Override
    public String call() {
        String tempFileName = null;
        try {
            Socket communicationSocket = new Socket(serverToRead.getAddress(), serverToRead.getPort());
            tempFileName = ClientToServer.readFromServer(hashChunkToRead, baseDir, communicationSocket);
        } catch (ConnectException e) {
            System.out.println("The server is not available ! Aborting...");
        } catch (IOException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return tempFileName;
    }
}
