package employee;

import javax.swing.*;
import general.AccountDetails;
import general.GUI;
import general.Home;
import general.SignIn;
import general.SignUp;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.io.IOException;

/**
 * The Graphic Interface employees use to do their tasks
 * @author Younes Saoudi
 */
public class EmployeeInterface{

	// Class Attributes //
	//Swing Items
	private JFrame window;
	private JLabel footerLabel;
	private JButton b1, b2, b3, b4, bFunctionName, bAccount,bOldOrders, SignOut;
	private JPanel headRight, footer, panel0;
	private Employee Employee;
	private JLabel text;
	private Color Background;
	private JScrollPane scrollPane;
	private boolean bFunctionNamehasBeenClicked = false;
	
	//Button Listeners
	private final ActionListener B_Stock = new OpenStock(); //Stock Button
	private final ActionListener B_FinancialState = new OpenFinancialState(); //Financial State Button
	private final ActionListener B_CurrentOrders = new OpenCurrentOrders(); //Current Orders Button
	private final ActionListener B_CreateEmployee = new CreateEmployee(); //Sign out Button
	private final ActionListener B_SignOut = new SignOut(); //Sign out Button
	private final ActionListener B_Account = new ShowAccDetails();
	private final ActionListener B_ShowOldOrders = new showOldOrders();

	/**
	 * Opens a window containing buttons leading to various tasks the employee can do to fulfill his job.
	 * @param Employee The logged in employee 
	 * @author Younes Saoudi 
	 */
	public EmployeeInterface(Employee Employee) {

		this.Employee = Employee; //Will be used for the CurrentOrders' ActionListener

		GUI MenuEmploye = new GUI(); //Using GUI's implemented methods
		this.Background = Color.WHITE;

		//Create maximised window and storing its dimensions
		this.window = MenuEmploye.createWindow("Employee Interface", 0, 0);
		this.window.setExtendedState(this.window.getExtendedState() | JFrame.MAXIMIZED_BOTH); //Automatically maximise window
		Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
		this.window.getContentPane().setBackground(Background);
		
		//Storing the dimensions
		int width = screenSize.width; //1536 (if 1080p screen)
		int height = screenSize.height;//864 (if 1080p screen)

		//HEADER
		//Making the Pop-Up Buttons which appear when clicking on the logged-in Employee's function
		//@author Younes Saoudi
		bFunctionName = MenuEmploye.createButton(Employee.getFunction().toString(), width*53/1536, height*10/864, 150, 20, null, null);
		bFunctionName.setOpaque(false);
		bFunctionName.setContentAreaFilled(false);
		bFunctionName.setForeground(Color.BLACK);
		this.window.add(bFunctionName);

		//Making the pop up menu
		JPanel panel = new JPanel();
		panel.setLayout(new GridLayout(2, 1)); //Will contain the buttons
		
		//Setting up the buttons
		bAccount = new JButton("Account Details");
		bOldOrders = new JButton("Old Orders");

		bAccount.setPreferredSize(new Dimension(180, 35));
		bOldOrders.setPreferredSize(new Dimension(180, 35));

		bAccount.setBackground(Color.BLACK);
		bOldOrders.setBackground(Color.BLACK);

		bAccount.setForeground(Color.WHITE);
		bOldOrders.setForeground(Color.WHITE);			
		
		//Button Listeners
		this.bAccount.addActionListener(B_Account);
		this.bOldOrders.addActionListener(B_ShowOldOrders);
		
		//Adding the buttons
		panel.add(bAccount);
		panel.add(bOldOrders);

		//Setting the button fonts.
		try {
			GraphicsEnvironment ge = GraphicsEnvironment.getLocalGraphicsEnvironment();
			Font Uniform_Light = Font.createFont(Font.TRUETYPE_FONT, new File("fonts/Uniform Light.ttf")).deriveFont(15f);
			ge.registerFont(Uniform_Light);
			Font Avenir_Light = Font.createFont(Font.TRUETYPE_FONT, new File("fonts/avenir-light.otf")).deriveFont(16f);
            ge.registerFont(Avenir_Light);
			bAccount.setFont(Avenir_Light);
			bOldOrders.setFont(Avenir_Light);
			bFunctionName.setFont(Avenir_Light);
		} catch (IOException|FontFormatException e) {
			e.printStackTrace();
		}

		//Panel containing the (eventually) scroll-able pop-up menu
		JPanel container = new JPanel(new FlowLayout(FlowLayout.CENTER, 0, 0));
		container.add(panel);
		scrollPane = new JScrollPane(container);
		
		//the Pop Up menu is invisble at first
		scrollPane.setVisible(false);
		panel0 = MenuEmploye.createPanel(width*197/1536, height*5/864, 200, 150, null);
		panel0.setOpaque(false); //transparent panel, only buttons appear
		panel0.add(scrollPane);

		/**	What happens when the bEmployeeName button is clicked
		 * @author Younes Saoudi
		 */
		bFunctionName.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				//if the pop-up menu is not visible
				if(!bFunctionNamehasBeenClicked) {
					//make it visible
					scrollPane.setVisible(true);
					bFunctionNamehasBeenClicked = true;
					//necessary steps so that the pop up menu appears:
					window.invalidate();
					window.validate();
					window.repaint();
				}else {
					//make it disappear
					bFunctionNamehasBeenClicked = false;
					scrollPane.setVisible(false);
				}
			}

		});
		this.window.add(panel0);


		//Right side of the header
		this.headRight = MenuEmploye.createPanel(width * 176/1536 + width * 1024/1536, 0, width * 336/1536, 40, Background);
		this.text = MenuEmploye.createLabel("Employee Interface", 10, 10, 200, 40);
		this.headRight.add(text);
		this.window.add(this.headRight);

		//BODY

		//Stock button
		this.b1 = MenuEmploye.createButton("Stock", 1241*width/1536, height/4, 250*width/1536, 40, new Color(32, 18, 83), Color.WHITE);


		this.b2 = MenuEmploye.createButton("Financial State", width *1241/1536, height/4 + 80*height/864, 250*width/1536, 40, new Color(15, 125, 102), Color.WHITE);

		//Current Orders Button
		this.b3 = MenuEmploye.createButton("Current Orders", width *1241/1536, height/4 + 160*height/864, 250*width/1536, 40, new Color(57, 186, 204), Color.WHITE);

		//Creating Employee Account Button
		if(Employee.getFunction().ordinal()>=EmployeeRank.Manager.ordinal()){
			this.b4 = MenuEmploye.createButton("Create Employee Account", width*1241/1536, height/4 + 240*height/864, 250*width/1536, 40, Color.BLACK, Color.WHITE);
			this.window.add(b4);
			b4.addActionListener(B_CreateEmployee);
			try {
				GraphicsEnvironment ge = GraphicsEnvironment.getLocalGraphicsEnvironment();
				Font Museo_500 = Font.createFont(Font.TRUETYPE_FONT, new File("fonts/Museo Slab W00 500.otf")).deriveFont(15f);
				ge.registerFont(Museo_500);
				this.b4.setFont(Museo_500);
			} catch (IOException|FontFormatException e) {
				e.printStackTrace();
			}
		}

		//Sign Out Button
		this.SignOut = MenuEmploye.createButton("Log Out", width*1241/1536, height/4 + 320*height/864, 250*width/1536, 40, new Color(220, 53, 69), Color.WHITE);

		//Adding previous buttons to the JFrame
		this.window.add(this.b1);
		this.window.add(this.b2);
		this.window.add(this.b3);
		this.window.add(this.SignOut);

		//Assigning each button to their ActionListener
		b1.addActionListener(this.B_Stock);
		b2.addActionListener(this.B_FinancialState);
		b3.addActionListener(this.B_CurrentOrders);
		SignOut.addActionListener(this.B_SignOut);

		//Displaying the logged in Employee's information
		JLabel Welcome = MenuEmploye.createLabel("Welcome back, ",width *250/1536, height/3 - height*75/864,width,100);
		JLabel FullName =  MenuEmploye.createLabel(Employee.getFirstName()+" "+Employee.getLastName()+" ...",width*500/1536, height/3 ,width,100);
		/*JLabel ID = MenuEmploye.createLabel("ID                :  " + Employee.getId(),width/2- width *250/1536, actual_height/4, 300,100);*/
		//JLabel Function =  MenuEmploye.createLabel("Function  :  " + Employee.getFunction(),width/2, actual_height/4,300,100);

		Welcome.setForeground(new Color(124, 77, 195));
		FullName.setForeground(new Color(124, 77, 195));
		//Adding the labels to the JFrame
		this.window.add(Welcome);
		this.window.add(FullName);
		
		scrollPane.repaint();
		panel0.repaint();

		//FOOTER

		//Footer Elements
		this.footer = MenuEmploye.createPanel(0, height*725/864, width, 100, new Color(124, 77, 195));
		this.footer.setLayout(new BorderLayout());
		this.footerLabel = MenuEmploye.createLabel("E24 Restaurant 2020", 0, 0, 100, 50);
		this.footerLabel.setForeground(Color.WHITE);
		this.footer.add(this.footerLabel, BorderLayout.CENTER);
		this.window.add(this.footer);
		
		//Setting up the fonts
		try {
			GraphicsEnvironment ge = GraphicsEnvironment.getLocalGraphicsEnvironment();
			Font Museo_1000 = Font.createFont(Font.TRUETYPE_FONT, new File("fonts/Museo Slab W00 1000.ttf")).deriveFont(70f);
			ge.registerFont(Museo_1000);
			Font Avenir_Light = Font.createFont(Font.TRUETYPE_FONT, new File("fonts/avenir-light.otf")).deriveFont(16f);
            ge.registerFont(Avenir_Light);
			Font Museo_500 = Font.createFont(Font.TRUETYPE_FONT, new File("fonts/Museo Slab W00 500.otf")).deriveFont(15f);
			ge.registerFont(Museo_500);
			Font Bebas_Light = Font.createFont(Font.TRUETYPE_FONT, new File("fonts/BebasNeue-Regular.ttf")).deriveFont(70f);
			ge.registerFont(Bebas_Light);
			Font Uniform_Light = Font.createFont(Font.TRUETYPE_FONT, new File("fonts/Uniform Light.ttf")).deriveFont(15f);
			ge.registerFont(Uniform_Light);
			this.SignOut.setFont(Museo_500);
			this.footerLabel.setFont(Uniform_Light);
			//this.logo.setFont(Uniform_Light);
			this.text.setFont(Avenir_Light);
			Welcome.setFont(Bebas_Light);
			FullName.setFont(Bebas_Light);
			this.b1.setFont(Museo_500);
			this.b2.setFont(Museo_500);
			this.b3.setFont(Museo_500);
		} catch (IOException|FontFormatException e) {
			e.printStackTrace();
		}

		this.window.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE); //System exits if the default close button is clicked
	}

	/**
	 * Show Stock if the Stock button is pressed
	 * @author Younes Saoudi
	 *
	 */
	private class OpenStock implements ActionListener {
		public void actionPerformed(ActionEvent e) {
			if(bFunctionNamehasBeenClicked) {
				scrollPane.setVisible(false);
				bFunctionNamehasBeenClicked = false;
			}
		}
	}

	/**
	 * Show restaurant's Finances if FinancialState Button is pressed
	 * @author Younes Saoudi
	 *
	 */
	private class OpenFinancialState implements ActionListener {
		public void actionPerformed(ActionEvent e) {
			if(bFunctionNamehasBeenClicked) {
				scrollPane.setVisible(false);
				bFunctionNamehasBeenClicked = false;
			}
			new FinancialStateSwing(Employee);
			window.dispose();
		}
	}

	/**
	 * Show Current Orders so that the logged in Employee can monitor/modify them when needed
	 * if the CurrentOrders button is pressed
	 * @author Younes Saoudi
	 *
	 */
	private class OpenCurrentOrders implements ActionListener {
		public void actionPerformed(ActionEvent e) {
			if(bFunctionNamehasBeenClicked) {
				scrollPane.setVisible(false);
				bFunctionNamehasBeenClicked = false;
			}
			new CurrentOrders(Employee);
			window.dispose();
		}
	}
	private class CreateEmployee implements ActionListener{
		public void actionPerformed(ActionEvent e) {
			if(bFunctionNamehasBeenClicked) {
				scrollPane.setVisible(false);
				bFunctionNamehasBeenClicked = false;
			}
			new SignUp(Employee,"en");
		}
	}
	/**
	 * Sign Out of the Employee account if the Sign Out button is pressed, but only after
	 * updating the Human-Friendly Orders database with the modifications that may have been made
	 * by the employee
	 * @author Younes Saoudi
	 *
	 */
	private class SignOut implements ActionListener {
		public void actionPerformed(ActionEvent e) {
			window.dispose();
			Home home = new Home("en");
			JFrame window = home.getWindow();
			new SignIn(window,"en");
		}
	}

	private class ShowAccDetails implements ActionListener {
		public void actionPerformed(ActionEvent e) {
			if(bFunctionNamehasBeenClicked) {
				scrollPane.setVisible(false);
				bFunctionNamehasBeenClicked = false;
			}
			window.dispose();
			new AccountDetails(Employee,"en");
		}
	}
	private class showOldOrders implements ActionListener {
		public void actionPerformed(ActionEvent e) {
			if(bFunctionNamehasBeenClicked) {
				scrollPane.setVisible(false);
				bFunctionNamehasBeenClicked = false;
			}
			window.dispose();
			new OldOrders(Employee);
		}
	}
	
}