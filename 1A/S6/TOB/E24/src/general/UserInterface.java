package general;
import customer.Choix;
import customer.Customer;
import customer.Menu;
import customer.MenuSwing;
import employee.Employee;
import employee.EmployeeInterface;

/**
 * Launches the corresponding interface (Customer Interface or Employee Interface)
 * @author Younes Saoudi
 *
 */
public class UserInterface {
	
	public UserInterface(User user, String lg) {
		if(user instanceof Employee) {
			new EmployeeInterface((Employee) user);
		}else if(user instanceof Customer) {
			Menu menu = new Menu(lg);
			Choix choix = new Choix();
			new MenuSwing(menu, choix, (Customer) user, lg);
		}
	}
}
