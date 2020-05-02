import java.awt.List;
import java.util.ArrayList;

/** Les plats servis par le restaurant
 * 
 * @author ISSAM
 *
 */
public interface Plat {
	
	enum Etat {ENTREE, PLATPRINCIPAL, DESSERT};
	
	 /** Récupérer le nom d'un plat
	  * @return le nom du plat
	  */
	 String getNomPlat();
	 
	 /** Mettre à jour le nom d'un plat
	  * @param nouveauNom le nouveau nom du plat
	  */
	 void setNomPlat(String nouveauNom);
	 
	 /** Récupérer le prix d'un plat
	  * @return le prix du plat
	  */
	 double getPrixPlat();
	 
	 /** Mettre à jour le prix d'un plat
	  * @param nouveauPrix le nouveau prix du plat
	  */
	 void setPrixPlat(double nouveauPrix);
	 
	 /** Savoir si un plat est disponible ou pas
	  * @return un booléan caractérisant la disponibilité
	  */
	 boolean getDisponibilitePlat();
	 
	 Etat getTypePlat();
	 
	 /** Mettre à jour la disponibilité d'un plat
	  * @param disponibilite un booléan caractérisant la disponibilité
	  */
	 void setDisponibilitePlat(boolean disponibilite);
	 
	 /** le nombre d'occurences d'un plat 
	  * dans une liste de plats
	  * @param listPlats la liste des plats
	  * @return le nombre d'occurence 
	  */
	 int nbreOccurencePlat(ArrayList<PlatResto> listPlats);

}
