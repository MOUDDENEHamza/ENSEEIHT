package employee;
import java.util.*;

/**
 * @author Mehdi WISSAD 
 */
public class Quantity {
  private int count = 0;
  private Date date;
  
  
  /**
   * Returns instance count
   * @return count
   */
  public int getCount() {
    return count;
  }
  
  
  /**
   * Sets instance count 
   * @param count
   */
  public void setCount(int count) {
    this.count = count;
  }
  
  
  /**
   * Sets instance date
   * @param date
   */
  public void setDate(Date date) {
    this.date = date;
  }
 
  
  /**
   * Returns instance date  
   * @return date
   */
  public Date getDate() {
    return date;
  }
}
