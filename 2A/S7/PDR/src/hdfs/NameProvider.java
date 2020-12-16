package hdfs;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.rmi.RemoteException;
import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;
import java.util.ArrayList;
import java.util.HashMap;

public class NameProvider {
    public static final int NAME_PROVIDER_PORT = 5000;

    public static final int SERVER_PORT_MIN = 6000;
    public static final int SERVER_PORT_MAX = 7000;

    public HashMap<String, FileRecord> files;
    ArrayList<ServerRecord> servers;

    private Registry registry;
    private ServerRegistry serverRegistry;
    private ClientRequest clientRequest;

    public NameProvider() throws UnknownHostException {
        System.out.println("=== Name Provider Startup ===");
        System.out.println("Address : " + InetAddress.getLocalHost() +" | Port : " + NAME_PROVIDER_PORT);
        this.files = new HashMap<>();
        this.servers = new ArrayList<>();
        try {
            registry = LocateRegistry.createRegistry(NAME_PROVIDER_PORT);
            serverRegistry = new ServerRegistry(files, servers);
            clientRequest = new ClientRequest(files, servers);

            System.out.print("Opening Client Request Service... ");
            registry.rebind("//localhost:" + NAME_PROVIDER_PORT + "/ClientRequest", clientRequest);
            System.out.println("Done.");
            System.out.print("Opening Server Registry Service... ");
            registry.rebind("//localhost:" + NAME_PROVIDER_PORT + "/ServerRegistry", serverRegistry);
            System.out.println("Done.");

            System.out.println("=== Name Provider Started. ===");
        } catch (RemoteException e) {
            e.printStackTrace();
        }
    }

    public static void main(String args[]) throws UnknownHostException {
        NameProvider np = new NameProvider();
    }
}
