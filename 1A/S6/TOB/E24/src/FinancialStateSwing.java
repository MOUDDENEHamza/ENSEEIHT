import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.image.BufferedImage;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import java.awt.*;

//@autor chaimaa

public class FinancialStateSwing {
	private JFrame window;
	private JButton button1, button2;
	private JPanel panel;
	public JLabel text;
	public final static Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
	public final static int width = screenSize.width;
	public final static int height = screenSize.height;
	int actual_height = height - 40 - 75;
	private final ActionListener Consult= new Consult();
	private final ActionListener Back = new Back();
	private Employee Employee;
	
	public FinancialStateSwing(Employee employee) {
		this.Employee = employee;
		//Create the new window
		GUI MenuState = new GUI();
		this.window = MenuState.createWindow("Financial State", 1000, 800);
		this.window.setExtendedState(this.window.getExtendedState() | JFrame.MAXIMIZED_BOTH);
        this.panel = MenuState.createPanel(50, 0, width-60, height/2,Color.white);
        Image icon1 = Toolkit.getDefaultToolkit().getImage("icons/images.png");
		window.setIconImage(icon1);
		this.window.getContentPane().setBackground(Color.white);
        
		//Read and add the picture to the window
		ImageIcon pic = new ImageIcon("pics/hello.png");
		Image newPic = scaleImage(pic.getImage(), width-60, height/2);
		JLabel icon = new JLabel(new ImageIcon(newPic), JLabel.CENTER);
		this.panel.add(icon);
		this.window.add(this.panel);
		//Read and add the picture to the window
		/*this.panel2 = MenuState.createPanel(350, 0, 1360/2, 750,Color.white);
				ImageIcon pic1 = new ImageIcon("téléchargement(2).jpg");
				Image newPic1 = scaleImage(pic1.getImage(), 1360/4 , 300);
				JLabel icon2 = new JLabel(new ImageIcon(newPic1), JLabel.CENTER);
				this.panel2.add(icon2);
				this.window.add(this.panel2);*/
		
		
		// Create the buttons
	    	// button1
		this.button1= MenuState.createButton("Consult", width/2 - width *194/1360, actual_height/2 + 150*height/705,
				150, 40,new Color(117,184,201), Color.black);

		this.window.add(button1);
		button1.addActionListener(this.Consult);
		
	        // bouton2
	    this.button2 = MenuState.createButton("Back ", 2*width/3 - width *170/1360, actual_height/2 +150*height/705,
        		150, 40,new Color(117,184,201), Color.black);
	   
	    this.window.add(button2);
	    button2.addActionListener(this.Back);
	    
	        
		/**try{
		     GraphicsEnvironment ge = GraphicsEnvironment.getLocalGraphicsEnvironment();
		     Font Museo_500 = Font.createFont(Font.TRUETYPE_FONT, new File("fonts/Museo Slab W00 500.otf")).deriveFont(15f);
		     ge.registerFont(Museo_500);
		     Font Uniform_Light = Font.createFont(Font.TRUETYPE_FONT, new File("fonts/Uniform Light.ttf")).deriveFont(14f);
		     ge.registerFont(Uniform_Light);
		     texte.setFont(Museo_500);	     
		} catch (IOException|FontFormatException e) {
		     e.printStackTrace();
		}*/
		
	     // Change font and text size
	     text.setFont(new java.awt.Font(Font.SERIF,Font.BOLD,10)); 
	     
		 this.window.setVisible(true);
         this.button1.repaint();
         this.button2.repaint();
         this.text.repaint();
	}
	
	
	/**
	 * Resize a picture
	 */
	public Image scaleImage(Image source, int width, int height) {
	     BufferedImage img = new BufferedImage(width, height, BufferedImage.TYPE_INT_ARGB);
	     Graphics2D g = (Graphics2D) img.getGraphics();
	     g.setRenderingHint(RenderingHints.KEY_INTERPOLATION, RenderingHints.VALUE_INTERPOLATION_BILINEAR);
	     g.drawImage(source, 0, 0, width, height, null);
	     g.dispose();
	     return img;
	}

		
	private class Consult implements ActionListener {
		 public void actionPerformed(ActionEvent e) {
				new Operation_FinancialState(Employee);
				window.dispose();
		 }	
	}	
		
	
	private class Back implements ActionListener {
		 public void actionPerformed(ActionEvent e) {
				new EmployeeInterface(Employee);
				window.dispose();
				EmployeeInterface.updateHumanFriendlyOrdersDATABASE();
		 }	
	 }
	
	
}

	
	


