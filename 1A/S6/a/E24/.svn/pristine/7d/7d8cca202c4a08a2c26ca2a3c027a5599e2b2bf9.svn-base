import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.swing.*;
import javax.swing.text.DateFormatter;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.*;
import java.security.GeneralSecurityException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;
import java.util.Random;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * The class that launchs the registration
 *
 * @author Hamza Moudenne & Younes Saoudi
 * @version 1.0
 */
public class SignUp implements ActionListener {

	JFrame windowLog;
	JLabel l1;
	JTextField text1;
	JLabel l2;
	JTextField text2;
	JLabel l3;
	JRadioButton r1;
	JRadioButton r2;
	ButtonGroup bg;
	JLabel l4;
	JTextField text4;
	JLabel l5;
	JPasswordField passwd;
	JLabel l6;
	JFormattedTextField dateTextField;
	JLabel l7;
	JTextField text7;
	JLabel l8;
	JTextField text8;
	JLabel l9;
	JPanel p10;
	JButton submit;
	JComboBox<String> comboBox = new JComboBox<String>();
	boolean correct_account;
	boolean High_Rank;
	Employee Creator;
	String verificationCode;

	/**
	 * Sign Up Constructor
	 * @param creator Is it an employee with a high enough rank who initiated the sign up procedure?
	 */
	@SuppressWarnings("deprecation")
	public SignUp(User creator) {

		if(creator.getFunction().ordinal() >= EmployeeRank.Manager.ordinal()) {
			this.High_Rank = true;
			this.Creator = (Employee) creator;
		}

		GUI regiseration = new GUI();

		this.windowLog = regiseration.createWindow("Sign up", 700, 750);
		this.windowLog.getContentPane().setBackground(new Color(152, 206, 224));
		Dimension dim = Toolkit.getDefaultToolkit().getScreenSize();
		this.windowLog.setLocation(dim.width/2-this.windowLog.getSize().width/2, dim.height/2-this.windowLog.getSize().height/2);



		this.l1 = regiseration.createLabel("First Name", 250, 60, 80, 30);
		this.text1 = regiseration.createText(250, 95, 200, 30, 32);

		this.l2 = regiseration.createLabel("Last name", 250, 135, 80, 30);
		this.text2 = regiseration.createText(250, 170, 200, 30, 32);

		this.l3 = regiseration.createLabel("Gender", 250, 205, 80, 30);
		this.r1 = new JRadioButton("Male");
		this.r2 = new JRadioButton("Female");
		r1.setBounds(260, 240, 100, 30);
		r2.setBounds(360, 240, 100, 30);
		r1.setBackground(windowLog.getContentPane().getBackground());
		r2.setBackground(windowLog.getContentPane().getBackground());
		this.bg = new ButtonGroup();
		bg.add(r1);
		bg.add(r2);

		this.l6 = regiseration.createLabel("Date of Birth", 250, 280, 120, 30);
		DateFormat format = new SimpleDateFormat("dd/MM/yyyy");
		DateFormatter df = new DateFormatter(format);
		dateTextField = new JFormattedTextField(df);
		dateTextField.setBounds(250,315,200,30);
		dateTextField.setValue(new Date(12,31,1999)); //DOES NOT CONTROL IF USER INPUTS A WRONG DATE FORMAT

		this.l7 = regiseration.createLabel("E-Mail", 250, 355, 120, 30);
		this.text7 = regiseration.createText(250, 390, 200, 30, 32); //DOES NOT CONTROL IF USER INPUTS WRONG EMAIL FORMAT OR IF EMAIL EXISTS

		this.l4 = regiseration.createLabel("Username", 250, 450, 80, 30);
		this.text4 = regiseration.createText(250, 485, 200, 30, 32);

		this.l5 = regiseration.createLabel("Password", 250, 525, 80, 30);
		this.passwd = regiseration.createPasswd(250, 560, 200, 30);

		if (High_Rank) {
			this.l8 = regiseration.createLabel("EmployeeID", 20, 305, 100, 30);
			this.text8 = regiseration.createText(20, 340, 200, 30, 32);
			this.text8.setText(UUID.randomUUID().toString());
			this.text8.setBackground(new Color(204,204,204));
			this.text8.setBorder(null);
			this.text8.setEditable(false);
			this.text8.setForeground(new Color(139,130,142));
			//this.text8.setSize(9*text8.getText().length(), 30);
			this.l9 = regiseration.createLabel("Function", 20, 380, 80, 30);
			this.p10 = regiseration.createPanel(20, 415, 105, 30, new Color(152, 206, 224));
			comboBox.addItem("Waiter");
			comboBox.addItem("Waitress");
			comboBox.addItem("Cashier");
			comboBox.addItem("Cook");
			comboBox.addItem("Manager");
			comboBox.addItem("Administrator");
			comboBox.addItem("Director");
			comboBox.addItem("Owner");
			comboBox.setBounds(20, 560, 200, 30);
			this.p10.add(comboBox);
			windowLog.add(l8);
			windowLog.add(text8);
			windowLog.add(l9);
			windowLog.add(p10);
		}

		this.submit = regiseration.createButton("Submit", 310, 600, 80, 30, new Color(59, 114, 117), Color.WHITE);

		try {
			GraphicsEnvironment ge = GraphicsEnvironment.getLocalGraphicsEnvironment();
			Font Museo_300 = Font.createFont(Font.TRUETYPE_FONT, new File("fonts/Museo Slab W00 300.ttf")).deriveFont(15f);
			ge.registerFont(Museo_300);
			Font Museo_900 = Font.createFont(Font.TRUETYPE_FONT, new File("fonts/Museo Slab W00 900.ttf")).deriveFont(15f);
			ge.registerFont(Museo_900);
			this.l1.setFont(Museo_300);
			this.text1.setFont(Museo_300);
			this.l2.setFont(Museo_300);
			this.text2.setFont(Museo_300);
			this.l3.setFont(Museo_300);
			this.r1.setFont(Museo_300);
			this.r2.setFont(Museo_300);
			this.l4.setFont(Museo_300);
			this.text4.setFont(Museo_300);
			this.l5.setFont(Museo_300);
			this.l6.setFont(Museo_300);
			this.l7.setFont(Museo_300);
			this.text7.setFont(Museo_300);
			this.passwd.setFont(Museo_300);
			if (High_Rank) {
				this.l8.setFont(Museo_900);
				this.text8.setFont(Museo_300);
				this.l9.setFont(Museo_900);
			}
			this.dateTextField.setFont(Museo_300);
		} catch (IOException|FontFormatException e) {
			e.printStackTrace();
		}

		windowLog.add(l1);
		windowLog.add(text1);
		windowLog.add(l2);
		windowLog.add(text2);
		windowLog.add(l3);
		windowLog.add(r1);
		windowLog.add(r2);
		windowLog.add(l4);
		windowLog.add(text4);
		windowLog.add(l5);
		windowLog.add(l7);
		windowLog.add(text7);
		windowLog.add(passwd);
		windowLog.add(submit);
		windowLog.add(l6);
		windowLog.add(dateTextField);
		submit.addActionListener(this);
	}

	/**
	 * @author Hamza Moudenne & Younes Saoudi
	 * @param gender
	 */
	@SuppressWarnings("unchecked")
	public void createNewUser(String gender) {
		Security security = new Security();
		//IndentJSON indentJSON = new IndentJSON();
		this.correct_account = true;
		JSONParser parser = new JSONParser();
		try {
			JSONArray userList = (JSONArray) parser.parse(new FileReader("data/users.json"));
			SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
			//Date of creation
			Date date = new Date(); 
			// new user
			JSONObject newUser = new JSONObject();
			newUser.put("First name", text1.getText());
			newUser.put("Last name", text2.getText());
			newUser.put("Gender", gender);
			newUser.put("Date of Birth", dateTextField.getText());
			newUser.put("E-Mail", text7.getText());
			String email = text7.getText();
			
			newUser.put("Username", text4.getText());
			newUser.put("Password", security.encrypt(new String(passwd.getPassword())));
			newUser.put("Created", formatter.format(date));
			newUser.put("Edits","");
			if (High_Rank) {
				newUser.put("UserID",text8.getText());
				newUser.put("Function",(String) comboBox.getSelectedItem().toString());
				newUser.put("Created by Employee", Creator.getFirstName() + " " + 
						Creator.getLastName() +" (" + Creator.getFunction() + 
						" " + Creator.getId() + ")");
			}
			else{
				newUser.put("UserID", UUID.randomUUID().toString());
				newUser.put("Function", "Null");
				newUser.put("LoyaltyPoints", 0);
				//ajoute par Hatim
				newUser.put("Discount", "No");
			}
			String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\."+ 
					"[a-zA-Z0-9_+&*-]+)*@" + 
					"(?:[a-zA-Z0-9-]+\\.)+[a-z" + 
					"A-Z]{2,7}$"; 

			Pattern pat = Pattern.compile(emailRegex);
			if(!pat.matcher(email).matches()) {
				JOptionPane.showMessageDialog(windowLog,"Invalid Email Address!");
				this.correct_account = false;
			}
			if(text1.getText().equals("") || text2.getText().equals("") || text7.getText().equals("") 
					|| text4.getText().equals("") || dateTextField.getText().equals("") 
					|| new String(passwd.getPassword()).equals("") ) {
				this.correct_account = false;
				JOptionPane.showMessageDialog(windowLog,"Please fill all the fields!");
			}
			else if(High_Rank && text8.getText().equals("")) {
				this.correct_account = false;
				JOptionPane.showMessageDialog(windowLog,"Please fill all the fields!");
			}
			for (Object user : userList) {
				JSONObject usr = (JSONObject) user;

				String username = (String) usr.get("Username");
				String emp_id = (String) usr.get("UserID");

				if (text4.getText().equals(username)) {
					JOptionPane.showMessageDialog(windowLog,"This username already exists!");
					this.correct_account = false;
				} else if(High_Rank) {
					if ((!text8.getText().equals("")) && text8.getText().equals(emp_id)) {
						JOptionPane.showMessageDialog(windowLog,"This EmployeeID already exists!");
						this.correct_account = false;
					}
				}
			}
			Pattern p = Pattern.compile("[^A-Za-z0-9]");
			Matcher m = p.matcher(text4.getText());
			boolean contains_special_character = m.find();
			if (contains_special_character) {
				JOptionPane.showMessageDialog(windowLog,"Username should not contain special characters!");
				this.correct_account = false;
			}
			if (correct_account) {
				JOptionPane.showMessageDialog(windowLog, "An email confirmation message will arrive shortly. A window will then appear.");
				int i = 3;
				sendEmail(text7.getText());
				String tmp = JOptionPane.showInputDialog(windowLog, i + " remaining attempts\nPlease, type the verification code :");
				while (i > 0) {
					if (i<3) {
							tmp = JOptionPane.showInputDialog(windowLog, i + " remaining attempts\nPlease enter the verification code :");
					}
					try{
						//System.out.println("aa" + tmp + this.verificationCode + tmp.equals(this.verificationCode));
						if (tmp.equals(this.verificationCode)) {
							userList.add(newUser);

							// Write the new userList to the JSON file
							try (FileWriter file = new FileWriter("data/users.json")) {
								file.write(userList.toJSONString());
								file.flush();

							} catch (IOException e) {
								e.printStackTrace();
							}
							JOptionPane.showMessageDialog(windowLog, "Your account has been created successfully.");
							this.windowLog.dispose();
							updateHumanFriendlyUsersDATABASE();
							i = 0;
						}
						i--;
					}catch(java.lang.NullPointerException e2) {
						JOptionPane.showMessageDialog(windowLog, "Operation Cancelled.");
						this.windowLog.dispose();
						i = 0;
					}
				}           	
			}
		}
		catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		} catch (GeneralSecurityException e) {
			e.printStackTrace();
		}
	}


	@Override
	public void actionPerformed(ActionEvent e) {
		if (e.getSource() == submit) {
			if (r1.isSelected()) {
				createNewUser("Male");
			} else if (r2.isSelected()) {
				createNewUser("Female");
			}
		}
	}

	public static void updateHumanFriendlyUsersDATABASE() {
		try {
			//Importing the users.json database since it has the made modifications
			JSONParser parser1 = new JSONParser();
			JSONArray userList = (JSONArray) parser1.parse(new FileReader("data/users.json"));

			//Formatting the database and converting it into a string
			Gson gson = new GsonBuilder().setPrettyPrinting().create();
			String Human_Friendly_Data = gson.toJson(userList);

			//Writing the string to the Human Friendly database
			try (FileWriter file = new FileWriter("data/users_Human_Friendly.json")) {
				file.write(Human_Friendly_Data);
				file.flush();
			}
			catch (IOException er) {
				er.printStackTrace();
			}
		}
		catch (FileNotFoundException er) {
			er.printStackTrace();
		} catch (IOException er) {
			er.printStackTrace();
		} catch (ParseException er) {
			er.printStackTrace();
		}
	}

	/**
	 * Send the verification email to achieve account creation
	 *
	 * @param to email address of the recipient
	 * @Exception MessagingException
	 */
	public void sendEmail(String to) {
		// Put sender’s address
		String from = "e24verifiy@gmail.com";
		final String username = "e24verifiy@gmail.com";//username generated by Mailtrap
		final String password = "E24N72020";//password generated by Mailtrap

		Properties props = System.getProperties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");//it’s optional in Mailtrap
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");// use one of the options in the SMTP settings tab in your Mailtrap Inbox

		// Get the Session object.
		Session session = Session.getInstance(props,
				new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});

		try {
			// Create a default MimeMessage object.
			Message message = new MimeMessage(session);

			// Set From: header field
			message.setFrom(new InternetAddress(from));

			// Set To: header field
			message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse(to));

			// Set Subject: header field
			message.setSubject("E24 Restaurant Account Confirmation");

			// Put the content of your message
			Random rand = new Random();
			this.verificationCode = String.format("%04d", rand.nextInt(10000));
			message.setText("Hello "+text1.getText()+ ",\n\nThank you for eating at our restaurant!"
					+ "\nHere is your verification code : " + this.verificationCode 
					+ "\nWe're happy to welcome you aboard. Don't forget that the more you eat in our restaurant, "
					+ "the better deals you can get!\n\nSee you soon and have a great meal!"
					+ "\nThe entire E24 Staff");

			// Send message
			Transport.send(message);

			//System.out.println("Message sent successfully...."+ this.verificationCode);

		} catch (MessagingException mex) {
			mex.printStackTrace();
		}
	}
}
