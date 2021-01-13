

import java.awt.Button;
import java.awt.GridLayout;
import java.awt.Label;
import java.awt.TextField;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.PrintWriter;
import javax.swing.JApplet;
import javax.swing.JFrame;

public class Saisie extends JApplet {
	private static final long serialVersionUID = 1;
	TextField nom, prenom, login, passwd, email, path;
	Label message;
	public void init() {
		setSize(300,200);
		setLayout(new GridLayout(10,2));
		add(new Label("  Nom : "));
		nom = new TextField(30);
		add(nom);
		add(new Label("  Prenom : "));
		prenom = new TextField(30);
		add(prenom);
		add(new Label("  Login : "));
		login = new TextField(30);
		add(login);
		add(new Label("  Password : "));
		passwd = new TextField(30);
		add(passwd);
		add(new Label("  Email : "));
		email = new TextField(30);
		add(email);
		add(new Label(""));
		add(new Label(""));
		Button Abutton = new Button("export XML");
		Abutton.addActionListener(new AButtonAction());
		add(Abutton);
		add(new Label(""));
		path = new TextField(30);
		path.setText("/tmp/in/out.xml");
		add(path);
		message = new Label();
		add(message);
	}
	
	// La reaction au bouton exporter
	class AButtonAction implements ActionListener {
		public void actionPerformed(ActionEvent ae) {
			String no, pr, lo, pa, em;
			no = nom.getText();
			pr = prenom.getText();
			lo = login.getText();
			pa = passwd.getText();
			em = email.getText();
			try {
				PrintWriter pw = new PrintWriter(path.getText());
				pw.println("<person>");
				pw.println("    <nom>"+no+"</nom>");
				pw.println("    <prenom>"+pr+"</prenom>");
				pw.println("    <login>"+lo+"</login>");
				pw.println("    <password>"+pa+"</password>");
				pw.println("    <email>"+em+"</email>");
				pw.println("</person>");
				pw.close();
				message.setText("export completed");
			} catch (Exception ex) {
				message.setText("export failed");
				ex.printStackTrace();
			}
		}
	}
	
	public static void main(String args[]) {
		Saisie a = new Saisie();
		a.init();
		a.start();
		JFrame frame = new JFrame("Applet");
		frame.setSize(400,200);
  	frame.getContentPane().add(a);
  	frame.setVisible(true);
	}
	
}
