import javax.swing.*;
import javax.swing.event.DocumentEvent;
import javax.swing.event.DocumentListener;
import javax.swing.event.TableModelEvent;
import javax.swing.event.TableModelListener;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableColumn;
import javax.swing.table.TableModel;
import javax.swing.table.TableRowSorter;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;


public class HistorySwing {
	private JFrame window;
	private JTable table;
	private JScrollPane sp;
	private JLabel logo, footerLabel, text, l1, l2, l3, l4,l5;
	private JTextField t2, tDate, tTablenm, tPayment;
	private JButton Return, Refresh, Clear;
	private JPanel headLeft, headCenter, headRight, footer, tablepanel;
	private Color Background;
	private JComboBox<String> comboBoxPayment,	comboBoxTableNm,comboBoxDate,comboBoxHour;
	private static final String[] COLUMN_NAMES = {"Number of Operation", "Date", "Amount","Balance"};
	private final ActionListener B_Return = new Return(); //Return button's listener
	private final ActionListener B_Refresh = new Refresh();
	private String[][] operations;
	private Employee Employee;
	public HistorySwing() {
		
		GUI MenuCommandes = new GUI(); //Using the methods implemented in GUI.java
		this.Background = new Color(255, 255, 255);

		//Create maximized JFrame and getting its dimensions
		this.window = MenuCommandes.createWindow("History", 0, 0);
		this.window.setExtendedState(this.window.getExtendedState() | JFrame.MAXIMIZED_BOTH);
		this.window.getContentPane().setBackground(Background); //set JFrame Color

		Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
		int width = screenSize.width; //1536
		int height = screenSize.height;//864
		int actual_height = height - height * 40/864 - height * 75/864  -5; //Height between footer and header

		//HEADER
		this.headLeft = MenuCommandes.createPanel(0, 0, width *176/1536, height * 40/864, Background );
		this.logo = MenuCommandes.createLabel("History of operations", 40, (height * 100/864)/2, 120, 40);
		this.headLeft.add(logo);
		this.window.add(this.headLeft);

		this.headCenter = MenuCommandes.createPanel(width * 176/1536, 0, width * 1024/1536,  height * 40/864, Background);
		this.window.add(this.headCenter);

		/*this.headRight = MenuCommandes.createPanel(width * 176/1536 + width * 1024/1536, 0, width * 336/1536,  height * 40/864, Background);
		this.text = MenuCommandes.createLabel("History of operations", 0, (height * 40/864)/2, 200, 40);
		this.headRight.add(text);
		this.window.add(this.headRight);*/

		//Import the operations database
		
		this.operations  = importOperations();
		//Setting up the column names
		String[] columnNames = {"Operation Number", "Date", "Amount","Balance"};
		//Setting up the table
		//Table panel
		this.tablepanel = MenuCommandes.createPanel(268, height * 40/864, width - 515*width/1536, actual_height - 210 *height/864, Color.WHITE); //Table panel

		DefaultTableModel model = new DefaultTableModel(operations, columnNames);

		this.table = new JTable(model);  //Table
		TableRowSorter<DefaultTableModel> sorter = new TableRowSorter<DefaultTableModel>(model);
		table.setRowSorter(sorter); //JTable filter
		//Set up JTextField/ComboBox + JLabel

		this.sp = new JScrollPane(table); //Table with a JScrollPane
		//View Size of JTable
		table.setPreferredScrollableViewportSize(new Dimension(width - width*536/1536, actual_height - 250*height/864)); //Table dimension
		table.setAutoResizeMode(JTable.AUTO_RESIZE_OFF);
		table.setFillsViewportHeight(true); 

		//Set table column widths
		this.table.getColumnModel().getColumn(0).setPreferredWidth(width*250/1536);
		this.table.getColumnModel().getColumn(1).setPreferredWidth(width*250/1536);
		this.table.getColumnModel().getColumn(2).setPreferredWidth(width*250/1536);
		this.table.getColumnModel().getColumn(3).setPreferredWidth(width*250/1536);
		//Set the height of every row
		this.table.setRowHeight(50);
		
		
		//Center all columns
		DefaultTableCellRenderer centerRenderer = new DefaultTableCellRenderer();
		centerRenderer.setHorizontalAlignment( SwingConstants.CENTER );		
		this.table.getColumnModel().getColumn(0).setCellRenderer( centerRenderer );
		this.table.getColumnModel().getColumn(1).setCellRenderer( centerRenderer );
		this.table.getColumnModel().getColumn(2).setCellRenderer( centerRenderer );
		this.table.getColumnModel().getColumn(3).setCellRenderer( centerRenderer );
		
		//Add JTable to Table Panel and Table Panel to JFrame
		this.tablepanel.add(this.sp);
		this.window.add(tablepanel);

		//Making a return button
		this.Return = MenuCommandes.createButton("Back", 0, 0, 100, 40, new Color(117,184,201), Color.WHITE);
		this.Refresh = MenuCommandes.createButton("Refresh", width - width*102/1536, (height * 8/864)/2, 95, 20, new Color(15, 125, 102), Color.WHITE);

		Return.addActionListener(this.B_Return); //The Return button's action listener
		Refresh.addActionListener(this.B_Refresh);

		//Footer items
		this.footer = MenuCommandes.createPanel(0, height*725/864, width,  height * 75/864, Background);
		this.footer.setLayout(new BorderLayout());
		this.footerLabel = MenuCommandes.createLabel("� 2020 Resto'N7 ", 0, 0, 100, 50);
		this.footer.add(this.Return, BorderLayout.NORTH);
		this.footer.add(this.footerLabel, BorderLayout.CENTER);
		this.window.add(this.footer); //Adding footer to JFrame
		this.window.add(this.Refresh);

		try {
			GraphicsEnvironment ge = GraphicsEnvironment.getLocalGraphicsEnvironment();
			Font Museo_500 = Font.createFont(Font.TRUETYPE_FONT, new File("fonts/Museo Slab W00 500.otf")).deriveFont(14f);
			ge.registerFont(Museo_500);
			Font Uniform_Medium = Font.createFont(Font.TRUETYPE_FONT, new File("fonts/Uniform Condensed Medium.ttf")).deriveFont(16f);
			ge.registerFont(Uniform_Medium);
			Font Uniform_Light = Font.createFont(Font.TRUETYPE_FONT, new File("fonts/Uniform Light.ttf")).deriveFont(15f);
			ge.registerFont(Uniform_Light);
			this.table.setFont(Museo_500);
			this.Return.setFont(Uniform_Light);
			this.Refresh.setFont(Uniform_Light);
			this.footerLabel.setFont(Uniform_Light);
			this.logo.setFont(Uniform_Light);
			this.text.setFont(Uniform_Light);

//			l2.setFont(Uniform_Medium);
//			t2.setFont(Uniform_Light);
//			l1.setFont(Uniform_Medium);
//			l3.setFont(Uniform_Medium);
//			l4.setFont(Uniform_Medium);
//			l5.setFont(Uniform_Medium);
//			Clear.setFont(Uniform_Medium);
		} catch (IOException|FontFormatException e) {
			e.printStackTrace();
		}
		
		this.window.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE );

	}
	
	private class Return implements ActionListener {
		public void actionPerformed(ActionEvent e) {
			new Operation_FinancialState(Employee);
			window.dispose();
			
		}
	}
	
	private class Refresh implements ActionListener {
		public void actionPerformed(ActionEvent e) {
			new HistorySwing();
			window.dispose();
			
		}
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

	public String[][] importOperations() {
		BufferedReader br = null;
		String line = "";
		String[][] operations = new String[getNbValues()][4]; 
		int i = 0;

		try {

			br = new BufferedReader(new FileReader("operation.csv"));
			while ((line = br.readLine()) != null) {

				// use comma as separator
				String[] op = line.split(",");
				operations[i][0] = op[0];
				operations[i][1] = op[1];
				operations[i][2] = op[2];
				operations[i][3] = op[3];
				i++;

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