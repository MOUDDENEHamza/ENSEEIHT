package vue;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import javafx.scene.image.ImageView;
import javafx.scene.image.Image;

public class Stack extends Data {
	private int adresse;

	private int valeur;

	private ImageView st;

	private ImageView lb;

	private String info;

	private static final ImageView ST_IMAGE = new ImageView(new Image("/icons/st.png"));
	private static final ImageView LB_IMAGE = new ImageView(new Image("/icons/lb.png"));

	public Stack(int adresse, int valeur, boolean st, boolean lb, String info) {
		super("stack");
		this.adresse = adresse;
		this.valeur = valeur;
		this.st = st ? ST_IMAGE : null;
		this.lb = lb ? LB_IMAGE : null;
		this.info = info;
	}

	public Stack(DataInputStream dataIn) {
		super(dataIn);
		try {
			this.adresse = dataIn.readInt();
			this.valeur = dataIn.readInt();
			this.st = dataIn.readBoolean() ? ST_IMAGE : null;
			this.lb = dataIn.readBoolean() ? LB_IMAGE : null;
			this.info = dataIn.readUTF();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public boolean equals(Object object) {
		if (!(object instanceof Stack))
			return false;
		if (this == object)
			return true;
		Stack data = ((Stack) object);
		return adresse == data.adresse && valeur == data.valeur;
	}

	public void writeData(DataOutputStream dataOut) throws IOException {
		super.writeData(dataOut);
		dataOut.writeInt(adresse);
		dataOut.writeInt(valeur);
		dataOut.writeBoolean(st == ST_IMAGE);
		dataOut.writeBoolean(lb == LB_IMAGE);
		dataOut.writeUTF(info);
	}

	public String toString() {
		StringBuffer sb = new StringBuffer();
		sb.append(adresse + ", " + valeur + " , " + (st == ST_IMAGE) + ", " + (lb == LB_IMAGE) + ", " + info);
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

	public ImageView getSt() {
		return st;
	}

	public void setSt(ImageView st) {
		this.st = st;
	}

	public ImageView getLb() {
		return lb;
	}

	public void setLb(ImageView lb) {
		this.lb = lb;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

}
