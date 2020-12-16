package ordo;

import formats.Format;
import map.Mapper;

import java.rmi.Naming;
import java.rmi.RemoteException;
import java.rmi.registry.LocateRegistry;
import java.rmi.server.UnicastRemoteObject;

/**
 * Realizes Worker interface that launch the demon on each machine using RMI to communicate between the client and the
 * demon
 *
 * @author Hamza Mouddene
 * @version 1.0
 */
public class WorkerImpl extends UnicastRemoteObject implements Worker {

    /**
     * Attributes of WorkerImpl class
     */
    static int port;            // The port of the worker
    static String url;          // The url of the worker

    /**
     * Constructor of WorkerImpl class that creates a worker
     *
     * @throws RemoteException that may occur during the execution of a remote method call
     */
    public WorkerImpl() throws RemoteException {
        // Get the url of the worker
        url = "//localhost:" + port + "/Worker";

        // Create registry then rebind
        try {
            LocateRegistry.getRegistry(port);
            Naming.rebind(url, this);
        } catch (Exception e) {
            try { // Registry not found
                LocateRegistry.createRegistry(port);
                Naming.rebind(url, this);
            } catch (Exception exception) {
                exception.printStackTrace();
            }
        }
    }

    @Override
    public void runMap(Mapper m, Format reader, Format writer, CallBack cb) throws RemoteException {
        // Open reader and writer
        reader.open(Format.OpenMode.R);
        writer.open(Format.OpenMode.W);

        // Launch map
        m.map(reader, writer);
        cb.taskDone();

        // Close reader and writer
        reader.close();
        writer.close();
    }

    /**
     * The main method of WorkerImpl class
     *
     * @param args contain the command line
     */
    public static void main(String[] args) throws RemoteException {
        // Check if the user give the port in the line command
        if (args.length == 0) {
            System.out.println("Usage : java WorkerImpl port");
            System.exit(1);
        }
        // Obtain the port number from args
        WorkerImpl.port = Integer.parseInt(args[0]);

        // Create worker
        new WorkerImpl();
    }

}
