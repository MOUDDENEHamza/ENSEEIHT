/* une PROPOSITION de squelette, incomplète et adaptable... */

package hdfs;

import formats.*;
import java.io.*;
import java.rmi.RemoteException;
import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;
import java.util.*;
import java.util.concurrent.*;

public class HdfsClient {
    private static Registry registry;
    private static Request nameProviderRequests;
    public final static String BASE_DIR = "";

    private static void usage() {
        System.out.println("Usage: java HdfsClient read <file>");
        System.out.println("Usage: java HdfsClient write <line|kv> <file>");
        System.out.println("Usage: java HdfsClient delete <file>");
        System.out.println("Optional: add the NameProvider address at the end of the command if it is not local.");
    }

    public static void HdfsDelete(String hdfsFname) {
        System.out.println("Asking hashes to delete to the Name Provider.");
        HashMap<String, ArrayList<ServerRecord>> toDelete = null;
        try {
            toDelete = nameProviderRequests.askDeleting(hdfsFname);
        } catch (RemoteException e) {
            e.printStackTrace();
        }

        if (toDelete == null) {
            System.out.println("The file you are trying to delete probably doesn't exist in this hdfs cluster.");
            System.exit(1);
        }
        System.out.println("Hashes and corresponding servers acquired.");

        ExecutorService threadPool = Executors.newFixedThreadPool(Runtime.getRuntime().availableProcessors());
        ArrayList<Future<?>> threadList = new ArrayList<>();

        System.out.println("Starting file deletion...");
        for (Map.Entry<String, ArrayList<ServerRecord>> p : toDelete.entrySet()) {
            for (ServerRecord sr : p.getValue()) {
                threadList.add(threadPool.submit(new ThreadDeleteChunks(p.getKey(), sr)));
            }
        }
        System.out.println("Asking threads started.");

        for (Future<?> chunk : threadList) {
            try {
                chunk.get();
            } catch (InterruptedException | ExecutionException e) {
                e.printStackTrace();
            }
        }

        threadPool.shutdown();
        System.out.println("Delete ended successfully.");
    }

    public static void HdfsWrite(Format.Type fmt, String localFSSourceFname, int repFactor) throws IOException, ExecutionException, InterruptedException {
        ArrayList<ChunkMetadata> chunksMetadata = null;
        ArrayList<ServerRecord> servers = null;


        int nbAvailableServers = 0;

        nbAvailableServers = nameProviderRequests.getNumberOfServers();

        if (nbAvailableServers == 0) {
            System.out.println("No server available on this HDFS cluster.");
            return;
        }

        chunksMetadata = ChunkMetadata.chunkFile(localFSSourceFname, fmt,
                nbAvailableServers);

        servers = nameProviderRequests.askWriting(chunksMetadata);

        if (servers == null) {
            System.out.println("This file is already written in this hdfs server... Aborting...");
            return;
        }

        int crumbSize = ChunkMetadata.crumbSize(chunksMetadata);

        ExecutorService threadPool = Executors.newFixedThreadPool(Runtime.getRuntime().availableProcessors());
        ArrayList<Future<?>> threadList = new ArrayList<>();

        System.out.print("Starting upload... ");

        // Adding tasks to the thead pool
        for (int i = 0; i < chunksMetadata.size(); ++i) {
            threadList.add(threadPool.submit(new ThreadWriteChunks(chunksMetadata.get(i), crumbSize, servers.get(i))));
        }
        System.out.println("Upload started.");

        // Waiting every thread to finish
        for (Future<?> chunk : threadList) {
            chunk.get();
        }
        System.out.println("Upload done.");

        threadPool.shutdown();
        System.out.println("Write ended successfully.");
    }


    public static void HdfsRead(String hdfsFname, String localFSDestFname) throws IOException, ExecutionException, InterruptedException {
        System.out.println("Reading started");
        ArrayList<Pair<Integer, Pair<String, ServerRecord>>> readRequest = null;
        System.out.print("Requesting chunks location to the Name Provider... ");
        readRequest = nameProviderRequests.askReading(hdfsFname);

        if (readRequest == null) {
            System.out.println("The given file to read doesn't exist on this hdfs cluster.");
            return;
        }

        Collections.sort(readRequest, new Comparator<>() {
            @Override
            public int compare(Pair<Integer, Pair<String, ServerRecord>> t1, Pair<Integer, Pair<String, ServerRecord>> t2) {
                return t1.getLeft() - t2.getLeft();
            }
        });

        System.out.println("Done.");

        if (readRequest == null) {
            System.out.println("The Name Provider was not able to find servers able to serve the file. Please check Name Provider's logs for more details");
            System.exit(1);
        }

        System.out.println("Chunk list has been acquired from the Name Provider and sorted.");

        ExecutorService threadPool = Executors.newFixedThreadPool(Runtime.getRuntime().availableProcessors());
        ArrayList<Future<String>> futureChunks = new ArrayList<>();


        System.out.println("Starting file download...");
        for (Pair<Integer, Pair<String, ServerRecord>> p : readRequest) {
            System.out.println("asking for the chunk with hash " + p.getRight().getLeft());
            futureChunks.add(threadPool.submit(new ThreadReadChunks(p.getRight().getLeft(), BASE_DIR, p.getRight().getRight())));
        }

        FileOutputStream fos = null;
        FileInputStream fis = null;
        String chunkLocation;
        for (int i=0; i<readRequest.size(); ++i) {
            chunkLocation = futureChunks.get(i).get();
            if (i == 0) {
                new File(chunkLocation).renameTo(new File (localFSDestFname));
                fos = new FileOutputStream(localFSDestFname, true);
            } else {
                if (chunkLocation == null) {
                    System.out.println("One of the servers was not available. Please verify the hdfs cluster...");
                    return;
                }
                fis = new FileInputStream(chunkLocation);
                byte buffer[] = new byte[2048];
                int read;
                while ((read = fis.read(buffer)) > 0) {
                    fos.write(buffer, 0, read);
                }
                fis.close();
                new File("." + readRequest.get(i).getRight().getLeft() + ".tmp").delete();
            }
        }

        fos.close();
        threadPool.shutdown();
        System.out.println("Reading ended successfully");
    }

    public static void HdfsList() {
        try {
            System.out.println("=== Hdfs List ===");
            System.out.print(nameProviderRequests.askList());
            System.out.println("=================");
        } catch (RemoteException e) {
            System.out.println("Impossible to list files from hdfs filesystem.");
        }
    }

    public static void main(String[] args) {
        // java HdfsClient <read|write> <line|kv> <file>
        try {
            if (args.length < 1) {
                System.out.println("args = " + args.length);
                usage();
                return;
            }

            if ((args[0].equals("write") || args[0].equals("read")) && args.length > 3) {
                registry = LocateRegistry.getRegistry(args[3], NameProvider.NAME_PROVIDER_PORT);
            } else if (!(args[0].equals("write") || args[0].equals("read")) && args.length > 2) {
                registry = LocateRegistry.getRegistry(args[2], NameProvider.NAME_PROVIDER_PORT);
            } else {
                registry = LocateRegistry.getRegistry(NameProvider.NAME_PROVIDER_PORT);
            }

            nameProviderRequests = (Request) registry.lookup("//localhost:" + NameProvider.NAME_PROVIDER_PORT + "/ClientRequest");

            switch (args[0]) {
                case "read":
                    if (args.length < 3) {
                        usage();
                        return;
                    }
                    HdfsRead(args[1], args[2]);
                    break;
                case "delete":
                    HdfsDelete(args[1]);
                    break;
                case "write":
                    Format.Type fmt;
                    if (args.length < 3) {
                        usage();
                        return;
                    }
                    if (args[1].equals("line")) fmt = Format.Type.LINE;
                    else if (args[1].equals("kv")) fmt = Format.Type.KV;
                    else {
                        usage();
                        return;
                    }
                    HdfsWrite(fmt, args[2], 1);
                    break;
                case "list":
                    HdfsList();
                    break;
            }
        } catch (ArrayIndexOutOfBoundsException e) {
            usage();
        } catch (RemoteException e) {
            System.out.println("Impossible to find the Name Provider...");
        } catch (FileNotFoundException e) {
            System.out.println("The given file doesn't exist.");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}