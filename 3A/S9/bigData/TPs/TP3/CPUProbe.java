

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Random;

public class CPUProbe {
	
	public static void main (String args[]) {
		
		Random rand = new Random();
				
			try {
				
				ServerSocket ss = new ServerSocket(9999);
				
				while (true) {
					Socket s = ss.accept();
					System.out.println("received connection");
					
					OutputStream os = s.getOutputStream();
					PrintWriter pw = new PrintWriter(os);
					
					while (true) {
						
						for (int i=0; i<10; i++) {
							String node = "node"+i;
							String cpu = ""+rand.nextInt(101);
							System.out.println("write "+node+" "+cpu);
							pw.write(node+" "+cpu+"\n");
							pw.flush();
						}
						
						Thread.sleep(1000);
					}
					
				}
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			catch (InterruptedException e2) {
				e2.printStackTrace();
			}
			
	}

}
