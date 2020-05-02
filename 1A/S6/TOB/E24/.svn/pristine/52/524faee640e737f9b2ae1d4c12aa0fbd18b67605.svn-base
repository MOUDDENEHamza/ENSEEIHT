import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.security.GeneralSecurityException;


public class SignIn {

	JFrame windowLog;
	JLabel l1;
	JTextField text;
	JLabel l2;
	JPasswordField passwd;
	JButton b, guest, signup, exit;
	boolean IsEmployee;
	Employee Employee;
	Customer Customer;
	private final ActionListener B_Submit = new Submit();
	private final ActionListener B_Guest = new asGuest();
	private final ActionListener B_SignUp = new signUp();
	private final ActionListener B_Exit = new Exit();
	private JFrame window;

	/**
	 * @author Hamza Moudenne & Younes Saoudi
	 * Constructor of login side
	 */
	public SignIn(JFrame window) {
		this.window = window;
		GUI log = new GUI();

		Dimension dim = Toolkit.getDefaultToolkit().getScreenSize();
		this.windowLog = log.createWindow("Sign In", 600*dim.width/1536, 450*dim.height/864);
		this.windowLog.getContentPane().setBackground(new Color(196,160,214));
		this.windowLog.setLocation(dim.width/2-this.windowLog.getSize().width/2, dim.height/2-this.windowLog.getSize().height/2);

		this.l1 = log.createLabel("Username", 200*dim.width/1536, 60*dim.height/864, dim.width*80/1536, 30*dim.height/864);
		this.text = log.createText(200*dim.width/1536, 95*dim.height/864, dim.width*200/1536, 30*dim.height/864, 32);
		this.l2 = log.createLabel("Password", 200*dim.width/1536, 135*dim.height/864, dim.width*80/1536, 30*dim.height/864);
		this.passwd = log.createPasswd(200*dim.width/1536, 165*dim.height/864, dim.width*200/1536, 30*dim.height/864);
		this.signup = log.createButton("Sign Up", 200*dim.width/1536, 235*dim.height/864, dim.width*95/1536, 30*dim.height/864, Color.BLACK, Color.WHITE);
		this.guest = log.createButton("Continue without logging in", 200*dim.width/1536, 280*dim.height/864, dim.width*200/1536, 30*dim.height/864, Color.WHITE, Color.BLACK);
		this.b = log.createButton("Log In", 305*dim.width/1536, 235*dim.height/864, dim.width*95/1536, 30*dim.height/864, new Color(152, 206, 224), Color.WHITE);
		this.exit = log.createButton("Exit", 200*dim.width/1536, 325*dim.height/864, dim.width*200/1536, 30*dim.height/864, new Color(220, 53, 69), Color.WHITE);

		try {
			GraphicsEnvironment ge = GraphicsEnvironment.getLocalGraphicsEnvironment();
			Font Museo_300 = Font.createFont(Font.TRUETYPE_FONT, new File("fonts/Museo Slab W00 300.ttf")).deriveFont(15f);
			ge.registerFont(Museo_300);
			Font Avenir_Light = Font.createFont(Font.TRUETYPE_FONT, new File("fonts/avenir-light.otf")).deriveFont(13f);
		    ge.registerFont(Avenir_Light);
			this.l1.setFont(Museo_300);
			this.l2.setFont(Museo_300);
			this.text.setFont(Museo_300);
			this.passwd.setFont(Museo_300);
			this.b.setFont(Avenir_Light);
			this.guest.setFont(Avenir_Light);
			this.exit.setFont(Avenir_Light);
			this.signup.setFont(Avenir_Light);
		} catch (IOException|FontFormatException e) {
			e.printStackTrace();
		}


		windowLog.add(l1);

		windowLog.add(text);

		windowLog.add(l2);

		windowLog.add(passwd);

		windowLog.add(b);
		windowLog.add(guest);
		windowLog.add(signup);
		windowLog.add(exit);
		b.addActionListener(B_Submit);
		guest.addActionListener(B_Guest);
		signup.addActionListener(B_SignUp);
		exit.addActionListener(B_Exit);
		KeyListener enterToLogIn = new KeyListener() {
			@Override
			public void keyPressed(KeyEvent e) {
				if (e.getKeyChar() == KeyEvent.VK_ENTER) {
					signin();
				}
			}
			public void keyReleased(KeyEvent e) {
				// nothing
			}
			public void keyTyped(KeyEvent e) {
				// nothing
			}

		};
		passwd.addKeyListener(enterToLogIn);
		text.addKeyListener(enterToLogIn);

		windowLog.setVisible(true);
	}

	public void signin() {
		if (checkCredentials(text.getText(), new String(passwd.getPassword()))) {
			if(IsEmployee) {
				new EmployeeInterface(Employee);
			} else {

				Menu menu = new Menu();
				Choix choix = new Choix();
				new MenuSwing(menu, choix, Customer);
			}

			windowLog.dispose();
			window.dispose();

		} else {
			JOptionPane.showMessageDialog(windowLog,"Wrong username or password.");
		}
	}


	@SuppressWarnings("static-access")
	public boolean checkCredentials(String ID, String passwd) {
		Security security = new Security();
		JSONParser parser = new JSONParser();
		try {
			JSONArray userList = (JSONArray) parser.parse(new FileReader("data/users.json"));

			for (Object user : userList) {
				JSONObject usr = (JSONObject) user;

				String username = (String) usr.get("Username");
				String password = (String) usr.get("Password");
				String birthDate =(String) usr.get("Date of Birth");
				String email     =(String) usr.get("E-Mail");
				String creationDate;
				long LoyaltyPointslong;
				int LoyaltyPoints = 0;
				creationDate=((String) usr.get("Created")).substring(0,10);
				try {
					LoyaltyPointslong = (long) usr.get("LoyaltyPoints");
					LoyaltyPoints = Math.toIntExact(LoyaltyPointslong);
				}catch(java.lang.NullPointerException e){
					//If the pointer is null, then it's because it's an employee, not a customer!
					//(Employees have no loyalty points)
				}
				String gender = (String) usr.get("Gender");
				IsEmployee = (!((String) usr.get("Function")).equals("Null"));
				String Function = (String) usr.get("Function");
				EmployeeRank Rank = EmployeeRank.Null;
				if (IsEmployee) {
					Rank = EmployeeRank.valueOf(Function);
				}
				String UserID = (String) usr.get("UserID");
				
				Employee = new Employee((String)usr.get("First name"),
						(String) usr.get("Last name"), UserID, Rank);
				Customer = new Customer((String)usr.get("First name"),
						(String) usr.get("Last name"),UserID);

				Customer.setID(UserID);
				Customer.setFunction(EmployeeRank.Null);
				Customer.setEmail(email);
				Customer.setUsername(username);
				Customer.setPassword(Security.decrypt(password));
				Customer.setBirthDate(birthDate);
				Customer.setCreationDate(creationDate);
				Customer.setGender( User.Gender.valueOf(gender) );
				Customer.setLoyaltyPoints(LoyaltyPoints);

				Employee.setID(UserID);
				Employee.setFunction(Rank);
				Employee.setEmail(email);
				Employee.setUsername(username);
				Employee.setPassword(Security.decrypt(password));
				Employee.setBirthDate(birthDate);
				Employee.setCreationDate(creationDate);
				Employee.setGender( User.Gender.valueOf(gender) );

				if (ID.equals(username) && passwd.equals(security.decrypt(password))) {
					return true;
				}
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		} catch (GeneralSecurityException e) {
			e.printStackTrace();
		}
		return false;
	}

	public class Submit implements ActionListener{
		public void actionPerformed(ActionEvent e) {
			signin();
		}
	}
	public class asGuest implements ActionListener{
		public void actionPerformed(ActionEvent e) {
			Menu menu = new Menu();
			Choix choix = new Choix();
			new MenuSwing(menu, choix, new Customer("NULL","NULL",""));
			windowLog.dispose();
			window.dispose();
		}
	}
	public class signUp implements ActionListener{
		public void actionPerformed(ActionEvent e) {
			windowLog.setVisible(false);
			new SignUp(new Customer("NULL","NULL"));
		}
	}
	public class Exit implements ActionListener{
		public void actionPerformed(ActionEvent e) {
			System.exit(0);
		}
	}
}