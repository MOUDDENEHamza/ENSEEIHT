package employee;

/**
*@author Mehdi Wissad .
*/
import java.util.ArrayList;

public class Dish1 {
	private String name;
	private ArrayList<DishIngredient> ingredients = new ArrayList<DishIngredient>();
	
	//constructor for Dish... takes in all DishIngredients and the name
	public Dish1(ArrayList<DishIngredient> dishIngred, String names){
		name = names;
		ingredients = dishIngred;
	}

	//empty constructor
	public Dish1(){}
	
	//returns the name of the Dish
	public String getName(){
		return name;
	}
	
	//returns the ingredients the dish requires
	public ArrayList<DishIngredient> getIngredients(){
		return ingredients;
	}
	
	//sets the DishIngredient
	public void setDishIngredients(ArrayList<DishIngredient> dishIngred){
		ingredients = dishIngred;
	}
	
	//sets the name of the Dish
	public void setName(String names){
		name = names;
	}
	
}

