package customer;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.*;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

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
    public final static PlatResto salade2 = new PlatResto (Plat.Etat.ENTREE,"Salade Cesar", 5, true);
	public final static PlatResto salade3 = new PlatResto (Plat.Etat.ENTREE,"Salade Bressane", 6, true);
	public final static PlatResto salade4 = new PlatResto (Plat.Etat.ENTREE,"Salade Asiatique", 6, true);
	public final static List<PlatResto> lesEntrees = new ArrayList<PlatResto>(4);
	
	
	public final static PlatResto plat1 = new PlatResto (Plat.Etat.PLATPRINCIPAL,"Lasagne Bolognaise", 10, true);
    public final static PlatResto plat2 = new PlatResto (Plat.Etat.PLATPRINCIPAL,"Pizza Italienne", 10, true);
	public final static PlatResto plat3 = new PlatResto (Plat.Etat.PLATPRINCIPAL,"Poulet", 12, true);
	public final static PlatResto plat4 = new PlatResto (Plat.Etat.PLATPRINCIPAL,"Canard a l'orange", 12, true);
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
	public Menu(String lg) {
		String file = "data/langueEn.json";
		JSONParser parser = new JSONParser();
        try {
        	if (lg.equals("fr")) {
        		file = "data/langueFr.json";
        	}
            JSONArray lang = (JSONArray) parser.parse(new FileReader(file));

            for (Object word : lang) {
				JSONObject msg = (JSONObject) word;
				salade1.setNomPlat((String) msg.get("starter1"));
				salade2.setNomPlat((String) msg.get("starter2"));
				salade3.setNomPlat((String) msg.get("starter3"));
				salade4.setNomPlat((String) msg.get("starter4"));
				
				plat1.setNomPlat((String) msg.get("main1"));
				plat2.setNomPlat((String) msg.get("main2"));
				plat3.setNomPlat((String) msg.get("main3"));
				plat4.setNomPlat((String) msg.get("main4"));
				
				dessert1.setNomPlat((String) msg.get("dessert1"));
				dessert2.setNomPlat((String) msg.get("dessert2"));
				dessert3.setNomPlat((String) msg.get("dessert3"));
				dessert4.setNomPlat((String) msg.get("dessert4"));
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
	
	
	public void applyReduction(int reduction) {
		for (PlatResto platEntree : this.menuEntree) {
			platEntree.setPrixPlat(platEntree.getPrixPlat() - reduction);
		}
		for (PlatResto platPrinc : this.menuPlatPrincipal) {
			platPrinc.setPrixPlat(platPrinc.getPrixPlat() - reduction);
		}
		for (PlatResto platDessert : this.menuDessert) {
			platDessert.setPrixPlat(platDessert.getPrixPlat() - reduction);
		}	
	}
	
	
	
}

