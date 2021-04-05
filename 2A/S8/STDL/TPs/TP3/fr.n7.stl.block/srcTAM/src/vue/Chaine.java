package vue;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;


public class Chaine  extends Data {

	private int adresse;

	private String valeur;

	public Chaine(int adresse, String valeur) {
		super("string");
		this.adresse = adresse;
		this.valeur = valeur;
	}

	public Chaine(DataInputStream dataIn) {
		super(dataIn);
		try {
			this.adresse = dataIn.readInt();
			this.valeur = dataIn.readLine();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int getAdresse() {
		return adresse;
	}

	public void setAdresse(int adresse) {
		this.adresse = adresse;
	}

	public String getValeur() {
		return valeur;
	}

	public void setValeur(String valeur) {
		this.valeur = valeur;
	}
    
}