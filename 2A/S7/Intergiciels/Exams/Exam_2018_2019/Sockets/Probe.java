import java.util.*;
import java.io.*;
import java.net.*;

public class Probe {
	
	public static void main (String[] args) {
		try {
			Socket c = new Socket("localhost",9999);
			ObjectOutputStream oos = new ObjectOutputStream (c.getOutputStream());
			Random rand = new Random();
			oos.writeObject(rand.nextInt(50));
			c.close();
		} catch (Exception e) {
			System.out.println("An error has occurred ...");
		}
	}
}
