package customer;
import general.*;
import javax.swing.*;
import javax.swing.event.DocumentEvent;
import javax.swing.event.DocumentListener;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableRowSorter;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

/**
 * @author Younes Saoudi
 */
public class PurchaseHistory {

	//Class Attributes//

	// Swing Items
	private JFrame window;
	private JTable table;
	private JScrollPane sp;
	private JLabel logo, footerLabel, text, l1, l2, l3, l4,l5;
	private JTextField t2, tDate, tPayment;
	private JButton Return, Refresh, Clear;
	private JPanel headLeft, headCenter, headRight, footer, tablepanel;
	private Color Background;
	private JComboBox<String> comboBoxPayment,comboBoxDate,comboBoxHour;

	private String[][] orders; //The 2D Array that will contain each order's details
	private MenuSwing menuSwing;

	private final ActionListener B_Return = new Return(); //Return button's listener
	private final ActionListener B_Refresh = new Refresh();
	private final ActionListener B_Clear  = new actionClear();
	private final Customer customer;
	private static final String startDate = "11/04/2020 00:00:00";

	/**
	 * @param menuSwing
	 * @author Younes Saoudi
	 */
	public PurchaseHistory(MenuSwing menuSwing) {
		this.menuSwing = menuSwing;
		this.customer = menuSwing.Customer;

		GUI MenuCommandes = new GUI(); //Using the methods implemented in GUI.java
		this.Background = Color.WHITE;
		JSONParser parser = new JSONParser();
		String hist = null  , paymethd = null, order=null, paid ="", createdate="",hour="", clear="", search ="",
				date="";
		      

		String file = "data/langueEn.json";
      	        try {
        	if (menuSwing.getLangue().equals("fr")) {
        		file = "data/langueFr.json";
        	}
                JSONArray lang = (JSONArray) parser.parse(new FileReader(file));

           	for (Object word : lang) {
				JSONObject msg = (JSONObject) word;
				hist = (String) msg.get("purchasehistory");
				paymethd = (String) msg.get("paymethd");
				order = (String) msg.get("order");
				paid = (String) msg.get("paid");
				createdate = (String) msg.get("createdate");
				hour = (String) msg.get("hour");	
				clear = (String) msg.get("clear");	
				search = (String) msg.get("searchTxt");
				date = (String) msg.get("date");
				}
        } catch (FileNotFoundException e) {
    			e.printStackTrace();
    		} catch (IOException e) {
    			e.printStackTrace();
    		} catch (ParseException e) {
    			e.printStackTrace();
    		} catch (NumberFormatException e) {
    			System.out.print(true);
    		} catch (Exception e) {
		}
		//Create maximised JFrame and getting its dimensions
		this.window = MenuCommandes.createWindow(hist, 0, 0);
		this.window.setExtendedState(this.window.getExtendedState() | JFrame.MAXIMIZED_BOTH);
		this.window.getContentPane().setBackground(Background);

		Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
		int width = screenSize.width; //1536
		int height = screenSize.height;//864
		int actual_height = height - height * 40/864 - height * 75/864  -5; //Height between footer and header

		//HEADER
		this.headLeft = MenuCommandes.createPanel(0, 0, width *176/1536, height * 40/864, Background );
		this.logo = MenuCommandes.createLabel(hist, 10, (height * 40/864)/2, 120, 40);
		this.headLeft.add(logo);
		this.window.add(this.headLeft);

		this.headCenter = MenuCommandes.createPanel(width * 176/1536, 0, width * 1024/1536,  height * 40/864, Background);
		this.window.add(this.headCenter);

		this.headRight = MenuCommandes.createPanel(width * 176/1536 + width * 1024/1536, 0, width * 336/1536,  height * 40/864, Background);
		this.text = MenuCommandes.createLabel(hist, 5, (height * 40/864)/2, 200, 40);
		this.headRight.add(text);
		this.window.add(this.headRight);
		
		this.l1 = MenuCommandes.createLabel("<html>You have <font color=#39bacc>" + customer.getLoyaltyPoints()%100 
				+" loyalty points.<br>"	+ "<font color=black>Only <font color=red>" 
				+ (100 - (customer.getLoyaltyPoints()%100)) + "<font color=black> left to get a discount!<html>",
				50*width/1536, 250*height/864, 200, 100);
		if (menuSwing.getLangue().equals("fr")) {
			this.l1.setText("<html>Vous avez <font color=#39bacc>" + customer.getLoyaltyPoints()%100 
			+" points de fid\u00E9li\u00E9.<br>"	+ "<font color=black>Il vous reste seulement <font color=red>" 
			+ (100 - (customer.getLoyaltyPoints()%100)) + "<font color=black> points pour b\u00E9n\u00E9ficier d'une r\u00E9duction!<html>");
		}
		window.add(l1);
		//Import the orders database       
		this.orders  = importOrders();
		//Setting up the column names
		String[] columnNames = { paymethd, order, paid, createdate};
		//Setting up the table
		this.tablepanel = MenuCommandes.createPanel(268, height * 40/864, width - 515*width/1536, actual_height - 210 *height/864, Color.WHITE); //Table panel

		DefaultTableModel model = new DefaultTableModel(orders, columnNames);

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
		this.table.getColumnModel().getColumn(0).setPreferredWidth(width*100/1536);
		this.table.getColumnModel().getColumn(1).setPreferredWidth(width*630/1536);
		this.table.getColumnModel().getColumn(2).setPreferredWidth(width*70/1536);
		this.table.getColumnModel().getColumn(3).setPreferredWidth(width*200/1536);
		this.table.setRowHeight(50);


		//Center all columns
		DefaultTableCellRenderer centerRenderer = new DefaultTableCellRenderer();
		centerRenderer.setHorizontalAlignment( SwingConstants.CENTER );		
		this.table.getColumnModel().getColumn(0).setCellRenderer( centerRenderer );
		this.table.getColumnModel().getColumn(1).setCellRenderer( centerRenderer );
		this.table.getColumnModel().getColumn(2).setCellRenderer( centerRenderer );
		this.table.getColumnModel().getColumn(3).setCellRenderer( centerRenderer );


		//Making a Combo Box for the Date filter
		comboBoxDate = new JComboBox<String>();
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
		Date Date = new Date();
		Calendar cal = Calendar.getInstance();
		try {
			cal.setTime(formatter.parse(startDate));
		} catch (java.text.ParseException e1) {
			e1.printStackTrace();
		}
		Date dynamicDate = cal.getTime();
		comboBoxDate.addItem("");
		while (dynamicDate.before(Date)) {
			comboBoxDate.addItem(formatter.format(dynamicDate));
			cal.add(Calendar.DATE,+1);
			dynamicDate = cal.getTime();
		}



		comboBoxHour = new JComboBox<String>();
		comboBoxHour.addItem("");
		for(int i=1;i<24;i++) {
			comboBoxHour.addItem(String.valueOf(i/10)+String.valueOf(i%10));
		}
		comboBoxHour.addItem("00");
		comboBoxPayment = new JComboBox<String>();
		comboBoxPayment.addItem("");
		comboBoxPayment.addItem("Cash");
		comboBoxPayment.addItem("Credit Card");
		comboBoxPayment.setSelectedIndex(0);
		
		l3 = MenuCommandes.createLabel(paymethd, 215*width/1536 + 80*width/1536, 4*actual_height/5, 130, 30);
		l3.setForeground(Color.BLACK);
		l4 = MenuCommandes.createLabel(date, 620*width/1536 + 80*width/1536, 4*actual_height/5, 130, 30);
		l4.setForeground(Color.BLACK);
		l5 = MenuCommandes.createLabel(hour, 950*width/1536 + 80*width/1536, 4*actual_height/5, 130, 30);
		l5.setForeground(Color.BLACK);

		
		comboBoxPayment.setBounds(425*width/1536,  4*actual_height/5, 150*width/1536, 30);
		comboBoxDate.setBounds(755*width/1536, 4*actual_height/5, 150*width/1536, 30);
		comboBoxHour.setBounds(1085*width/1536, 4*actual_height/5, 150*width/1536, 30);

		Clear = MenuCommandes.createButton(clear, width/2 - 40*width/1536, 13*actual_height/14, 80, 25, Color.WHITE, Color.BLACK);
		Clear.addActionListener(B_Clear);

		l2 = MenuCommandes.createLabel(search, 365*width/1536, 7*actual_height/8, 130, 30);
		l2.setForeground(Color.BLACK);
		l2.setBackground(Background);
		t2 = MenuCommandes.createText(465*width/1536, 7*actual_height/8, 600, 30,12);
		t2.getDocument().addDocumentListener(new DocumentListener() {
			@Override
			public void insertUpdate(DocumentEvent e) {
				search(t2.getText());
			}
			@Override
			public void removeUpdate(DocumentEvent e) {
				search(t2.getText());
			}
			@Override
			public void changedUpdate(DocumentEvent e) {
				search(t2.getText());
			}
			public void search(String str) {
				String[] split = str.split("\\s+");
				ArrayList<RowFilter<Object,Object>> filters = new ArrayList<RowFilter<Object,Object>>(split.length);
				for (int i =0; i<split.length;i++) {
					filters.add(RowFilter.regexFilter("(?i)" + split[i]));
				}
				if(!tPayment.getText().equals("")) {
					filters.add(RowFilter.regexFilter("(?i)" + tPayment.getText(),0));
				}
				if(!tDate.getText().equals("")) {
					filters.add(RowFilter.regexFilter("(?i)" + tDate.getText(),3));
				}
				RowFilter<Object, Object> filter = RowFilter.andFilter(filters);
				sorter.setRowFilter(filter);
			}
		});

		
		tPayment = MenuCommandes.createText(0, 0, 0, 0, 12);
		comboBoxPayment.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				tPayment.setText(comboBoxPayment.getSelectedItem().toString());
			}

		});
		tPayment.getDocument().addDocumentListener(new DocumentListener() {
			@Override
			public void insertUpdate(DocumentEvent e) {
				search(tPayment.getText());
			}
			@Override
			public void removeUpdate(DocumentEvent e) {
				search(tPayment.getText());
			}
			@Override
			public void changedUpdate(DocumentEvent e) {
				search(tPayment.getText());
			}
			public void search(String str) {
				ArrayList<RowFilter<Object,Object>> filters = new ArrayList<RowFilter<Object,Object>>(6);
				if(!tPayment.getText().equals("")) {
					filters.add(RowFilter.regexFilter("(?i)" + str,0));
				}
				if(!tDate.getText().equals("")) {
					filters.add(RowFilter.regexFilter("(?i)" + tDate.getText(),3));
				}
				if(!t2.getText().equals("")) {
					filters.add(RowFilter.regexFilter("(?i)" + t2.getText()));
				}
				RowFilter<Object, Object> filter = RowFilter.andFilter(filters);
				sorter.setRowFilter(filter);
			}
		});

		comboBoxHour.setEnabled(false);
		tDate = MenuCommandes.createText(0, 0, 0, 0, 12);
		comboBoxDate.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				//tDate.setText(comboBoxDate.getSelectedItem().toString());
				if (!comboBoxDate.getSelectedItem().equals("")) {
					comboBoxHour.setEnabled(true);
					if(comboBoxHour.getSelectedItem().equals("")){
						tDate.setText(comboBoxDate.getSelectedItem().toString());
					}else {
						tDate.setText(comboBoxDate.getSelectedItem().toString() 
								+" "+ comboBoxHour.getSelectedItem().toString() + ":");
					}
				} else {
					comboBoxHour.setSelectedIndex(0);
					comboBoxHour.setEnabled(false);
					tDate.setText("");
				}
			}

		});
		comboBoxHour.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				if(!comboBoxDate.getSelectedItem().equals("")) {
					tDate.setText(comboBoxDate.getSelectedItem().toString() 
							+" "+ comboBoxHour.getSelectedItem().toString() + ":");
					if(comboBoxHour.getSelectedItem().equals("")){
						comboBoxHour.setSelectedIndex(0);
						tDate.setText(comboBoxDate.getSelectedItem().toString());
					}
				}
			}
		});

		tDate.getDocument().addDocumentListener(new DocumentListener() {
			@Override
			public void insertUpdate(DocumentEvent e) {
				search(tDate.getText());
			}
			@Override
			public void removeUpdate(DocumentEvent e) {
				search(tDate.getText());
			}
			@Override
			public void changedUpdate(DocumentEvent e) {
				search(tDate.getText());
			}
			public void search(String str) {
				ArrayList<RowFilter<Object,Object>> filters = new ArrayList<RowFilter<Object,Object>>(6);
				if(!tPayment.getText().equals("")) {
					filters.add(RowFilter.regexFilter("(?i)" + tPayment.getText(),0));
				}
				if(!tDate.getText().equals("")) {
					filters.add(RowFilter.regexFilter("(?i)" + str,3));
				}
				if(!t2.getText().equals("")) {
					filters.add(RowFilter.regexFilter("(?i)" + t2.getText()));
				}
				RowFilter<Object, Object> filter = RowFilter.andFilter(filters);
				sorter.setRowFilter(filter);
			}
		});

		//Adding the table to the JFrame
		this.tablepanel.add(this.sp);
		this.window.add(tablepanel);
		window.add(tPayment); tPayment.setVisible(false);
		window.add(tDate); tDate.setVisible(false);
		window.add(comboBoxDate);
		window.add(comboBoxHour);
		window.add(comboBoxPayment);
		window.add(l2);
		window.add(t2);
		window.add(l3);
		window.add(l4);
		window.add(l5);
		window.add(Clear);

		//FOOTER

		//Making a return button
		this.Return = MenuCommandes.createButton("Return to Employee Menu", 0, 0, 100, 40, new Color(220, 53, 69), Color.WHITE);
		this.Refresh = MenuCommandes.createButton("Refresh", width - width*102/1536, (height * 8/864)/2, 95, 20, new Color(15, 125, 102), Color.WHITE);

		
		Return.addActionListener(this.B_Return); //The Return button's action listener
		Refresh.addActionListener(this.B_Refresh);

		//Footer items
		this.footer = MenuCommandes.createPanel(0, height*725/864, width,  height * 75/864, Background);
		this.footer.setLayout(new BorderLayout());
		this.footerLabel = MenuCommandes.createLabel("E24 Restaurant 2020 ", 0, 0, 100, 50);
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
			Font Avenir_Light = Font.createFont(Font.TRUETYPE_FONT, new File("fonts/avenir-light.otf")).deriveFont(20f);
            ge.registerFont(Avenir_Light);
            Font Bebas_Light = Font.createFont(Font.TRUETYPE_FONT, new File("fonts/BebasNeue-Regular.ttf")).deriveFont(60f);
            ge.registerFont(Bebas_Light);
            //setFont(Avenir_Light.deriveFont(17f));
			this.table.setFont(Avenir_Light.deriveFont(17f));
			this.Return.setFont(Uniform_Light);
			this.Refresh.setFont(Uniform_Light);
			this.footerLabel.setFont(Avenir_Light.deriveFont(17f));
			l1.setFont(Uniform_Medium.deriveFont(15f));
			this.logo.setFont(Uniform_Light);
			this.text.setFont(Uniform_Light);

			l2.setFont(Uniform_Medium);
			t2.setFont(Uniform_Light);
			l3.setFont(Uniform_Medium);
			l4.setFont(Uniform_Medium);
			l5.setFont(Uniform_Medium);
			Clear.setFont(Uniform_Medium);
		} catch (IOException|FontFormatException e) {
			e.printStackTrace();
		}

		comboBoxPayment.repaint();
		comboBoxHour.repaint();
		comboBoxDate.repaint();
		this.Refresh.repaint();
		this.window.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE );

	}
	/**
	 * Imports all the columns of the orders database aside from OrderNm OR only the Order IDs, depending on the value of OnlyOrderID
	 * This is how the database looks like :
	 * {"Status":"","Order":"","Payment":"","TableNm":"","Price":"","Customer":"","OrderNm":"","Edits":""}
	 * @param OnlyOrderID if true, only the order IDs are imported instead of all the columns.
	 * @return String[][] The 2D Array Database
	 */
	public String[][] importOrders() {
		int orderCount = getOrderCount();
		String[][]current_orders = new String[orderCount][4];
		JSONParser parser = new JSONParser();
		int i = 0;
		try {
			//Importing the database
			JSONArray orderList = (JSONArray) parser.parse(new FileReader("data/orders.json"));
			for (Object order : orderList) {
				try{
					JSONObject current_order = (JSONObject) order;
					String Customer  = (String) current_order.get("UserID");
					if (Customer.equals(customer.getId())){
						String Payment   = (String) current_order.get("Payment");
						String FullOrder = (String) current_order.get("Order");
						String Price     = (String) current_order.get("Price");
						String Date      = (String) current_order.get("Created");
						String [] this_order = {Payment,FullOrder, Price, Date};
						current_orders[i] = this_order;
						i++;  
					}
				}catch (NullPointerException e) {
					continue;
				}            
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return current_orders;
	}
	/**
	 * returns the number of orders yet to be completed
	 * @return OrderCount The number of orders not yet completed
	 */
	public int getOrderCount() {
		JSONParser parser = new JSONParser();
		int i = 0;
		try {
			//Importing the database
			JSONArray orderList = (JSONArray) parser.parse(new FileReader("data/orders.json"));
			for (Object order : orderList) {
				JSONObject current_order = (JSONObject) order;

				try {
					String Customer  = (String) current_order.get("UserID");
					//if the order hasn't already been completed, and if we want all the columns, then
					if(Customer.equals(customer.getId())) {
						i++;
					}} catch(NullPointerException e) {
						continue;
					}
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return i;
	}


	private class Refresh implements ActionListener {
		public void actionPerformed(ActionEvent e) {
			new PurchaseHistory(menuSwing);
			window.dispose();
			Refresh.repaint();

		}
	}

	private class actionClear implements ActionListener{

		@Override
		public void actionPerformed(ActionEvent e) {
			t2.setText("");
			tPayment.setText("");
			tDate.setText("");
			comboBoxPayment.setSelectedIndex(0);
			comboBoxDate.setSelectedIndex(0);
			comboBoxHour.setSelectedIndex(0);
		}
	}

	private class Return implements ActionListener {
		public void actionPerformed(ActionEvent e) {
			window.dispose();
            JFrame previous = menuSwing.getFenetre();
            previous.setVisible(true);
		}
	}
}
