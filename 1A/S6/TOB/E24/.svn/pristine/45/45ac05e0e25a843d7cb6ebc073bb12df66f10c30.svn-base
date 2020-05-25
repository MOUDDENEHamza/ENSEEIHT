package employee;
import java.util.ArrayList;
import java.util.Iterator;

/**
*@author Mehdi WISSAD
*/
public class OrderingSystem {
	private ArrayList<Observer> listOfObserver = new ArrayList<Observer>();
	private ArrayList<Dish1> dishes = new ArrayList<Dish1>();
	private DishSize dishSize;
	
	
	//orders the dishes... has to interact with Ingredient class
	public Dish1 orderDish(String dishName){
		boolean dishExists = false;
		Dish1 dish = new Dish1();
		
		//first: get all available dishes
		ArrayList<Dish1> dishes = availableDishes();
		for(Dish1 d : dishes){
			//System.out.println(dishName + d.getName());
			//check if the name exists on our Dish list
			if((d.getName()).compareTo(dishName) == 0){
				dishExists = true;
				//dish = d;
				dish.setDishIngredients(d.getIngredients());// = d;
				dish.setName(d.getName());
				break;
			}
		}
		//check if it broke out of the loop from prior, if it did, Dish was found and can continue
		if(dishExists == false){
			System.out.println("Here!");
			return null;
		}

		//second: get dish sizes
		ArrayList<DishIngredient> ingredients = dishSize.getIngredients(dish.getIngredients());
		dish.setDishIngredients(ingredients);

		//tell observers
		notifyObservers(dish);
		
		return dish;
	}
	
	public Dish1 captureDish(String dishName){
		//boolean dishExists = false;
		//Dish dish = new Dish();
		
		//first: get all available dishes
		ArrayList<Dish1> dishes = availableDishes();
		for(Dish1 d : dishes){
			//System.out.println(dishName + d.getName());
			//check if the name exists on our Dish list
			if((d.getName()).compareTo(dishName) == 0){
				//dishExists = true;
				//dish = d;
				//break;
				return d;
			}
		}
		return null;
	}
	
	public void replaceDish(Dish1 dish){
		for(Dish1 d : dishes){
			if((d.getName()).compareTo(dish.getName()) == 0){
				d = dish;
				//return true;
			}
		}
		//return false;
	}
	
	//adds an observer
	public void addObserver(Observer o){
		listOfObserver.add(o);
	}
	
	//returns the list of Dishes
	public ArrayList<Dish1> availableDishes(){
		return dishes;
	}
	
	//set the list of Dishes at beginning
	public void setDishes(ArrayList<Dish1> dishList){
		dishes = dishList;
	}
	
	//sets the DishSize according to class chosen
	public void setDishSize(DishSize size){
		dishSize = size;
	}
	
	public void notifyObservers(Dish1 dish) {
	  Iterator<Observer> itr = listOfObserver.iterator();
	  Observer obs;
	  
	  while(itr.hasNext()) {
	    obs = itr.next();
	    obs.updateList(dish);
	  }
	}
}
