import java.net.*;
import java.io.*;

public class Slave implements Runnable {
        Socket accept;
        int a, b;
        public Slave(Socket s, int average, int count) {
                this.accept = s;
                this.a = average;
                this.b = count;
        }

        public void run() {
                try {
			ObjectInputStream ois = new ObjectInputStream(this.accept.getInputStream());
                        int load = (int) ois.readObject();
                        System.out.println("Old Average = "+ a);
			System.out.println("received load = "+ load);
			System.out.println("New average : "+ ((a + load) / b) + "\n");
                        this.accept.close();
                } catch (Exception e) {
                        System.out.println("An error has occurred ...");
                }
        }
}

