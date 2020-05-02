import javax.imageio.ImageIO;

import javax.swing.*;


import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.*;

/**
 * Les plats principaux proposés
 * @author Issam HABIBI
 *
 */
public class PlatPrincipauxSwing {


    public MenuSwing menuSwing;

    public JFrame fenetre;

    private JLabel logo, footerLabel, dish1Label, dish2Label, dish3Label, dish4Label;


    private JPanel headLeft, headCenter, headRight, footer, dish1, dish2, dish3, dish4,
            desc1, desc2, desc3, desc4;

    private JButton bChoisir1, bChoisir2, bChoisir3, bChoisir4, bBack;


    public PlatPrincipauxSwing(MenuSwing menuSwing) {

        GUI MenuModel = new GUI();
        this.menuSwing = menuSwing;

        this.fenetre = MenuModel.createWindow("Menu", 1000, 800);

        this.fenetre.setExtendedState(this.fenetre.getExtendedState() | JFrame.MAXIMIZED_BOTH); //Maximiser automatiquement la fen�tre
        Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
        int width = screenSize.width; //1536 (delete later)
        int height = screenSize.height;//864 (delete later)
        int actual_height = height - 40 - 75; //La vraie hauteur de la fen�tre (ayant soustrait l'ent�te et le bas de page)

        //ENTETE
        this.headLeft = MenuModel.createPanel(0, 0, width * 176 / 1536, 40, new Color(211, 211, 211));
        this.logo = MenuModel.createLabel("Resto'N7", 10, 10, 120, 40);
        this.headLeft.add(logo);
        this.bBack = MenuModel.createButton("Back to the Menu", 580, 5, 200, 30, Color.RED, Color.WHITE);
        this.bBack.addActionListener(new ActionBack());
        this.fenetre.add(this.bBack);
        this.fenetre.add(this.headLeft);

        this.headCenter = MenuModel.createPanel(width * 176 / 1536, 0, width * 1024 / 1536, 40, new Color(211, 211, 211));
        this.fenetre.add(this.headCenter);

        this.headRight = MenuModel.createPanel(width * 176 / 1536 + width * 1024 / 1536, 0, width * 336 / 1536, 40, new Color(211, 211, 211));
        JLabel text = MenuModel.createLabel("Plat Principaux", 10, 10, 200, 40);
        this.headRight.add(text);
        this.fenetre.add(this.headRight);


        //BAS DE PAGE
        this.footer = MenuModel.createPanel(0, height * 725 / 864, width, 75, new Color(211, 211, 211));
        this.footer.setLayout(new BorderLayout());
        this.footerLabel = MenuModel.createLabel("� 2020 Resto'N7 ", 0, 0, 100, 50);
        // this.footer.add(this.SignOut, BorderLayout.NORTH);
        this.footer.add(this.footerLabel, BorderLayout.CENTER);
        this.fenetre.add(this.footer);


        int bWidth = width / 4 - width * 100 / 1536 + width * 65 / 1366;
        int bHeight = actual_height / 2 - height * 25 / 768;
        int widthDiff = width - width * 750 / 1366;
        this.bChoisir1 = MenuModel.createButton("Choose", bWidth, bHeight, 100, 30, new Color(9, 128, 67), Color.WHITE);
        this.bChoisir1.addActionListener(new ActionChoose1());
        this.fenetre.add(this.bChoisir1);

        this.bChoisir2 = MenuModel.createButton("Choose", bWidth + widthDiff, bHeight, 100, 30, new Color(9, 128, 67), Color.WHITE);
        this.bChoisir2.addActionListener(new ActionChoose2());
        this.fenetre.add(this.bChoisir2);

        this.bChoisir3 = MenuModel.createButton("Choose", bWidth, bHeight + height * 290 / 768, 100, 30, new Color(9, 128, 67), Color.WHITE);
        this.bChoisir3.addActionListener(new ActionChoose3());
        this.fenetre.add(this.bChoisir3);


        this.bChoisir4 = MenuModel.createButton("Choose", bWidth + widthDiff, bHeight + height * 290 / 768, 100, 30, new Color(9, 128, 67), Color.WHITE);
        this.bChoisir4.addActionListener(new ActionChoose4());
        this.fenetre.add(this.bChoisir4);


        //Ajouter le priemier DISH
        this.dish1 = MenuModel.createPanel(width * 250 / 1366, height * 50 / 768, 250, 220, null);
        //Lire,Redimonsionner puis ajouter une image � la premi�re partie
        ImageIcon image1 = new ImageIcon("pics/Lasagne bolognaise.jpg");
        Image newImage1 = MenuModel.scaleImage(image1.getImage(), 250, 220);
        JLabel icon1 = new JLabel(new ImageIcon(newImage1), JLabel.CENTER);
        this.dish1.add(icon1);
        this.fenetre.add(this.dish1);

        this.desc1 = MenuModel.createPanel(width * 270 / 1366, height * 270 / 768, 200, 20, null);
        this.dish1Label = MenuModel.createLabel("Lasagne Bolognaise (10�)", width * 200 / 1366, height * 265 / 768, 100, 250);
        this.desc1.add(this.dish1Label);
        this.fenetre.add(this.desc1);


        this.dish2 = MenuModel.createPanel(width - width * 500 / 1366, height * 50 / 768, 250, 220, null);
        //Lire,Redimonsionner puis ajouter une image � la premi�re partie
        ImageIcon image2 = new ImageIcon("pics/Pizza Italienne.jpg");
        Image newImage2 = MenuModel.scaleImage(image2.getImage(), 250, 220);
        JLabel icon2 = new JLabel(new ImageIcon(newImage2), JLabel.CENTER);
        this.dish2.add(icon2);
        this.fenetre.add(this.dish2);


        this.desc2 = MenuModel.createPanel(width * 260 / 1366 + widthDiff, height * 270 / 768, 200, 20, null);
        this.dish2Label = MenuModel.createLabel("Pizza Italienne (10�)", width * 200 / 1366, height * 265 / 768, 100, 250);
        this.desc2.add(this.dish2Label);
        this.fenetre.add(this.desc2);


        this.dish3 = MenuModel.createPanel(width * 250 / 1366, height * 340 / 768, 250, 220, null);
        //Lire,Redimonsionner puis ajouter une image � la premi�re partie
        ImageIcon image3 = new ImageIcon("pics/Poulet.jpg");
        Image newImage3 = MenuModel.scaleImage(image3.getImage(), 250, 220);
        JLabel icon3 = new JLabel(new ImageIcon(newImage3), JLabel.CENTER);
        this.dish3.add(icon3);
        this.fenetre.add(this.dish3);

        this.desc3 = MenuModel.createPanel(width * 270 / 1366, height * 560 / 768, 200, 20, null);
        this.dish3Label = MenuModel.createLabel("Poulet (12�)", width * 200 / 1366, height * 265 / 768, 100, 250);
        this.desc3.add(this.dish3Label);
        this.fenetre.add(this.desc3);


        this.dish4 = MenuModel.createPanel(width - width * 500 / 1366, height * 340 / 768, 250, 220, null);
        //Lire,Redimonsionner puis ajouter une image � la premi�re partie
        ImageIcon image4 = new ImageIcon("pics/Canard à l'orange.png");
        Image newImage4 = MenuModel.scaleImage(image4.getImage(), 250, 220);
        JLabel icon4 = new JLabel(new ImageIcon(newImage4), JLabel.CENTER);
        this.dish4.add(icon4);
        this.fenetre.add(this.dish4);


        this.desc4 = MenuModel.createPanel(width * 270 / 1366 + widthDiff, height * 560 / 768, 200, 20, null);
        this.dish4Label = MenuModel.createLabel("Canard � l'orange (12�)", width * 200 / 1366, height * 265 / 768, 100, 250);
        this.desc4.add(this.dish4Label);
        this.fenetre.add(this.desc4);


        fenetre.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        fenetre.setVisible(true);


    }


    public class ActionBack implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent arg0) {
            fenetre.dispose();
            JFrame previous = menuSwing.getFenetre();
            previous.setVisible(true);
        }

    }


    public class ActionChoose1 implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent arg0) {
            PlatResto plat1 = menuSwing.getMenu().getMenuPlatPrincipal().get(0);
            menuSwing.listChoixPlatP.add(plat1);
            menuSwing.getChoix().ajouterPlatPrincipal(menuSwing.listChoixPlatP);
        }

    }

    public class ActionChoose2 implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent arg0) {
            PlatResto plat2 = menuSwing.getMenu().getMenuPlatPrincipal().get(1);
            menuSwing.listChoixPlatP.add(plat2);
            menuSwing.getChoix().ajouterPlatPrincipal(menuSwing.listChoixPlatP);
        }

    }

    public class ActionChoose3 implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent arg0) {
            PlatResto plat3 = menuSwing.getMenu().getMenuPlatPrincipal().get(2);
            menuSwing.listChoixPlatP.add(plat3);
            menuSwing.getChoix().ajouterPlatPrincipal(menuSwing.listChoixPlatP);
        }

    }

    public class ActionChoose4 implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent arg0) {
            PlatResto plat4 = menuSwing.getMenu().getMenuPlatPrincipal().get(3);
            menuSwing.listChoixPlatP.add(plat4);
            menuSwing.getChoix().ajouterPlatPrincipal(menuSwing.listChoixPlatP);
        }

    }


}

	
	
