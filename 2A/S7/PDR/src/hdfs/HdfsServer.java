package hdfs;

import org.yaml.snakeyaml.DumperOptions;
import org.yaml.snakeyaml.Yaml;
import java.io.*;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.UnknownHostException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;
import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class HdfsServer {
    public static final String metadataFileName = ".metadata.yaml";

    private Register nameProviderRegistry;
    private HashMap<String, ChunkMetadata> storedChunk;
    private String dataDirectory;
    private ServerRecord record;
    private Yaml yaml;

    public HdfsServer (Register nameProviderRegistry, String rootDataDirectory, String serverName) {
        this.nameProviderRegistry = nameProviderRegistry;
        this.storedChunk = new HashMap<>();
        this.dataDirectory = rootDataDirectory + "/" + serverName + "/";


        DumperOptions options = new DumperOptions();
        options.setDefaultFlowStyle(DumperOptions.FlowStyle.BLOCK);
        //options.setPrettyFlow(true);
        this.yaml = new Yaml(options);

        try {
            Files.createDirectories(Paths.get(this.dataDirectory));
        } catch (IOException e) {
            e.printStackTrace();
        }

        try {
            this.record = new ServerRecord(serverName, InetAddress.getLocalHost(), nameProviderRegistry.getAvailablePort());
        } catch (UnknownHostException | RemoteException e) {
            e.printStackTrace();
        }

        System.out.println("Authentication to the Name Provider...");
        this.serverAuthenticationToNameProvider();
        System.out.println("Authentication done.");

        loadStoredChunks();
    }

    public void loadStoredChunks() {
        System.out.print("Loading chunks... ");
        try {
            InputStream is = new FileInputStream(dataDirectory + metadataFileName);
            storedChunk = (HashMap<String, ChunkMetadata>) yaml.load(is);
            is.close();
        } catch (FileNotFoundException e) {
            System.out.println("No metadata file found... Skipping loading.");
            return;
        } catch (IOException e) {
            e.printStackTrace();
        }

        for (Map.Entry<String, ChunkMetadata> p : storedChunk.entrySet()) {
            serverRegisterChunkToNameProvider(p.getValue(), p.getKey());
        }
        System.out.println("Done.");
    }

    public void saveChunksMetadata() {
        try {
            FileWriter writer = new FileWriter(dataDirectory + metadataFileName);
            yaml.dump(storedChunk, writer);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void writeToServer (Socket client, ObjectInputStream ois) throws IOException, NoSuchAlgorithmException, ClassNotFoundException {
        System.out.println("Writing started.");

        MessageDigest sha256Digest = MessageDigest.getInstance("SHA-256");

        FileOutputStream fos = new FileOutputStream(dataDirectory + ".tmp");

        ChunkMetadata chunkMetadata = (ChunkMetadata) ois.readObject();
        int bufferSize = (int) ois.readObject();

        byte buffer[] = new byte[bufferSize];
        long chunkSize = chunkMetadata.getSizeBytes();
        long received = 0;
        int receivedLoop;
        InputStream bis = client.getInputStream();


        while (received + bufferSize <= chunkSize) {
            receivedLoop = bis.read(buffer);
            fos.write(buffer,0, receivedLoop);
            sha256Digest.update(buffer, 0, receivedLoop);
            received += receivedLoop;
        }

        int remainingBytes = (int) (chunkSize - received);

        while (remainingBytes > 0) {
            receivedLoop = bis.read(buffer, 0, remainingBytes);
            sha256Digest.update(buffer, 0, receivedLoop);
            fos.write(buffer, 0, receivedLoop);
            remainingBytes -= receivedLoop;
        }

        ObjectOutputStream oos = new ObjectOutputStream(client.getOutputStream());
        oos.writeObject(Command.END_OF_TRANSMISSION);

        String hash = ChunkMetadata.bytesToHex(sha256Digest.digest());

        new File(dataDirectory + ".tmp").renameTo(new File(dataDirectory + hash));
        fos.close();

        storedChunk.put(hash, new ChunkMetadata(chunkMetadata));
        System.out.println(storedChunk);

        saveChunksMetadata();

        nameProviderRegistry.addChunk(this.record, chunkMetadata, hash);
        System.out.println("Writing ended successfully.");
    }

    public void readFromServer(Socket socket, ObjectInputStream ois) throws IOException, ClassNotFoundException {
        System.out.println("Reading started.");
        String hashToSend = (String) ois.readObject();
        if (!storedChunk.containsKey(hashToSend)) {
            System.out.println("The client tried to read a chunk which is not stored here");
            return;
        }
        FileInputStream fis = new FileInputStream(dataDirectory + hashToSend);
        ObjectOutputStream oos = new ObjectOutputStream(socket.getOutputStream());
        ArrayList<ChunkMetadata> chunkMetadataList = new ArrayList<>();
        chunkMetadataList.add(storedChunk.get(hashToSend));
        int bufferSize = ChunkMetadata.crumbSize(chunkMetadataList);
        long chunkSize = chunkMetadataList.get(0).getSizeBytes();
        oos.writeObject(bufferSize);
        oos.writeObject(chunkSize);


        byte buffer[] = new byte[bufferSize];
        long sent = 0;
        int sentloop = 0;
        OutputStream bos = socket.getOutputStream();

        while (sent + bufferSize <= chunkSize) {
            sentloop = fis.read(buffer);
            bos.write(buffer, 0, sentloop);
            sent += sentloop;
        }

        int remainingBytes = (int) (chunkSize - sent);

        while (remainingBytes > 0) {
            sentloop = fis.read(buffer, 0, remainingBytes);
            bos.write(buffer, 0, sentloop);
            remainingBytes -= sentloop;
        }

        Command c = (Command) ois.readObject();

        if (c.equals(Command.END_OF_TRANSMISSION)) {
            socket.close();
        } else {
            throw new IOException("Error while communicating with a HDFS server");
        }
    }

    public void serverAuthenticationToNameProvider() {
        try {
            boolean success = nameProviderRegistry.addServer(record);
            if (!success) {
                System.out.println("Registration failed... Aborting...");
                System.exit(1);
            }
        } catch (RemoteException e) {
            e.printStackTrace();
        }
    }

    public void serverRegisterChunkToNameProvider(ChunkMetadata chunk, String hash) {
        System.out.println("Registering chunk " + hash + " to the Name Provider.");
        try {
            nameProviderRegistry.addChunk(this.record, chunk, hash);
        } catch (RemoteException e) {
            System.out.println("\nImpossible to register new Chunk in the Name Provider...");
            System.exit(1);
        }
        System.out.println("Registration done.");
    }

    private void deleteChunkServer(String hashToDelete) {
        System.out.println("Deleting chunk " + hashToDelete + " from the server...");
        System.out.print("Deleting file from Name Provider...");
        if (!storedChunk.containsKey(hashToDelete)) {
            System.out.println("The given hash doesn't exist... Cancelling...");
            return;
        }

        try {
            nameProviderRegistry.deleteChunk(storedChunk.get(hashToDelete).getFileName(), this.record);
        } catch (RemoteException e) {
            e.printStackTrace();
        }
        System.out.println("Done.");

        System.out.println("Trying to delete chunk from disk...");

        new File(dataDirectory + hashToDelete).delete();

        System.out.println("File deleted successfully.");

        storedChunk.remove(hashToDelete);

        saveChunksMetadata();
        System.out.println("File deleted.");
    }

    public void start() {
        try {
            System.out.println("Address : " + InetAddress.getLocalHost() +" | Port : " + this.record.getPort());
        } catch (UnknownHostException e) {
            e.printStackTrace();
        }
        ServerSocket serverSocket = null;

        try {
            serverSocket = new ServerSocket(record.getPort());
        } catch (IOException e) {
            e.printStackTrace();
        }

        Socket communicationSocket;
        Command commandToExecute;
        ObjectInputStream ois;

        System.out.println("=== Server Started. ===");
        while (true) {
            try {
                System.out.println("Waiting for a request...");
                communicationSocket = serverSocket.accept();
                System.out.println("A new connection has been acquired.");
                ois = new ObjectInputStream(communicationSocket.getInputStream());
                commandToExecute = (Command) ois.readObject();

                switch(commandToExecute) {
                    case CMD_WRITE:
                        System.out.println("A request to write has been received.");
                        writeToServer(communicationSocket, ois);
                        break;
                    case CMD_READ:
                        System.out.println("A request to read has been received.");
                        readFromServer(communicationSocket, ois);
                        break;
                    case CMD_DELETE:
                        System.out.println("A request to delete has been received.");
                        deleteChunkServer((String) ois.readObject());
                        break;
                }
                communicationSocket.close();
            } catch (IOException | ClassNotFoundException e) {
                e.printStackTrace();
            } catch (NoSuchAlgorithmException e) {
                e.printStackTrace();
            }
        }
    }

    public static void main(String args[]) {

        if (args.length < 1) {
            System.out.println("Usage : java HdfsServer [Server_Name]");
            System.out.println("Optional: add the NameProvider address at the end of the command if it is not local.");
            System.exit(1);
        }

        try {
            System.out.println("=== Server Startup ===");
            Registry registry;
            if (args.length == 1) {
                registry = LocateRegistry.getRegistry(NameProvider.NAME_PROVIDER_PORT);
            } else {
                registry = LocateRegistry.getRegistry(args[1], NameProvider.NAME_PROVIDER_PORT);
            }
            HdfsServer server = new HdfsServer((Register) registry.lookup("//localhost:" + NameProvider.NAME_PROVIDER_PORT + "/ServerRegistry"), "serverData", args[0]);
            server.start();
        } catch (RemoteException | NotBoundException e) {
            System.out.println("Impossible to connect to the NameProvider...");
            System.exit(1);
        }
    }
}
