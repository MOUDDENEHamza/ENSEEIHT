package customer;
/**
 *  This class handles the loyalty program for the customer
 *
 * @author Hatim MESKINE
 * @version 1.0
 */

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;


public class RewardPoints {

	int Points; // loyalty points
	String ID;


	public RewardPoints(String id) {
		this.ID= id;
		JSONParser parser = new JSONParser();
		this.Points = 0;
		try {
			JSONArray userList = (JSONArray) parser.parse(new FileReader("data/users.json"));

			for (Object user : userList) {
				JSONObject usr = (JSONObject) user;
				String UserID = (String) usr.get("UserID");
				boolean IsCustomer = (((String) usr.get("Function")).equals("Null"));
				if (IsCustomer) { 
					long ptslong = (long) usr.get("LoyaltyPoints");
					int ptsint = Math.toIntExact(ptslong);
					if(id.equals(UserID)) {
						this.Points = ptsint;
					}
				}

			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		} catch (NumberFormatException e) {
			System.out.print(true);
		} catch (Exception e) {

		}
	}

	public int getPoints() {
		return this.Points;
	}

	@SuppressWarnings("unchecked")
	public void addPoints(int addpt, String ID) {
		JSONParser parser = new JSONParser();
		try {
			JSONArray userList = (JSONArray) parser.parse(new FileReader("data/users.json"));

			for (Object user : userList) {
				JSONObject usr = (JSONObject) user;
				String UserID = (String) usr.get("UserID");
				boolean IsCustomer = (((String) usr.get("Function")).equals("Null"));
				if (IsCustomer) {
					long ptslong = (long) usr.get("LoyaltyPoints");
					int ptsint = Math.toIntExact(ptslong);
					if(ID.equals(UserID)) {
						usr.remove("LoyaltyPoints");
						usr.put("LoyaltyPoints", ptsint + addpt);
						this.Points += addpt;
					}
				}
			} try (FileWriter file = new FileWriter("data/users.json")) {

				file.write(userList.toJSONString());
				file.flush();

			} catch (IOException e) {
				e.printStackTrace();
			}

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		} catch (Exception e) {

		}

	}

	public boolean discount() {
		JSONParser parser = new JSONParser();
		try {
			JSONArray userList = (JSONArray) parser.parse(new FileReader("data/users.json"));

			for (Object user : userList) {
				JSONObject usr = (JSONObject) user;
				String UserID = (String) usr.get("UserID");
				boolean IsCustomer = (((String) usr.get("Function")).equals("Null"));
				if (IsCustomer) {			    	
					String discount = (String) usr.get("Discount");
					if(ID.equals(UserID) && discount.equals("Yes")) {
						return true;
					}
				}
			} try (FileWriter file = new FileWriter("data/users.json")) {

				file.write(userList.toJSONString());
				file.flush();

			} catch (IOException e) {
				e.printStackTrace();
			}

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		} 
		return false;
	}
}


