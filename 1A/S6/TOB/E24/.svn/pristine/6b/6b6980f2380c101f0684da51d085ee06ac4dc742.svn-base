package employee;
/**
 * Restaurant Inventory Management . 
 */

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Scanner;

/**
 * @authors Mehdi WISSAD
 *
 */
public class Client {
	static ArrayList<Ingredient> ingreds = new ArrayList<Ingredient>();
	static ArrayList<Dish1> dishes = new ArrayList<Dish1>();
	static Api connection = new Api();
	static HashMap<String, String> dishSizes = new HashMap<String, String>();
	static GregorianCalendar cal =  new GregorianCalendar();
	static ArrayList<DishIngredient> currentInventory = new ArrayList<DishIngredient>();

	/**
	 * This function will print out the menu for the user to select from.
	 * There are no arguments for this function.
	 */
	private static void printMenu() {
		printHeader("Menu");
		cal.setTime(connection.getDate());
		System.out.println("Current Date: " + cal.get(GregorianCalendar.YEAR) + "/" + ((cal.get(GregorianCalendar.MONTH))+1) + "/" + cal.get(GregorianCalendar.DAY_OF_MONTH));
		System.out.println("1. Order Dish");
		System.out.println("2. Add Items to Inventory");
		System.out.println("3. Current Inventory");
		System.out.println("4. End Day");
		System.out.println("5. Forecast Shopping List (based on previous day's ordered dishes)");
		System.out.println("6. Load data from file (This will reset the system completely!!!)");
		System.out.println("q. Quit");
	}
	/**
	 * This function wll print out a header for a given text string.
	 * @param text - A string to place within the header flag.
	 */
	public static void printHeader(String text) {
		int count = text.length();
		String dash = "-";
		for (int i = 0; i < count-1; i++) {
			dash = dash.concat("-");
		}
		System.out.println("+" + dash + "+");
		System.out.println("+" + text + "+");
		System.out.println("+" + dash + "+");
	}
	
	/**
	 * This will determine if a ingredient is in the larger list of ingredients, identified by name.
	 * @param haystack - The list of all ingredients
	 * @param needle - The string you are looking for, identifying the ingredient
	 * @return - true if the ingredient is found, false if not.
	 */
	public static boolean ingredientExists(ArrayList<Ingredient> haystack, String needle) {
		for (Ingredient item : haystack) {
			if (item.getName().equalsIgnoreCase(needle)) {
				return true;
			}
		}
		return false;
	}
	
	/**
	 * This will return the Ingredient object that is in the larger list of ingredients, identified by name.
	 * @param haystack - The list of all ingredients.
	 * @param needle - The string you are looking for, identifying the ingredient.
	 * @return - Returns the Ingredient instance that was found in the haystack.
	 */
	public static Ingredient getIngredient(ArrayList<Ingredient> haystack, String needle) {
		for (Ingredient item : haystack) {
			if (item.getName().equalsIgnoreCase(needle)) {
				return item;
			}
		}
		return null;
	}
	
	/**
	 * Determines if a string is a number
	 * @param str - A string to be determined to be a number or not.
	 * @return - True if the string is parsable into a number. False if not a string parsable into a number.
	 */
	public static boolean isNumeric(String str)
	{
	  return str.matches("-?\\d+(\\.\\d+)?");  //match a number with optional '-' and decimal.
	}
	
	/**
	 * Loads a dishes file to be added into the running database.
	 * @param file - the filename / filepath from the current working directory. (one directory above the src folder)
	 */
	private static void loadDishesFile(String file) {
		// This is Java 8... 5 lines to read the file...
//		try {
//			Files.lines(Paths.get(input), StandardCharsets.UTF_8).forEach(System.out::println);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
		BufferedReader br = null;
		String line = null;
		try {
			 
			br = new BufferedReader(new FileReader(file));
			while ((line = br.readLine()) != null) {
				if (line.startsWith("#")) {
					continue; // Comment detection
				}
				String[] elements = line.split(",");
				ArrayList<DishIngredient> dishRecipe = new ArrayList<DishIngredient>();
				
				/**
				 * For each line:
				 * - Add an Ingredient if not exists in array
				 * - Make a dishIngredient and append to list
				 * - Create a Dish
				 * - Add dish to dishArray
				 */
				for (int i = 1; i < elements.length; i++) {
					String[] elemquant = elements[i].split(":");
					Ingredient currentIngredient = new Ingredient(elemquant[0]);
					if(!ingredientExists(ingreds, elemquant[0])) {
						ingreds.add(currentIngredient);
						//System.out.println("Added " + currentIngredient.getName());
					}else {
						//System.out.println("Skipping ingredient.");
					}
					DishIngredient currentDishIngredient = new DishIngredient(getIngredient(ingreds, elemquant[0]), Integer.parseInt(elemquant[1]));
					dishRecipe.add(currentDishIngredient);
				}
				Dish1 currentDish = new Dish1(dishRecipe, elements[0]);
				dishes.add(currentDish);
			}
			connection.loadIngredients(ingreds);
			connection.loadDishes(dishes);
			System.out.println("Loaded Dishes: " + dishes.size() + " dishes loaded...");
			System.out.println("Loaded Ingredients: " + ingreds.size() + " recipe ingredients loaded...");
		} catch (FileNotFoundException e) {
			System.out.println("File Not Found.  Skipped dishes loading.");
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (br != null) {
				try {
					br.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	/**
	 * Loads a inventory file to be added into the running database.
	 * @param file - the filename / filepath from the current working directory. (one directory above the src folder)
	 */
	private static void loadInventoryFile(String file) {
		BufferedReader br2 = null;
		String line2 = null;
		ArrayList<Ingredient> toBeAdded2 = new ArrayList<Ingredient>();
		try {
			 
			br2 = new BufferedReader(new FileReader(file));
			while ((line2 = br2.readLine()) != null) {
				if (line2.startsWith("#")) {
					continue; // Comment detection
				}
				String[] elements = line2.split(",");
				String ingredientName = elements[0];
				int curQuantity = Integer.parseInt(elements[1]);
				String[] parseDate = elements[2].split("/");
				GregorianCalendar date2 = new GregorianCalendar(Integer.parseInt(parseDate[0]),Integer.parseInt(parseDate[1])-1,Integer.parseInt(parseDate[2]));
				if (ingredientExists(ingreds,ingredientName)) {
					Ingredient ingredientToAdd2 = new Ingredient(ingredientName);
					Quantity newQuantity2 = new Quantity();
					newQuantity2.setCount(curQuantity);
					newQuantity2.setDate(date2.getTime());
					ingredientToAdd2.addQuantity(newQuantity2);
					toBeAdded2.add(ingredientToAdd2);
					//System.out.println("Added: " + newQuantity2.getCount() + " " + ingredientName + "(s) set to expire on " + newQuantity2.getDate().toString());
				}
			}
			System.out.println("Loading Inventory: Committed " + toBeAdded2.size() + " distinct items");
			connection.addItemsToInventory(toBeAdded2);
		} catch (FileNotFoundException e) {
			System.out.println("File Not Found.  Skipped inventory loading.");
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (br2 != null) {
				try {
					br2.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	/**
	 * Calls the API and determines what we need to buy.
	 * @param api - the connection/instance of the api.
	 */
	public static void forecastApi(Api api, boolean autoIncludeInventory) {
		ArrayList<Ingredient> list = null;
		try {
			list = api.getShoppingList(autoIncludeInventory);
		} catch (NullPointerException e) {
			System.out.println("There is nothing on the shopping list.");
		}
	    if (list != null) {
		    //api.addItemsToInventory(list);
		    Iterator<Ingredient> itr = list.iterator();
		    Ingredient ingredient;
		    
		    System.out.println("******** Shopping List **********");
		    while(itr.hasNext()) {
		      ingredient = itr.next();
		      System.out.println("Ingredient: " + ingredient.getName() + " Quantity: " + ingredient.getTotalQuantityOfIngredient());
		    }
		    System.out.println("\n");
	    }
	  }
	/**
	 * This function is the main driver and client for the our project.  This
	 * main function will handle all the interface logic with the user.
	 * @param args - This parameter is not used.
	 */
	public static void main(String[] args) {
		String version = "1.10";
		loadDishesFile("data.csv");
		loadInventoryFile("inventory.csv");
		System.out.println("+------------------------------------------------------------------------------+");
		System.out.format("+                    Restaurant Inventory Management                     v%s +\n", version);
		System.out.println("+                   *******************************             +");
		System.out.println("+                                                                                   +");
		System.out.println("+------------------------------------------------------------------------------+");
		dishSizes.put("F", "Full order");
		dishSizes.put("S", "Super size order");
		dishSizes.put("H", "Half order");
		printMenu();
		System.out.println("\nSelect a menu option: ");
		int count = 0;
		Scanner s = new Scanner(System.in);
		String input = s.nextLine();
		s.close();
		
		while (!("q".equalsIgnoreCase(input))) {
			while (!isNumeric(input)) {
				input = s.nextLine(); // Grab any stay lines.
			}
			switch(Integer.parseInt(input)) {
			case 1:
				printHeader("Order Dish");
				System.out.println("Please select the dish you would like to order:");
				count = 0;
				for(Dish1 item : dishes) {
					System.out.println(count +") "+ item.getName());
					count++;
				}
				input = null;
				input = s.nextLine();
				while ((input.length() >= 1) && (Integer.parseInt(input) > dishes.size())) {
					System.out.println("Invalid option. Try again:");
					input = s.nextLine();
				}
				int getDish = Integer.parseInt(input);
				System.out.println("Please select a dish size:");
				System.out.println("S) Super Size Order");
				System.out.println("F) Full Size Order (Normal)");
				System.out.println("H) Half Size Order");
				input = null;
				input = s.nextLine();
				while (input.length() <= 0) {
					input = s.nextLine();
				}
				String dSize = input;
				boolean result = connection.orderDish(dishes.get(getDish).getName(), dSize.substring(0, 1).toUpperCase());
				if (result) {
					System.out.println(dishSizes.get(dSize.substring(0, 1).toUpperCase()) + " of " + dishes.get(getDish).getName() + " ordered successfully.");
				}else {
					System.out.println(dishSizes.get(dSize.substring(0, 1).toUpperCase()) + " of " + dishes.get(getDish).getName() + " order failed. System does not have enough ingredients to fulfill the order.");
					System.out.println("A "+ dishSizes.get(dSize.substring(0, 1).toUpperCase()) +" of '" + dishes.get(getDish).getName() + "' requires the following ingredients: ");
					Dish1 curDish = dishes.get(getDish);
					for(DishIngredient item : curDish.getIngredients()) {
						if (dSize.substring(0, 1).toUpperCase().equalsIgnoreCase("F")) {
							System.out.format("Item: %s, Quantity: %d\n", item.getIngredient().getName(), item.getQuantity());
						} else if (dSize.substring(0, 1).toUpperCase().equalsIgnoreCase("S")) {
							System.out.format("Item: %s, Quantity: %d\n", item.getIngredient().getName(), (item.getQuantity()*2));
						} else {
							System.out.format("Item: %s, Quantity: %d\n", item.getIngredient().getName(), ((int)Math.ceil(((double)item.getQuantity())/2)));
						}
					}
				}
				break;
			case 2:
				printHeader("Add Items to Inventory Quantity");
				count = 0;
				for(Ingredient item : ingreds) {
					System.out.println(count + ") " + item.getName());
					count++;
				}
				System.out.println("Please select the ingredient you would like to add quantity to:");
				int ingredientToAdd = s.nextInt();
				while(ingredientToAdd >= ingreds.size() || ingredientToAdd < 0) {
					System.out.println("Invalid option, try again:");
					ingredientToAdd = s.nextInt();
				}
				System.out.println("How many would you like to add?:");
				int quantityToAdd = s.nextInt();
				while(quantityToAdd < 0) {
					System.out.println("Invalid quantity, try again:");
					quantityToAdd = s.nextInt();
				}
				input =  s.nextLine(); // Eat up new line.
				System.out.println("When is the throw away date?: yyyy/mm/dd");
				input =  s.nextLine();
				String[] ymd = input.split("/");
				ArrayList<Ingredient> toBeAdded = new ArrayList<Ingredient>();
				Ingredient ingredientStaged = new Ingredient(ingreds.get(ingredientToAdd).getName());
				Quantity newQuantity = new Quantity();
				newQuantity.setCount(quantityToAdd);
				GregorianCalendar itemDate = new GregorianCalendar(Integer.parseInt(ymd[0]),Integer.parseInt(ymd[1]) - 1,Integer.parseInt(ymd[2]));
				newQuantity.setDate(itemDate.getTime());
				ingredientStaged.addQuantity(newQuantity);
				toBeAdded.add(ingredientStaged);
				connection.addItemsToInventory(toBeAdded);
				System.out.println(newQuantity.getCount() + " " + ingreds.get(ingredientToAdd).getName() + " have been added to the inventory!");
				break;
			case 3:
				printHeader("Current Inventory Listing");
				currentInventory = connection.getCurrentInventory();
				System.out.format("%15s | %8s\n---------------------------\n", "Ingredient", "Quantity");
				for(DishIngredient item : currentInventory) {
					System.out.format("%15s | %7d\n", item.getIngredient().getName(), item.getQuantity());
				}
				break;
			case 4:
				printHeader("End Day");
				connection.updateDate();
				System.out.println("Moved on to the next day!");
				break;
			case 5:
				printHeader("Forecast Shopping List");
				System.out.println("Would you like to auto-add the shopping list to the inventory?: (Y/N)");
				System.out.println("Note the auto-added ingredients have a 7-day expiration.");
				input = s.nextLine();
				while(!input.equalsIgnoreCase("Y") && !input.equalsIgnoreCase("N")) {
					System.out.println("Invalid input. Try again.:");
					input = s.nextLine();
				}
				if (input.equalsIgnoreCase("Y")) {
					forecastApi(connection, true);
				} else {
					forecastApi(connection, false);
				}
				break;
			case 6:
				printHeader("Load Data from file");
				connection = new Api();
				System.out.println("Would you like to load from default files?: (Y/N)");
				input = s.nextLine();
				if (input.equalsIgnoreCase("Y")) {
					loadDishesFile("data.csv");
					loadInventoryFile("inventory.csv");
				}else {
					System.out.println("Please specify a file name to load for DISHES: ");
					input = s.nextLine();
					loadDishesFile(input);
					System.out.println("Please specify a file name to load for INVENTORY: ");
					input = s.nextLine();
					loadInventoryFile(input);
				}
				break;
			default:
				System.out.println("***Incorrect input, try again.***");
				break;
			}
			printMenu();
			System.out.println("\nSelect a menu option: ");
			input = s.nextLine();
		}
	}

}
