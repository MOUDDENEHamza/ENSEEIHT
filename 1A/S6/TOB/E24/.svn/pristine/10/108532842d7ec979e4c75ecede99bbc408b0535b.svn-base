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
 * choice of months we want to compare their expenses and income.
 *
 * @author Chaimaa_LOTFI
 * @version 1.0
 */
public class ChoiceMonthsToCompare {

	/**
	 * Attributs of class
	 */
	private Employee Employee;
	private JFrame window;
	private JLabel header, l1, l2, l3, l5, l6;
	private JButton back, consult;
	private JComboBox<?> month1, year1, month2, year2;
	private final ActionListener Consult = new Consult();
	private final ActionListener Back = new Back();
	private String[] tab = {"January","February","March","April","May","June","July","August","September","October","November","December"};
	private String year;
	private String month;
	private String firstYear;
	private String secondMonth;
	private JFrame prevWindow;
	/**
	 * Constructor of ChoiceMonthsToCompare class
	 *
	 * @param menu of the user
	 */
	public ChoiceMonthsToCompare(Employee employee, JFrame previousWindow) {
		this.Employee = employee;
		this.prevWindow = previousWindow;
		GUI menu = new GUI();
		this.window = menu.createWindow("Comparison", 600, 700);
		Dimension screen = Toolkit.getDefaultToolkit().getScreenSize();
		this.window.setLocation((screen.width / 2) - 300, (screen.height / 2) - 400);
		this.window.getContentPane().setBackground(Color.white);
		
		// HEADER
		this.header = menu.createLabel("Comparison of monthly gain.", 100, 50, 300, 50);
		this.window.add(this.header);
		// Change font and text size
	    header.setFont(new java.awt.Font(Font.SERIF,Font.BOLD,15));
		
	    // BODY
		this.l1 = menu.createLabel("Please choose the months you want to compare.", 100, 120, 400, 30);
		this.window.add(this.l1);

		//1st month
		this.l2 = menu.createLabel("Month", 100, 200, 150, 30);
		this.window.add(this.l2);
		String[] list = new String[12];
		for (int i = 1; i <= 12; i++) {
			list[i - 1] = tab[i - 1];
		}
		this.month1 = menu.createComboBox(list, 100, 230, 150, 30);
		this.window.add(this.month1);
		
		//1st year
		this.l3 = menu.createLabel("Year", 300, 200, 150, 30);
		this.window.add(this.l3);
		String[] list1 = new String[3];
		for (int i = 1; i <= 3; i++) {
			list1[i - 1] = Integer.toString(i + 2019);
		}
		this.year1 = menu.createComboBox(list1, 300, 230, 150, 30);
		this.window.add(this.year1);

		// 2nd month
		this.l5 = menu.createLabel("Month", 100, 400, 150, 30);
		this.window.add(this.l5);
		String[] list2 = new String[12];
		for (int i = 1; i <= 12; i++) {
			list2[i - 1] = tab[i - 1];
		}
		this.month2 = menu.createComboBox(list2, 100, 430, 150, 30);
		this.window.add(this.month2);
		//2nd year
		this.l6 = menu.createLabel("Year", 300, 400, 150, 30);
		this.window.add(this.l6);
		String[] list3 = new String[3];
		for (int i = 1; i <= 3; i++) {
			list3[i - 1] = Integer.toString(i + 2019);
		}
		this.year2 = menu.createComboBox(list3, 300, 430, 150, 30);
		this.window.add(this.year2);

		//Button, one to continue, other to come back
		this.consult = menu.createButton("Consult", 350, 550, 100, 30, new Color(117, 184, 201), Color.WHITE);
		this.consult.addActionListener(this.Consult);
		this.window.add(this.consult);
		this.back = menu.createButton("Back", 460, 550, 100, 30, new Color(117, 184, 201), Color.WHITE);
		this.back.addActionListener(this.Back);
		this.window.add(this.back);
		
		//Repaint
		this.window.setVisible(true);
		this.back.repaint();
		this.consult.repaint();
		this.month1.repaint();
		this.year1.repaint();
		this.month2.repaint();
		this.year2.repaint();
		this.l5.repaint();
		this.l1.repaint();
		this.l2.repaint();
		this.l3.repaint();

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
	public String getYear1() {
		return firstYear ;
	}

	public String getMonth1() {
		return secondMonth ;
	}
	public void setYear1(String newYear) {
		this.firstYear = newYear;
	}
	public void setMonth1 (String newMonth) {
		this.secondMonth = newMonth;
	}
	private class Back implements ActionListener {
		public void actionPerformed(ActionEvent e) {
			new OperationsFinancialState(Employee);
			window.dispose();
		}
	}

	private class Consult implements ActionListener {
		public void actionPerformed(ActionEvent e) {
			ChoiceMonthsToCompare.this.setMonth((String) ChoiceMonthsToCompare.this.month1.getItemAt(ChoiceMonthsToCompare.this.month1.getSelectedIndex()));
			ChoiceMonthsToCompare.this.setYear((String) ChoiceMonthsToCompare.this.year1.getItemAt(ChoiceMonthsToCompare.this.year1.getSelectedIndex()));
			String y = ChoiceMonthsToCompare.this.getYear();
			String m =  ChoiceMonthsToCompare.this.getMonth();
			ChoiceMonthsToCompare.this.setMonth1((String) ChoiceMonthsToCompare.this.month2.getItemAt(ChoiceMonthsToCompare.this.month2.getSelectedIndex()));
			ChoiceMonthsToCompare.this.setYear1((String) ChoiceMonthsToCompare.this.year2.getItemAt(ChoiceMonthsToCompare.this.year2.getSelectedIndex()));
			String y1 = ChoiceMonthsToCompare.this.getYear1();
			String m1 =  ChoiceMonthsToCompare.this.getMonth1();
			new ComparaisonMonthEarningsSwing(m,y,m1,y1, Employee);
			window.dispose();
			prevWindow.dispose();
		}
	}
}
