package hdfs;

import java.io.*;
import java.net.Socket;

public class ClientToServer {
    public static void writeChunkToServer(String fname, ChunkMetadata chunk, int bufferSize, Socket server)
            throws IOException, ClassNotFoundException, InterruptedException {
        ObjectOutputStream oos = new ObjectOutputStream(server.getOutputStream());

        FileInputStream fis = new FileInputStream(fname);
        fis.skip(chunk.getBaseByte());

        oos.writeObject(Command.CMD_WRITE);
        oos.writeObject(chunk);
        oos.writeObject(bufferSize);

        byte buffer[] = new byte[bufferSize];
        long chunkSize = chunk.getSizeBytes();
        long sent = 0;
        int sentloop = 0;
        OutputStream bos = server.getOutputStream();

        while (sent + bufferSize <= chunkSize) {
            sentloop = fis.read(buffer);
            bos.write(buffer, 0, sentloop);
            sent += sentloop;
        }

        int remaining = (int) (chunkSize - sent);

        while (remaining > 0) {
            sentloop = fis.read(buffer, 0, remaining);
            bos.write(buffer, 0, sentloop);
            remaining -= sentloop;
        }

        ObjectInputStream ois = new ObjectInputStream(server.getInputStream());
        Command c = (Command) ois.readObject();

        if (c.equals(Command.END_OF_TRANSMISSION)) {
            server.close();
        } else {
            throw new IOException("Error while communicating with a HDFS server");
        }
    }

    public static String readFromServer(String hash, String baseDir, Socket server) throws IOException, ClassNotFoundException {
        String fileName = baseDir + "." + hash + ".tmp";

        ObjectOutputStream oos = new ObjectOutputStream(server.getOutputStream());
        FileOutputStream fos = new FileOutputStream(fileName);

        oos.writeObject(Command.CMD_READ);
        oos.writeObject(hash);
        ObjectInputStream ois = new ObjectInputStream(server.getInputStream());
        int bufferSize = (int) ois.readObject();
        long chunkSize = (long) ois.readObject();

        byte buffer[] = new byte[bufferSize];
        long received = 0;
        int receivedLoop;
        InputStream bis = server.getInputStream();

        while (received + bufferSize <= chunkSize) {
            receivedLoop = bis.read(buffer);
            fos.write(buffer,0, receivedLoop);
            received += receivedLoop;
        }

        int remainingBytes = (int) (chunkSize - received);

        while (remainingBytes > 0) {
            receivedLoop = bis.read(buffer, 0, remainingBytes);
            fos.write(buffer, 0, receivedLoop);
            remainingBytes -= receivedLoop;
        }

        oos.writeObject(Command.END_OF_TRANSMISSION);
        server.close();

        return fileName;
    }

    public static void deleteToServer(String hash, Socket server) {
        try {
            ObjectOutputStream outStream = new ObjectOutputStream(server.getOutputStream());

            outStream.writeObject(Command.CMD_DELETE);
            outStream.writeObject(hash);
            outStream.close();
            server.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
