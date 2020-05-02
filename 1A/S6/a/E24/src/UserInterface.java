/**
 * Launches the corresponding interface (Customer Interface or Employee Interface)
 * @author Younes Saoudi
 *
 */
public class UserInterface {
	
	public UserInterface(User user) {
		if(user instanceof Employee) {
			new EmployeeInterface((Employee) user);
		}else if(user instanceof Customer) {
			Menu menu = new Menu();
			Choix choix = new Choix();
			new MenuSwing(menu, choix, (Customer) user);
		}
	}
}
