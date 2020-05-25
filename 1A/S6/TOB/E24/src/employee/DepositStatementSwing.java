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
 * Show the deposit statement for specific month.
 *
 * @author Chaimaa_LOTFI
 * @version 1.0
 */
public class DepositStatementSwing {
	private JFrame window;
	private JTable table;
	private JScrollPane sp;
	private JLabel logo, logo1, logo2, footerLabel,text3;
	private JButton Return, Refresh;
	private JPanel headLeft, headLeft1, headLeft2, headCenter, footer, tablepanel;
	private Color Background;
	private final ActionListener B_Return = new Return(); // Return button's listener
	private final ActionListener B_Refresh = new Refresh();
	private String[][] operations;
	private Employee Employee;
	private String month;
	private String year;
	History history = new History();
	int k;
	public DepositStatementSwing(String month, String year, Employee employee) {
		this.Employee = employee;
		GUI MenuCommandes = new GUI(); // Using the methods implemented in GUI.java
		this.Background = new Color(255, 255, 255);
		this.month = month;
		this.year = year;
		// Create maximized JFrame and getting its dimensions
		this.window = MenuCommandes.createWindow("Deposit Statement", 0, 0);
		this.window.setExtendedState(this.window.getExtendedState() | JFrame.MAXIMIZED_BOTH);
		this.window.getContentPane().setBackground(Background); // set JFrame Color

		Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
		int width = screenSize.width; // 1536
		int height = screenSize.height;// 864
		int actual_height = height - height * 40 / 864 - height * 75 / 864 - 5; // Height between footer and header

		// HEADER
		this.headLeft = MenuCommandes.createPanel(0, 0, width * 176 / 1536, height * 40 / 864, Background);
		this.logo = MenuCommandes.createLabel("Deposit Statement:", 40, (height * 100 / 864) / 2, 120, 40);
		this.headLeft.add(logo);
		this.window.add(this.headLeft);
		this.headLeft1 = MenuCommandes.createPanel(0, 50, width * 176 / 1536, height * 40 / 864, Background);
		this.logo1 = MenuCommandes.createLabel("Month :" + this.month, 40, (height * 100 / 864) / 2, 20, 40);
		this.headLeft1.add(logo1);
		this.window.add(this.headLeft1);
		this.headLeft2 = MenuCommandes.createPanel(0, 100, width * 176 / 1536, height * 40 / 864, Background);
		this.logo2 = MenuCommandes.createLabel("Year :" + this.year, 40, (height * 100 / 864) / 2, 20, 40);
		this.headLeft2.add(logo2);
		this.window.add(this.headLeft2);
		logo.setFont(new java.awt.Font(Font.SERIF, Font.BOLD, 15));
		logo1.setFont(new java.awt.Font(Font.SERIF, Font.BOLD, 15));
		logo2.setFont(new java.awt.Font(Font.SERIF, Font.BOLD, 15));
		this.headCenter = MenuCommandes.createPanel(width * 176 / 1536, 0, width * 1024 / 1536, height * 40 / 864,
				Background);
		this.window.add(this.headCenter);
		// Import the operations database

		this.operations = importOperations();
		// Setting up the column names
		String[] columnNames = { "Operation Number", "Date", "Amount", "Balance" };
		// Setting up the table
		// Table panel
		this.tablepanel = MenuCommandes.createPanel(268, height * 40 / 864, width - 515 * width / 1536,
				actual_height - 210 * height / 864, Color.WHITE); // Table panel

		DefaultTableModel model = new DefaultTableModel(operations, columnNames);

		this.table = new JTable(model); // Table
		TableRowSorter<DefaultTableModel> sorter = new TableRowSorter<DefaultTableModel>(model);
		table.setRowSorter(sorter); // JTable filter
		table.setRowHeight(30);
		// Set up JTextField/ComboBox + JLabel

		this.sp = new JScrollPane(table); // Table with a JScrollPane
		// View Size of JTable
		table.setPreferredScrollableViewportSize(
				new Dimension(width - width * 536 / 1536, actual_height - 250 * height / 864)); // Table dimension
		table.setAutoResizeMode(JTable.AUTO_RESIZE_OFF);
		table.setFillsViewportHeight(true);

		// Set table column widths
		this.table.getColumnModel().getColumn(0).setPreferredWidth(width * 250 / 1536);
		this.table.getColumnModel().getColumn(1).setPreferredWidth(width * 250 / 1536);
		this.table.getColumnModel().getColumn(2).setPreferredWidth(width * 250 / 1536);
		this.table.getColumnModel().getColumn(3).setPreferredWidth(width * 250 / 1536);

		// Center all columns
		DefaultTableCellRenderer centerRenderer = new DefaultTableCellRenderer();
		centerRenderer.setHorizontalAlignment(SwingConstants.CENTER);
		this.table.getColumnModel().getColumn(0).setCellRenderer(centerRenderer);
		this.table.getColumnModel().getColumn(1).setCellRenderer(centerRenderer);
		this.table.getColumnModel().getColumn(2).setCellRenderer(centerRenderer);
		this.table.getColumnModel().getColumn(3).setCellRenderer(centerRenderer);

		// Add JTable to Table Panel and Table Panel to JFrame
		this.tablepanel.add(this.sp);
		this.window.add(tablepanel);

		// Making a return button
		this.Return = MenuCommandes.createButton("Back", 0, 550, width, 30, new Color(117, 184, 201), Color.WHITE);
		this.Refresh = MenuCommandes.createButton("Refresh", width - width * 102 / 1536, (height * 8 / 864) / 2, 95, 25,
				new Color(15, 125, 102), Color.WHITE);

		Return.addActionListener(this.B_Return); // The Return button's action listener
		Refresh.addActionListener(this.B_Refresh);
		if(k==0) {
			this.text3 = MenuCommandes.createLabel("There were no operations this month... " 
					, 370 * width / 1360, height * 450 / 705, width * 176 / 200, 100);
			this.text3.setForeground(Color.black);
			text3.setFont(new java.awt.Font(Font.SERIF, Font.BOLD, 25));
			this.window.add(text3);
		}
		
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
			this.Refresh.setFont(Uniform_Light);
			this.footerLabel.setFont(Uniform_Light);
			this.logo.setFont(Uniform_Light);
			this.logo1.setFont(Avenir_Light.deriveFont(20f));
			this.logo2.setFont(Avenir_Light.deriveFont(20f));

		} catch (IOException | FontFormatException e) {
			e.printStackTrace();
		}

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

			new DepositStatementSwing(month, year, Employee);
			window.dispose();

		}
	}

	/* convert month name to number. */
	public String convert() {
		int i;
		switch (this.month) {
		case "January":
			i = 01;
			break;

		case "February":
			i = 02;
			break;

		case "March":
			i = 03;
			break;

		case "April":
			i = 04;
			break;

		case "May":
			i = 05;
			break;

		case "June":
			i = 06;
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

		case "October":
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

	/*returns the operations performed in a month.*/
	public String[][] importOperations() {
		BufferedReader br = null;
		String line = "";
		String line1;
		if (Integer.parseInt(convert()) < 10) {
			line1 = new StringBuilder("00").append("/0").append(convert()).append("/").append(this.year).toString();
		} else {
			line1 = new StringBuilder("00").append("/").append(convert()).append("/").append(this.year).toString();
		}
		/* Get the first index of operation associate to this date. */
		int j = history.getPosition(line1);
		/* Get the number of operation on this month-year. */
		k = history.getPositionF(line1);
		String[][] operations = new String[k][4];
		int i = 0;

		try {

			br = new BufferedReader(new FileReader("data/operation.csv"));

			/* Read the file. */
			while ((line = br.readLine()) != null) {

				if (i >= j && i < k + j) {
					// use comma as separator
					String[] op = line.split(",");
					/* Initialize the number of operation from 1. */
					int nmOperation = Integer.parseInt(op[0]) - j;
					String str1 = Integer.toString(nmOperation);
					operations[i - j][0] = str1;
					operations[i - j][1] = op[1];
					operations[i - j][2] = op[2];
					operations[i - j][3] = op[3];
					i++;
				} else if (i == k + j) {
					break;
				} else {
					i++;
				}
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
		return operations;

	}
}
