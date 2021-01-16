import java.io.*;
import java.net.Socket;
import java.util.Random;

public class Slave extends Thread {
    
    Socket input;
    static String hosts[] = {"localhost", "localhost"};
    static int ports[] = {8081,8082};
    static int nbHosts = 2;
    static Random rand = new Random();

    public Slave(Socket s) {
        this.input = s;
    }
    
    public void run() {
        try {
            int i = rand.nextInt(nbHosts);
            Socket output = new Socket(hosts[i], ports[i]);
            
            InputStream client_in_stream = input.getInputStream();
            OutputStream client_out_stream = input.getOutputStream();
            
            InputStream srv_in_stream = output.getInputStream();
	  		OutputStream srv_out_stream = output.getOutputStream();
	  	
	
            byte[] buffer = new byte[8192];

            int bytesRead = client_in_stream.read(buffer);
			srv_out_stream.write(buffer, 0, bytesRead);
            
            bytesRead = srv_in_stream.read(buffer);
			client_out_stream.write(buffer, 0, bytesRead);
            
            output.close();
        } catch (Exception e) {
            System.out.println("An error has occurred ...");
        }
    }
}