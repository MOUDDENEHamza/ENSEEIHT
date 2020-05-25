package employee;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.regex.Pattern;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

/**
 * The financial statement of the restaurant
 * 
 * @author LOTFI
 *
 */

public class FinancialState {

	// the initial balance
	private static double rstBalance;

	public FinancialState(double balance) {
		FinancialState.rstBalance = balance;
	}

	/**
	 * Give the balance of the restaurant
	 * 
	 * @return this balance.
	 */
	public double getRestauBalance() {
		return FinancialState.rstBalance;
	}

	/**
	 * change the balance of the restaurant
	 * 
	 * @param this balance.
	 */

	public void setRestauBalance(double newBalance) {
		FinancialState.rstBalance = newBalance;
	}

	/**
	 * add a earning to the restau' balance
	 * 
	 * @param gain
	 */

	public void addGain(double gain, String dateStr) {
		if (gain != 0.0) {
			rstBalance = rstBalance + gain;

			String dateRegExpression = "^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\\d\\d$";
			Pattern pat = Pattern.compile(dateRegExpression);

			if (!pat.matcher(dateStr).matches()) {
				Date date = new Date();
				SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
				dateStr = formatter.format(date);
			}
			History.record(gain, rstBalance, dateStr);
		}
	}

	/**
	 * Substract a earning to the restau' balance
	 * 
	 * @param loss
	 */

	public void SubstractLoss(double loss, String dateStr) {
		FinancialState.rstBalance = FinancialState.rstBalance - loss;

		String dateRegExpression = "^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\\d\\d$";
		Pattern pat = Pattern.compile(dateRegExpression);

		if (!pat.matcher(dateStr).matches()) {
			Date date = new Date();
			SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
			dateStr = formatter.format(date);
		}
		History.record(loss, FinancialState.rstBalance, dateStr);
	}

	public double sumDayGains(String dateStr) {
		JSONParser parser = new JSONParser();

		String dateRegExpression = "^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\\d\\d$";
		Pattern pat = Pattern.compile(dateRegExpression);
		double gains = 0.0;
		if (pat.matcher(dateStr).matches()) {

			try {
				// Importing the database
				JSONArray orderList = (JSONArray) parser.parse(new FileReader("data/orders.json"));

				for (Object order : orderList) {
					JSONObject current_order = (JSONObject) order;
					String OrderDate = ((String) current_order.get("Created")).substring(0, 10);
					if (OrderDate.equals(dateStr)) {
						String price = (String) current_order.get("Price");
						int euroIndex = price.indexOf("\u20AC") - 1;
						price = price.substring(0, euroIndex);
						gains += Double.parseDouble(price);
					}
				}

			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		return gains;

	}

	public void updateGains() {
		String[][] operations = HistorySwing.importOperations();
		int nbOperations = HistorySwing.getNbValues();

		String lastOperationDateString = operations[nbOperations - 1][1];
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");

		try {
			Date Date = new Date();

			Calendar cal = Calendar.getInstance();
			cal.setTime(formatter.parse(lastOperationDateString));

			Date dynamicDate = cal.getTime();

			while (dynamicDate.before(Date)) {
				cal.add(Calendar.DATE, +1);
				String dynamicDateStr = formatter.format(cal.getTime());
				addGain(sumDayGains(dynamicDateStr), dynamicDateStr);
				// SubstractLoss(substractDayLosses(dynamicDateStr), dynamicDateStr);
				dynamicDate = cal.getTime();
			}
		} catch (java.text.ParseException e) {
			e.printStackTrace();
		}

	}
}