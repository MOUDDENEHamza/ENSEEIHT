package vue;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import javafx.scene.image.ImageView;
import javafx.scene.image.Image;

public class TamAsm  extends Data{
	private int adresse;
	private String etiquette;
	private String instruction;
	private ImageView bp;
	private ImageView cp;

	// Flèches pour visualisation
	private static final ImageView CP_IMAGE = new ImageView(new Image("/icons/cp.png"));

	public TamAsm(int adresse, String etiquette, String instruction, boolean bp, boolean cp) {
		super("asm");
		this.adresse = adresse;
		this.etiquette = etiquette;
		this.instruction = instruction;
		this.bp = bp ? new ImageView(new Image("/icons/bp.png")) : null;
		this.cp = cp ? CP_IMAGE : null;
	}

	public TamAsm(DataInputStream dataIn) {
		super(dataIn);
		try {
			this.adresse = dataIn.readInt();
			this.etiquette = dataIn.readUTF();
			this.instruction = dataIn.readUTF();
			this.bp = dataIn.readBoolean() ? new ImageView(new Image("vue/icons/bp.gif")) : null;
			this.cp = dataIn.readBoolean() ? CP_IMAGE : null;
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public boolean equals(Object object) {
		if (!(object instanceof TamAsm))
			return false;
		if (this == object)
			return true;
		TamAsm data = ((TamAsm) object);
		return adresse == data.adresse;
	}

	public void writeData(DataOutputStream dataOut) throws IOException {
		super.writeData(dataOut);
		dataOut.writeInt(adresse);
		dataOut.writeUTF(etiquette);
		dataOut.writeUTF(instruction);
		dataOut.writeBoolean(bp != null);
		dataOut.writeBoolean(cp == CP_IMAGE);

	}

	public String toString() {
		StringBuffer sb = new StringBuffer();
		sb.append(adresse + ", " + etiquette + " , " + instruction + ", " + (bp != null) + ", " + (cp == CP_IMAGE));
		return sb.toString();
	}

	public int getAdresse() {
		return adresse;
	}

	public void setAdresse(int adresse) {
		this.adresse = adresse;
	}

	public String getEtiquette() {
		return etiquette;
	}

	public void setEtiquette(String etiquette) {
		this.etiquette = etiquette;
	}

	public String getInstruction() {
		return instruction;
	}

	public void setInstruction(String instruction) {
		this.instruction = instruction;
	}

	public ImageView getBp() {
		return bp;
	}

	public void setBp(ImageView bp) {
		this.bp = bp;
	}

	public boolean isCP(){
		return cp != null;
	}

	public ImageView getCp() {
		return cp;
	}

	public void setCp(ImageView cp) {
		this.cp = cp;
	}

}
