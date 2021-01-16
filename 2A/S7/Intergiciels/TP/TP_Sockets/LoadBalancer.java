import java.net.ServerSocket;

public class LoadBalancer {

    public static void main(String[] args) {
        try {
            ServerSocket loadBalancer;
            int port = 8080;

            loadBalancer = new ServerSocket(port);
            System.out.println("Load balancer Server ready in port 8080 ...");
            
            while (true) {
                Slave sl = new Slave(loadBalancer.accept());
                sl.start();
                loadBalancer.close();
            }
        } catch (Exception e) {
            System.out.println("An error has occurred ...");
        }
    } 
    
}