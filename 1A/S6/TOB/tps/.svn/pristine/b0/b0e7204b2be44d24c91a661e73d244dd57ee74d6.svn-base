import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.util.Observable;
import java.util.Observer;

public class ChatSwing extends JFrame implements Observer {

    private Chat chat;

    private JTextArea messages = new JTextArea(15, 20);
    private JLabel pseudo = new JLabel();
    private JTextField texte = new JTextField(20);
    private JButton logOut = new JButton("Log out");
    private JButton send = new JButton("Send");

    public ChatSwing(Chat chat, String pseudo) {
        super("Conversation of " + pseudo);
        this.chat = chat;
        this.chat.addObserver(this);
        this.pseudo.setText(pseudo);

        Container cont = this.getContentPane();
        cont.setLayout(new BorderLayout());

        cont.add(logOut, BorderLayout.NORTH);
        cont.add(new JScrollPane(messages), BorderLayout.CENTER);

        JPanel discussion = new JPanel(new FlowLayout());
        discussion.add(this.pseudo);
        discussion.add(texte);
        discussion.add(send);
        cont.add(discussion, BorderLayout.SOUTH);

        ActionFermer actionfermer = new ActionFermer();
        ActionOk actionok = new ActionOk();
        this.logOut.addActionListener(actionfermer);
        this.send.addActionListener(actionok);
        this.texte.addActionListener(actionok);
        this.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);

        this.pack();
        this.setVisible(true);
    }

    public void update(Observable o, Object arg) {
        messages.append("" + arg + "\n");
    }

    public void close() {
        this.chat.deleteObserver(ChatSwing.this);
        this.chat.ajouter(new MessageTexte(this.pseudo.getText(), "You have been logged out"));
    }

    public class ActionFermer implements ActionListener {
        public void actionPerformed(ActionEvent e) {
            close();

        }
    }

    public class ActionOk implements ActionListener {
        public void actionPerformed(ActionEvent e) {
            Message newmsg = new MessageTexte(pseudo.getText(), texte.getText());
            texte.setText("");
            chat.ajouter(newmsg);
        }
    }

}