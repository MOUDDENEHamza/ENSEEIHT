// Time-stamp: <02 mai 2013 11:59 queinnec@enseeiht.fr>

import javax.swing.*;
import javax.swing.event.*;
import java.awt.event.*;
import java.util.Hashtable;

@SuppressWarnings("serial")
public class IHMChoixNombre extends JPanel implements ActionListener {

    private JTextField textField;
    private JSlider js;
    private int valeur;
    private int min, max;

    public IHMChoixNombre(int min, int max, int ini,
                          ChangeListener otherChangeListener)
    {
        super();
        this.min = min;
        this.max = max;
        valeur = ini;
        textField = new JTextField(Integer.toString(ini), 3);
        textField.addActionListener(this);
        textField.addFocusListener(new FocusAdapter() {
                public void focusLost (FocusEvent e) {
                    actionPerformed (null);
                }
            });
        this.add(textField);

        js = new JSlider (JSlider.HORIZONTAL, min, max, ini);
        js.addChangeListener(new ChangeListener() {
                public void stateChanged(ChangeEvent e) {
                    JSlider source = (JSlider) e.getSource();
                    valeur=source.getValue();
                    textField.setText(Integer.toString(valeur));
                }
            });
        if (otherChangeListener != null)
          js.addChangeListener(otherChangeListener);

        js.setMajorTickSpacing(10);
        js.setMinorTickSpacing(5);
        js.setPaintTicks(true);
        // crée table de labels
        Hashtable<Integer,JLabel> labelTable = new Hashtable<Integer,JLabel>();
        labelTable.put( new Integer(min), new JLabel(Integer.toString(min)) );
        labelTable.put( new Integer(max), new JLabel(Integer.toString(max)) );
        js.setLabelTable (labelTable);
        js.setPaintLabels (true);

        this.add(js);
    }

    public void setEnabled(boolean bool)
    {
        textField.setEnabled(bool);
        js.setEnabled(bool);
    }

    public void actionPerformed(ActionEvent e)
    {
        try {
            valeur = Integer.parseInt(textField.getText());
            if (valeur < min) {
                textField.setText(Integer.toString(min));
                valeur = min;
            }
            else if (valeur > max) {
                textField.setText(Integer.toString(max));
                valeur = max;
            }
            js.setValue(valeur);
        }
        catch (NumberFormatException exc) {
            textField.setText(Integer.toString(min));
            valeur = min;
        }
    }

    public int getValeur ()
    {
        return valeur;
    }

    public void setInitialValue (int ini)
    {
        textField.setText(Integer.toString(ini));
        js.setValue(ini);
    }

}
