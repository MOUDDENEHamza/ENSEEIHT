import java.util.*;
/*Quantity is a class used to manage the restaurant stock  
 *  @author Wissad
 * @version 0.1
 */
public class Quantity {
	private int count = 0 ; 
	private Date date ; 
	
	/**
	   * get the count 
	   * @return count
	   */
    public int getCount() {
    	return count ;
    }
    /**
     * set the count 
     * @param count 
     */
    public void setCount(int count) {
    	this.count = count ;
    }

	/**
	   * get the date 
	   * @return date
	   */
    public Date getDate() {
    	return date ;
    }
    /**
     * set the date 
     * @param date
     */
    public void setDate(Date date) {
    	this.date = date ;
    }
}
