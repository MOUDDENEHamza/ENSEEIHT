package employee;

import java.text.DateFormat;
import java.util.Date;
//import java.util.Locale;

//@author Chaimaa

public class Date1 {

  /**
   * @param args
 * @return 
   */
	 public String getDate() {
	    Date aujourdhui = new Date();
	
	    DateFormat shortDateFormat = DateFormat.getDateTimeInstance(
	        DateFormat.SHORT,
	        DateFormat.SHORT);
		
	       String str =  shortDateFormat.format(aujourdhui);
		   return str;
		}
	 
}
