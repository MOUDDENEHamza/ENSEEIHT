package customer;
import employee.EmployeeRank;
import java.util.UUID;

import general.User;

/**
 * The Customer
 * @author Younes Saoudi
 *
 */

public class Customer extends User {

	private int LoyaltyPoints;

	public Customer(String FirstName, String LastName) {
		super(FirstName, LastName,UUID.randomUUID().toString(),EmployeeRank.Null);
	}
	
	public Customer(String FirstName, String LastName, String UserID) {
		super(FirstName, LastName,UserID,EmployeeRank.Null);
	}
	
	/**
	 * Set the loyalty points of the customer
	 * @param LP Amount of Loyalty Points
	 */
	public void setLoyaltyPoints(int LP) {
		this.LoyaltyPoints = LP;
	}
	
	/**
	 * Get the Loyalty Points of the customer
	 * @return LoyaltyPoints
	 */
	public int getLoyaltyPoints() {
		return this.LoyaltyPoints;
	}
	
	public void addLoyaltyPoints(int LP) {
		this.LoyaltyPoints += LP;
	}

}