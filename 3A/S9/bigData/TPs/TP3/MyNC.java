import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Scanner;

public class MyNC {
	
	public static void main(String args[]) {
			
			try {
				ServerSocket ss = new ServerSocket(9999);
				Socket s = ss.accept();
				System.out.println("received connection");
					
				OutputStream os = s.getOutputStream();
				PrintWriter pw = new PrintWriter(os);
				Scanner input = new Scanner(System.in);
				while (input.hasNext()) {
					String line = input.nextLine();
					pw.println(line);
					pw.flush();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
				
	}
}
