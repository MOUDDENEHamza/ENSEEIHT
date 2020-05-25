package employee;
import java.util.ArrayList;

/**
 * @author Mehdi WISSAD . 
 *
 */

// This is an interface that will help us implement the strategy pattern that will determine the amount of ingredients needed for a certain dish
public interface DishSize {
	// This is the method that takes an ArrayList<DishIngredients> and modifies it accordingly
	public ArrayList<DishIngredient> getIngredients(ArrayList<DishIngredient> listOfIngredients);
}
