import java.net.*;

public class Proxy {

	public static void main(String[] args) {
		try {
			ServerSocket serverProxy = new ServerSocket(8080);
			System.out.println("Proxy Server ready in port 8080 ...");
			while (true) {
				Slave s = new Slave(serverProxy.accept());
				s.start();
				serverProxy.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
