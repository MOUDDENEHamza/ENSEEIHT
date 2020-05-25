package general;
import javax.swing.*;
import java.awt.*;
import java.awt.image.BufferedImage;

/**
 * The class handles the graphical side of the program
 *
 * @author Hamza MOUDDENE
 * @version 1.0
 */
@SuppressWarnings("serial")
public class GUI extends JFrame {

    /**
     * Create a graphical window
     *
     * @param name the name of the window
     * @return the window
     */
    public JFrame createWindow(String name, int width, int height) {
        JFrame window = new JFrame(name);
        Image icon = Toolkit.getDefaultToolkit().getImage("icons/icon.png");
        window.setIconImage(icon);
        window.setSize(width, height);
        window.setBackground(Color.WHITE);
        window.setLayout(null);
        window.setVisible(true);
        return window;
    }

    /**
     * Create label
     *
     * @param name   the name of the label
     * @param x      axis of the label
     * @param y      axis of the label
     * @param width  of the label
     * @param height of the label
     * @return the button
     */
    public JLabel createLabel(String name, int x, int y, int width, int height) {
        JLabel label = new JLabel(name);
        label.setBounds(x, y, width, height);
        return label;
    }

    /**
     * Create password field
     *
     * @param x      axis of the password field
     * @param y      axis of the password field
     * @param width  of the password field
     * @param height of the password field
     * @return the password field
     */
    public JPasswordField createPasswd(int x, int y, int width, int height) {
        JPasswordField passwd = new JPasswordField();
        passwd.setBounds(x, y, width, height);
        return passwd;
    }

    /**
     * Create text field
     *
     * @param x         axis of the text field
     * @param y         axis of the text field
     * @param width     of the text field
     * @param height    of the height field
     * @param inputSize of the text field
     * @return the text field
     */
    public JTextField createText(int x, int y, int width, int height, int inputSize) {
        JTextField text = new JTextField(inputSize);
        text.setBounds(x, y, width, height);
        return text;
    }

    /**
     * Create button
     *
     * @param name   the name of the button
     * @param x      axis of the button
     * @param y      axis of the button
     * @param width  of the button
     * @param height of the button
     * @return the button
     */
    public JButton createButton(String name, int x, int y, int width, int height, Color background, Color foreground) {
        JButton button = new JButton(name);
        button.setBounds(x, y, width, height);
        button.setBackground(background);
        button.setForeground(foreground);
        return button;
    }

    /**
     * Create a panel
     *
     * @param x      axis of the panel
     * @param y      axis of the panel
     * @param width  of the panel
     * @param height of the panel
     * @param color  of the panel
     * @return the panel
     */
    public JPanel createPanel(int x, int y, int width, int height, Color color) {
        JPanel panel = new JPanel();
        panel.setBounds(x, y, width, height);
        panel.setBackground(color);
        return panel;
    }

    /**
     * Create radio button
     *
     * @param name   of radio button
     * @param x      of radio button
     * @param y      of radio button
     * @param width  of radio button
     * @param height of radio button
     * @return the radio button
     */
    public JRadioButton createRadioButton(String name, int x, int y, int width, int height) {
        JRadioButton radioButton = new JRadioButton(name);
        radioButton.setBounds(x, y, width, height);
        return radioButton;
    }

    /**
     * Create a combo box
     * @param list   containing items in the combo box
     * @param x      of the combo box
     * @param y      of the combo box
     * @param width  of the combo box
     * @param height of the combo box
     * @return the combo box
     */
    @SuppressWarnings({ "rawtypes", "unchecked" })
	public JComboBox createComboBox(String[] list, int x, int y , int width, int height) {
        JComboBox comboBox = new JComboBox(list);
        comboBox.setBounds(x, y, width, height);
        return comboBox;
    }

    /**
     * Resize an image
     *
     * @param source the source image
     * @param width of the image
     * @param height of the image
     * @return scaled image
     */
    public Image scaleImage(Image source, int width, int height) {
        BufferedImage img = new BufferedImage(width, height, BufferedImage.TYPE_INT_ARGB);
        Graphics2D g = (Graphics2D) img.getGraphics();
        g.setRenderingHint(RenderingHints.KEY_INTERPOLATION, RenderingHints.VALUE_INTERPOLATION_BILINEAR);
        g.drawImage(source, 0, 0, width, height, null);
        g.dispose();
        return img;
    }
}