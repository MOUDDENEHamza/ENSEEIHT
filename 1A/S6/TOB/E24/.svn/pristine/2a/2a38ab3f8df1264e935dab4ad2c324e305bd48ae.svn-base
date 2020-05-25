package employee;
import java.util.*;

/**
 * @author Mehdi WISSAD
 *
 */
public class InventoryManager {
  private HashMap<String, Ingredient> database;//points to all ingredients being managed by system
  
  
  /**
   * Class Constructor. Takes in a list of ingredients that the system will managed such as
   * tomato, onion etc.
   * 
   * @param list contains base ingredients of system
   */
  public InventoryManager(ArrayList<Ingredient> list) {
    int size = list.size();
    Ingredient ingredient;
    Iterator<Ingredient> iterator = list.iterator();
    
    database = new HashMap<String, Ingredient>((int)(size*1.33));//gives some extra space in hash
    
    
    while(iterator.hasNext()) {
      ingredient = iterator.next();
      database.put(ingredient.getName(), ingredient);
    }
  }
  
  
  /**
   * Retrieves and removes ingredients in the system needed to make a dish. Does not
   * remove any ingredients if there are not enough ingredients to make a dish.
   * 
   * @param dish user desired dish
   * @return true if dish could be made. Returns false if could not make dish
   */
  public boolean getIngredientsForDish(Dish1 dish) {
    boolean madeDish = false;
    DishIngredient dishIngredient;
    int totalNeeded = 0;
    Ingredient ingredientEntry;
    //Ingredient dishIngredient;
    
    //get Ingredients of dish
    Iterator<DishIngredient> dishIngredients = dish.getIngredients().iterator();
    
    //parse through list and check that all ingredients are available
    while(dishIngredients.hasNext()) {
      dishIngredient = dishIngredients.next();
      totalNeeded = dishIngredient.getQuantity();
      
      ingredientEntry = database.get(dishIngredient.getIngredient().getName());
      if(!ingredientEntry.isIngredientAvail(totalNeeded)) {
        return madeDish;
      }
    }
    
    //If all available, remove ingredients
    dishIngredients = dish.getIngredients().iterator(); // reset iterator
    while(dishIngredients.hasNext()) {
      dishIngredient = dishIngredients.next();
      totalNeeded = dishIngredient.getQuantity();
      
      ingredientEntry = database.get(dishIngredient.getIngredient().getName());
      ingredientEntry.getIngredient(totalNeeded);
    }
    madeDish = true;
    
    return madeDish;
  }
  
  
  /**
   * Removes all spoiled ingredient quantities from system that have expired
   * based off the quantity expiration date
   *  
   * @param date todays date
   * @return the number of quantities removed by the system
   */
  public int removedSpoiledIngredients(Date date) {
    Iterator<Map.Entry<String, Ingredient>> entries = database.entrySet().iterator();
    Map.Entry<String, Ingredient> entry;
    Ingredient ingredient;
    int totalRemoved = 0;
    
    while(entries.hasNext()) {
      entry = entries.next();
      ingredient = entry.getValue();
      totalRemoved += ingredient.removedSpoiledQuantity(date);
    }
    
    return totalRemoved;
  }
  
  
  /**
   * Add ingredient quantities in Ingredient instances
   * in List Parameter to system to manage
   * 
   * @param items Ingredient instances list containing Quantity instances
   * @return number of quantities added to system to manage
   */
  public int addItems(ArrayList<Ingredient> items) {
    Iterator<Ingredient> ingredientItr = items.iterator();
    Ingredient ingredient;
    Iterator<Quantity> quantityItr;
    Ingredient databaseIngredient;
    int quantityAdded = 0;
    
    while(ingredientItr.hasNext()) {
      ingredient = ingredientItr.next();
      databaseIngredient = database.get(ingredient.getName());
      quantityItr = ingredient.createIterator();
      while(quantityItr.hasNext()) {
        databaseIngredient.addQuantity(quantityItr.next());
        ++quantityAdded;
      }
    }
    
    return quantityAdded;
  }
  
  
  /**
   * Forecasts systems ingredients Quantity needs based off orderHistory. If system does not have enough
   * of a certain Ingredient to make all the dishes in orderHistory, this method will add the amount needed
   * to the return list.
   *  
   * @param orderHistory list of dishes to forecast from
   * @return ArrayList of Ingredients. Ingredient Quantities represent want needs to be added
   */
  public ArrayList<Ingredient> forecast(ArrayList<Dish1> orderHistory) {
    ArrayList<Ingredient> consolidatedIngHist = createConsolidatedIngredientList(orderHistory);
    Iterator<Ingredient> itr = consolidatedIngHist.iterator();
    Ingredient ingredient;
    Ingredient databaseIng;
    
    //Remove Ingredients from ConsolidatedIngHist if database has enough
    while(itr.hasNext()) {
      ingredient = itr.next();
      databaseIng = database.get(ingredient.getName());
      int availableIng = databaseIng.getTotalQuantityOfIngredient();
      int lastTimeUsage = ingredient.getFirstQuantity().getCount();
      int predictedDeficit = availableIng - lastTimeUsage;
      
      if(predictedDeficit >= 0) {
        itr.remove();
      }
      else {
        ingredient.getFirstQuantity().setCount(-predictedDeficit);
      }
    }
    return consolidatedIngHist;
  }
   
  
  /**
   * Creates a count of Ingredients needed for all of the dishes
   * in orderHisttory parameter. Returns this consolidated count
   *  
   * @param orderHistory dishes to count ingredients from
   * @return consolidated count of ingredients in an ArrayList
   */
  private ArrayList<Ingredient> createConsolidatedIngredientList(ArrayList<Dish1> orderHistory) {
    ArrayList<Ingredient> consolidatedHistory = new ArrayList<Ingredient>();
    Iterator<Dish1> orderHistoryItr = orderHistory.iterator();
    Iterator<Map.Entry<String, Ingredient>> entries = database.entrySet().iterator();
    HashMap<String, Ingredient>  ingredientCount = new HashMap<String, Ingredient>(database.size()); //used for fast lookup in consolidatedHistory
    Ingredient ingredient;
    Quantity q;
    Map.Entry<String, Ingredient> entry;
    Dish1 dish;
    Iterator<DishIngredient> dishIngItr;
    DishIngredient dishIng;
    
    //Init consolidateHistory and ingredientCount
    while(entries.hasNext()) {
      entry = entries.next();
      ingredient = new Ingredient(entry.getKey());
      q = new Quantity();
      q.setCount(0);
      ingredient.addQuantity(q);
      consolidatedHistory.add(ingredient);
      ingredientCount.put(entry.getKey(), ingredient);
    }
    

    //Get Ingredient Counts
    while(orderHistoryItr.hasNext()) {
      dish = orderHistoryItr.next();
      dishIngItr = dish.getIngredients().iterator();
      while(dishIngItr.hasNext()) {
        dishIng = dishIngItr.next();
        ingredient = ingredientCount.get(dishIng.getIngredient().getName());
        q = ingredient.getFirstQuantity();
        q.setCount(q.getCount() + dishIng.getQuantity());
      }
    }
    
    return consolidatedHistory;
  }
  
  
  /**
   * Returns current counts of available ingredients store in system
   *  
   * @return list of ingredient counts
   */
  public ArrayList<DishIngredient> getCurrentInventory() {
    ArrayList<DishIngredient> list = new ArrayList<DishIngredient>();
    Iterator<Map.Entry<String, Ingredient>> entries = database.entrySet().iterator();
    Ingredient dataIngredient;
    Ingredient copy;
    DishIngredient inventoryListEntry;
    
    while(entries.hasNext()) {
      dataIngredient = entries.next().getValue();
      inventoryListEntry = new DishIngredient();
      
      copy = new Ingredient(dataIngredient.getName());
      inventoryListEntry.setIngredient(copy);
      inventoryListEntry.setQuantity(dataIngredient.getTotalQuantityOfIngredient());
      
      list.add(inventoryListEntry);
    }
    
    return list;
  }
}
