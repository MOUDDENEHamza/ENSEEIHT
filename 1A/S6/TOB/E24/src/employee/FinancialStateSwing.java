package employee;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;

import general.GUI;

import java.awt.*;

/**
 * Show the operations allowed in financial state.
 *
 * @author Chaimaa_LOTFI
 * @version 1.0
 */

public class FinancialStateSwing {
	private JFrame window;
	private JButton button1, button2;
	private JPanel panel;

	public final static Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
	public final static int width = screenSize.width;
	public final static int height = screenSize.height;
	int actual_height = height - 40 - 75;
	private final ActionListener Consult = new Consult();
	private final ActionListener Back = new Back();
	private Employee Employee;

	public FinancialStateSwing(Employee employee) {
		this.Employee = employee;
		// Create the new window
		GUI MenuState = new GUI();
		this.window = MenuState.createWindow("Financial State", 1000, 800);
		this.window.setExtendedState(this.window.getExtendedState() | JFrame.MAXIMIZED_BOTH);
		this.panel = MenuState.createPanel(width/2 - 450*width/1536, 0, 900*width/1536, 504*height/864, Color.white);
		this.window.getContentPane().setBackground(Color.white);

		// Read and add the picture to the window
		ImageIcon pic = new ImageIcon("icons/hello.png");
		Image newPic = scaleImage(pic.getImage(), 900*width/1536, 504*height/864);
		JLabel icon = new JLabel(new ImageIcon(newPic), JLabel.CENTER);
		this.panel.add(icon);
		this.window.add(this.panel);

		// Create the buttons
		// button1
		this.button1 = MenuState.createButton("Consult", 2 * width / 3 - width * 170 / 1360,
				actual_height / 2 + 150 * height / 705, 150, 40,  new Color(117, 184, 201), Color.WHITE);

		this.window.add(button1);
		button1.addActionListener(this.Consult);

		// bouton2
		this.button2 = MenuState.createButton("Back ", width / 2 - width * 194 / 1360,
				actual_height / 2 + 150 * height / 705, 150, 40, new Color(117, 184, 201), Color.WHITE);

		this.window.add(button2);
		button2.addActionListener(this.Back);
		
		try {
            GraphicsEnvironment ge = GraphicsEnvironment.getLocalGraphicsEnvironment();
            Font Avenir_Light = Font.createFont(Font.TRUETYPE_FONT, new File("fonts/avenir-light.otf")).deriveFont(17f);
            ge.registerFont(Avenir_Light);
            this.button1.setFont(Avenir_Light);
            this.button2.setFont(Avenir_Light);
        } catch (IOException | FontFormatException e) {
            e.printStackTrace();
        }

		// setVisible
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
		g.setRenderingHint(RenderingHints.KEY_ALPHA_INTERPOLATION, RenderingHints.VALUE_ALPHA_INTERPOLATION_QUALITY);
		g.drawImage(source, 0, 0, width, height, null);
		g.dispose();
		return img;
	}

	private class Consult implements ActionListener {
		public void actionPerformed(ActionEvent e) {
			new OperationsFinancialState(Employee);
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
