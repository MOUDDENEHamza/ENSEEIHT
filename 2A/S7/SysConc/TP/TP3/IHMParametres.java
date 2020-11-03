// Time-stamp: <03 mai 2013 11:13 queinnec@enseeiht.fr>

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

/** Interface de gestion des paramètres de la simulation. */ 
public class IHMParametres extends JDialog {

    // fréquence actuellement en action
    private int freq = 2;
    // nouvelle fréquence en cours de choix, avant confirmation
    // (ok ou appliquer)
    private int freqCourante = 2; 

    private final static String[] choix
        = { "Peu gourmands", "Assez gourmands", "Fréquents",
            "Très gourmands", "Extrêmement gourmands"};
		
    public IHMParametres (Frame frame)
    {
        super(frame,"Paramètres de la simulation",false);
        setLocationRelativeTo(frame);
			
        /* ===== Fréquence des demandes ===== */
        JPanel jp_freq = new JPanel();
        jp_freq.add(new JLabel(" Fréquence des demandes : "));
        final JComboBox<?> jc_freq = new JComboBox<String>(choix);
        jc_freq.addActionListener(new ActionListener() {
                public void actionPerformed(ActionEvent e) {
                    JComboBox<?> source = (JComboBox<?>) e.getSource();
                    freqCourante = source.getSelectedIndex();
                }
            });
        jp_freq.add(jc_freq);
		
        this.addComponentListener (new ComponentAdapter() {
                public void componentShown (ComponentEvent e) {
						
                    jc_freq.setSelectedIndex (freq);
                    freqCourante = freq;
                }});


        /* ===== Boutons ===== */
        JPanel jp_boutons = new JPanel(new GridLayout(0,3,5,10));
        // OK
        JButton jb_ok = new JButton("OK");
        jb_ok.addActionListener(new ActionListener()
            {
                public void actionPerformed(ActionEvent evt)
                {
                    freq = freqCourante;
                    Main.setSleepDuration(freq);
                    setVisible(false);
                }
            });
        jp_boutons.add(jb_ok);
        // Appliquer
        JButton jb_appli = new JButton("Appliquer");
        jb_appli.addActionListener(new ActionListener()
            {
                public void actionPerformed(ActionEvent evt)
                {
                    freq = freqCourante;
                    Main.setSleepDuration (freq);
                }
            });
        jp_boutons.add(jb_appli);
        // Annuler
        JButton jb_annuler = new JButton("Annuler");
        jb_annuler.addActionListener(new ActionListener()
            {
                public void actionPerformed(ActionEvent evt)
                {
                    setVisible(false);
                }
            });
        jp_boutons.add(jb_annuler);
        /* ==== Assemblage ==== */
        Container contentPane = getContentPane();
        contentPane.add(jp_freq,BorderLayout.NORTH);
        contentPane.add(jp_boutons,BorderLayout.SOUTH);
        pack();
        setSize(500,200);
    }
		
}
