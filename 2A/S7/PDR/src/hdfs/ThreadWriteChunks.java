package hdfs;

import java.io.FileInputStream;
import java.io.IOException;
import java.net.Socket;

public class ThreadWriteChunks implements Runnable {
    private ServerRecord serverToWrite;
    private String fname;
    private int bufferSize;
    private ChunkMetadata chunk;


    ThreadWriteChunks(ChunkMetadata chunk, int bufferSize, ServerRecord serverToWrite) {
        this.serverToWrite = serverToWrite;
        this.bufferSize = bufferSize;
        this.chunk = chunk;
        this.fname = chunk.getFileName();
    }

    @Override
    public void run() {
        try {
            Socket communicationSocket = new Socket(serverToWrite.getAddress(), serverToWrite.getPort());
            ClientToServer.writeChunkToServer(fname, chunk, bufferSize, communicationSocket);
        } catch (IOException | ClassNotFoundException | InterruptedException e) {
            e.printStackTrace();
        }
    }
}