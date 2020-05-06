import java.time.LocalDateTime;
import java.util.*;

/**
 * {@code PointDeVente} décrit un point de vente de carburant.
 */

public class PointDeVente {
	private long identifiant;
	private double latitude;
	private double longitude;
	private String adresse;
	private String ville;
	private String codePostal;

	/** Les services proposés. */
	private Set<String> services;

	/** Les changements de prix (valeur) d'un carburant (clé) */
	private Map<Carburant, NavigableMap<LocalDateTime, Integer>> prix;


	/**
	 * Initialiser un point de vente.
	 * Pour des raisons d'efficacité, {@code PointDeVente} garde directement
	 * un accès sur ses paramètres. Il ne faut donc pas que ces paramètres
	 * restent accessibles du reste de l'application.
	 */
	public PointDeVente(long identifiant, double latitude, double longitude,
			String adresse, String ville, String codePostal,
			Set<String> services,
			Map<Carburant, NavigableMap<LocalDateTime, Integer>> prix)
	{
		this.identifiant = identifiant;
		this.latitude = latitude;
		this.longitude = longitude;
		this.adresse = adresse;
		this.ville = ville;
		this.codePostal = codePostal;
		this.services = Collections.unmodifiableSet(services);
		this.prix  = Collections.unmodifiableMap(prix);
	}


	@Override public String toString() {
		return "[" + getIdentifiant() + "] "
			+ getAdresse() + ", " + getCodePostal() + " " + getVille();
	}


	public long getIdentifiant() {
		return identifiant;
	}


	public double getLatitude() {
		return latitude;
	}


	public double getLongitude() {
		return longitude;
	}


	public String getAdresse() {
		return adresse;
	}


	public String getVille() {
		return ville;
	}


	public String getCodePostal() {
		return codePostal;
	}


	public Set<String> getServices() {
		return services;
	}


	public Map<Carburant, NavigableMap<LocalDateTime, Integer>> getPrix() {
		return prix;
	}


	/** Obtenir le prix d'un carburant à une date donnée.  Si le point ce point
	 * de vente ne propose le carburant, la valeur de 0 sera retournée.
	 * @param carburant le carburant dont on veut connaître le prix
	 * @param date la oate où l'on veut connaître le prix
	 */
	public int getPrix(Carburant carburant, LocalDateTime date) {
		return 0;
	}

}
