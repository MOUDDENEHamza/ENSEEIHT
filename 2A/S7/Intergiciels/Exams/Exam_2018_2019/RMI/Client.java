import java.rmi.*;

public class Client {

	public static void main(String[] args) {
		try {
 			CallBack cb = (CallBack) Naming.lookup("//localhost:8000/server");
			cb.handle(Integer.parseInt(args[0]));
 		} catch (Exception e) {
			System.out.println("error");
			e.printStackTrace();
		}	
	}
}
