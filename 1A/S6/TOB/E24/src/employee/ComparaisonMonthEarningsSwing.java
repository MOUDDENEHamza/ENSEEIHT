package employee;

import javax.swing.*;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableRowSorter;

import general.GUI;

import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

/**
 * Comparison of income and expenses between two months
 *
 * @author Chaimaa_LOTFI
 * @version 1.0
 */
public class ComparaisonMonthEarningsSwing {
	private JFrame window;
	private JTable table;
	private JScrollPane sp;
	private JLabel logo,footerLabel;
	public JLabel text, text1, text3;
	private JButton Return, Refresh;
	private JPanel headLeft,footer, headCenter, tablepanel;
	private Color Background;
	private final ActionListener B_Return = new Return(); // Return button's listener
	private final ActionListener B_Refresh = new Refresh();
	private String[][] operations;
	private String month;
	private String year;
	private String month1;
	private String year1;
	History history = new History();
	ExpensesComparaison date1;
	ExpensesComparaison date2;
	private String str1, str2;
	private Employee Employee;
	public ComparaisonMonthEarningsSwing(String month, String year, String month1, String year1,Employee Employee) {

		this.Employee = Employee;
		GUI MenuCommandes = new GUI(); // Using the methods implemented in GUI.java
		this.Background = new Color(255, 255, 255);
		this.month = month;
		this.year = year;
		this.month1 = month1;
		this.year1 = year1;
		str1 = new StringBuilder("01").append("/").append(Month(month)).append("/").append(this.year).toString();
		str2 = new StringBuilder("01").append("/").append(Month(month1)).append("/").append(this.year1).toString();
		date1 = new ExpensesComparaison(str1, str2);
		date2 = new ExpensesComparaison(Month(month1), year1);
		// Create maximized JFrame and getting its dimensions
		this.window = MenuCommandes.createWindow("Comparsison", 0, 0);
		this.window.setExtendedState(this.window.getExtendedState() | JFrame.MAXIMIZED_BOTH);
		this.window.getContentPane().setBackground(Background); // set JFrame Color

		Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
		int width = screenSize.width; // 1536
		int height = screenSize.height;// 864
		// HEADER
		this.headLeft = MenuCommandes.createPanel(0, 0, width * 176 / 1536, height * 40 / 864, Background);
		this.logo = MenuCommandes.createLabel("Monthly earnings:", 40, (height * 100 / 864) / 2, 500,
				100);
		this.headLeft.add(logo);
		this.window.add(this.headLeft);
		// logo.setFont(new java.awt.Font(Font.SERIF, Font.BOLD, 15));
		this.headCenter = MenuCommandes.createPanel(width * 176 / 1536, 0, width * 1024 / 1536, height * 40 / 864,
				Background);
		this.window.add(this.headCenter);
		this.operations = importOperations();

		// Setting up the column names
		String[] columnNames = { " ", "Number of operation", "Amount" };
		// Setting up the table
		// Table panel
		this.tablepanel = MenuCommandes.createPanel(268, height * 250 / 864, width - 515 * width / 1536,
				130 * height / 864, Color.WHITE); // Table panel

		DefaultTableModel model = new DefaultTableModel(operations, columnNames);

		this.table = new JTable(model); // Table
		TableRowSorter<DefaultTableModel> sorter = new TableRowSorter<DefaultTableModel>(model);
		table.setRowSorter(sorter);
		table.setRowHeight(50*height/864);
		this.sp = new JScrollPane(table); // Table with a JScrollPane
		// View Size of JTable
		table.setPreferredScrollableViewportSize(
				new Dimension(width - width * 536 / 1536, 250* height / 864)); // Table dimension
		table.setAutoResizeMode(JTable.AUTO_RESIZE_OFF);
		table.setFillsViewportHeight(true);

		// Set table column widths
		this.table.getColumnModel().getColumn(0).setPreferredWidth(width * 330 / 1536);
		this.table.getColumnModel().getColumn(1).setPreferredWidth(width * 332 / 1536);
		this.table.getColumnModel().getColumn(2).setPreferredWidth(width * 340 / 1536);

		// Center all columns
		DefaultTableCellRenderer centerRenderer = new DefaultTableCellRenderer();
		centerRenderer.setHorizontalAlignment(SwingConstants.CENTER);
		this.table.getColumnModel().getColumn(0).setCellRenderer(centerRenderer);
		this.table.getColumnModel().getColumn(1).setCellRenderer(centerRenderer);
		this.table.getColumnModel().getColumn(2).setCellRenderer(centerRenderer);

		// Add JTable to Table Panel and Table Panel to JFrame
		this.tablepanel.add(this.sp);
		this.window.add(tablepanel);
		// Text
		this.text = MenuCommandes.createLabel("Comparison of monthly earnings between :", 300 * width / 1360,
				height * 50 / 705, width * 176 / 200, 100);
		this.text.setForeground(Color.black);
		this.window.add(text);
		// Text1
		this.text1 = MenuCommandes.createLabel(month + " " +year +" and "+month1+ " "+year1 , 400 * width / 1360,
				height * 100 / 705, width * 176 / 200, 100);
		this.text1.setForeground(Color.black);
		this.window.add(text1);
		text.setFont(new java.awt.Font(Font.SERIF, Font.BOLD, 25));
		text1.setFont(new java.awt.Font(Font.SERIF, Font.BOLD, 25));
		/*compare the result.*/
		double a = Double.parseDouble(operations[0][2]);
		double b = Double.parseDouble(operations[1][2]);
		if(a<b) {
			this.text3 = MenuCommandes.createLabel("The earnings of " +month1+ " "+year1+ " are higher than those of " 
					+month +" "+year, 300 * width / 1360, height * 380 / 705, width * 176 / 200, 100);}
		if(a==b) {
			this.text3 = MenuCommandes.createLabel("The earnings of " +month1+ " "+year1+ " are equal to those of " 
					+month +" "+year, 300 * width / 1360, height * 380 / 705, width * 176 / 200, 100);}

		else {
			this.text3 = MenuCommandes.createLabel("The earnings of " +month+ " "+year+ " are higher than those of " 
					+month1 +" "+year1, 200 * width / 1360, height * 380 / 705, width * 176 / 200, 100);}
		this.text3.setForeground(Color.black);
		this.window.add(text3);


		// Making a return and refresh button
		this.Return = MenuCommandes.createButton("Back", 0, 550, width, 30, new Color(117, 184, 201), Color.WHITE);
		this.Refresh = MenuCommandes.createButton("Refresh", width - width * 102 / 1536, (height * 8 / 864) / 2, 95, 25,
				new Color(15, 125, 102), Color.WHITE);

		// The Return and Refresh button's action listener
		Return.addActionListener(this.B_Return);
		Refresh.addActionListener(this.B_Refresh);

		
		// Add buttons to window
		// Footer items
		this.footer = MenuCommandes.createPanel(0, height * 725 / 864, width, height * 75 / 864, Background);
		this.footer.setLayout(new BorderLayout());
		this.footerLabel = MenuCommandes.createLabel("E24 Restaurant 2020", 0, 0, 100, 50);
		this.footer.add(this.Return, BorderLayout.NORTH);
		this.footer.add(this.footerLabel, BorderLayout.CENTER);
		this.window.add(this.footer); // Adding footer to JFrame
		this.window.add(this.Refresh);
		try {
			GraphicsEnvironment ge = GraphicsEnvironment.getLocalGraphicsEnvironment();
			Font Museo_500 = Font.createFont(Font.TRUETYPE_FONT, new File("fonts/Museo Slab W00 500.otf"))
					.deriveFont(14f);
			ge.registerFont(Museo_500);
			Font Uniform_Medium = Font.createFont(Font.TRUETYPE_FONT, new File("fonts/Uniform Condensed Medium.ttf"))
					.deriveFont(16f);
			ge.registerFont(Uniform_Medium);
			Font Uniform_Light = Font.createFont(Font.TRUETYPE_FONT, new File("fonts/Uniform Light.ttf"))
					.deriveFont(15f);
			Font Avenir_Light = Font.createFont(Font.TRUETYPE_FONT, new File("fonts/avenir-light.otf")).deriveFont(20f);
			ge.registerFont(Avenir_Light);
			ge.registerFont(Uniform_Light);
			this.table.setFont(Museo_500);
			this.Return.setFont(Uniform_Light);
			this.footerLabel.setFont(Uniform_Light);
			this.Refresh.setFont(Uniform_Light);
			this.logo.setFont(Uniform_Light);
			this.text.setFont(Avenir_Light.deriveFont(30f));
			this.text1.setFont(Avenir_Light.deriveFont(30f));
			this.text3.setFont(Avenir_Light.deriveFont(30f));

		} catch (IOException | FontFormatException e) {
			e.printStackTrace();
		}

		this.text.repaint();
		this.window.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

	}

	private class Return implements ActionListener {
		public void actionPerformed(ActionEvent e) {

			new OperationsFinancialState(Employee);
			window.dispose();

		}
	}

	private class Refresh implements ActionListener {
		public void actionPerformed(ActionEvent e) {

			new ComparaisonMonthEarningsSwing(month, year,month1,year1,Employee);
			window.dispose();
		}
	}

	/*convert month name to number.*/
	public String convert(String Hello) {
		int i;
		switch (Hello) {

		case "January":
			i = 1;
			break;

		case "Februry":
			i = 2;
			break;

		case "March":
			i = 3;
			break;

		case "April":
			i = 4;
			break;

		case "May":
			i = 5;
			break;

		case "June":
			i = 6;
			break;

		case "July":
			i = 07;
			break;

		case "August":
			i = 8;
			break;

		case "September":
			i = 9;
			break;

		case "Obtober":
			i = 10;
			break;

		case "November":
			i = 11;
			break;

		case "December":
			i = 12;
			break;
		default:
			i = 0;
		}

		String str = Integer.toString(i);
		return str;
	}

	public /* @ pure @ */ int getNbValues() {
		int i = 0;
		BufferedReader br = null;
		try {

			br = new BufferedReader(new FileReader("operation.csv"));
			while ((br.readLine()) != null) {
				i = i + 1;
			}

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (br != null) {
				try {
					br.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return i;
	}

	/*return the month in form xx.*/
	public String Month(String month) {
		String line;
		if (Integer.parseInt(convert(month)) < 10) {
			line = new StringBuilder("0").append(convert(month)).toString();
		} else {
			line = month;
		}
		return line;
	}

	/*returns the operations performed in a month.*/
	public String[][] importOperations() {
		String[][] operations = new String[2][3];
		/*expenses and income for each month.*/
		double sum1 = date1.sum1();
		double sum2 = date1.sum2();
		int k1 = history.getPositionF(
				new StringBuilder("01").append("/").append(Month(month)).append("/").append(this.year).toString());
		int k2 = history.getPositionF(
				new StringBuilder("01").append("/").append(Month(month1)).append("/").append(this.year1).toString());
		/* Initialize the number of operation from 1. */
		operations[0][0] = "1st " + month + " " + this.year;
		operations[0][1] = Integer.toString(k1);
		operations[0][2] = Double.toString(sum1);
		operations[1][0] = "1st " + month1 + " " + this.year1;
		operations[1][1] = Integer.toString(k2);
		operations[1][2] = Double.toString(sum2);

		return operations;

	}
}
