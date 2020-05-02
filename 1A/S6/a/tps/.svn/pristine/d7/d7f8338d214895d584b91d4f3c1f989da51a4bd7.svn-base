import javax.swing.*;
import java.awt.*;
import javax.swing.event.*;
import java.awt.event.*;
import java.util.*;
import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

/**
 * Programmation d'un jeu de Morpion avec une interface graphique Swing.
 * <p>
 * REMARQUE : Dans cette solution, le patron MVC n'a pas été appliqué !
 * On a un modèle (?), une vue et un contrôleur qui sont fortement liés.
 *
 * @author Xavier Crégut
 * @version $Revision: 1.4 $
 */

public class MorpionSwing implements ActionListener {

    // les images à utiliser en fonction de l'état du jeu.
    private static final Map<ModeleMorpion.Etat, ImageIcon> images
            = new HashMap<ModeleMorpion.Etat, ImageIcon>();

    static {
        images.put(ModeleMorpion.Etat.VIDE, new ImageIcon("blanc.jpg"));
        images.put(ModeleMorpion.Etat.CROIX, new ImageIcon("croix.jpg"));
        images.put(ModeleMorpion.Etat.ROND, new ImageIcon("rond.jpg"));
    }

// Choix de réalisation :
// ----------------------
//
//  Les attributs correspondant à la structure fixe de l'IHM sont définis
//	« final static » pour montrer que leur valeur ne pourra pas changer au
//	cours de l'exécution.  Ils sont donc initialisés sans attendre
//  l'exécution du constructeur !

    private ModeleMorpion modele;    // le modèle du jeu de Morpion

//  Les éléments de la vue (IHM)
//  ----------------------------

    /**
     * Fenêtre principale
     */
    private JFrame fenetre;

    /**
     * Bouton pour quitter
     */
    private final JMenuItem quitter = new JMenuItem("Quiter");

    /**
     * Bouton pour commencer une nouvelle partie
     */
    private final JMenuItem nouvellePartie = new JMenuItem("Nouvelle partie");

    private JButton quit, newGame, currentPlayer;

    /**
     * Cases du jeu
     */
    private final JLabel[][] cases = new JLabel[3][3];
    private final JButton[][] cell = new JButton[3][3];
    /**
     * Zone qui indique le joueur qui doit jouer
     */
    private final JLabel joueur = new JLabel();


// Le constructeur
// ---------------

    /**
     * Construire le jeu de morpion
     */
    public MorpionSwing() {
        this(new ModeleMorpionSimple());
    }

    /**
     * Construire le jeu de morpion
     */
    public MorpionSwing(ModeleMorpion modele) {
        // Initialiser le modèle
        this.modele = modele;

        // Créer les cases du Morpion
        for (int i = 0; i < this.cases.length; i++) {
            for (int j = 0; j < this.cases[i].length; j++) {
                this.cases[i][j] = new JLabel();
            }
        }

        // Initialiser le jeu
        this.recommencer();

        // Construire la vue (présentation)
        //	Définir la fenêtre principale
        this.fenetre = new JFrame("Morpion");
        this.fenetre.setLocation(100, 200);
        // afficher la fenêtre
        Image icon = Toolkit.getDefaultToolkit().getImage("croix.jpg");
        this.fenetre.setIconImage(icon);
        this.fenetre.setSize(400, 400);

        JMenuBar mb = new JMenuBar();
        JMenu jeu = new JMenu("jeu");
        this.quitter.addActionListener(this);
        this.nouvellePartie.addActionListener(this);
        jeu.add(this.quitter);
        jeu.add(this.nouvellePartie);
        mb.add(jeu);
        this.fenetre.setJMenuBar(mb);

        int i, j;

        for (i = 0; i < 3; i++) {
            for (j = 0; j < 3; j++) {
                this.cell[i][j] = new JButton(new ImageIcon("blanc.jpg"));
                this.cell[i][j].setBounds(100 + 50 * j, 100 + 50 * i, 50, 50);
                this.cell[i][j].addActionListener(this);
                this.fenetre.add(cell[i][j]);
            }
        }

        this.quit = new JButton("Quitter");
        this.quit.setBounds(50, 300, 100, 30);
        this.quit.addActionListener(this);
        this.fenetre.add(this.quit);

        this.newGame = new JButton("Nouvelle partie");
        this.newGame.setBounds(200, 300, 150, 30);
        this.newGame.addActionListener(this);
        this.fenetre.add(this.newGame);

        this.currentPlayer = new JButton(new ImageIcon("blanc.jpg"));
        this.currentPlayer.setBounds(150, 30, 50, 50);
        this.currentPlayer.addActionListener(this);
        this.fenetre.add(currentPlayer);

        // Construire le contrôleur (gestion des événements)
        this.fenetre.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        this.fenetre.setLayout(null);
        this.fenetre.setVisible(true);    // l'afficher
    }

// Quelques réactions aux interactions de l'utilisateur
// ----------------------------------------------------

    /**
     * Recommencer une nouvelle partie.
     */
    public void recommencer() {
        this.modele.recommencer();

        // Vider les cases
        for (int i = 0; i < this.cases.length; i++) {
            for (int j = 0; j < this.cases[i].length; j++) {
                this.cases[i][j].setIcon(images.get(this.modele.getValeur(i, j)));
            }
        }

        // Mettre à jour le joueur
        joueur.setIcon(images.get(modele.getJoueur()));
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        if (e.getSource() == this.quitter || e.getSource() == this.quit)
            System.exit(0);
        if (e.getSource() == this.nouvellePartie || e.getSource() == this.newGame) {
            new MorpionSwing();
        } else {
            int i, j;
            for (i = 0; i < 3; i++) {
                for (j = 0; j < 3; j++) {
                    if (e.getSource() == this.cell[i][j]) {
                        try {
                            if (modele.getJoueur().toString() == "CROIX") {
                                this.modele.cocher(i, j);
                                this.currentPlayer.setIcon(new ImageIcon("croix.jpg"));
                                this.cell[i][j].setIcon(new ImageIcon("croix.jpg"));
                            } else if (modele.getJoueur().toString() == "ROND") {
                                this.modele.cocher(i, j);
                                this.currentPlayer.setIcon(new ImageIcon("rond.jpg"));
                                this.cell[i][j].setIcon(new ImageIcon("rond.jpg"));
                            }
                        } catch (CaseOccupeeException exception) {
                            JOptionPane.showMessageDialog(this.fenetre, "Erreur : La case n'est pas vide!");
                        }
                    }
                }
            }
            if (this.modele.estTerminee()) {
                if (this.modele.estGagnee()) {
                        JOptionPane.showMessageDialog(this.fenetre, modele.getJoueur().toString() + " a gagné");
                } else {
                    JOptionPane.showMessageDialog(this.fenetre, "Partie nulle");
                }
                System.exit(0);
            }
        }
    }


// La méthode principale
// ---------------------

    public static void main(String[] args) {
        EventQueue.invokeLater(new Runnable() {
            public void run() {
                new MorpionSwing();
            }
        });
    }

}
