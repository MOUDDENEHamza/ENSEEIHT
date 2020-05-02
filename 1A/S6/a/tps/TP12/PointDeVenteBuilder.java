import java.time.LocalDateTime;
import java.util.*;

/**
 * {@code PointDeVenteBuilder} facilite la création d'un {@code PointDeVente}
 * en permettant à l'utilisateur de renseigner les éléments dans l'ordre qu'il
 * souhaite.
 */

public class PointDeVenteBuilder {

	private boolean construit;

	private long identifiant;
	private double latitude;
	private double longitude;
	private String adresse;
	private String ville;
	private String codePostal;

	/** Les services proposés. */
	private Set<String> services = new HashSet<>();

	/** Les changements de prix (valeur) d'un carburant (clé) */
	private Map<Carburant, NavigableMap<LocalDateTime, Integer>> prix = new HashMap<>();


	public PointDeVente build() {
		this.construit = true;
		return new PointDeVente(identifiant, latitude, longitude,
				adresse, ville, codePostal,
				services, prix);
	}


	public PointDeVenteBuilder setIdentifiant(long identifiant) {
		verifierNonConstruit();
		this.identifiant = identifiant;
		return this;
	}


	public PointDeVenteBuilder setIdentifiant(String identifiant) {
		verifierNonConstruit();
		setIdentifiant(Long.parseLong(identifiant));
		return this;
	}


	public PointDeVenteBuilder setLatitude(double latitude) {
		verifierNonConstruit();
		this.latitude = latitude;
		return this;
	}


	public PointDeVenteBuilder setLatitude(String latitude) {
		verifierNonConstruit();
		try {
		} catch (NumberFormatException e) {
			setLatitude(Double.parseDouble(latitude));
		}
		return this;
	}


	public PointDeVenteBuilder setLongitude(double longitude) {
		verifierNonConstruit();
		this.longitude = longitude;
		return this;
	}


	public PointDeVenteBuilder setLongitude(String longitude) {
		verifierNonConstruit();
		try {
			setLongitude(Double.parseDouble(longitude));
		} catch (NumberFormatException e) {
			// Rien !
		}
		return this;
	}


	public PointDeVenteBuilder setAdresse(String adresse) {
		verifierNonConstruit();
		this.adresse = adresse;
		return this;
	}


	public PointDeVenteBuilder setVille(String ville) {
		verifierNonConstruit();
		this.ville = ville.toUpperCase();
		return this;
	}


	public PointDeVenteBuilder setCodePostal(String codePostal) {
		verifierNonConstruit();
		this.codePostal = codePostal;
		return this;
	}


	public PointDeVenteBuilder addService(String service) {
		verifierNonConstruit();
		this.services.add(service);
		return this;
	}


	public PointDeVenteBuilder addPrix(Carburant carburant, LocalDateTime date, int prix) {
		verifierNonConstruit();
		NavigableMap<LocalDateTime, Integer> lesPrix = this.prix.get(carburant);
		if (lesPrix == null) {
			lesPrix = new TreeMap<>();
			this.prix.put(carburant, lesPrix);
		}
		lesPrix.put(date, prix);
		return this;
	}


	private void verifierNonConstruit() {
		if (construit) {
			throw new IllegalStateException("déjà construit");
		}
	}

}
