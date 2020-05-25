package customer;

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
	
	//La disponibilit� d'un plat
	private boolean disponibilitePlat;
	
	/** Construire un plat � partir de son nom, son prix
	 * et sa disponibilit�
	 * @param nomPlat le nom du plat
	 * @param prixPlat le prix du plat
	 * @param disponibilite la disponibilit� du plat
	 */
	public PlatResto(Etat type, String nomPlat, double prixPlat, boolean disponibilite) {
		this.type = type;
		this.nomPlat = nomPlat;
		this.prixPlat = prixPlat;
		this.disponibilitePlat = disponibilite;
	}
	
	/** R�cup�rer le nom d'un plat
	 * 
	 * @return le nom du plat
	 */
     @Override public String getNomPlat() {
    	 return this.nomPlat;
     }
     
     
     /** Mettre � jour le nom d'un plat
      * 
      */
     @Override public void setNomPlat(String nouveauNom) {
    	 this.nomPlat = nouveauNom;
     }
     
     
     /** R�cup�rer le prix d'un plat
      * 
      * @return le prix du plat
      */
     @Override public double getPrixPlat() {
    	 return this.prixPlat;
     }
     
     
     /** Mettre � jour le prix d'un plat
      * 
      */
     @Override public void setPrixPlat(double nouveauPrix) {
    	 this.prixPlat = nouveauPrix;
     }
     
     
     /** Savoir si un plat est disponible ou non
      * 
      * @return un bool�an caract�risant la disponibilit�
      */
     @Override public boolean getDisponibilitePlat() {
    	 return this.disponibilitePlat;
     }
     
     
     /** Mettre � jour la disponibilit� d'un plat
      * 
      */
     @Override public void setDisponibilitePlat(boolean disponibilite) {
    	 this.disponibilitePlat = disponibilite;  	 
     }
     
     @Override public Etat getTypePlat() {
    	 return this.type;
     }
     
     
    
}
