package pack;

import java.io.FileWriter;
import java.io.IOException;

public class AccountManager {

	public void createAccount(String login, String passwd) {
		try {
			FileWriter fw = new FileWriter("/tmp/accounts",true);
			fw.write(login+" "+passwd+"\n");
			fw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
