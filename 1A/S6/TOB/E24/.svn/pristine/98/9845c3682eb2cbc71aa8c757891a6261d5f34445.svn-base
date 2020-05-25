package general;
import employee.*;
import customer.*;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import customer.Customer;
import customer.Menu;
import customer.MenuSwing;

import javax.imageio.ImageIO;
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
	
	//Swing attributes
	JFrame windowLog;
	JLabel l1;
	JTextField text;
	JLabel l2;
	JPasswordField passwd;
	JButton b, guest, signup,  bFrench, bEnglish, exit;
	private Image imgFrench, imgEnglish;
    private ImageIcon iconFrench, iconEnglish;
	private JFrame window;
	
	private String lang,signinerr;
	boolean IsEmployee;
	Employee Employee;
	Customer Customer;
	
	//Button listeners
	private final ActionListener B_Submit = new Submit();
	private final ActionListener B_Guest = new asGuest();
	private final ActionListener B_SignUp = new signUp();
	private final ActionListener B_Exit = new Exit();

	/**
	 * @author Hamza Moudenne & Younes Saoudi
	 * Constructor of login side
	 */
	public SignIn(JFrame window, String lg) {
		//Choosing a language
		this.window = window;
		this.lang=lg;
		GUI log = new GUI();
		JSONParser parser = new JSONParser();
		String signin = "";
		String usrn = "";
		String psw = "";
		this.signinerr = "";
		String ex = "";
		String asguest = "";
		String sgnup = "";
		String login = "";
		String file = "data/langueEn.json";
        try {
        	if (lang.equals("fr")) {
        		file = "data/langueFr.json";
        	}
            JSONArray lang = (JSONArray) parser.parse(new FileReader(file));

            for (Object word : lang) {
				JSONObject msg = (JSONObject) word;
				signin = (String) msg.get("signIn");
				psw = (String) msg.get("password");
				usrn = (String) msg.get("username");
				signinerr = (String) msg.get("signInErr");
				ex = (String) msg.get("exit");
				asguest = (String) msg.get("asGuest");
				sgnup = (String) msg.get("signup");
				login = (String) msg.get("login");				
				}
        } catch (FileNotFoundException e) {
    			e.printStackTrace();
    		} catch (IOException e) {
    			e.printStackTrace();
    		} catch (ParseException e) {
    			e.printStackTrace();
    		} catch (NumberFormatException e) {
    			System.out.print(true);
    		} catch (Exception e) {
    		}
		
    	//Setting the frame size
		Dimension dim = Toolkit.getDefaultToolkit().getScreenSize();
		this.windowLog = log.createWindow(signin, 600*dim.width/1536, 450*dim.height/864);
		int width = this.windowLog.getSize().width;
		int height = this.windowLog.getSize().height;
		this.windowLog.getContentPane().setBackground(new Color(196,160,214));
		this.windowLog.setLocation(dim.width/2-this.windowLog.getSize().width/2, dim.height/2-this.windowLog.getSize().height/2);
		
		//Creating JLabels
		this.l1 = log.createLabel(usrn, 200*dim.width/1536, 60*dim.height/864, dim.width*150/1536, 30*dim.height/864);
		this.text = log.createText(200*dim.width/1536, 95*dim.height/864, dim.width*200/1536, 30*dim.height/864, 32);
		this.l2 = log.createLabel(psw, 200*dim.width/1536, 135*dim.height/864, dim.width*150/1536, 30*dim.height/864);
		this.passwd = log.createPasswd(200*dim.width/1536, 165*dim.height/864, dim.width*200/1536, 30*dim.height/864);
		this.signup = log.createButton(sgnup, 190*dim.width/1536, 235*dim.height/864, dim.width*105/1536, 30*dim.height/864, Color.BLACK, Color.WHITE);
		this.guest = log.createButton(asguest, 190*dim.width/1536, 280*dim.height/864, dim.width*220/1536, 30*dim.height/864, Color.WHITE, Color.BLACK);
		this.b = log.createButton(login, 305*dim.width/1536, 235*dim.height/864, dim.width*105/1536, 30*dim.height/864, new Color(152, 206, 224), Color.WHITE);
		this.exit = log.createButton(ex, 190*dim.width/1536, 325*dim.height/864, dim.width*220/1536, 30*dim.height/864, new Color(220, 53, 69), Color.WHITE);
		
		//Setting up the fonts
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
		
		
		//Adding the language flag buttons
		try {
			this.imgEnglish = ImageIO.read(new File("icons/englishIcon.png")).getScaledInstance(30, 15,Image.SCALE_SMOOTH);
			this.imgFrench = ImageIO.read(new File("icons/frenchIcon.jpg")).getScaledInstance(30, 15,Image.SCALE_SMOOTH);
		} catch (IOException e) {
			e.printStackTrace();
		}

		this.bFrench  = log.createButton("", width*9/10, 30*height/864, 30, 15, null, null);
		this.bEnglish = log.createButton("", width*8/10  + 55*width/1536, 30*height/864, 30, 15, null, null);

		this.iconFrench = new ImageIcon(imgFrench);
		this.iconEnglish = new ImageIcon(imgEnglish);

		this.bFrench.setIcon(iconFrench);
		this.bEnglish.setIcon(iconEnglish);
		
		//Adding JComponents to JFrame
		this.windowLog.add(this.bFrench);
		this.windowLog.add(this.bEnglish);
		this.windowLog.add(l1);
		this.windowLog.add(text);
		this.windowLog.add(l2);
		this.windowLog.add(passwd);
		this.windowLog.add(b);
		this.windowLog.add(guest);
		this.windowLog.add(signup);
		this.windowLog.add(exit);
		
		//Adding action listeners
		b.addActionListener(B_Submit);
		guest.addActionListener(B_Guest);
		signup.addActionListener(B_SignUp);
		exit.addActionListener(B_Exit);
		
		//Adding a key listener to log in when the user hits the Enter key
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
		
		//Adding action listeners to the language flag buttons
		bFrench.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				//Restart the application in French (only for customers)
				windowLog.dispose();
				window.dispose();
				new Home("fr");
			}
		});
		
		bEnglish.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				//Restart the application in English
				windowLog.dispose();
				window.dispose();
				new Home("en");
			}
			
		});

		windowLog.setVisible(true);
	}
	
	/**
	 * Leads the user to his corresponding interface if his credentials are correct
	 */
	public void signin() {
		//If the credentials are correct
		if (checkCredentials(text.getText(), new String(passwd.getPassword()))) {
			//and the user is an employee
			if(IsEmployee) {
				new EmployeeInterface(Employee); //lead the employee to his Employee Interface
			} else {
				//It is a customer
				Menu menu = new Menu(lang);
				Choix choix = new Choix();
				new MenuSwing(menu, choix, Customer,lang); //Customer Interface
			}

			windowLog.dispose();
			window.dispose();

		} else {
			//Wrong credentials!
			JOptionPane.showMessageDialog(windowLog,signinerr);
		}
	}

	/**
	 * Checks the credentials typed by the user
	 * @param ID The username of the user
	 * @param passwd The password of the user
	 * @return
	 */
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
				//Import loyalty points if the user is a customer
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
				
				//Is the user an employee?
				EmployeeRank Rank = EmployeeRank.Null;
				if (IsEmployee) {
					Rank = EmployeeRank.valueOf(Function);
				}
				
				String UserID = (String) usr.get("UserID");
				Employee = new Employee((String)usr.get("First name"),
						(String) usr.get("Last name"), UserID, Rank);
				Customer = new Customer((String)usr.get("First name"),
						(String) usr.get("Last name"),UserID);
				
				//Create the customer object
				Customer.setID(UserID);
				Customer.setFunction(EmployeeRank.Null);
				Customer.setEmail(email);
				Customer.setUsername(username);
				Customer.setPassword(Security.decrypt(password));
				Customer.setBirthDate(birthDate);
				Customer.setCreationDate(creationDate);
				Customer.setGender( User.Gender.valueOf(gender) );
				Customer.setLoyaltyPoints(LoyaltyPoints);
				
				//Create the employee object
				Employee.setID(UserID);
				Employee.setFunction(Rank);
				Employee.setEmail(email);
				Employee.setUsername(username);
				Employee.setPassword(Security.decrypt(password));
				Employee.setBirthDate(birthDate);
				Employee.setCreationDate(creationDate);
				Employee.setGender( User.Gender.valueOf(gender) );
				
				//If the credentials are right
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
	
	/**
	 * Log in as guest
	 *
	 */
	public class asGuest implements ActionListener{
		public void actionPerformed(ActionEvent e) {
			Menu menu = new Menu(lang);
			Choix choix = new Choix();
			new MenuSwing(menu, choix, new Customer("NULL","NULL",""),lang);
			windowLog.dispose();
			window.dispose();
		}
	}
	
	/**
	 * Create an account
	 *
	 */
	public class signUp implements ActionListener{
		public void actionPerformed(ActionEvent e) {
			windowLog.setVisible(false);
			new SignUp(new Customer("NULL","NULL"),lang);
		}
	}
	
	/**
	 * Shutdown the application
	 *
	 */
	public class Exit implements ActionListener{
		public void actionPerformed(ActionEvent e) {
			System.exit(0);
		}
	}
}