import javax.imageio.ImageIO;
import javax.swing.*;
import java.awt.GraphicsEnvironment;

import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;


public class RewardPointSwing implements ActionListener {
    MenuSwing menuSwing;
	JFrame window;
	BufferedImage img1, img2;
	JPanel body1, body2, body3 , body4, body5, body6, body7, body80, body81, body82 ;
	ImageIcon icon1, icon2;
	Color Background;
	JButton bBack;
	JLabel pictureLabel1, pictureLabel2, label3, label4, label41, label42, label5, label6, label7 ;
	Customer Customer; //Younes (car Back to the Menu levait NullPointerException)
	
	
	public final static Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
	public final static int width = screenSize.width;
	public final static int height = screenSize.height;
	int actual_height = height - height*40/864 - height*75/864; //La vraie hauteur de la fen�tre (ayant soustrait l'ent�te et le bas de page) 

	
	public RewardPointSwing(Customer customer ) {
		this.Customer = customer; // Younes
		GUI PagePts = new GUI();
        this.window = PagePts.createWindow("Poins de fidélité", 1000, 800);
		this.Background = Color.WHITE;
        this.window.setExtendedState(this.window.getExtendedState() | JFrame.MAXIMIZED_BOTH); 
		this.window.getContentPane().setBackground(Background);
        this.body1 = PagePts.createPanel(0, 0, width*700/1366, height/3, new Color(255, 255, 255));
        this.body2 = PagePts.createPanel(width*700/1366,0,width/2,height/2,new Color(255, 255, 255));
        try {
            this.img1 = ImageIO.read(new File("icons/offreFidelite.png"));
        } catch (IOException e) {
            e.printStackTrace();
        }
        try {
            this.img2 = ImageIO.read(new File("icons/reward.png"));
        } catch (IOException e) {
            e.printStackTrace();
        }
        
        
        img1 = scaleImage(img1, this.body1.getWidth(),this.body1.getHeight());
        img2 = scaleImage(img2, this.body2.getWidth(),this.body2.getHeight());

        this.icon1 = new ImageIcon(img1);
        this.pictureLabel1 = new JLabel();
        this.pictureLabel1.setIcon(this.icon1);
        this.body1.add(pictureLabel1);
        this.icon2 = new ImageIcon(img2);
        this.pictureLabel2 = new JLabel();
        this.pictureLabel2.setIcon(this.icon2);
        this.body2.add(pictureLabel2);
        this.window.add(this.body1);
        this.window.add(this.body2);       
    	this.bBack = PagePts.createButton("Back to the Menu",580, 5, 200, 30, Color.RED, Color.WHITE);
		this.window.add(this.bBack);
		bBack.addActionListener(this);


		
        RewardPoints rwd = new RewardPoints(customer.getId());
        int point = rwd.getPoints();
        int reduction;
        if (point < 100) {
        	reduction = 100 - point;
        } else {
        	reduction = 100 - (point%100);
        }
    
        // this.window.add(body2);
	
        this.body3 = PagePts.createPanel(0,height/3,width*700/1366,height/6,new Color(255, 255, 255));
        this.body4 = PagePts.createPanel(0,height/2,width*700/1366,height/6,new Color(255, 255, 255));
        this.body5 = PagePts.createPanel(0,4*height/6,width*700/1366,height/7,new Color(255, 255, 255));
        this.body6 = PagePts.createPanel(0,4*height/6+height/7,width*700/1366,height-(4*height/6+height/7),new Color(255, 255, 255));
        this.label4 = PagePts.createLabel("Vous avez ", 10* width/1366, 340*height/706, 250*width/1366,100*height/706 );
	    this.label41 = PagePts.createLabel( "" + point , 10* width/1366, 340*height/706, 250*width/1366,100*height/706 );
	    this.label42 = PagePts.createLabel( " points.", 10* width/1366, 340*height/706, 250*width/1366,100*height/706 );
        this.label5 = new JLabel("Il ne vous reste que ");
	    this.label6= new JLabel("   " + reduction + "  points ");
	    this.label7 = new JLabel("pour obtenir votre prochaine récompense !");
       
	    this.body80 = PagePts.createPanel(width*700/1366, height/2, width/2, height/6, new Color(255,255,255));
        this.body81 = PagePts.createPanel(width*700/1366, 4*height/6, width/2, height/7, new Color(255,255,255));
        this.body82 = PagePts.createPanel(width*700/1366, 4*height/6+height/7, width/2, height-4*height/6+height/7, new Color(255,255,255));	    
	    JLabel label80, label81, label82;
        if (rwd.discount()) {
           label80 = new JLabel("Vous bénéficiez d'une ");
	       label81= new JLabel(" réduction de 5€.");
	       label82 = new JLabel("Profitez-en dès maintenant ! ");
	    } else {
	    	 label80 = new JLabel("Merci pour ");
		     label81 = new JLabel(" votre fidélité !!");
		     label82 = new JLabel("");
	    }
	    	
	    // this.label6 = PagePts.createLabel("  points ", 10* width/1366, 340*height/706 + 210*height/706 , 250*width/1366,100*height/706 );
	    
	    try {
		     GraphicsEnvironment ge = GraphicsEnvironment.getLocalGraphicsEnvironment();
		     Font Uniform_Light1 = Font.createFont(Font.TRUETYPE_FONT, new File("fonts/BebasNeue-Thin.otf")).deriveFont(50f);
		     ge.registerFont(Uniform_Light1);
		     Font Uniform_Light2 = Font.createFont(Font.TRUETYPE_FONT, new File("fonts/BebasNeue-Thin.otf")).deriveFont(45f);
		     ge.registerFont(Uniform_Light2);
            this.label4.setFont(Uniform_Light1);
            this.label41.setFont(Uniform_Light1);  
            this.label41.setForeground(Color.RED);
            this.label42.setFont(Uniform_Light1);
            this.label5.setFont(Uniform_Light1);
            this.label6.setFont(Uniform_Light1);
            this.label6.setForeground(Color.RED);
            this.label7.setFont(Uniform_Light2);
            label80.setFont(Uniform_Light2);
            label81.setFont(Uniform_Light2);
            label82.setFont(Uniform_Light2);
           // this.label6.setFont(Uniform_Light);
	    } catch (IOException|FontFormatException e) {
		     e.printStackTrace();
		}
	    this.body3.add(label4);
	    this.body3.add(label41);
	    this.body3.add(label42);
	    this.body4.add(label5);
	    this.body5.add(label6);
	    this.body6.add(label7);
	    this.body80.add(label80);
	    this.body81.add(label81);
	    this.body82.add(label82);
	    this.window.add(body3);
	    this.window.add(body4);
	    this.window.add(body5);
	    this.window.add(body6);
	    this.window.add(body80);
	    this.window.add(body81);
	    this.window.add(body82);
	}

    
	public BufferedImage scaleImage(Image source, int width, int height) {
	    BufferedImage img = new BufferedImage(width, height, BufferedImage.TYPE_INT_ARGB);
	    Graphics2D g = (Graphics2D) img.getGraphics();
	    g.setRenderingHint(RenderingHints.KEY_INTERPOLATION, RenderingHints.VALUE_INTERPOLATION_BILINEAR);
	    g.drawImage(source, 0, 0, width, height, null);
	    g.dispose();
	    return img;
	}
	
	
	public void actionPerformed(ActionEvent evt) {
		 if (evt.getSource() == bBack) {
			    window.dispose();
			    //Modifi� par Younes, car il retournait NullPointerException 
				//JFrame previous = menuSwing.getFenetre();
				//previous.setVisible(true);
			    Menu menu = new Menu();
				Choix choix = new Choix();
				new MenuSwing(menu, choix, Customer);
			         }
	}
}
