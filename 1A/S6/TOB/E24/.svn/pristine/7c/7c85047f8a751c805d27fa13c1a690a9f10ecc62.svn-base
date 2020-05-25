package employee;
import java.util.*;

/**
 * @author Mehdi WISSAD 
 */
public class Ingredient{
  private String name;
  private ArrayList<Quantity> list = new ArrayList<Quantity>();
  
  
  /**
   * Class Constructor. Requires name of Ingredient 
   * @param ingredientName name of ingredient 
   */
  public Ingredient(String ingredientName) {
    this.name = ingredientName;
  }
  
  
  /**
   * Get name of instance of Ingredient 
   * @return name of Ingredient
   */
  public String getName() {
    return this.name;
  }
  
  /**
   * Overrides Object toString() method so name of Ingredient is
   * returned instead
   * 
   */
  public String toString() {
    return getName();
  }
  
  
  /**
   * Indicates if there is enough quantity to meet
   * the count parameter 
   * 
   * @param count requested amount of an ingredient
   * @return true if there is enough. Otherwise, false.
   */
  public boolean isIngredientAvail(int count) {
    boolean isAvailable = false;
    
    if(this.getTotalQuantityOfIngredient() >= count) {
      isAvailable = true;
    }
    
    return isAvailable;
  }
  
  
  /**
   * Get and remove quantities of an ingredient in system
   * 
   * @param count requested amount of an ingredient
   * @return number of ingredients retrieve.
   */
  public int getIngredient(int count) {
    int totalRetrieved = 0;
    Quantity q;
    int quantityCount = 0;
   
    while(totalRetrieved < count && this.list.size() > 0) {
      q = this.list.get(0); //oldest quantity
      quantityCount = q.getCount();
      
      if(quantityCount >= count) {
        q.setCount(quantityCount - count);
        totalRetrieved += (count);
      }
      else {
        q.setCount(0);
        totalRetrieved += quantityCount;
      }
      
      //remove quantity if it not longer has any count
      if(q.getCount() <= 0) {
        this.list.remove(0);
      }
    }
      
    return totalRetrieved;
  }
  
  
  /**
   * Counts total amount of an ingredient in the system
   * @return total count
   */
  public int getTotalQuantityOfIngredient() {
    Iterator<Quantity> iterator = this.list.iterator();
    int count = 0;
    
    while(iterator.hasNext()) {
      count += iterator.next().getCount();
    }
    
    return count;
  }
  
  
  /**
   * Adds a Quantity of an Ingredient to the system
   * @param q Quantity Instance to be added
   */
  public void addQuantity(Quantity q) {
    int size = list.size();
    boolean beenAdded = false;
    Date date = q.getDate();
    
    for(int i = 0; i < size && !beenAdded; i++) {
      if(list.get(i).getDate().compareTo(date) >= 0) {
        list.add(i, q);
        beenAdded = true;
      }
    }
    
    if(!beenAdded) {
      list.add(q);
    }
  }
  
  
  /**
   * Removes spoiled quantities associated with instance of Ingredient
   *  
   * @param date checking date to determine if a quantity has expired
   * @return number of removed quantities 
   */
  public int removedSpoiledQuantity(Date date) {
    int numberOfRemoved = 0;
    while(true) {
      if(this.list.size() > 0 && this.list.get(0).getDate().compareTo(date) < 0) {
        this.list.remove(0);
        ++numberOfRemoved;
      }
      else {
        break;
      }
    }
    
    return numberOfRemoved;
  }
  
  /**
   * Creates an Quantity Iterator for list of Quantity stored in instance of Ingredient
   * @return Quantity Iterator
   */
  public Iterator<Quantity> createIterator() {
    return this.list.iterator();
  }
  
  
  /**
   * Retrieve first Quantity instance stored in this instance of Ingredient
   * @return Quantity instance if one exists. Otherwise, returns null.
   */
  public Quantity getFirstQuantity() {
    if(list.size() > 0) {
      return list.get(0);
    }
    else {
      return null;
    }
  }
}

