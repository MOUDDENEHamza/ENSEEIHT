import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.FontFormatException;
import java.awt.Graphics2D;
import java.awt.GraphicsEnvironment;
import java.awt.Image;
import java.awt.RenderingHints;
import java.awt.Toolkit;
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

//@autor chaimoua

public class OperationsFinancialState {
	private JFrame window;
	private JButton button1, button2, button3, button4;
	private JPanel panel, footer;
	public JLabel text, footerLabel;
	public final static Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
	public final static int width = screenSize.width;
	public final static int height = screenSize.height;
	int actual_height = height - 40 - 75;
	private final ActionListener Monthly_Gain = new Monthly_Gain();
	private final ActionListener History = new History();
	private final ActionListener Deposite_Statement = new DepositeStatement();
	private final ActionListener Back = new Back();
	private Employee Employee;

	public OperationsFinancialState(Employee employee) {
		this.Employee = employee;
		// Creat a window
		GUI MenuEtat = new GUI();
		this.window = MenuEtat.createWindow("Operations", 700, 750);
		this.window.setExtendedState(this.window.getExtendedState() | JFrame.MAXIMIZED_BOTH);
		this.panel = MenuEtat.createPanel(350 * width / 1360, 121 * height / 750, 700, 350, Color.white);
		// this.window.getContentPane().setBackground(new Color(52,69,137));
		this.window.getContentPane().setBackground(Color.white);

		// Add a picture
		ImageIcon pic = new ImageIcon("pics/operation.png");
		Image newPic = scaleImage(pic.getImage(), 700, 350);
		JLabel icon = new JLabel(new ImageIcon(newPic), JLabel.CENTER);
		this.panel.add(icon);

		// Create the buttons
		// button1
		// this.button1 = MenuEtat.createButton("History",width/2 - width *38/1360+
		// 85*width/1360, actual_height/2-65*height/705 ,
		// 300, 60,new Color(1,158,147), Color.WHITE);
		this.button1 = MenuEtat.createButton("History", width / 2 - width * 350 / 1360 + 65 * width / 1360,
				actual_height / 2 + 180 * height / 705, 190, 40, new Color(117, 184, 201), Color.WHITE);
		this.button1.addActionListener(this.History);
		this.window.add(button1);

		// button2
		this.button2 = MenuEtat.createButton("Consult", width / 2 - width * 350 / 1360 + 280 * width / 1360,
				actual_height / 2 + 180 * height / 705, 190, 40, new Color(117, 184, 201), Color.WHITE);
		this.button2.addActionListener(this.Monthly_Gain);
		this.window.getContentPane().add(button2);

		// button3
		this.button3 = MenuEtat.createButton("Deposite Statement", width / 2 - width * 350 / 1360 + 500 * width / 1360,
				actual_height / 2 + 180 * height / 705, 190, 40, new Color(117, 184, 201), Color.WHITE);
		this.button3.addActionListener(this.Deposite_Statement);
		this.window.add(button3);

		// button4

		this.button4 = MenuEtat.createButton("Back", 0, 0, 150, 60, new Color(117, 184, 201), Color.white);
		button4.addActionListener(this.Back);
		this.footer = MenuEtat.createPanel(0, height * 725 / 864, width, height * 75 / 864, Color.WHITE);
		this.footer.setLayout(new BorderLayout());
		this.footerLabel = MenuEtat.createLabel("E24 Restaurant 2020", 0, 0, 100, 50);
		this.footer.add(this.button4, BorderLayout.NORTH);
		this.footer.add(this.footerLabel, BorderLayout.CENTER);
		this.window.add(this.footer); // Adding footer to JFrame

		// Add a text
		this.text = MenuEtat.createLabel("Please, choose the operation you want to do.. ", 300 * width / 1360,
				height * 20 / 705, width * 176 / 200, 100);
		this.text.setForeground(Color.black);
		this.window.add(text);
		this.window.add(this.panel);
		// Change font and text size
		text.setFont(new java.awt.Font(Font.SERIF, Font.BOLD, 30));
		
		try {
            GraphicsEnvironment ge = GraphicsEnvironment.getLocalGraphicsEnvironment();
            Font Avenir_Light = Font.createFont(Font.TRUETYPE_FONT, new File("fonts/avenir-light.otf")).deriveFont(17f);
            ge.registerFont(Avenir_Light);
            Font Uniform_Light = Font.createFont(Font.TRUETYPE_FONT, new File("fonts/Uniform Light.ttf")).deriveFont(15f);
			ge.registerFont(Uniform_Light);
			this.footerLabel.setFont(Uniform_Light);
            this.button1.setFont(Avenir_Light);
            this.button2.setFont(Avenir_Light);
            this.button3.setFont(Avenir_Light);
            this.button4.setFont(Avenir_Light);
            this.footerLabel.setFont(Uniform_Light);
        } catch (IOException | FontFormatException e) {
            e.printStackTrace();
        }
		
		this.window.setVisible(true);
		this.button1.repaint();
		this.button2.repaint();
		this.button3.repaint();
		this.button4.repaint();
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

	private class History implements ActionListener {
		public void actionPerformed(ActionEvent e) {
			new HistorySwing(Employee);
			window.dispose();
		}
	}

	private class Monthly_Gain implements ActionListener {
		public void actionPerformed(ActionEvent e) {
			new ChoiceMonthsToCompare(Employee);
			window.dispose();
		}
	}

	private class DepositeStatement implements ActionListener {
		public void actionPerformed(ActionEvent e) {
			new ChoiceDepositStateSwing(Employee);
			window.dispose();
		}
	}

	private class Back implements ActionListener {
		public void actionPerformed(ActionEvent e) {
			new FinancialStateSwing(Employee);
			window.dispose();
		}
	}

}
