package vue;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import javafx.scene.image.ImageView;
import javafx.scene.image.Image;

public class Heap extends Data {
	private int adresse;

	private int valeur;

	private ImageView ht;

	private static final ImageView HT_IMAGE = new ImageView(new Image("/icons/ht.png"));

	public Heap(int adresse, int valeur, boolean rg) {
		super("stack");
		this.adresse = adresse;
		this.valeur = valeur;
		this.ht = rg ? HT_IMAGE : null;
	}

	public Heap(DataInputStream dataIn) {
		super(dataIn);
		try {
			this.adresse = dataIn.readInt();
			this.valeur = dataIn.readInt();
			this.ht = dataIn.readBoolean() ? HT_IMAGE : null;
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public boolean equals(Object object) {
		if (!(object instanceof Heap))
			return false;
		if (this == object)
			return true;
		Heap data = ((Heap) object);
		return adresse == data.adresse && valeur == data.valeur;
	}

	public void writeData(DataOutputStream dataOut) throws IOException {
		super.writeData(dataOut);
		dataOut.writeInt(adresse);
		dataOut.writeInt(valeur);
		dataOut.writeBoolean(ht == HT_IMAGE);

	}

	public String toString() {
		StringBuffer sb = new StringBuffer();
		sb.append(adresse + ", " + valeur + " , " + (ht == HT_IMAGE));
		return sb.toString();
	}

	public int getAdresse() {
		return adresse;
	}

	public void setAdresse(int adresse) {
		this.adresse = adresse;
	}

	public int getValeur() {
		return valeur;
	}

	public void setValeur(int valeur) {
		this.valeur = valeur;
	}

	public ImageView getHt() {
		return ht;
	}

	public void setHt(ImageView rg) {
		this.ht = rg;
	}

}
