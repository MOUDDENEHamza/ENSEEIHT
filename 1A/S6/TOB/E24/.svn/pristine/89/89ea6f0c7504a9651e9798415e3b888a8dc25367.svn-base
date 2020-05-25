package general;
import employee.*;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.swing.*;
import javax.swing.event.DocumentEvent;
import javax.swing.event.DocumentListener;
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

	//Swing Attributes
	JFrame windowLog;
	JLabel l1, l2, l3, l4 ,l5, l6, l7, l8, l9;
	JTextField text1, text2, text4, text7, text8;
	JRadioButton r1, r2;
	ButtonGroup bg;
	JPasswordField passwd;
	JFormattedTextField dateTextField;
	JPanel p10;
	JButton submit;
	JComboBox<String> comboBox = new JComboBox<String>();
	private final DocumentListener  actionFullName = new generateUsername(); //Automatically generate username for employees

	boolean correct_account;
	boolean High_Rank;
	Employee Creator;

	String verificationCode;
	String lang, msgCst1,msgCst2,msgCst3, err1, err2,err3,err5,err6;	
	/**
	 * Sign Up Constructor
	 * @param creator Is it an employee with a high enough rank who initiated the sign up procedure?
	 */
	@SuppressWarnings("deprecation")
	public SignUp(User creator,String lg) {

		//Is the user an employee with a rank of Manager of higher?
		if(creator.getFunction().ordinal() >= EmployeeRank.Manager.ordinal()) {
			this.High_Rank = true;
			this.Creator = (Employee) creator;
		}
		GUI regiseration = new GUI();

		/**
		 *  Internationalization of Application
		 * @author Hatim Meskine
		 */
		this.lang =lg;
		JSONParser parser = new JSONParser();

		String sgup = null  , fstnm = null, lstnm = null, usrn=null, pwd = null, gender = null, male = null, female=null, bDate=null,subm=null;
		this.err2=null; this.err3=null; this.err5=null; this.err6=null;
		this.msgCst1=null; this.msgCst2=null; this.msgCst3=null;

		String file = "data/langueEn.json";
		try {
			if (lg.equals("fr")) {
				file = "data/langueFr.json";
			}
			JSONArray lang = (JSONArray) parser.parse(new FileReader(file));

			for (Object word : lang) {
				JSONObject msg = (JSONObject) word;
				sgup = (String) msg.get("signUp");
				fstnm = (String) msg.get("firstName");
				lstnm = (String) msg.get("lastName");
				gender = (String) msg.get("gender");
				male = (String) msg.get("male");
				female = (String) msg.get("female");
				bDate = (String) msg.get("birthDate");
				usrn = (String) msg.get("username");
				pwd = (String) msg.get("password");
				subm = (String) msg.get("submit");
				this.err1 = (String) msg.get("signUpErr1");	
				err2 = (String) msg.get("signUpErr2");				
				this.err3 = (String) msg.get("signUpErr3");					
				this.err5 = (String) msg.get("signUpErr5");				
				this.err6 = (String) msg.get("signUpErr6");
				msgCst1 = (String) msg.get("signUpCustomerSend");
				msgCst2 = (String) msg.get("signUpCustomerVerify");
				msgCst3 = (String) msg.get("signUpCustomerOK");
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

		//Creatin the window and setting its size
		this.windowLog = regiseration.createWindow(sgup, 700, 750);
		this.windowLog.getContentPane().setBackground(new Color(152, 206, 224));
		Dimension dim = Toolkit.getDefaultToolkit().getScreenSize();
		this.windowLog.setLocation(dim.width/2-this.windowLog.getSize().width/2, dim.height/2-this.windowLog.getSize().height/2);


		//Creating the labels and text fields
		this.l1 = regiseration.createLabel(fstnm, 250, 60, 150, 30);
		this.text1 = regiseration.createText(250, 95, 200, 30, 32);

		this.l2 = regiseration.createLabel(lstnm, 250, 135, 150, 30);
		this.text2 = regiseration.createText(250, 170, 200, 30, 32);

		//Gender radio buttons
		this.l3 = regiseration.createLabel(gender, 250, 205, 80, 30);
		this.r1 = new JRadioButton(male);
		this.r2 = new JRadioButton(female);
		r1.setBounds(260, 240, 100, 30);
		r2.setBounds(360, 240, 100, 30);
		r1.setBackground(windowLog.getContentPane().getBackground());
		r2.setBackground(windowLog.getContentPane().getBackground());
		this.bg = new ButtonGroup();
		bg.add(r1);
		bg.add(r2);
		
		//Date of birth (with format "dd/MM/yyyy"
		this.l6 = regiseration.createLabel(bDate, 250, 280, 150, 30);
		DateFormat format = new SimpleDateFormat("dd/MM/yyyy");
		DateFormatter df = new DateFormatter(format);
		dateTextField = new JFormattedTextField(df);
		dateTextField.setBounds(250,315,200,30);
		dateTextField.setValue(new Date(12,31,1999)); //DOES NOT CONTROL IF USER INPUTS A WRONG DATE FORMAT

		this.l7 = regiseration.createLabel("E-Mail", 250, 355, 120, 30);
		this.text7 = regiseration.createText(250, 390, 200, 30, 32); 

		this.l4 = regiseration.createLabel(usrn, 250, 450, 150, 30);
		this.text4 = regiseration.createText(250, 485, 200, 30, 32);

		this.l5 = regiseration.createLabel(pwd, 250, 525, 150, 30);
		this.passwd = regiseration.createPasswd(250, 560, 200, 30);
		
		//if the user is an employee with rank of Manager or Higher then add more information
		if (High_Rank) {
			this.l8 = regiseration.createLabel("EmployeeID", 20, 305, 100, 30);
			this.text8 = regiseration.createText(20, 340, 200, 30, 32);
			this.text8.setText(UUID.randomUUID().toString());
			this.text8.setBackground(new Color(204,204,204));
			this.text8.setBorder(null);
			this.text8.setEditable(false);
			this.text8.setForeground(new Color(139,130,142));
			
			this.l9 = regiseration.createLabel("Function", 20, 380, 80, 30);
			this.p10 = regiseration.createPanel(20, 415, 105, 30, new Color(152, 206, 224));

			this.text4.setEditable(false);
			this.text4.setBorder(null);
			this.text4.setBackground(new Color(204,204,204));
			this.text4.setForeground(new Color(139,130,142));

			this.passwd.setEditable(false);
			this.passwd.setBorder(null);
			this.passwd.setBackground(new Color(204,204,204));
			this.passwd.setForeground(new Color(139,130,142));
			
			//Automatically generate username and password from full name
			this.text1.getDocument().addDocumentListener(actionFullName);
			this.text2.getDocument().addDocumentListener(actionFullName);

			//ComboBox with the functions of employees
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

		this.submit = regiseration.createButton(subm, 310, 600, 80, 30, new Color(59, 114, 117), Color.WHITE);
		
		//Setting the fonts
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
			this.dateTextField.setFont(Museo_300);
			
			if (High_Rank) {
				this.l8.setFont(Museo_900);
				this.text8.setFont(Museo_300);
				this.l9.setFont(Museo_900);
			}
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
	 * Automaticallt generates username and password for new employees from their full name
	 * @author Younes Saoudi
	 * @param firstName
	 * @param lastName
	 * @return
	 */
	public String autoEmployeeUsername(String firstName, String lastName) {
		int occurences = 0; //occurences of the new username in the users.json database
		
		JSONParser parser = new JSONParser();
		int length = Math.min(lastName.length(), 6); //length of the username
		//Creating the username (first letter of first name + first 6 letters of last name)
		String employeeUsername = firstName.toLowerCase().charAt(0) + lastName.toLowerCase().substring(0, length);
		
		//Get the number of occurences of employeeUsername in users.json
		try {
			JSONArray userList = (JSONArray) parser.parse(new FileReader("data/users.json"));

			for (Object user : userList) {
				JSONObject usr = (JSONObject) user;
				String username = (String) usr.get("Username");
				
				//if there is an occurence
				if (employeeUsername.equals(username)) {
					occurences ++;
				}
			}
		}
		catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		}
		//if the number of occurences is higher than 0, add the number to the username so that there is no conflict
		if (occurences > 0) {
			employeeUsername = employeeUsername + occurences;
		}
		return employeeUsername;
	}

	/**
	 * @author Hamza Moudenne & Younes Saoudi
	 * @param gender
	 */
	@SuppressWarnings("unchecked")
	public void createNewUser(String gender) {
		//password encryption
		Security security = new Security();
		
		this.correct_account = true; //the account information is set to correct for now
		
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
			
			//if we're creating an employee account, then other info should be added
			if (High_Rank) {
				newUser.put("UserID",text8.getText());
				newUser.put("Function",(String) comboBox.getSelectedItem().toString());
				newUser.put("Created by Employee", Creator.getFirstName() + " " + 
						Creator.getLastName() +" (" + Creator.getFunction() + 
						" " + Creator.getId() + ")");
			}
			else{ //different info should be added for customers
				newUser.put("UserID", UUID.randomUUID().toString());
				newUser.put("Function", "Null");
				newUser.put("LoyaltyPoints", 0);
				//ajoute par Hatim
				newUser.put("Discount", "No");
			}
			//Checking if the email is an actual email
			String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\."+ 
					"[a-zA-Z0-9_+&*-]+)*@" + 
					"(?:[a-zA-Z0-9-]+\\.)+[a-z" + 
					"A-Z]{2,7}$"; 

			Pattern pat = Pattern.compile(emailRegex);
			//is it a correct email?
			if(!pat.matcher(email).matches()) {
				JOptionPane.showMessageDialog(windowLog, err1);
				this.correct_account = false; //if not, then the account is not correct
			}
			
			//if one of the textfields is empty
			if(text1.getText().equals("") || text2.getText().equals("") || text7.getText().equals("") 
					|| text4.getText().equals("") || dateTextField.getText().equals("") 
					|| new String(passwd.getPassword()).equals("") ) {
				this.correct_account = false; //incorrect account!
				JOptionPane.showMessageDialog(windowLog,err2);
			}
			else if(High_Rank && text8.getText().equals("")) {
				this.correct_account = false;
				JOptionPane.showMessageDialog(windowLog,err2);
			}
			
			//checking if the username or employee id already exist in the database
			for (Object user : userList) {
				JSONObject usr = (JSONObject) user;

				String username = (String) usr.get("Username");
				String emp_id = (String) usr.get("UserID");
				
				//if the username already exists
				if (text4.getText().equals(username)) {
					JOptionPane.showMessageDialog(windowLog,err3);
					this.correct_account = false;
				} else if(High_Rank) {
					// if the UUID somehow alread exists (very small chance but still possible)
					if ((!text8.getText().equals("")) && text8.getText().equals(emp_id)) {
						JOptionPane.showMessageDialog(windowLog,"This EmployeeID already exists! Please close the account creation window and try again");
						this.correct_account = false;
					}
				}
			}
			
			//Check if username contains special characrers
			Pattern p = Pattern.compile("[^A-Za-z0-9]");
			Matcher m = p.matcher(text4.getText());
			boolean contains_special_character = m.find();
			if (contains_special_character) {
				JOptionPane.showMessageDialog(windowLog,err5);
				this.correct_account = false;
			}
			
			//If the account is correct and it's a client, not an employee
			if (correct_account && !High_Rank) {
				//Send verification email
				JOptionPane.showMessageDialog(windowLog, msgCst1);
				int i = 3;
				sendEmail(text7.getText());
				
				//The client will now have 3 attempts to write the correct code sent to him
				String tmp = JOptionPane.showInputDialog(windowLog, i + msgCst2);
				while (i > 0) {
					if (i<3) {
						tmp = JOptionPane.showInputDialog(windowLog, i + msgCst2);
					} 
					try{
						//if the code is correct, add the user to the database
						if (tmp.equals(this.verificationCode)) {
							userList.add(newUser);

							// Write the new userList to the JSON file
							try (FileWriter file = new FileWriter("data/users.json")) {
								file.write(userList.toJSONString());
								file.flush();

							} catch (IOException e) {
								e.printStackTrace();
							}
							//Created successfully!
							JOptionPane.showMessageDialog(windowLog, msgCst3);
							this.windowLog.dispose();
							i = 0;
						}
						i--; //else, number of attempts gets decreases
					}catch(java.lang.NullPointerException e2) {
						//if the user cancels, the window is closed!
						JOptionPane.showMessageDialog(windowLog, err6);
						this.windowLog.dispose();
						i = 0;
					}
				}    
			//if the account is correct and it IS an employee
			} else if(correct_account && High_Rank) {
				//the user is automatically added to the database and an email is sent to the new employee
				userList.add(newUser);
				// Write the new userList to the JSON file
				try (FileWriter file = new FileWriter("data/users.json")) {
					file.write(userList.toJSONString());
					file.flush();

				} catch (IOException e) {
					e.printStackTrace();
				}
				JOptionPane.showMessageDialog(windowLog, "The account has been created successfully."
						+ " Its new owner should receive a confirmation e-mail containing his credentials shortly.");
				sendEmail(text7.getText());
				this.windowLog.dispose();
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
	
	/**
	 * Creating unique username and password from full name
	 * @author Younes Saoudi
	 *
	 */
	public class generateUsername implements DocumentListener{

		@Override
		public void insertUpdate(DocumentEvent e) {
			if (!text1.getText().equals("") && !text2.getText().equals("")) {
				text4.setText(autoEmployeeUsername(text1.getText(),text2.getText()));
				passwd.setText(text4.getText());
			}				
		}

		@Override
		public void removeUpdate(DocumentEvent e) {
			if (!text1.getText().equals("") && !text2.getText().equals("")) {
				text4.setText(autoEmployeeUsername(text1.getText(),text2.getText()));
				passwd.setText(text4.getText());
			}	
		}

		@Override
		public void changedUpdate(DocumentEvent e) {
			//nothing
		}

	}

	/**
	 * Send the verification email to achieve account creation
	 *
	 * @param to email address of the recipient
	 * @Exception MessagingException
	 */
	public void sendEmail(String to) {
		// Put sender's address
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
			
			//if the client chose French
			if(lang.equals("fr")){
				message.setText("Bonjour "+text1.getText()+ ",\n\nMerci d'avoir choisi notre restaurant!"
						+ "\nVoici votre code de v\u00E9rification : " + this.verificationCode 
						+ "\nNous sommes tr\u00E8s heureux de vous compter parmi nous. N'oubliez pas que plus vous mangez dans E24, "
						+ "plus vous aurez de meilleurs offres!\n\nA tr\u00E8s bient\u00F4t et bon app\u00E9tit!"
						+ "\nTout le Staff E24");
			}
			//If it's an employee
			if(High_Rank) {
				message.setText("Hello "+text1.getText()+",\n\nThe entire E24 Staff welcomes you aboard."
						+ "\nYour superior, " +  Creator.getFirstName() +" " + Creator.getLastName()+ ", created a special "
						+ "E24 Staff account for you. You'll find your credentials below."
						+ "\nYou will be using this account during the entirety of your stay with us to fulfill "
						+ "the various tasks you will be assigned to."
						+ "\nIf you have any questions, don't hesitate to refer to your supervisor or colleagues."
						+ "\n\nSee you soon!"
						+ "\n\nUsername: " + text4.getText() + "\nPassword: " + new String(passwd.getPassword()));
			}

			// Send message
			Transport.send(message);

		} catch (MessagingException mex) {
			mex.printStackTrace();
		}
	}
}
