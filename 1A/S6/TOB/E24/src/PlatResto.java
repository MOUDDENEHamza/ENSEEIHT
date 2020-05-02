import java.util.ArrayList;

/** Un plat servi par le restaurant
 * 
 * @author ISSAM
 *
 */

public class PlatResto implements Plat {
	
	//Le type d'un plat
	private Etat type;
	
	//Le nom d'un plat
	private String nomPlat;
	
	//Le prix d'un plat
	private double prixPlat;
	
	//La disponibilité d'un plat
	private boolean disponibilitePlat;
	
	/** Construire un plat à partir de son nom, son prix
	 * et sa disponibilité
	 * @param nomPlat le nom du plat
	 * @param prixPlat le prix du plat
	 * @param disponibilite la disponibilité du plat
	 */
	public PlatResto(Etat type, String nomPlat, double prixPlat, boolean disponibilite) {
		this.type = type;
		this.nomPlat = nomPlat;
		this.prixPlat = prixPlat;
		this.disponibilitePlat = disponibilite;
	}
	
	/** Récupérer le nom d'un plat
	 * 
	 * @return le nom du plat
	 */
     @Override public String getNomPlat() {
    	 return this.nomPlat;
     }
     
     
     /** Mettre à jour le nom d'un plat
      * 
      */
     @Override public void setNomPlat(String nouveauNom) {
    	 this.nomPlat = nouveauNom;
     }
     
     
     /** Récupérer le prix d'un plat
      * 
      * @return le prix du plat
      */
     @Override public double getPrixPlat() {
    	 return this.prixPlat;
     }
     
     
     /** Mettre à jour le prix d'un plat
      * 
      */
     @Override public void setPrixPlat(double nouveauPrix) {
    	 this.prixPlat = nouveauPrix;
     }
     
     
     /** Savoir si un plat est disponible ou non
      * 
      * @return un booléan caractérisant la disponibilité
      */
     @Override public boolean getDisponibilitePlat() {
    	 return this.disponibilitePlat;
     }
     
     
     /** Mettre à jour la disponibilité d'un plat
      * 
      */
     @Override public void setDisponibilitePlat(boolean disponibilite) {
    	 this.disponibilitePlat = disponibilite;  	 
     }
     
     @Override public Etat getTypePlat() {
    	 return this.type;
     }
     
     
	 /** le nombre d'occurences d'un plat 
	  * dans une liste de plats
	  * @param listPlats la liste des plats
	  * @return le nombre d'occurence 
	  */
	 @Override public int nbreOccurencePlat(ArrayList<PlatResto> listPlats) {
		 int nbreOccurence = 0;
		 for (PlatResto plat : listPlats) {
			 if (this.type == plat.type && this.nomPlat == plat.nomPlat) {
				 nbreOccurence++;
			 }
		 }
		 return nbreOccurence;
	 }

     
     
	
}
