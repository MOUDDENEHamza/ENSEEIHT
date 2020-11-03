// Time-stamp: <10 jui 2013 16:51 queinnec@enseeiht.fr>
// V0.1 9/13 (PM, commentaires)
// V0.2 10/14 (PM, aide)
// V0.3 10/15 (PM, correction placement fourchettes)

import javax.swing.*;
import javax.swing.event.*;
import java.awt.*;
import java.awt.event.*;
import java.util.Hashtable;
import Synchro.Simulateur;

/** La partie graphique des philosophes.
 * Les seules méthodes visibles sont IHMPhilo.changerEtat et IHMPhilo.poser.
 *
 * Note : le code est crade et mériterait une réécriture complète.
 */
public class IHMPhilo {

    /* Attention: les variables d'état partagées de l'affichage
     * (lesFourchettes[].etat et lesPhilos[].etat) ne sont pas protégées.
     * Il ne doit pas y avoir de problème avec des appels concurrents entre
     * poser et/ou changer_etat (a priori, ils concernent des objets
     * différents). Il ne devrait pas y avoir de surprise lors d'une
     * exécution concurrente avec repaint() car cette fonction est
     * thread-safe.
     */

    private final static boolean verbose = false;
    private static int nbPhilosophes;

    private Simulateur simu;

    class Point {
        public int x = 0;
        public int y = 0;
        /** Changement de position, coordonnées cartésiennes. */
        public void setPosition (int cardx, int cardy) {
            x = cardx;
            y = cardy;
        }
        /** Changement de position, coordonnées angulaires. */
        public void setPosition (double rayon, double unAngle)
        {
            x = centreTable.x + (int) (rayon * Math.cos (unAngle));
            y = centreTable.y + (int) (rayon * Math.sin (unAngle));
        }
    }

    /* Le rayon d'une assiette et de la table. */
    private double rayonAss, rayonTable;

    /* Le centre de la table. */
    private Point centreTable = new Point();

    /* Les 3 placements d'une fourchette, selon son état. */
    class Fourchette {
        EtatFourchette etat;
        Point table[];
        Point assGau[];
        Point assDro[];
        public Fourchette () {
            etat = EtatFourchette.Table;
            table = new Point[2];
            assGau = new Point[2];
            assDro = new Point[2];
            for(int i = 0; i < 2; i++) {
                table[i] = new Point();
                assGau[i] = new Point();
                assDro[i] = new Point();
            }

        }
    }

    /* Le placement d'un philosophe, et son état à l'écran. */
    class Philosophe {
        int no;
        Point position;
        EtatPhilosophe etat;
        public Philosophe (int i) {
            no = i;
            position = new Point();
            etat = EtatPhilosophe.Pense;
        }
    }

    /* Le centre d'une assiette. */
    class Assiette {
        Point position;
        public Assiette () {
            position = new Point();
        }
    }

    private static Philosophe[] lesPhilos;      // tableau [nbPhilosophes]
    private static Fourchette[] lesFourchettes; // tableau [nbPhilosophes]
    private Assiette[] lesAssiettes;     // tableau [nbPhilosophes]


    /****************************************************************/

    static double distance (int x1, int y1, int x2, int y2)
    {
        return Math.sqrt((double) (x1-x2)*(x1-x2) + (y1-y2)*(y1-y2));
    }

    /****************************************************************/
    class FenetreDessin extends JPanel {

        /* La police utilisée pour les numéros des philosophes. */
        private final Font font = new Font("Helvetica", Font.BOLD, 14); // def = ("Times",Font.PLAIN,12);
        private final FontMetrics fontMetrics = getFontMetrics(font);

        FenetreDessin ()
        {
            super();
            setFont (font);
        }

        /* appelé lors de la création et le redimensionnement de la fenêtre */
	void computePlacement ()
	{
            int taille_fenetre_x, taille_fenetre_y, taille_fenetre;
            double unAngle, unAngleFour, deplAngle;
            double distTableAss, distTablePhilo;
            double centreAss, centrePhilo;
            double posFour[] = new double[2];

            taille_fenetre_x = getWidth();
            taille_fenetre_y = getHeight();
            taille_fenetre = (taille_fenetre_x < taille_fenetre_y ?
                              taille_fenetre_x : taille_fenetre_y);

            centreTable.setPosition(taille_fenetre_x / 2, taille_fenetre_y / 2);
            rayonTable = taille_fenetre * 6.0 / (8.0 * 2.0);
            distTableAss   = taille_fenetre / 15.0;
            distTablePhilo = taille_fenetre / 20.0;
            centreAss   = rayonTable - distTableAss;
            centrePhilo = rayonTable + distTablePhilo;

            unAngle = 0.0;
            unAngleFour = 0.0;
            deplAngle = (2.0 * Math.PI) / nbPhilosophes;
            rayonAss  = (rayonTable - centreAss) / 2.0;

            posFour[0] = centreAss + rayonAss;
            posFour[1] = centreAss - rayonAss;

            for (int i = 0; i < nbPhilosophes; i++) {

                lesPhilos[i].position.setPosition (centrePhilo, unAngle);
                lesAssiettes[i].position.setPosition (centreAss, unAngle);

                unAngleFour = unAngle - deplAngle / 2.0;
                lesFourchettes[i].table[0].setPosition (posFour[0], unAngleFour);
                lesFourchettes[i].table[1].setPosition (posFour[1], unAngleFour);

                unAngleFour = unAngle - deplAngle + deplAngle / 12.0;
                lesFourchettes[i].assDro[0].setPosition (posFour[0], unAngleFour);
                lesFourchettes[i].assDro[1].setPosition (posFour[1], unAngleFour);

                unAngleFour = unAngle - deplAngle / 12.0;
                lesFourchettes[i].assGau[0].setPosition (posFour[0], unAngleFour);
                lesFourchettes[i].assGau[1].setPosition (posFour[1], unAngleFour);

                unAngle = unAngle + deplAngle;

            }
            repaint();
	}

	void tracerCercle (Graphics g, boolean fill, Point unPt, int rayon)
	{
            if (fill)
              g.fillOval(unPt.x - rayon, unPt.y - rayon, rayon*2, rayon*2);
            else
              g.drawOval(unPt.x - rayon, unPt.y - rayon, rayon*2, rayon*2);
	}


	void tracerFourchette (Graphics g, Point pos[])
	{
            g.drawLine (pos[0].x, pos[0].y, pos[1].x, pos[1].y);
	}

	void tracerNumero (Graphics g, int num, Point pos)
	{
            String str = Integer.toString(num);
            g.drawString (str, pos.x - fontMetrics.stringWidth(str) / 2,
                          (int) (pos.y + fontMetrics.getLineMetrics(str,g).getHeight() / 2));
	}

	public void paintComponent (Graphics g)
	{
            super.paintComponent(g);
            g.setColor (Color.black);
            tracerCercle (g, false, centreTable,(int) rayonTable);
            for (int i = 0; i < nbPhilosophes; i++) {
                tracerCercle (g, false, lesAssiettes[i].position,(int) rayonAss);
                tracerNumero (g, i, lesAssiettes[i].position);

                EtatFourchette etat = lesFourchettes[i].etat;
                if (etat == EtatFourchette.Table)
                  tracerFourchette (g, lesFourchettes[i].table);
                else if (etat == EtatFourchette.AssietteDroite)
                  tracerFourchette (g, lesFourchettes[i].assDro);
                else if (etat == EtatFourchette.AssietteGauche)
                  tracerFourchette (g, lesFourchettes[i].assGau);
                
                if (isInvalidState(i))
                  g.setColor(Color.red);
                if (lesPhilos[i].etat == EtatPhilosophe.Mange)
                  tracerCercle (g, true, lesPhilos[i].position, 7);
                else if (lesPhilos[i].etat != EtatPhilosophe.Pense)
                  tracerCercle (g, false, lesPhilos[i].position, 7);
                g.setColor(Color.black);
            }
	}
    } // class FenetreDessin

    /* Le panel où l'on dessine les philosophes. */
    private static FenetreDessin jp_fen;

    /****************************************************************/
    private static void afficher ()
    {
        jp_fen.repaint();
    }

    /****************************************************************/

    /* Renvoie vrai si le philosophe i mange et l'un de ses voisins mange aussi. */
    private boolean isInvalidState(int i)
    {
        return ((lesPhilos[i].etat == EtatPhilosophe.Mange)
                && ((lesPhilos[Main.PhiloGauche(i)].etat == EtatPhilosophe.Mange) || lesPhilos[Main.PhiloDroite(i)].etat == EtatPhilosophe.Mange));
    }
    
    /** Indique à l'affichage que la fourchette noFourch passe dans l'état spécifié (assiette de droite, assiette de gauche, table). */
    public static void poser (int noFourch, EtatFourchette pos)
    {
        lesFourchettes[noFourch].etat = pos;
	if (verbose)
          System.out.println("Fourchette "+noFourch+" posée "+pos);
        afficher();
    }

    /** Indique à l'affichage que le philosophe noPhilo passe dans l'état spécifié (penseur, demandeur, mangeur). */
    public static void changerEtat (int noPhilo, EtatPhilosophe etat)
    {
        lesPhilos[noPhilo].etat = etat;
	if (verbose)
          System.out.println("Philosophe "+noPhilo+" change d'état : "+etat);
        afficher();
    }

    /****************************************************************/

    /* Initialise la fenêtre d'affichage
     */
    public IHMPhilo (String nomstrategie, int _nbPhilosophes, Simulateur _simu)
    {
        simu = _simu;
        nbPhilosophes = _nbPhilosophes;
        lesPhilos = new Philosophe[nbPhilosophes];
        lesFourchettes = new Fourchette[nbPhilosophes];
        lesAssiettes = new Assiette[nbPhilosophes];

        for (int i = 0; i < nbPhilosophes; i++) {
            lesPhilos[i] = new Philosophe(i);
            lesFourchettes[i] = new Fourchette();
            lesAssiettes[i] = new Assiette();
        }

        // Fenetre
        final JFrame fenetre = new JFrame("Philosophes");
        // Listener Fermeture de la fenetre
        fenetre.addWindowListener(new WindowAdapter()
            {
                public void windowClosing(WindowEvent e)
                {
                    // Fermeture de la fenetre graphique
                    System.exit(0);
                }
            });
        // Listener Redimensionnement de la fenetre
        fenetre.addComponentListener(new ComponentAdapter()
            {
                public void componentResized(ComponentEvent e)
                {
                    jp_fen.computePlacement ();
                }
            });
        // Listener touche 'q'
        fenetre.addKeyListener (new KeyAdapter()
            {
                public void keyTyped (KeyEvent e)
                {
                    if (e.getKeyChar() == 'q') {
                        fenetre.dispatchEvent (new WindowEvent(fenetre,WindowEvent.WINDOW_CLOSING));
                        //System.exit (0);
                    }
                }
            });

        /* ===== boutons ===== */
        JPanel jp_boutons = new JPanel(new GridLayout(0,4,5,10));
        // Quitter
        JButton jb_quitter = new JButton("Quitter");
        jb_quitter.addActionListener(new ActionListener()
            {
                public void actionPerformed(ActionEvent evt)
                {
                    System.exit(0);
                }
            });
        jp_boutons.add(jb_quitter);
        // Parametres
        final JDialog dialogParam = new IHMParametres (fenetre);
        JButton jb_parametres = new JButton("Paramètres");
        jb_parametres.setToolTipText("Paramétrage fin du comportement");
        jb_parametres.addActionListener(new ActionListener()
            {
                public void actionPerformed(ActionEvent evt)
                {
                    dialogParam.setVisible (true);
                }
            });
        jp_boutons.add(jb_parametres);
        // Pause
        final JButton jb_pause = new JButton("Pause");
        jb_pause.setToolTipText("Suspension/reprise du temps");
        /* Event clicked on button "pause". */
        jb_pause.addActionListener(new ActionListener()
            {
                public void actionPerformed(ActionEvent evt)
                {
                    simu.swapRunning();
                    if (simu.getRunning())
                      jb_pause.setText("Pause");
                    else
                      jb_pause.setText("Temps suspendu");
                }
            });
        jp_boutons.add(jb_pause);
        // Aide
        JEditorPane jep_aide =
          new JEditorPane("text/html",
                          "<html><head></head><body><br>"+
                          "Les Philosophes et les Spaghettis"+
                          "<br>------------------------<br><br>"+
                          "Problème : un philosophe ne peut manger des spaghettis qu'avec deux fourchettes. Il doit donc utiliser les deux fourchettes adjacentes à son assiette pour pouvoir manger. Ce faisant, il empêche ses deux voisins de manger.<br><br>"+
                          "Symboles :"+
                          "<ul>"+
                          "<li>un disque plein indique un philosophe mangeant ;"+
                          "<ul>"+
                          	"<li>un disque noir indique une situation normale ;"+
                          	"<li>un disque rouge signale une incohérence <i>possible</i> ;"+
                          "</ul>"+
							"<li>un cercle indique un philosophe demandeur ;"+
                          "<li>aucun symbole indique un philosophe penseur ;"+
                          "</ul>"+
                          "Actions :"+
                          "<ul>"+
                          "<li>en cliquant dans l'assiette d'un philosophe, vous pouvez forcer une transition: penser -&gt; demander, ou manger -&gt; penser (la transition demander -&gt; manger reste du ressort de la synchronisation);"+
                          "<li>pause permet de suspendre le temps de la simulation. Les actions forcées sont par contre toujours possibles;"+
                          "<li>vous pouvez régler la vitesse de la simulation avec l'échelle du bas."+
                          "</ul>"+
                          "</body></html>");
        jep_aide.setEditable (false);
        JOptionPane pane = new JOptionPane(new JScrollPane (jep_aide));
        final JDialog dialogAide = pane.createDialog(fenetre,"Aide");
        dialogAide.setModal (false);
        dialogAide.setSize(500,500);
        JButton jb_aide = new JButton("  Aide   ");
        jb_aide.addActionListener(new ActionListener() {
                public void actionPerformed(ActionEvent evt)
                {
                    dialogAide.setVisible(true);
                }});
        jp_boutons.add(jb_aide);
        /* ===== Le nom de la stratégie ===== */
        JPanel jp_strategie = new JPanel();
        jp_strategie.add(new JLabel(nomstrategie));
        jp_strategie.setBorder(BorderFactory.createEtchedBorder());

        /* ===== Fenêtre de dessin ===== */
        jp_fen = new FenetreDessin();
        /* Event button release on drawingarea. */
        jp_fen.addMouseListener(new MouseAdapter()
            {
                public void mouseClicked(MouseEvent e)
                {
                    int mx, my;
                    mx = e.getX();
                    my = e.getY();
                    /* Les assiettes */
                    for (int i = 0; i < nbPhilosophes; i++) {
                        if (distance (mx, my, lesAssiettes[i].position.x,
                                      lesAssiettes[i].position.y) <= rayonAss)
                          simu.wakeup (i);
                    }
                }
            });


        /* ===== Le réglage de vitesse du temps ===== */
        JPanel jp_vitesse = new JPanel();
        jp_vitesse.setToolTipText("Vitesse d'écoulement du temps simulé");
        jp_vitesse.setBorder(BorderFactory.createEtchedBorder());
        jp_vitesse.add(new JLabel(" Vitesse du temps : "));
        JSlider js_vitesseTemps = new JSlider(JSlider.HORIZONTAL,1,100,1);
        // Event "value_changed" de l'ajustement de l'échelle de vitesse du temps.
        js_vitesseTemps.addChangeListener(new ChangeListener() {
                public void stateChanged(ChangeEvent e) {
                    JSlider source = (JSlider) e.getSource();
                    simu.setTimespeed(source.getValue());
                }
            });
        js_vitesseTemps.setMajorTickSpacing(10);
        js_vitesseTemps.setPaintTicks(true);
        // crée table de labels
        Hashtable<Integer,JLabel> labelTable = new Hashtable<Integer,JLabel>();
        labelTable.put( new Integer( 1 ), new JLabel("1") );
        labelTable.put( new Integer( 100 ), new JLabel("100") );
        js_vitesseTemps.setLabelTable( labelTable );
        js_vitesseTemps.setPaintLabels(true);
	jp_vitesse.add(js_vitesseTemps);


        /* ===== Assemblage ===== */
        Container contentPane = fenetre.getContentPane();
        contentPane.add(jp_boutons);
        contentPane.add(jp_strategie);
        contentPane.add(jp_fen);
        contentPane.add(jp_vitesse);
        /* ==== Contraintes ==== */
        GridBagLayout gridbag = new GridBagLayout();
        contentPane.setLayout(gridbag);
        // Contraintes pour la fenêtre de dessin
        GridBagConstraints c_fen = new GridBagConstraints();
        c_fen.fill = GridBagConstraints.BOTH;
        c_fen.gridwidth = GridBagConstraints.REMAINDER;
        c_fen.weightx = 1.0;
        c_fen.weighty = 1.0;
        gridbag.setConstraints(jp_fen, c_fen);
        // Contraintes pour les autres éléments
        GridBagConstraints c = new GridBagConstraints();
        c.fill = GridBagConstraints.BOTH;
        c.gridwidth = GridBagConstraints.REMAINDER;
        gridbag.setConstraints(jp_boutons, c);
        gridbag.setConstraints(jp_strategie, c);
        gridbag.setConstraints(jp_vitesse, c);

        //jp_fen.setDebugGraphicsOptions(DebugGraphics.LOG_OPTION);

        fenetre.pack();
        int taille_fen_x = 600;
        int taille_fen_y = 500;
        fenetre.setSize(taille_fen_x,taille_fen_y);
        jp_fen.computePlacement ();
        fenetre.setVisible(true);
    }

}
