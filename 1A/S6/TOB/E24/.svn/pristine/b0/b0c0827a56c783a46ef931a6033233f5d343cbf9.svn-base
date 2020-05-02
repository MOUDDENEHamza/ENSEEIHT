


import javax.imageio.ImageIO;
import javax.swing.*;
import javax.swing.border.Border;
import javax.swing.border.LineBorder;

import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

/**
 *Home Page of the application
 * @author Younes Saoudi
 * @version 0.1
 */
@SuppressWarnings("unused")
public class Home {
	
	// Class Attributes //
	//Swing Items
	private JFrame window;
	private JLabel logo, footerLabel, pictureLabel;
	private JButton b1, b2, b3, SignOut;
	private JPanel headLeft, headCenter, headRight, footer, body;
	private Employee Employee;
    private Image img;
    private ImageIcon icon;

	
	//Button Listeners
	private final ActionListener B_Start = new Start(); //Stock Button
	/**
	 * Employee Interface Constructor
	 */
	public Home() {
		
		GUI MenuEmploye = new GUI(); //Using GUI's implemented methods
		//Create maximised window and storing its dimensions
		this.window = MenuEmploye.createWindow("Home", 0, 0);
		
		/*GraphicsEnvironment Ge = GraphicsEnvironment.getLocalGraphicsEnvironment();
		GraphicsDevice[] gd = Ge.getScreenDevices();
		if (gd.length >= 1) {
			window.setLocation(gd[0].getDefaultConfiguration().getBounds().x, gd[0].getDefaultConfiguration().getBounds().y + window.getY());
			
		}
		int width =  (int) (gd[0].getDisplayMode().getWidth());
		int height = (int) (gd[0].getDisplayMode().getHeight());*/
		
		this.window.setExtendedState(this.window.getExtendedState() | JFrame.MAXIMIZED_BOTH); //Automatically maximise window
		Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
		
		int width = screenSize.width; //1536 (if 1080p screen)
		int height = screenSize.height;//864 (if 1080p screen)
		int actual_height = height - height*40/864 - height*75/864; //True window height (having subtracted footer and header height)
		
		this.body = MenuEmploye.createPanel(0, 0, width, 2*height/3, new Color(249, 244, 244));
        try {
            this.img = ImageIO.read(new File("icons/Home_empty.png")).getScaledInstance(width, height,Image.SCALE_SMOOTH);
        } catch (IOException e) {
            e.printStackTrace();
        }
        this.icon = new ImageIcon(img);
        this.pictureLabel = new JLabel();
        this.pictureLabel.setIcon(this.icon);
        this.body.add(pictureLabel);
        this.window.add(this.body);
		
        this.b1 = MenuEmploye.createButton("CLICK TO START", 0, 2*height/3, width, height/4 + height* 15/864, new Color(136, 172, 215), Color.WHITE);
		try {
		     GraphicsEnvironment ge = GraphicsEnvironment.getLocalGraphicsEnvironment();
		     Font Uniform_Condensed_2 = Font.createFont(Font.TRUETYPE_FONT, new File("fonts/Uniform Condensed Medium.ttf")).deriveFont(60f);
		     ge.registerFont(Uniform_Condensed_2);
		     this.b1.setFont(Uniform_Condensed_2);
		} catch (IOException|FontFormatException e) {
		     e.printStackTrace();
		}
		
		this.window.add(this.b1);
        
		//Assigning each button to their ActionListener
        b1.addActionListener(this.B_Start);
        
        this.window.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE); //System exits if the default close button is clicked
        
        this.window.setVisible(true);
        this.b1.repaint();
	}
		
	JFrame getWindow() {
		return this.window;
	}
	
	/**
	 * Start if the Start button is pressed
	 * @author Younes Saoudi
	 *
	 */
	private class Start implements ActionListener {
		public void actionPerformed(ActionEvent e) {
			new SignIn(window);
		}
	}
	
}

