import java.awt.Color;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.Font;
import java.awt.FontFormatException;
import java.awt.GraphicsEnvironment;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.io.IOException;

import javax.swing.JButton;
import javax.swing.JPanel;
import javax.swing.JScrollPane;

/**
 * The goal of this class is to generate a pop menu in the customer's interface when the user clicks on 
 * bCustomerName on the top right of the screen. This pop-up menu includes Account Details, Loyalty Points
 * and Purchase History.
 * @author Younes Saoudi
 *
 */
public class PopUpMenu {
	
	public PopUpMenu(MenuSwing Interface) {
		Interface.bCustomerName = MenuSwing.MenuModel.createButton(Interface.Customer.getFirstName() + " " + Interface.Customer.getLastName(), MenuSwing.width * 23 / 1536, MenuSwing.height * 10 / 864, 210, 20, null, null);
		Interface.bCustomerName.setOpaque(false);
        Interface.bCustomerName.setContentAreaFilled(false);
        Interface.bCustomerName.setForeground(Color.BLACK);
        Interface.fenetre.add(Interface.bCustomerName);

        //Making the pop up menu
        JPanel panel = new JPanel();
        panel.setLayout(new GridLayout(3, 1));
        String[] Button_Names = {"Account Details", "Purchase History", "Loyalty Points"};
        Interface.bAccount = new JButton(Button_Names[0]);
        Interface.bHistory = new JButton(Button_Names[1]);
        Interface.bRewardPoint = new JButton(Button_Names[2]);

        Interface.bAccount.setPreferredSize(new Dimension(180, 35));
        Interface.bHistory.setPreferredSize(new Dimension(180, 35));
        Interface.bRewardPoint.setPreferredSize(new Dimension(180, 35));

        Interface.bAccount.setBackground(Color.BLACK);
        Interface.bHistory.setBackground(Color.BLACK);
        Interface.bRewardPoint.setBackground(Color.BLACK);

        Interface.bAccount.setForeground(Color.WHITE);
        Interface.bHistory.setForeground(Color.WHITE);
        Interface.bRewardPoint.setForeground(Color.WHITE);

        Interface.bAccount.addActionListener(Interface.B_Account);
        //Interface.bHistory.addActionListener(new ActionShowHistory());
        Interface.bRewardPoint.addActionListener(Interface.B_ShowLoyaltyPoints);

        panel.add(Interface.bAccount);
        panel.add(Interface.bRewardPoint);
        panel.add(Interface.bHistory);

        //Setting the button fonts.
        try {
            GraphicsEnvironment ge = GraphicsEnvironment.getLocalGraphicsEnvironment();
            Font Uniform_Light = Font.createFont(Font.TRUETYPE_FONT, new File("fonts/Uniform Light.ttf")).deriveFont(15f);
            ge.registerFont(Uniform_Light);
            Interface.bAccount.setFont(Uniform_Light);
            Interface.bHistory.setFont(Uniform_Light);
            Interface.bRewardPoint.setFont(Uniform_Light);
            Interface.bCustomerName.setFont(Uniform_Light);
        } catch (IOException | FontFormatException e) {
            e.printStackTrace();
        }

        //Panel containing the (eventually) scroll-able pop-up menu
        JPanel container = new JPanel(new FlowLayout(FlowLayout.CENTER, 0, 0));
        container.add(panel);
        Interface.scrollPane = new JScrollPane(container);
        Interface.scrollPane.setVisible(false);
        Interface.panel0 = MenuSwing.MenuModel.createPanel(MenuSwing.width * 227 / 1536, MenuSwing.height * 5 / 864, 200, 150, null);
        Interface.panel0.setOpaque(false); //transparent panel, only buttons appear
        Interface.panel0.add(Interface.scrollPane);

        /**    What happens when the Interface.bCustomerName button is clicked
         * @author Younes Saoudi
         */
        Interface.bCustomerName.addActionListener(new ActionListener() {

            @Override
            public void actionPerformed(ActionEvent e) {
                //if the pop-up menu is not visible
                if (!Interface.bCustomerNamehasBeenClicked) {
                    Interface.scrollPane.setVisible(true);
                    Interface.bCustomerNamehasBeenClicked = true;
                    Interface.fenetre.invalidate();
                    Interface.fenetre.validate();
                    Interface.fenetre.repaint();
                } else {
                    Interface.bCustomerNamehasBeenClicked = false;
                    Interface.scrollPane.setVisible(false);
                }
            }

        });
        Interface.fenetre.add(Interface.panel0);
	}
}
