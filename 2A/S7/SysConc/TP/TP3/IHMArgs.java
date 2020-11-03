// Time-stamp: <03 mai 2013 11:13 queinnec@enseeiht.fr>

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import java.io.File;
import java.util.List;
import java.util.LinkedList;

public class IHMArgs extends JDialog {

    private int nbPhilo = 2;
    private int implantation = 0;

    public IHMArgs (Frame frame)
    {
        super(frame,"Arguments",true);
        setLocationRelativeTo(frame);

        // Listener Fermeture du dialogue
        addWindowListener(new WindowAdapter() {
                public void windowClosing(WindowEvent e)
                {
                    System.exit(0);
                }
            });

        /* ===== choix de l'implantation ===== */
        final String[] choix = trouver_implantations("StrategiePhilo");
        JPanel jp_implantation = new JPanel();
        JComboBox<?> jComboBox = new JComboBox<String>(choix);
        jComboBox.setSelectedIndex(implantation);
        jComboBox.addActionListener(new ActionListener() {
                public void actionPerformed(ActionEvent e) {
                    JComboBox<?> source = (JComboBox<?>) e.getSource();
                    implantation = source.getSelectedIndex();
                }
            });
        jp_implantation.add(jComboBox);

        /* ===== Nombre de Philosophes ===== */
        final IHMChoixNombre jp_nbPhi = new IHMChoixNombre(2,30,4,null);

        /* ===== Boutons ===== */
        JPanel jp_boutons = new JPanel(new GridLayout(1,0,5,10));
        // OK
        JButton jb_ok = new JButton("OK");
        jb_ok.addActionListener(new ActionListener()
            {
                public void actionPerformed(ActionEvent evt)
                {
                    nbPhilo = jp_nbPhi.getValeur();
                    setVisible(false);
                    Main.initialiser (choix[implantation], nbPhilo);
                }
            });
        jp_boutons.add(jb_ok);
        // Annuler
        JButton jb_annuler = new JButton("Annuler");
        jb_annuler.addActionListener(new ActionListener()
            {
                public void actionPerformed(ActionEvent evt)
                {
                    System.exit (0);
                }
            });
        jp_boutons.add(jb_annuler);
        /* ==== Assemblage ==== */
        Container contentPane = getContentPane();
        contentPane.add(new JLabel(" Implantation : "));
        contentPane.add(jp_implantation);
        contentPane.add(new JLabel(" Philosophes : "));
        contentPane.add(jp_nbPhi);
        contentPane.add(jp_boutons);
        /* ==== Disposition ==== */
        GridBagLayout gridbag = new GridBagLayout();
        getContentPane().setLayout(gridbag);
        // Contraintes
        GridBagConstraints c = new GridBagConstraints();
        c.fill = GridBagConstraints.BOTH;
        c.gridwidth = GridBagConstraints.REMAINDER;
        gridbag.setConstraints(jp_implantation, c);
        gridbag.setConstraints(jp_nbPhi, c);
        gridbag.setConstraints(jp_boutons, c);

        pack();
        setVisible(true);
    }

    private String[] trouver_implantations (String interfaceName)
    {
        List<String> lesChoix = new LinkedList<String>();
        // Récupére les noms de fichier
        String[] files = (new File(".")).list();
        // L'interface que les classes doivent implanter
        Class<?> interf = null;
        try {
            interf = Class.forName (interfaceName);
        } catch (ClassNotFoundException e) {
            System.err.println ("Panic: ne trouve pas l'interface "+interfaceName+" :"+e);
            System.exit (1);
        }
        // Vérifions qu'ils implantent la bonne interface
        for (int i = 0; i < files.length; i++) {
            Class<?> implant;
            if (files[i].endsWith (".class")) {
                String classname = files[i].substring (0, files[i].length()-6);
                try {
                    implant = Class.forName (classname);
                } catch (ClassNotFoundException e) {
                    implant = null;
                }
                if ((implant != null) && (! classname.equals(interfaceName)) && interf.isAssignableFrom (implant)) {
                    // ok !
                    lesChoix.add (classname);
                }
            }
        }
        // Y a-t-il au moins une classe ?
        if (lesChoix.isEmpty()) {
            System.out.println ("Aucune implantation de "+interfaceName+" trouvee !");
            System.exit (1);
        }
        return lesChoix.toArray (new String[0]);
    }
}
