// Time-stamp: <03 mai 2013 11:12 queinnec@enseeiht.fr>

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import javax.swing.event.*;

public class IHMParametres extends JDialog {

    // les fréquences actuellement en action
    private int freqLect = 2;
    private int freqRed = 2;

    // les nouvelles fréquences en cours de choix, avant confirmation
    // (ok ou appliquer)
    private int newfreqLect;
    private int newfreqRed;

    private final static String[] choix = {
        "Peu fréquents", "Assez fréquents", "Fréquents",
        "Très fréquents", "Extrêmement fréquents"
    };	

    public IHMParametres (Frame frame)
    {
        super(frame, "Paramètres de la simulation", false);
        //setLocationRelativeTo(frame);

        // ===== Fréquence de Lecteurs =====
        JPanel jp_Lec = new JPanel();
        jp_Lec.add (new JLabel (" Fréquence des lecteurs : "));
        final JComboBox<?> jc_Lec = new JComboBox<String> (choix);
        //jc_Lec.setSelectedIndex (freqLect);
        jc_Lec.addActionListener (new ActionListener() {
                public void actionPerformed(ActionEvent e) {
                    JComboBox<?> source = (JComboBox<?>) e.getSource();
                    newfreqLect = source.getSelectedIndex();
                }
            });
        jp_Lec.add(jc_Lec);

        // ===== Fréquence des Redacteurs =====
        JPanel jp_Red = new JPanel();
        jp_Red.add (new JLabel(" Fréquence des redacteurs : "));
        final JComboBox<?> jc_Red = new JComboBox<String>(choix);
        //jc_Red.setSelectedIndex (freqRed);
        jc_Red.addActionListener (new ActionListener() {
                public void actionPerformed(ActionEvent e) {
                    JComboBox<?> source = (JComboBox<?>) e.getSource();
                    newfreqRed = source.getSelectedIndex();
                }
            });
        jp_Red.add (jc_Red);
		
        this.addComponentListener (new ComponentAdapter() {
                public void componentShown (ComponentEvent e) {
                    jc_Lec.setSelectedIndex (freqLect);
                    jc_Red.setSelectedIndex (freqRed);
                    newfreqLect = freqLect;
                    newfreqRed = freqRed;
                }});

        // ===== Boutons =====
        JPanel jp_boutons = new JPanel(new GridLayout(0,3,5,10));
        // OK
        JButton jb_ok = new JButton("OK");
        jb_ok.addActionListener (new ActionListener()
            {
                public void actionPerformed(ActionEvent evt)
                {
                    freqLect = newfreqLect;
                    freqRed = newfreqRed;
                    Main.setSleepDuration (freqLect, freqRed);
                    setVisible (false);
                }
            });
        jp_boutons.add(jb_ok);
        // Appliquer
        JButton jb_appli = new JButton("Appliquer");
        jb_appli.addActionListener (new ActionListener()
            {
                public void actionPerformed (ActionEvent evt)
                {
                    freqLect = newfreqLect;
                    freqRed = newfreqRed;
                    Main.setSleepDuration (freqLect, freqRed);
                }
            });
        jp_boutons.add(jb_appli);
        // Annuler
        JButton jb_annuler = new JButton ("Annuler");
        jb_annuler.addActionListener (new ActionListener()
            {
                public void actionPerformed (ActionEvent evt)
                {
                    setVisible(false);
                }
            });
        jp_boutons.add (jb_annuler);
        // ==== Assemblage ====
        Container contentPane = getContentPane();
        contentPane.add(jp_Lec);
        contentPane.add(jp_Red);
        contentPane.add(jp_boutons);
        // ==== Contraintes ====
        GridBagLayout gridbag = new GridBagLayout();
        getContentPane().setLayout(gridbag);
        // Contraintes
        GridBagConstraints c = new GridBagConstraints();
        c.fill = GridBagConstraints.BOTH;
        c.gridwidth = GridBagConstraints.REMAINDER;
        gridbag.setConstraints(jp_Lec, c);  
        gridbag.setConstraints(jp_Red, c);  
        gridbag.setConstraints(jp_boutons, c);

        pack();
    }

}
