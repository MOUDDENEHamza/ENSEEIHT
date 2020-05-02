import java.util.*;

/** Le menu du restaurant
 * 
 * @author ISSAM
 *
 */
public class Menu {
	

	//Une liste contenant les entrées du menu
	private List<PlatResto> menuEntree;
	
	//Une liste contenant les plats principals du menu
	private List<PlatResto> menuPlatPrincipal;
	
	//Une liste contenant les desserts du menu
	private List<PlatResto> menuDessert;
	
	public final static PlatResto salade1 = new PlatResto (Plat.Etat.ENTREE,"Salade Nordique", 5, true);
    public final static PlatResto salade2 = new PlatResto (Plat.Etat.ENTREE,"Salade César", 5, true);
	public final static PlatResto salade3 = new PlatResto (Plat.Etat.ENTREE,"Salade Bressane", 6, true);
	public final static PlatResto salade4 = new PlatResto (Plat.Etat.ENTREE,"Salade Asiatique", 6, true);
	public final static List<PlatResto> lesEntrees = new ArrayList<PlatResto>(4);
	
	
	public final static PlatResto plat1 = new PlatResto (Plat.Etat.PLATPRINCIPAL,"Lasagne Bolognaise", 10, true);
    public final static PlatResto plat2 = new PlatResto (Plat.Etat.PLATPRINCIPAL,"Pizza Italienne", 10, true);
	public final static PlatResto plat3 = new PlatResto (Plat.Etat.PLATPRINCIPAL,"Poulet", 12, true);
	public final static PlatResto plat4 = new PlatResto (Plat.Etat.PLATPRINCIPAL,"Canard à l'orange", 12, true);
	public final static List<PlatResto> lesPlatsP = new ArrayList<PlatResto>(4);
	
	
	public final static PlatResto dessert1 = new PlatResto (Plat.Etat.DESSERT,"Le Fraisier", 6, true);
    public final static PlatResto dessert2 = new PlatResto (Plat.Etat.DESSERT,"Tiramisu", 6, true);
	public final static PlatResto dessert3 = new PlatResto (Plat.Etat.DESSERT,"Tarte Chocolat", 7, true);
	public final static PlatResto dessert4 = new PlatResto (Plat.Etat.DESSERT,"Tarte Orange", 7, true);
	public final static List<PlatResto> lesDesserts = new ArrayList<PlatResto>(4);
	
	
	/** Construire un menu à partir de son nom, ses entrée,
	 * ses plats principaux et ses desserts.
	 * @param nomMenu le nom du menu
	 */
	public Menu() {
		
		lesEntrees.add(salade1);
		lesEntrees.add(salade2);
		lesEntrees.add(salade3);
		lesEntrees.add(salade4);
		this.menuEntree= lesEntrees;
		
		lesPlatsP.add(plat1);
		lesPlatsP.add(plat2);
		lesPlatsP.add(plat3);
		lesPlatsP.add(plat4);
		this.menuPlatPrincipal = lesPlatsP;
		
		lesDesserts.add(dessert1);
		lesDesserts.add(dessert2);
		lesDesserts.add(dessert3);
		lesDesserts.add(dessert4);
		this.menuDessert = lesDesserts;
	}
	
	
	/** Récupérer une liste des entrées du menu
	 * 
	 * @return les entrées du menu
	 */
	public List<PlatResto> getMenuEntree() {
		return this.menuEntree;
	}
	
	/** Récupérer une liste des plats principaux du menu
	 * 
	 * @return les plats principaux du menu
	 */
	public List<PlatResto> getMenuPlatPrincipal() {
		return this.menuPlatPrincipal;
	}
	
	/** Récupérer une liste des desserts du menu
	 * 
	 * @return les desserts du menu
	 */
	public List<PlatResto> getMenuDessert() {
		return this.menuDessert;
	}
	
	/** Ajouter une entrée au menu
	 * 
	 * @param entree l'entrée à ajouter
	 */
	public void ajouterEntree(PlatResto entree) {
		this.menuEntree.add(entree);
	}
	
	/** Ajouter un plat principal au menu
	 * 
	 * @param platPrincipal le plat principal à ajouter
	 */
	public void ajouterPlatPrincipal(PlatResto platPrincipal) {
		this.menuPlatPrincipal.add(platPrincipal);
	}
	
	/** Ajouter un dessert au menu
	 * 
	 * @param dessert le dessert à ajouter
	 */
	public void ajouterDessert(PlatResto dessert) {
		this.menuDessert.add(dessert);
	}

	public void setMenuEntree(ArrayList<PlatResto> menuEntree) {
		this.menuEntree = menuEntree;
	}
	
	
}

