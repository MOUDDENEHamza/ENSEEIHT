package vue;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;

public class Data{

	// le nom de la donnee
	private String name;

	public Data(String name) {
		this.name = name;
	}

	public Data(DataInputStream dataIn) {
		try {
			this.name = dataIn.readUTF();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public boolean equals(Object object) {
		if (!(object instanceof Data))
			return false;
		if (this == object)
			return true;
		Data data = ((Data) object);
		return name.equals(data.name);
	}

	public String getName() {
		return name;
	}

	public int hashCode() {
		return name.hashCode();
	}

	public void writeData(DataOutputStream dataOut) throws IOException {
		dataOut.writeUTF(name);
	}

	public void readData(DataInputStream dataIn) throws IOException {
	}

	public String toString() {
		StringBuffer sb = new StringBuffer();
		sb.append(name);
		return sb.toString();
	}
}
