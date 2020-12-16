package ordo;

import java.rmi.Remote;
import java.rmi.RemoteException;

import map.Mapper;
import formats.Format;

/**
 * Launch the demon on each machine using RMI to communicate between the client and the demon
 *
 * @author Hamza Mouddene
 * @version 1.0
 */
public interface Worker extends Remote {

    /**
     * Launch the demon on each machine using RMI to communicate between the client and the demon
     *
     * @param m      the map to apply on the chuck
     * @param reader a file in a given format containg the chunk
     * @param writer the result fine where the results will be written
     * @param cb     the reminder that prevents job that a task is done
     * @throws RemoteException that may occur during the execution of a remote method call
     */
    void runMap(Mapper m, Format reader, Format writer, CallBack cb) throws RemoteException;

}
