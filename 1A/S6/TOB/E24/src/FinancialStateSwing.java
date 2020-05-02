import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.image.BufferedImage;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import java.awt.*;

//@autor chaimoua

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
        this.panel = MenuState.createPanel(350, 121, 700, 350,new Color(45,75,127));
        Image icon1 = Toolkit.getDefaultToolkit().getImage("icons/images.png");
		window.setIconImage(icon1);
		this.window.getContentPane().setBackground(new Color(82,182,231));
        
		//Read and add the picture to the window
		ImageIcon pic = new ImageIcon("pics/FinancialState.jpg");
		Image newPic = scaleImage(pic.getImage(), 700 , 350);
		JLabel icon = new JLabel(new ImageIcon(newPic), JLabel.CENTER);
		this.panel.add(icon);
		this.window.add(this.panel);
		
		
		// Create the buttons
	    	// button1
		this.button1= MenuState.createButton("Consult", width/2 - width *194/1360, actual_height/2 + 230*height/705,
				150, 40,new Color(150,169,200), Color.WHITE);
		this.window.add(button1);
		button1.addActionListener(this.Consult);
		
	        // bouton2
	    this.button2 = MenuState.createButton("Back to Employee Interface", 2*width/3 - width *170/1360, actual_height/2 + 230*height/705,
        		150, 40,new Color(150,169,200), Color.WHITE);
	   
	    this.window.add(button2);
	    button2.addActionListener(this.Back);
	    
	        // Text
	    this.text = MenuState.createLabel("Consult the financial statement of the restaurant",200*width/1360, 0, width *176/200, 100);
		this.text.setForeground(Color.white);
		this.window.add(text);
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
	     text.setFont(new java.awt.Font(Font.SERIF,Font.BOLD,40)); 
	     
		 this.window.setVisible(true);
         this.button1.repaint();
         this.button2.repaint();
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
		 }	
	 }
	
	
	
	
}

	
	


