import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import javax.swing.*;
import javax.swing.border.LineBorder;
import java.awt.*;
import java.awt.event.*;
import java.io.*;
import java.security.GeneralSecurityException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Shows the account details of the user, be it a customer or an employee.
 * @author Younes Saoudi
 */
public class AccountDetails {
    // Class Attributes //
    
	//Swing Components
    private JFrame window;
    private JButton Save, Return;
    private JLabel l1, l2, l3, l4, l5, l6, l7, l8, l9, FullName, SubTitle;
    private JPasswordField password;
    private JTextField t1, t2, t3, t4, t5, t7, t8;
    private Color Background;
    private boolean isEmployee; //Is the user and employee or a customer?
    private boolean isEditing = false; //Is the user editing his account details or no?
    private User User;		//The abstract user
    private int width, height;

    //Button Listeners
    private final ActionListener B_Save = new ActionSave(); //Save Modifications
    private final ActionListener B_Return = new ActionReturn(); //Return/Cancel Button
    private final MouseListener Click_Edit = new ActionEdit(); //If JTextFields are clicked on, they can be edited.

    /**
     * Account Details
     */
    public AccountDetails(User user) {
        this.User = user;
        
        if (user instanceof Employee) {
            isEmployee = true;
        }
        
        GUI DetailsGUI = new GUI(); //Using GUI's implemented methods
        this.Background = Color.WHITE; //Setting the BG color

        //Create maximised window and storing its dimensions
        this.window = DetailsGUI.createWindow("Account Details", 0, 0);
        this.window.setExtendedState(this.window.getExtendedState() | JFrame.MAXIMIZED_BOTH); //Automatically maximise window
        Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
        this.window.getContentPane().setBackground(Background); //Setting the color of the JFrame
        //Width and Height of the User's screen
        width = screenSize.width; height = screenSize.height;


        //BODY
        
        //Title 
        this.FullName = DetailsGUI.createLabel("Account Settings of "
                        + user.getFirstName() + " " + user.getLastName(),
                (int) (0.2 * width), (int) (0.05 * height), width, 80); //width*685/1536 : WIDTH of text
        this.SubTitle = DetailsGUI.createLabel("View and update your account details and profile.",
                (int) (0.2 * width), (int) (0.05 * height) + height * 50 / 864, width, 50);

        //Account Details
        this.l1 = DetailsGUI.createLabel("First Name",
                (int) (0.2 * width) + width * 50 / 1536, (int) (0.24 * height), 200, 50);
        this.t1 = DetailsGUI.createText((int) (0.2 * width) + width * 300 / 1536,
                (int) (0.24 * height) + height * 15 / 864, 200, 25, 32);
        this.t1.setText(user.getFirstName());

        this.l2 = DetailsGUI.createLabel("Last Name",
                (int) (0.2 * width) + width * 50 / 1536, (int) (0.24 * height) + height * 40 / 864, 200, 50);
        this.t2 = DetailsGUI.createText((int) (0.2 * width) + width * 300 / 1536,
                (int) (0.24 * height) + height * 40 / 864 + height * 15 / 864, 200, 25, 32);
        this.t2.setText(user.getLastName());

        this.l3 = DetailsGUI.createLabel("Date of Birth",
                (int) (0.2 * width) + width * 50 / 1536, (int) (0.24 * height) + height * 80 / 864, 200, 50);
        this.t3 = DetailsGUI.createText((int) (0.2 * width) + width * 300 / 1536,
                (int) (0.24 * height) + height * 80 / 864 + height * 15 / 864, 200, 25, 32);
        this.t3.setText(user.getBirthDate());


        this.l4 = DetailsGUI.createLabel("Email Address",
                (int) (0.2 * width) + width * 50 / 1536, (int) (0.24 * height) + height * 160 / 864, 200, 50);
        this.t4 = DetailsGUI.createText((int) (0.2 * width) + width * 300 / 1536,
                (int) (0.24 * height) + height * 160 / 864 + height * 15 / 864, 200, 25, 32);
        this.t4.setText(user.getEmail());
        this.t4.setSize(12 * t4.getText().length(), 25);

        this.l5 = DetailsGUI.createLabel("Account Name",
                (int) (0.2 * width) + width * 50 / 1536, (int) (0.24 * height) + height * 200 / 864, 200, 50);
        this.t5 = DetailsGUI.createText((int) (0.2 * width) + width * 300 / 1536,
                (int) (0.24 * height) + height * 200 / 864 + height * 15 / 864, 200, 25, 32);
        this.t5.setText(user.getUsername());

        this.l6 = DetailsGUI.createLabel("Password",
                (int) (0.2 * width) + width * 50 / 1536, (int) (0.24 * height) + height * 240 / 864, 200, 50);
        this.password = DetailsGUI.createPasswd((int) (0.2 * width) + width * 300 / 1536,
                (int) (0.24 * height) + height * 240 / 864 + height * 15 / 864, 200, 25);
        this.password.setText(User.getPassword());

        this.l7 = DetailsGUI.createLabel("Account ID",
                (int) (0.2 * width) + width * 50 / 1536, (int) (0.24 * height) + height * 320 / 864, 200, 50);
        this.t7 = DetailsGUI.createText((int) (0.2 * width) + width * 300 / 1536,
                (int) (0.24 * height) + height * 328 / 864, 200, 50, 32);
        this.t7.setText(user.getId());

        this.l9 = DetailsGUI.createLabel("You have been with us since : " + User.getCreationDate() + " !",
                width / 2 - width * 175 / 1536, 5 * height / 6, 350, 50);

        
        //Only the text of the JTextFields will appear:
        this.t1.setBackground(Background);
        this.t2.setBackground(Background);
        this.t3.setBackground(Background);
        this.t4.setBackground(Background);
        this.t5.setBackground(Background);
        this.password.setBackground(Background);
        
        this.t1.setBorder(null);
        this.t2.setBorder(null);
        this.t3.setBorder(null);
        this.t4.setBorder(null);
        this.t5.setBorder(null);
        this.password.setBorder(null);
        
        //The JTextFields and password are not editable until clicked on:
        this.t1.setEditable(false);
        this.t2.setEditable(false);
        this.t3.setEditable(false);
        this.t4.setEditable(false);
        this.t5.setEditable(false);
        this.password.setEditable(false);
        
        this.t1.addMouseListener(Click_Edit);
        this.t2.addMouseListener(Click_Edit);
        this.t3.addMouseListener(Click_Edit);
        this.t4.addMouseListener(Click_Edit);        
        this.password.addMouseListener(Click_Edit);

        //The unique User ID is grayed-out because it's never editable
        this.t7.setBackground(new Color(204, 204, 204));
        this.t7.setBorder(null);
        this.t7.setEditable(false);
        this.t7.setForeground(new Color(139, 130, 142));
        this.t7.setSize(9 * t7.getText().length(), 35);
        
        //Adding the HAND CURSOR as the default Cursor for the editable JTextFields 
        //(It will turn into a Text Cursor if they're clicked on)
        this.t1.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        this.t2.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        this.t3.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        this.t4.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        this.password.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        
        //Extra JTextField Function which appears only if the User is an Employee; it cannot be edited either.
        if (isEmployee) {
            this.l8 = DetailsGUI.createLabel("Function",
                    (int) (0.2 * width) + width * 50 / 1536, (int) (0.24 * height) + height * 360 / 864, 200, 50);
            this.t8 = DetailsGUI.createText((int) (0.2 * width) + width * 300 / 1536,
                    (int) (0.24 * height) + height * 368 / 864, 200, 50, 32);
            this.t8.setText(user.getFunction().toString());
            this.t8.setBackground(new Color(204, 204, 204));
            this.t8.setBorder(null);
            this.t8.setEditable(false);
            this.t8.setForeground(new Color(139, 130, 142));
            this.t8.setSize(9 * t8.getText().length(), 35);
            this.window.add(l8);
            this.window.add(t8);
        }

        //Adding the components to the JFrame
        this.window.add(FullName);
        this.window.add(SubTitle);
        this.window.add(l1);
        this.window.add(t1);
        this.window.add(l2);
        this.window.add(t2);
        this.window.add(l3);
        this.window.add(t3);
        this.window.add(l4);
        this.window.add(t4);
        this.window.add(l5);
        this.window.add(t5);
        this.window.add(l6);
        this.window.add(password);
        this.window.add(l7);
        this.window.add(t7);
        this.window.add(l9);
        
        //Adding the Return/Cancel Button to the JFrame
        this.Return = DetailsGUI.createButton("Return", (int) (0.2 * width) + 7 * width * 690 / 1536 / 8,
                3 * height / 4, width * 680 / 1536 / 8, 30, new Color(220, 53, 69), Color.WHITE);
        this.window.add(Return);
        this.Return.addActionListener(B_Return);
        
        //Setting up the fonts
        try {
            GraphicsEnvironment ge = GraphicsEnvironment.getLocalGraphicsEnvironment();
            Font Avenir_Light = Font.createFont(Font.TRUETYPE_FONT, new File("fonts/avenir-light.otf")).deriveFont(20f);
            ge.registerFont(Avenir_Light);
            Font Bebas_Light = Font.createFont(Font.TRUETYPE_FONT, new File("fonts/BebasNeue-Regular.ttf")).deriveFont(60f);
            ge.registerFont(Bebas_Light);
            this.FullName.setFont(Bebas_Light);
            this.SubTitle.setFont(Avenir_Light);
            this.l1.setFont(Avenir_Light.deriveFont(17f));
            this.t1.setFont(Avenir_Light.deriveFont(17f));
            this.l2.setFont(Avenir_Light.deriveFont(17f));
            this.t2.setFont(Avenir_Light.deriveFont(17f));
            this.l3.setFont(Avenir_Light.deriveFont(17f));
            this.t3.setFont(Avenir_Light.deriveFont(17f));
            this.l4.setFont(Avenir_Light.deriveFont(17f));
            this.t4.setFont(Avenir_Light.deriveFont(17f));
            this.l5.setFont(Avenir_Light.deriveFont(17f));
            this.t5.setFont(Avenir_Light.deriveFont(17f));
            this.l6.setFont(Avenir_Light.deriveFont(17f));
            this.password.setFont(Avenir_Light.deriveFont(17f));
            this.l7.setFont(Avenir_Light.deriveFont(17f));
            this.t7.setFont(Avenir_Light.deriveFont(17f));
            this.Return.setFont(Avenir_Light.deriveFont(16f));
            if (isEmployee) {
                this.l8.setFont(Avenir_Light.deriveFont(17f));
                this.t8.setFont(Avenir_Light.deriveFont(17f));
            }
            this.l9.setFont(Avenir_Light.deriveFont(17f));
        } catch (IOException | FontFormatException e) {
            e.printStackTrace();
        }

        this.window.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE); //System exits if the default close button is clicked
    }
    
    /**
     * If the button is clicked while the user is editing, their modifications are cancelled and the original AccountDetails
     * windows reappears (acts as a Cancel Button). Else, the User is returned to the EmployeeInterface (acts as a Return Button) 
     * @author Younes Saoudi
     *
     */
    public class ActionReturn implements ActionListener {
        public void actionPerformed(ActionEvent arg0) {
            if (isEditing) {
                window.dispose();
                new AccountDetails(User);
            } else {
                window.dispose();
                new UserInterface(User);
            }
        }
    }
    
    /**
     * Saves the user's modifications to the users.json database.
     * @author Younes Saoudi
     *
     */
    public class ActionSave implements ActionListener {
        @SuppressWarnings("unchecked")
        public void actionPerformed(ActionEvent arg0) {
            Security security = new Security();
            JSONParser parser = new JSONParser();
            String UserID = "";
            try {
                //Importing the database
                JSONArray userList = (JSONArray) parser.parse(new FileReader("data/users.json"));

                for (Object user_tmp : userList) {
                    
                	JSONObject current_user = (JSONObject) user_tmp;
                    UserID = (String) current_user.get("UserID");

                    //If the userID/EmployeeID is found
                    if (User.getId().equals(UserID)) {
                        
                    	SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                        //Date of modification
                        Date date = new Date();
                        String Previous_Edits;
                        
                        try {
                            Previous_Edits = (String) current_user.get("Edits"); //Previous edits made to the account
                        } catch (NullPointerException e) {
                            Previous_Edits = ""; //No Edits have been made previously
                        }
                        
                        //adding the current edit to the list of edits:
                        Previous_Edits = Previous_Edits
                                + " \n" + User.getFirstName() + " " + User.getLastName()
                                + " (" + User.getId() + ")"
                                + " modified account's information on " + formatter.format(date);
                        
                        //Replace the old value with the new one
                        current_user.replace("E-Mail", t4.getText());
                        current_user.replace("First name", t1.getText());
                        current_user.replace("Last name", t2.getText());
                        current_user.replace("Date of Birth", t3.getText());
                        
                        //If the password is different than the old one, encrypt and save :
                        if (!(new String(password.getPassword())).equals(User.getPassword())) {
                            current_user.replace("Password", security.encrypt(new String(password.getPassword())));
                        }
                        current_user.replace("Gender", User.getGender().toString());
                        current_user.replace("Edits", Previous_Edits); //replace the old list of edits with the new one
                        
                        //Save the modifications to the User attribute as well:
                        User.setFirstName(t1.getText());
                        User.setLastName(t2.getText());
                        User.setBirthDate(t3.getText());
                        User.setEmail(t4.getText());
                        User.setPassword(new String(password.getPassword()));
                        
                        try (FileWriter file = new FileWriter("data/users.json")) {
                            //Updating the database
                            file.write(userList.toJSONString());
                            file.flush();

                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    }
                }
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            } catch (ParseException e) {
                e.printStackTrace();
            } catch (GeneralSecurityException e) {
                e.printStackTrace();
            }
            window.dispose();
            new AccountDetails(User);
            SignUp.updateHumanFriendlyUsersDATABASE();
        }
    }
    
    /**
     * Edit the JTextField or JPasswordField
     * @author Younes Saoudi
     * @param t
     */
    public void editTextField(JTextField t) {
    	//Show a black border around the now editable JTextField
        t.setBorder(new LineBorder(Color.black));
        
        //If the password is the one being edited:
        if (t == password) {
            password.setText("");
        }
        
        //Make t editable and use the Text Cursor
        t.setEditable(true);
        t.setCursor(Cursor.getPredefinedCursor(Cursor.TEXT_CURSOR));
        
        //Adding a KeyListener that will "switch off" the ability to edit once the user presses the Enter Key
        t.addKeyListener(new KeyListener() {
            @Override
            public void keyPressed(KeyEvent e) {
                if (e.getKeyChar() == KeyEvent.VK_ENTER) {
                	
                	//If the password is empty, then it was automatically the one being edited! (Passwords cannot be empty on sign up)
                    if (new String(password.getPassword()).equals("")) {
                        JOptionPane.showMessageDialog(window, "Your password cannot be empty!");
                    } else {
                    	//Set the JTextField back to being not editable
                        t.setEditable(false);
                        t.setBorder(null);
                        t.setSize(12 * t.getText().length(), 25);
                        t.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
                    }
                }
            }

            public void keyTyped(KeyEvent e) {
                //  nothing
            }

            public void keyReleased(KeyEvent e) {
                // nothing
            }
        });
        //Adding a FocusListener that will "switch off" the ability to edit once the user clicks on another JTextField or elsewhere
        t.addFocusListener(new FocusListener() {
            public void focusGained(FocusEvent e) {
                //nothing
            }

            @Override
            public void focusLost(FocusEvent e) {
            	//If the password is empty, then it was automatically the one being edited! (Passwords cannot be empty on sign up)
                if (new String(password.getPassword()).equals("")) {
                    JOptionPane.showMessageDialog(window, "Your password cannot be empty!");
                    t.grabFocus(); //Grab Focus so that this window doesn't appear multiple times!
                } else {
                	//Set the JTextField back to being not editable
                    t.setEditable(false);
                    t.setBorder(null);
                    t.setSize(12 * t.getText().length(), 25);
                    t.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
                }

            }

        });
    }
    
    /**
     * If the user clicks on any editable JTextField (Password Included) then, the "Return" Button becomes a "Cancel" Button
     * and a "Save" Button appears.
     * @author Younes Saoudi
     */
    public class ActionEdit implements MouseListener {
        @Override
        public void mouseClicked(MouseEvent e) {
            isEditing = true; //The User is Editing
            
            //Adding the Save Button
            Save = new GUI().createButton("Save", (int) (0.2 * width) + 3 * width * 680 / 1536 / 4, 3 * height / 4,
                    width * 680 / 1536 / 8, 30, Color.BLACK, Color.WHITE);
            Save.addActionListener(B_Save);
            window.add(Save);
            try {
                GraphicsEnvironment ge = GraphicsEnvironment.getLocalGraphicsEnvironment();
                Font Avenir_Light = Font.createFont(Font.TRUETYPE_FONT, new File("fonts/avenir-light.otf")).deriveFont(20f);
                ge.registerFont(Avenir_Light);
                Save.setFont(Avenir_Light.deriveFont(16f));
            } catch (IOException | FontFormatException error) {
                error.printStackTrace();
            }
            Return.setText("Cancel");
            Return.setBackground(new Color(225, 225, 225));
            Return.setForeground(new Color(139, 130, 142));
            
            //Make the JTextField editable:
            JTextField t = (JTextField) e.getSource();
            editTextField(t);
        }

        public void mousePressed(MouseEvent e) {
            // nothing
        }

        public void mouseReleased(MouseEvent e) {
            // nothing
        }

        public void mouseEntered(MouseEvent e) {
            // nothing
        }

        public void mouseExited(MouseEvent e) {
            // nothing
        }
    }
}
