package formats;

import java.io.Serializable;
import java.util.ArrayList;

public class KV implements Serializable {

	public static final String SEPARATOR = "<->";
	
	public String k;
	public String v;
	
	public KV() {}
	
	public KV(String k, String v) {
		super();
		this.k = k;
		this.v = v;
	}

	public String toString() {
		return "KV [k=" + k + ", v=" + v + "]";
	}

	public static ArrayList<KV> loadKVsFromFile(Format file) {
		ArrayList<KV> fileRead = new ArrayList<>();
		KV readAtomic;
		while( (readAtomic = file.read()) != null) {
			fileRead.add(new KV(readAtomic.k, readAtomic.v));
		}
		return fileRead;
	}
}
