// Time-stamp: <30 mai 2013 10:32 queinnec@enseeiht.fr>
// v1 (10/14, PM) : Nettoyage applet, 
//					Correction message d'avertissement émis par le test de cohérence.

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import javax.swing.event.*;
import java.util.*;
import java.util.List;
import java.util.Hashtable;	
import Synchro.Simulateur;
import Synchro.ProcId;

public class IHMLectRed
{
    // fenetre
    public JFrame fenetre;
    
    // Zones de dessin
    private JPanel jp_fenRed, jp_fenLec, jp_fenInside;
    // rayon des cercles
    private final int rayon = 7;

    private int nbLecteurs;
    private int nbRedacteurs;
    private List<ObjetGraphique> lesLecteurs = new LinkedList<ObjetGraphique>();
    private List<ObjetGraphique> lesRedacteurs = new LinkedList<ObjetGraphique>();
    private Map<ProcId,ObjetGraphique> lesProcessus = new HashMap<ProcId,ObjetGraphique>();

    private Synchro.Simulateur simu;
    private LectRed lr;

    private static Random random = new Random();

    class Point {
        int x;
        int y;
    }

    class ObjetGraphique {
        ProcId id;              // identité du processus correspondant
        LectRedEtat etat;       // Pour l'affichage
        Point posRien;
        Point posDemande;
        Point posUtilise;
        public ObjetGraphique(){
            posRien = new Point();
            posDemande = new Point();
            posUtilise = new Point();
        }
    }

    /****************************************************************/

    /** Cherche un dormeur dans <code>ens</code> qui soit dans l'état
     * <code>etat</code>.
     */
    private ObjetGraphique chercherDormeur (List<ObjetGraphique> ens, LectRedEtat etat)
    {
        int i, base;
        int fin = ens.size();
        if (fin == 0)
          return null;
        // on tire au hasard le point de départ, et on parcourt circulairement.
        base = random.nextInt (fin);
        for (i = 0; i < fin; i++) {
            int j = (base + i) % fin;
            ObjetGraphique obj = ens.get(j);
            if (obj.etat == etat) {
                //simu.wakeup (obj.id);
                return obj;
            }
        }
        return null;
    }
    
    /****************************************************************/

    /** Actualise les variables nécessaires à l'affichage après un redimensionnement. */
    public void computePlacement ()
    {
        int taille_fen_dem_x, taille_fen_inside_x; /* H1 dem = lect ou red */
        int taille_fen_dem_y, taille_fen_inside_y;
        double intervRien, intervDemande, intervUtilise;
        double startRien, startDemande, startUtilise;
		
        taille_fen_dem_x = jp_fenRed.getWidth();
        taille_fen_dem_y = jp_fenRed.getHeight();

        taille_fen_inside_x = jp_fenInside.getWidth();
        taille_fen_inside_y = jp_fenInside.getHeight();

        //System.out.println ("Placement = "+taille_fen_dem_x+"x"+taille_fen_dem_y);

        /* Les lecteurs */
        intervRien = taille_fen_dem_x / (nbLecteurs - 1 + 4.0);
        intervUtilise = taille_fen_inside_x / (nbLecteurs - 1 + 4.0);
        intervDemande = intervUtilise;
        startRien = 2.0 * intervRien;
        startUtilise = 2.0 * intervUtilise;
        startDemande = (taille_fen_dem_x - taille_fen_inside_x) / 2 + startUtilise;
    
        for (ObjetGraphique obj : lesLecteurs) {
            obj.posRien.x = (int) startRien;
            obj.posRien.y = (int) (taille_fen_dem_y * 0.7); /* H3 */
            obj.posDemande.x = (int) startDemande;
            obj.posDemande.y = (int) (taille_fen_dem_y * 0.3); /* H3 */
            obj.posUtilise.x = (int) startUtilise;
            obj.posUtilise.y = (int) (taille_fen_inside_y * 0.7); /* H3 */
            startRien += intervRien;
            startDemande += intervDemande;
            startUtilise += intervUtilise;
        }

        /* Les rédacteurs */
        intervRien = taille_fen_dem_x / (nbRedacteurs - 1 + 4.0);
        intervUtilise = taille_fen_inside_x / (nbRedacteurs -1 + 4.0);
        intervDemande = intervUtilise;
        startRien = 2.0 * intervRien;
        startUtilise = 2.0 * intervUtilise;
        startDemande = (taille_fen_dem_x - taille_fen_inside_x) / 2 + startUtilise;
    
        for (ObjetGraphique obj : lesRedacteurs) {
            obj.posRien.x = (int) startRien;
            obj.posRien.y = (int) (taille_fen_dem_y * 0.3); /* H3 */
            obj.posDemande.x = (int) startDemande;
            obj.posDemande.y = (int) (taille_fen_dem_y * 0.7); /* H3 */
            obj.posUtilise.x = (int) startUtilise;
            obj.posUtilise.y = (int) (taille_fen_inside_y * 0.3); /* H3 */
            startRien += intervRien;
            startDemande += intervDemande;
            startUtilise += intervUtilise;
        }
        jp_fenRed.repaint();
        jp_fenInside.repaint();
        jp_fenLec.repaint();
    }

    /****************************************************************/

    public void ajouterLecteur()
    {
        synchronized (this) {
            nbLecteurs++;
            ObjetGraphique obj = new ObjetGraphique();
            obj.etat = LectRedEtat.Lecteur_Rien;
            obj.id = ProcId.getSelf();
            lesLecteurs.add (obj);
            lesProcessus.put (obj.id, obj);
            computePlacement();
        }
    }

    public void ajouterRedacteur()
    {
        synchronized (this) {
            nbRedacteurs++;
            ObjetGraphique obj = new ObjetGraphique();
            obj.etat = LectRedEtat.Redacteur_Rien;
            obj.id = ProcId.getSelf();
            lesRedacteurs.add (obj);
            lesProcessus.put (obj.id, obj);
            computePlacement();
        }
    }
    
    public void enlever ()
    {
        synchronized (this) {
            ObjetGraphique obj = lesProcessus.get (ProcId.getSelf());
            lesProcessus.remove (obj.id);
            boolean estLecteur;
            if (lesLecteurs.contains (obj)) {
                lesLecteurs.remove (obj);
                nbLecteurs--;
            } else {
                lesRedacteurs.remove (obj);
                nbRedacteurs--;
            }
            computePlacement();
        }
    }

    /****************************************************************/

    private void tracerCercle (Graphics g, boolean fill, Point unPt, int rayon)
    {
        g.setColor (Color.black); 
        if (fill) 
          g.fillOval(unPt.x - rayon, unPt.y - rayon, rayon*2, rayon*2);
        else
          g.drawOval(unPt.x - rayon, unPt.y - rayon, rayon*2, rayon*2);
    }

    class FenLec extends JPanel {
	public void paintComponent (Graphics g)
	{
            super.paintComponent(g);  //paint background
            for (ObjetGraphique obj : lesLecteurs) {
                if (obj.etat == LectRedEtat.Lecteur_Rien)
                  tracerCercle (g, false, obj.posRien, rayon);
                else if (obj.etat == LectRedEtat.Lecteur_Demande)
                  tracerCercle (g, false, obj.posDemande, rayon);
            }
	}
    }

    class FenRed extends JPanel {
	public void paintComponent (Graphics g)
	{
            super.paintComponent(g);  //paint background
            for (ObjetGraphique obj : lesRedacteurs) {
                if (obj.etat == LectRedEtat.Redacteur_Rien)
                  tracerCercle (g, true, obj.posRien, rayon);
                else if (obj.etat == LectRedEtat.Redacteur_Demande)
                  tracerCercle (g, true, obj.posDemande, rayon);
            }
	}
    }

    class FenInside extends JPanel {
	public void paintComponent (Graphics g)
	{
            super.paintComponent(g);  //paint background
            for (ObjetGraphique obj : lesRedacteurs) {
                if (obj.etat == LectRedEtat.Redacteur_Ecrit)
                  tracerCercle (g, true, obj.posUtilise, rayon);
            }
            for (ObjetGraphique obj : lesLecteurs) {
                if (obj.etat == LectRedEtat.Lecteur_Lit)
                  tracerCercle (g, false, obj.posUtilise, rayon);
            }
	}
    }

    /****************************************************************/

    private Color defColor;
    
    private void checkValidState () {
        int nr, nl;

        if (defColor == null)
          defColor = jp_fenInside.getBackground();
        
        nl = 0; nr = 0;
        for (ObjetGraphique obj : lesLecteurs) {
            if (obj.etat == LectRedEtat.Lecteur_Lit)
              nl++;
        }
        for (ObjetGraphique obj : lesRedacteurs) {
            if (obj.etat == LectRedEtat.Redacteur_Ecrit)
              nr++;
        }
        if (((nl > 0) && (nr > 0)) || (nr > 1)) {
            System.err.println("Attention : peut-être nblect="+nl+" nbred="+nr);
            jp_fenInside.setBackground(Color.RED);
        } else {
            jp_fenInside.setBackground(defColor);
        }
    }

    public void changerEtat (final LectRedEtat etat)
    {
        final ObjetGraphique obj = lesProcessus.get (ProcId.getSelf());
		SwingUtilities.invokeLater(new Runnable (){
                public void run() {
                    //    assert ((no >= 0) && (no < nbObjets));
                    // LECTEUR => (etat = Demande, Lit ou Rien)
                    //    assert ((no >= nbLecteurs) || (etat == LecRedEtat.Lecteur_Demande)
                    //            || (etat == Lecteur_Lit) || (etat == Lecteur_Rien));
                    // REDACTEUR => (etat = Demande, Ecrit ou Rien)
                    //    assert ((no < nbLecteurs) || (etat == Redacteur_Demande)
                    //           || (etat == Redacteur_Ecrit) || (etat == Redacteur_Rien));
                    obj.etat = etat;
                    checkValidState();
                    if (etat == LectRedEtat.Lecteur_Rien) {
                        jp_fenInside.repaint();
                        jp_fenLec.repaint();
                    }
                    else if (etat == LectRedEtat.Lecteur_Lit) {
                        jp_fenInside.repaint();
                        jp_fenLec.repaint();
                    }
                    else if (etat == LectRedEtat.Lecteur_Demande) {
                        jp_fenLec.repaint();
                    }
                    else if (etat == LectRedEtat.Redacteur_Rien) {
                        jp_fenInside.repaint();
                        jp_fenRed.repaint();
                    }
                    else if (etat == LectRedEtat.Redacteur_Ecrit) {
                        jp_fenInside.repaint();
                        jp_fenRed.repaint();
                    }
                    else if (etat == LectRedEtat.Redacteur_Demande) {
                        jp_fenRed.repaint();
                    }
                    //System.out.println("Changement etat: "+no+": "+etat);
                }
            });
    }

    /****************************************************************/
    public IHMLectRed (LectRed _lr,
                       Synchro.Simulateur _simu)
    {
        nbLecteurs = 0;
        nbRedacteurs = 0;
        simu = _simu;
        lr = _lr;
		fenetre = new JFrame("Lecteurs/Rédacteurs");
        
        // Listener Fermeture de la fenetre
        fenetre.setDefaultCloseOperation (JFrame.EXIT_ON_CLOSE);

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
        /* ===== Boutons ===== */
        JPanel jp_boutons = new JPanel(new GridLayout(0,4,5,10));

//        if (! isApplet) {
            // Quitter
            JButton jb_quitter = new JButton(" Quitter ");
            jb_quitter.addActionListener(new ActionListener()
                {
                    public void actionPerformed(ActionEvent evt)
                    {
                        //System.out.println("Fermeture de Lecteurs/Rédacteurs...");
                        //Main.quitter();  // pour tester
                        System.exit(0);
                    }
                });
            jp_boutons.add(jb_quitter);
 //       }

        // Parametres
        final JDialog dialogParam = new IHMParametres (null);        
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
        final JButton jb_pause = new JButton("  Pause  ");
        jb_pause.setToolTipText("Suspension/reprise du temps");
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
                          "Lecteurs/Rédacteurs<br>-------------------<br>"+
                          "\nProblème : deux classes de processus sont en compétition pour accéder à un fichier; "+
                          " les lecteurs peuvent être concurrents qu'entre eux, et les rédacteurs sont exclusifs"+
                          " vis-à-vis de tous.<br><br>"+
                          "Interprétation du dessin :"+
                          "<ul><li>les disques noirs sont les rédacteurs, et les cercles noirs sont les lecteurs;"+
                          "<li>un processus dans le rectangle central possède l'accès;"+
                          "<li>un processus à proximité du rectangle demande l'accès."+
                          "</ul>"+
                          "Actions :"+
                          "<ul><li>en cliquant dans le rectangle, vous forcez une fin d'utilisation;</li>"+
                          "<li>en cliquant côté lecteur, vous forcez une demande de lecture;</li>"+
                          "<li>en cliquant côté rédacteur, vous forcez une demande d'écriture;</li>"+
                          "<li>pause permet de suspendre le temps de la simulation."+
                          " Les actions forcées sont par contre toujours possibles;</li>"+
                          "<li>vous pouvez régler la vitesse de la simulation avec l'échelle du bas.</li>"+
                          "</ul>"+
                          "</body></html>");
        jep_aide.setEditable (false);
        JOptionPane pane = new JOptionPane(new JScrollPane (jep_aide));
        final JDialog dialogAide = pane.createDialog(null,"Aide");
        dialogAide.setModal (false);
        dialogAide.setSize(500,550);
        JButton jb_aide = new JButton("  Aide   ");
        jb_aide.addActionListener(new ActionListener() {
                public void actionPerformed(ActionEvent evt)
                {
                    dialogAide.setVisible (true);
                }});
        jp_boutons.add(jb_aide);
    
        /* ===== Le nom de la stratégie ===== */
        JPanel jp_strategie = new JPanel();
        jp_strategie.add(new JLabel(lr.nomStrategie()));
        jp_strategie.setBorder(BorderFactory.createEtchedBorder());
		
		
        /* ===== Les fenêtres de dessin ===== */
        /* la fenêtre rédacteur est en haut, la fenêtre lecteur en bas. */

        // ==== Rédacteurs ====
        JPanel jp_titreRed = new JPanel();
        jp_titreRed.add(new JLabel("REDACTEURS"));
    
        jp_fenRed = new FenRed();
        jp_fenRed.setToolTipText("Cliquer pour forcer une demande de rédaction");
        //jp_fenRed.setBorder(BorderFactory.createEtchedBorder());
        jp_fenRed.addMouseListener(new MouseAdapter()
            {
                public void mouseClicked(MouseEvent e)
                {
                    ObjetGraphique obj = chercherDormeur (lesRedacteurs, LectRedEtat.Redacteur_Rien);
                    if (obj != null)
                      simu.wakeup (obj.id);
                }
            });

        JButton jb_red_plus = new JButton("+1");
        jb_red_plus.setToolTipText("Ajouter un rédacteur");
        final IHMLectRed moi = this;
        jb_red_plus.addActionListener(new ActionListener()
            {
                public void actionPerformed(ActionEvent evt)
                {
                    new ProcessusRedacteur (lr,simu,moi).start();
                }
            });
        
        JButton jb_red_moins = new JButton("-1");
        jb_red_moins.setToolTipText("Enlever un rédacteur endormi");
        jb_red_moins.setMaximumSize(jb_red_plus.getMaximumSize());
        jb_red_moins.addActionListener(new ActionListener()
            {
                public void actionPerformed(ActionEvent evt)
                {
                    ObjetGraphique obj = chercherDormeur (lesRedacteurs, LectRedEtat.Redacteur_Rien);
                    if (obj != null)
                      simu.wakeupAndDie (obj.id);
                }
            });

        Box box_bouton_red = Box.createVerticalBox();
        box_bouton_red.add (Box.createVerticalGlue());
        box_bouton_red.add (jb_red_plus);
        box_bouton_red.add (jb_red_moins);
        box_bouton_red.add (Box.createVerticalGlue());
        Box box_red = Box.createHorizontalBox();
        box_red.add (box_bouton_red);
        box_red.add (jp_fenRed);
		
        // ==== Inside ====
        jp_fenInside = new FenInside();
        jp_fenInside.setToolTipText("Cliquer pour forcer une sortie");
        jp_fenInside.setBorder(BorderFactory.createTitledBorder("Fichier"));
        jp_fenInside.addMouseListener(new MouseAdapter()
            {
                public void mouseClicked(MouseEvent e)
                {
                    ObjetGraphique obj;
                    obj = chercherDormeur (lesLecteurs, LectRedEtat.Lecteur_Lit);
                    if (obj == null)
                      obj = chercherDormeur (lesRedacteurs, LectRedEtat.Redacteur_Ecrit);
                    if (obj != null)
                      simu.wakeup (obj.id);
                }
            });

        // ==== Lecteurs ====
        jp_fenLec = new FenLec();
        jp_fenLec.setToolTipText("Cliquer pour forcer une demande de lecture");
        // jp_fenLec.setBorder(BorderFactory.createEtchedBorder());
        JPanel jp_titreLec = new JPanel();
        jp_titreLec.add(new JLabel("LECTEURS"));
  	jp_fenLec.addMouseListener(new MouseAdapter()
            {
                public void mouseClicked(MouseEvent e)
                {
                    ObjetGraphique obj = chercherDormeur (lesLecteurs, LectRedEtat.Lecteur_Rien);
                    if (obj != null)
                      simu.wakeup (obj.id);
                }
            });

        JButton jb_lec_plus = new JButton("+1");
        jb_lec_plus.setToolTipText("Ajouter un lecteur");
        jb_lec_plus.addActionListener(new ActionListener()
            {
                public void actionPerformed(ActionEvent evt)
                {
                    new ProcessusLecteur (lr,simu,moi).start();
                }
            });
        
        JButton jb_lec_moins = new JButton("-1");
        jb_lec_moins.setMaximumSize(jb_lec_plus.getMaximumSize());
        jb_lec_moins.setToolTipText("Enlever un lecteur endormi");
        jb_lec_moins.addActionListener(new ActionListener()
            {
                public void actionPerformed(ActionEvent evt)
                {
                    ObjetGraphique obj = chercherDormeur (lesLecteurs, LectRedEtat.Lecteur_Rien);
                    if (obj != null)
                      simu.wakeupAndDie (obj.id);
                }
            });

        Box box_bouton_lec = Box.createVerticalBox();
        box_bouton_lec.add (Box.createVerticalGlue());
        box_bouton_lec.add (jb_lec_plus);
        box_bouton_lec.add (jb_lec_moins);
        box_bouton_lec.add (Box.createVerticalGlue());
        Box box_lec = Box.createHorizontalBox();
        box_lec.add (box_bouton_lec);
        box_lec.add (jp_fenLec);
  
        /* ===== Le réglage de vitesse du temps ===== */
        JPanel jp_vitesse = new JPanel();
        jp_vitesse.setToolTipText("Vitesse d'écoulement du temps simulé");
        jp_vitesse.setBorder(BorderFactory.createEtchedBorder());
        jp_vitesse.add(new JLabel(" Vitesse du temps : "));
        JSlider js_vitesseTemps = new JSlider(JSlider.HORIZONTAL,1,100,1);
        /* Event "value_changed" de l'ajustement de l'échelle de vitesse du temps. */
        js_vitesseTemps.addChangeListener(new ChangeListener() {
                public void stateChanged(ChangeEvent e) {
                    JSlider source = (JSlider) e.getSource();
                    simu.setTimespeed((int)source.getValue());
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
        contentPane.add(jp_titreRed);
        contentPane.add(box_red);
        contentPane.add(jp_fenInside);
        contentPane.add(box_lec);
        contentPane.add(jp_titreLec);
        contentPane.add(jp_vitesse);
        
        /* ==== Contraintes ==== */
        GridBagLayout gridbag = new GridBagLayout();
        contentPane.setLayout(gridbag);
        // Contraintes pour fenêtres de dessin
        GridBagConstraints c_fen = new GridBagConstraints();
        c_fen.gridwidth = GridBagConstraints.REMAINDER; 
        c_fen.fill = GridBagConstraints.BOTH; 
        c_fen.weightx = 1.0;
        c_fen.weighty = 1.0;
        gridbag.setConstraints(box_red, c_fen);
        gridbag.setConstraints(jp_fenInside,c_fen);
        gridbag.setConstraints(box_lec, c_fen);
        // Contraintes pour les autres éléments
        GridBagConstraints c = new GridBagConstraints();
        c.gridwidth = GridBagConstraints.REMAINDER; 
        c.fill = GridBagConstraints.BOTH;
        gridbag.setConstraints(jp_boutons, c);
        gridbag.setConstraints(jp_strategie, c);
        gridbag.setConstraints(jp_titreRed, c);
        gridbag.setConstraints(jp_titreLec, c);  
        gridbag.setConstraints(jp_vitesse, c);

        // Listener redimensionnement de la fenetre
        contentPane.addComponentListener(new ComponentAdapter()
            {
                public void componentResized(ComponentEvent e)
                {
                    //System.out.println ("Resized");
                    computePlacement ();
                }
            });
		        /* ===== Affichage ==== */
        int taille_fen_x = Math.max(2*7*(Math.max(nbRedacteurs,nbLecteurs)+10),400);
        int taille_fen_y = 400;
        //fenetre.pack();
        fenetre.setSize(taille_fen_x,taille_fen_y);
        fenetre.setVisible(true);
    }
}
