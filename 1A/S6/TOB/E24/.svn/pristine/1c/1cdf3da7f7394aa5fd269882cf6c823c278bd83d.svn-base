package employee;


import java.util.ArrayList;

public class Observer {
	private ArrayList<Dish1> dishesOrdered = new ArrayList<Dish1>();
	
	public void updateList(Dish1 dish){
		dishesOrdered.add(dish);
	}
	
	public void resetList(){
		dishesOrdered =  new ArrayList<Dish1>();
	}
	
	public Dish1 removeLastAdded() {
	  int size = dishesOrdered.size();
	  return dishesOrdered.remove(size - 1);
	}
	
	public ArrayList<Dish1> getDishesOrdered(){
		return dishesOrdered;
	}
	
}
