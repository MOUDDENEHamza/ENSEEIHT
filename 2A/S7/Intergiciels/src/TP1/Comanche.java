import java.net.*;
import java.io.*;


public class Comanche implements Runnable {
	private Socket s;
	public Comanche (Socket s) { this.s = s; }
	
	public static void main (String[] args) throws IOException {
		ServerSocket s = new ServerSocket(Integer.parseInt(args[0]));
		while (true) { new Thread(new Comanche(s.accept())).start(); }
	}

	public void run () {
		try {
			InputStreamReader in = new InputStreamReader(s.getInputStream());
			PrintStream out = new PrintStream(s.getOutputStream());
			String rq = new LineNumberReader(in).readLine();
			System.out.println(rq);
			if (rq.startsWith("GET ")) {
				File f = new File(rq.substring(5, rq.indexOf(' ', 4)));
				if (f.exists() && !f.isDirectory()) {
					InputStream is = new FileInputStream(f);
					byte[] data = new byte[is.available()];
					is.read(data);
					is.close();
					String s = new String(data);
					out.print("HTTP/1.0 200 OK\n\n"+s);
				} else {
					out.print("HTTP/1.0 404 Not Found\n\n <html>Document not found.</html>");
				}
			}
			out.close();
			s.close();
		} catch (IOException ex) {
			ex.printStackTrace();
		}
	}
}
