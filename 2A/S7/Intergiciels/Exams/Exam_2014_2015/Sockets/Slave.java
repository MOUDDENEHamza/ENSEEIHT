import java.net.*;
import java.io.*;

public class Slave extends Thread {

	Socket in;
	
	public Slave(Socket s) {
		this.in = s;
	}

	public void run() {
		try {
			Socket out = new Socket("localhost", 9000);

			InputStream iis = in.getInputStream();
			OutputStream ios = in.getOutputStream();
		       	
			InputStream ois = out.getInputStream();
                        OutputStream oos = out.getOutputStream();
			
			byte[] buffer = new byte[8192];

			int bytesRead = iis.read(buffer);
			oos.write(buffer, 0, bytesRead);

			bytesRead = ois.read(buffer);
                        ios.write(buffer, 0, bytesRead);

			out.close();	
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
