import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.FontFormatException;
import java.awt.GraphicsEnvironment;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Observable;
import java.util.Observer;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;

/**
 * La version graphique (swing) du menu
 *
 * @author Issam HABIBI
 * @version 1.0
 */
@SuppressWarnings("deprecation")
public class MenuSwing implements Observer {

    /**
     * Attributs of menuSwing
     */
    private Menu menu;
    JFrame fenetre;
    private Choix choix;
    private JButton bEntree, bPlatP, bDessert, bSignOut, bPay, bCancelOrder;
	JButton bAccount;
	JButton bHistory;
	JButton bRewardPoint;
	JButton bCustomerName;
    boolean bCustomerNamehasBeenClicked = false;
    JScrollPane scrollPane;
    private JLabel logo, footerLabel, recapLabel;
    private JPanel headCenter, headRight, footer, recap;
	JPanel panel0;
    private Color Background;
    private JLabel text;
    Customer Customer;
    private ActionListener B_Pay = new ActionPay();
    ActionListener B_Account = new ActionShowAccDetails();
    ActionListener B_ShowLoyaltyPoints = new ActionRewardPoint();
    //private ActionListener B_History = new ActionShowHistory();	(will be implemented later)
    public ArrayList<PlatResto> listChoixEntree = new ArrayList<PlatResto>();
    public ArrayList<PlatResto> listChoixPlatP = new ArrayList<PlatResto>();
    public ArrayList<PlatResto> listChoixDessert = new ArrayList<PlatResto>();

    //Les dimensions de la fen�tre et des constantes utiles dans le design
    public final static Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
    public final static int width = screenSize.width;
    public final static int height = screenSize.height;
	@SuppressWarnings("rawtypes")
	public static final GUI MenuModel = new GUI();
    int actual_height = height - height * 40 / 864 - height * 75 / 864; //La vraie hauteur de la fen�tre (ayant soustrait l'ent�te et le bas de page)


    /**
     * Constructeur du menu version Swing
     *
     * @param menu le menu
     */
    public MenuSwing(Menu menu, Choix choix, Customer Customer) {

        this.Customer = Customer;
        this.menu = menu;
        this.choix = choix;
        //Ajouter un observateur � l'objet choix , pour assurer l'int�ractivit� entre les composantes de l'appli .
        this.choix.addObserver(this);
        this.Background = Color.WHITE;
        //La cr�ation de la fen�tre
        this.fenetre = MenuModel.createWindow("Menu", 0, 0);
        //Maximiser automatiquement la fen�tre
        this.fenetre.setExtendedState(this.fenetre.getExtendedState() | JFrame.MAXIMIZED_BOTH);
        this.fenetre.getContentPane().setBackground(Background);

        //La partie gauche de l'ent�te
        if (Customer.getLastName().equals("NULL") && Customer.getFirstName().equals("NULL")) {
            this.logo = MenuModel.createLabel("Customer", 70 * width / 1536, 0, 120, 40);
            this.fenetre.add(logo);
        } else {
            //Making the Pop-Up Buttons which appear when clicking on the logged-in customer's name
            //@author Younes Saoudi
        	new PopUpMenu(this);
        }

        //La partie droite de l'ent�te
        this.headCenter = MenuModel.createPanel(width * 176 / 1536, 0, width * 1024 / 1536, 40, Background);
        this.fenetre.add(this.headCenter);
        this.headRight = MenuModel.createPanel(width * 176 / 1536 + width * 1024 / 1536, 0,
                width * 336 / 1536, 40, Background);
        this.text = MenuModel.createLabel("Menu", 10, 10, 200, 40);
        this.headRight.add(text);
        this.fenetre.add(this.headRight);


        this.bSignOut = MenuModel.createButton("Exit to Main Menu", 0, 0, 100, 40, new Color(220, 53, 69), Color.WHITE);
        //Fermer l'application en cliquant sur le boutton SignOut
        this.bSignOut.addActionListener(new ActionSignOut());

        //BAS DE PAGE
        this.footer = MenuModel.createPanel(0, height * 725 / 864, width, 75, Background);
        this.footer.setLayout(new BorderLayout());
        this.footerLabel = MenuModel.createLabel("� 2020 Resto'N7 ", 0, 0, 100, 50);
        this.footer.add(this.bSignOut, BorderLayout.NORTH);
        this.footer.add(this.footerLabel, BorderLayout.CENTER);
        this.fenetre.add(this.footer);

        //Cr�ation des bouttons de la pages
        this.bEntree = MenuModel.createButton("Entrees", width / 4, actual_height / 2 + height * 110 / 864,
                100, 40, new Color(15, 125, 102), Color.WHITE);
        //R�cup�rer les entr�es en cliquant sur le boutton Entr�es
        this.bEntree.addActionListener(new ActionEntree());

        this.bPlatP = MenuModel.createButton("Plats Principaux", 2 * width / 4 - width * 100 / 1536, actual_height / 2 + height * 110 / 864,
                200, 40, new Color(32, 18, 83), Color.WHITE);
        this.bPlatP.addActionListener(new ActionPlatPrincipal());

        this.bDessert = MenuModel.createButton("Desserts", 3 * width / 4 - width * 100 / 1536, actual_height / 2 + height * 110 / 864,
                140, 40, new Color(238, 94, 138), Color.WHITE);
        this.bDessert.addActionListener(new ActionDessert());

        //this.bRewardPoint= MenuModel.createButton("Points de fidélité", width/2 - width *100/1536, actual_height/2,
        //		200, 40, new Color(189, 51, 164), Color.WHITE);


        this.bCancelOrder = MenuModel.createButton("Cancel Order", width / 2 - width * 205 / 1536, actual_height / 2 + height * 220 / 864,
                200*width/1536, 40, new Color(161, 59, 81), Color.WHITE);
        this.bCancelOrder.addActionListener(new ActionCancelOrder());
        this.bCancelOrder.setEnabled(false);

        this.bPay = MenuModel.createButton("Pay", width / 2 + width * 5 / 1536, actual_height / 2 + height * 220 / 864,
                200*width/1536, 40, new Color(94, 141, 85), Color.WHITE);
        this.bPay.addActionListener(B_Pay);
        this.bPay.setEnabled(false);

        //Writing the Welcome sign for both logged-in customers and guests
        JLabel Welcome = MenuModel.createLabel("Welcome, ", width * 250 / 1536, actual_height / 4 - actual_height * 75 / 749, width, 100);
        JLabel FullName = MenuModel.createLabel(Customer.getFirstName() + " " + Customer.getLastName() + " ...", width * 500 / 1536, actual_height / 4, width, 100);
        if (Customer.getLastName().equals("NULL") && Customer.getFirstName().equals("NULL")) {
            Welcome.setText("Welcome!");
            Welcome.setLocation(width * 600 / 1536, actual_height / 4 - actual_height * 75 / 749);
            FullName.setText("");
        }
        Welcome.setForeground(new Color(247, 167, 80));
        FullName.setForeground(new Color(247, 167, 80));
        Welcome.setForeground(new Color(57, 186, 204));
		FullName.setForeground(new Color(57, 186, 204));
        //Adding the labels to the JFrame
        this.fenetre.add(Welcome);
        this.fenetre.add(FullName);


        //Ajouter l'ensemble des bouttons au fen�tre
        this.fenetre.add(bEntree);
        this.fenetre.add(bPlatP);
        this.fenetre.add(bDessert);
        //this.fenetre.add(bRewardPoint);
        this.fenetre.add(bPay);
        this.fenetre.add(bCancelOrder);

        //R�capitulatif du client
        this.recap = MenuModel.createPanel(5, 40, width * 175 / 1536, actual_height - height * 75 / 864, null);
        this.recap.setLayout(new BorderLayout());
        this.recapLabel =
                MenuModel.createLabel("<html>My Order :" + this.choix.toStringCommande() + "<br/>    <br/>TOTAL : "
                                + this.choix.getPrixTotal() + " �</html>"
                        , 0, 0, 0, 0);
        this.recap.add(recapLabel);
        this.fenetre.add(recap);

        //Setting up the fonts for all the remaining Swing Assets
        try {
            GraphicsEnvironment ge = GraphicsEnvironment.getLocalGraphicsEnvironment();
            Font Museo_1000 = Font.createFont(Font.TRUETYPE_FONT, new File("fonts/Museo Slab W00 1000.ttf")).deriveFont(70f);
            ge.registerFont(Museo_1000);
            //Font Museo_300 = Font.createFont(Font.TRUETYPE_FONT, new File("fonts/Museo Slab W00 300.ttf")).deriveFont(15f);
            //ge.registerFont(Museo_300);
            Font Museo_500 = Font.createFont(Font.TRUETYPE_FONT, new File("fonts/Museo Slab W00 500.otf")).deriveFont(15f);
            ge.registerFont(Museo_500);
            Font Uniform_Condensed_3 = Font.createFont(Font.TRUETYPE_FONT, new File("fonts/Uniform Condensed Black.ttf")).deriveFont(15f);
            ge.registerFont(Uniform_Condensed_3);
            Font Uniform_Light = Font.createFont(Font.TRUETYPE_FONT, new File("fonts/Uniform Light.ttf")).deriveFont(15f);
            ge.registerFont(Uniform_Light);
            this.bSignOut.setFont(Uniform_Light);
            this.footerLabel.setFont(Uniform_Light);
            this.text.setFont(Uniform_Light);
            Welcome.setFont(Museo_1000);
            FullName.setFont(Museo_1000);
            this.bEntree.setFont(Museo_500);
            this.bPlatP.setFont(Museo_500);
            this.bDessert.setFont(Museo_500);
            if ((Customer.getLastName().equals("NULL") && Customer.getFirstName().equals("NULL"))) {
                this.logo.setFont(Uniform_Light);
            }
            this.bPay.setFont(Museo_500);
            this.bCancelOrder.setFont(Museo_500);
            this.recapLabel.setFont(Uniform_Condensed_3);
        } catch (IOException | FontFormatException e) {
            e.printStackTrace();
        }

        //Faciliter la fermeture de la fen�tre et la rendre visible
        fenetre.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        fenetre.setVisible(true);
        bEntree.repaint();
        bPlatP.repaint();
        bDessert.repaint();
        bPay.repaint();
        bSignOut.repaint();
        if (!(Customer.getLastName().equals("NULL") && Customer.getFirstName().equals("NULL"))) {
            scrollPane.repaint();
            panel0.repaint();
        }
    }

    /**
     * Get the menu
     *
     * @return the menu
     */
    public Menu getMenu() {
        return this.menu;
    }

    /**
     * Get the choice
     *
     * @return get the choice
     */
    public Choix getChoix() {
        return this.choix;
    }

    /**
     * Get the customer
     *
     * @return the customer
     */
    public Customer getCustomer() {
        return this.Customer;
    }

    /**
     * Get the window
     *
     * @return the window
     */
    public JFrame getFenetre() {
        return this.fenetre;
    }

    @Override
    public void update(Observable arg0, Object arg1) {
        this.recapLabel.setText("<html>My Order :" + this.choix.toStringCommande() + "<br/>    <br/>TOTAL : "
                + this.choix.getPrixTotal() + " �</html>");
        if (this.choix.getPrixTotal() > 0) {
            this.bCancelOrder.setEnabled(true);
            this.bPay.setEnabled(true);
        } else {
            this.bCancelOrder.setEnabled(false);
            this.bPay.setEnabled(false);
        }
    }

    /**
     * Add an action listener on entree button
     */
    public class ActionEntree implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent arg0) {
            //Make the pop-up menu disappear if it's visible
            if (bCustomerNamehasBeenClicked) {
                scrollPane.setVisible(false);
                bCustomerNamehasBeenClicked = false;
            }
            fenetre.dispose();
            new EntreeSwing(MenuSwing.this);
        }

    }

    /**
     * Add an action listener on plat principal order button
     */
    public class ActionPlatPrincipal implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent arg0) {
            //Make the pop-up menu disappear if it's visible
            if (bCustomerNamehasBeenClicked) {
                scrollPane.setVisible(false);
                bCustomerNamehasBeenClicked = false;
            }
            fenetre.dispose();
            new PlatPrincipauxSwing(MenuSwing.this);
        }

    }

    /**
     * Add an action listener on dessert button
     */
    public class ActionDessert implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent arg0) {
            //Make the pop-up menu disappear if it's visible
            if (bCustomerNamehasBeenClicked) {
                scrollPane.setVisible(false);
                bCustomerNamehasBeenClicked = false;
            }
            fenetre.dispose();
            new DessertSwing(MenuSwing.this);
        }

    }

    /**
     * Add an action listener on reward point button
     */
    public class ActionRewardPoint implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent arg0) {
            fenetre.dispose();
            new RewardPointSwing(Customer);
        }

    }

    /**
     * Add an action listener on cancel order button
     */
    public class ActionCancelOrder implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent arg0) {
            choix.clearMap();
        }

    }

    /**
     * Add an action listener on sign out button
     */
    public class ActionSignOut implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent arg0) {
            fenetre.dispose();
            Home home = new Home();
            JFrame window = home.getWindow();
            new SignIn(window);
        }

    }

    /**
     * Add an action listener on pay button
     */
    public class ActionPay implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent arg0) {
            new Payment(MenuSwing.this);
        }
    }
    
    public class ActionShowAccDetails implements ActionListener{

		@Override
		public void actionPerformed(ActionEvent e) {
			fenetre.dispose();
			new AccountDetails(Customer);
		}
    	
    }

}