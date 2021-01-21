import java.net.*;
import java.io.*;

public class Server {

	public static void main (String[] args) {
		try {
			int average = 0;
			int count = 0;

			ServerSocket s;
			int port = 9999;
			s = new ServerSocket(port);
			System.out.println("Server ready ...");

			while (true) {
				count ++;
				Thread t = new Thread(new Slave(s.accept(), average, count));
				t.sleep(1000);
				t.start();
			}
		} catch (Exception e) {
			System.out.println("An error has occurred ...");
		}
	}
}
