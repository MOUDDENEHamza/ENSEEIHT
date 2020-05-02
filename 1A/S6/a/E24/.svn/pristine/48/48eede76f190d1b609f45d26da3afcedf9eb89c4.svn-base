import java.util.UUID;

/** Un client
 * 
 * @author Saoudi
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
	
	
	public void setLoyaltyPoints(int LP) {
		this.LoyaltyPoints = LP;
	}
	
	public int getLoyaltyPoints() {
		return this.LoyaltyPoints;
	}

}