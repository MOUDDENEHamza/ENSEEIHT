package employee;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;

import general.GUI;

/**
 * choice of month that we want its Deposit statement.
 *
 * @author Chaimaa_LOTFI
 * @version 1.0
 */
public class ChoiceDepositStateSwing {

	private Employee Employee;
	private JFrame window;
	private JLabel header, header1, l2, l3;
	private JButton back, consult;
	JComboBox<?> month1, year1;
	private final ActionListener Consult = new Consult();
	private final ActionListener Back = new Back();
	private String[] tab = { "January", "February", "March", "April", "May", "June", "July", "August", "September",
			"October", "November", "December" };
	private String year;
	private String month;
	private JFrame prevWindow;

	/**
	 * Constructor of ChoiceDepositState class
	 */
	public ChoiceDepositStateSwing(Employee employee, JFrame previousWindow) {
		this.Employee = employee;
		this.prevWindow = previousWindow;
		GUI menu = new GUI();
		this.window = menu.createWindow("Choices", 500, 500);
		Dimension screen = Toolkit.getDefaultToolkit().getScreenSize();
		this.window.setLocation((screen.width / 2) - 300, (screen.height / 2) - 400);
		this.window.getContentPane().setBackground(Color.white);

		// HEADER
		this.header = menu.createLabel("Please, choose the month of", 100, 50, 300, 50);
		this.window.add(this.header);
		this.header1 = menu.createLabel("the deposit statement you want.", 100, 80, 300, 50);
		this.window.add(this.header1);
		// Change font and text size
		header.setFont(new java.awt.Font(Font.SERIF, Font.BOLD, 15));
		header1.setFont(new java.awt.Font(Font.SERIF, Font.BOLD, 15));
		// BODY

		// 1st month
		this.l2 = menu.createLabel("Month", 100, 200, 150, 30);
		this.window.add(this.l2);
		String[] list = new String[12];
		for (int i = 1; i <= 12; i++) {
			list[i - 1] = tab[i - 1];
		}
		this.month1 = menu.createComboBox(list, 100, 230, 150, 30);
		this.window.add(this.month1);


		// 1st year
		this.l3 = menu.createLabel("Year", 300, 200, 150, 30);
		this.window.add(this.l3);
		String[] list1 = new String[5];
		for (int i = 1; i <= 5; i++) {
			list1[i - 1] = Integer.toString(i + 2019);
		}
		this.year1 = menu.createComboBox(list1, 300, 230, 150, 30);
		this.window.add(this.year1);
		this.year = (String) this.year1.getItemAt(this.year1.getSelectedIndex());

		// Button, one to continue, other to come back
		this.consult = menu.createButton("Consult", 250, 400, 100, 30, new Color(117, 184, 201), Color.WHITE);
		this.consult.addActionListener(this.Consult);
		this.window.add(this.consult);
		this.back = menu.createButton("Back", 360, 400, 100, 30, new Color(117, 184, 201), Color.WHITE);
		this.back.addActionListener(this.Back);
		this.window.add(this.back);

		// Repaint
		this.window.setVisible(true);
		this.back.repaint();
		this.consult.repaint();
		this.month1.repaint();
		this.year1.repaint();
		this.l3.repaint();
		this.l2.repaint();

	}

	/*getters and setters to retrieve the chosen date.*/
	public String getYear() {
		return year;
	}

	public String getMonth() {
		return month;
	}
	public void setYear(String newYear) {
		this.year = newYear;
	}
	public void setMonth (String newMonth) {
		this.month = newMonth;
	}

	private class Back implements ActionListener {
		public void actionPerformed(ActionEvent e) {
			window.dispose();
			new OperationsFinancialState(Employee);
		}
	}
	
	private class Consult implements ActionListener {
		public void actionPerformed(ActionEvent e) {
			ChoiceDepositStateSwing.this.setMonth((String) ChoiceDepositStateSwing.this.month1.getItemAt(ChoiceDepositStateSwing.this.month1.getSelectedIndex()));
			ChoiceDepositStateSwing.this.setYear((String) ChoiceDepositStateSwing.this.year1.getItemAt(ChoiceDepositStateSwing.this.year1.getSelectedIndex()));
			String y = ChoiceDepositStateSwing.this.getYear();
			String m =  ChoiceDepositStateSwing.this.getMonth();
			new DepositStatementSwing(m,y, Employee);
			window.dispose();
			prevWindow.dispose();
		}
	}
}