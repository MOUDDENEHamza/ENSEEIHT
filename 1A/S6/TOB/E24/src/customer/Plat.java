package customer;

/** Les plats servis par le restaurant
 * 
 * @author ISSAM
 *
 */
public interface Plat {
	
	enum Etat {ENTREE, PLATPRINCIPAL, DESSERT};
	
	 /** R�cup�rer le nom d'un plat
	  * @return le nom du plat
	  */
	 String getNomPlat();
	 
	 /** Mettre � jour le nom d'un plat
	  * @param nouveauNom le nouveau nom du plat
	  */
	 void setNomPlat(String nouveauNom);
	 
	 /** R�cup�rer le prix d'un plat
	  * @return le prix du plat
	  */
	 double getPrixPlat();
	 
	 /** Mettre � jour le prix d'un plat
	  * @param nouveauPrix le nouveau prix du plat
	  */
	 void setPrixPlat(double nouveauPrix);
	 
	 /** Savoir si un plat est disponible ou pas
	  * @return un bool�an caract�risant la disponibilit�
	  */
	 boolean getDisponibilitePlat();
	 
	 Etat getTypePlat();
	 
	 /** Mettre � jour la disponibilit� d'un plat
	  * @param disponibilite un bool�an caract�risant la disponibilit�
	  */
	 void setDisponibilitePlat(boolean disponibilite);
	 

}
