package map;

import java.io.Serializable;

import formats.FormatReader;
import formats.FormatWriter;

public interface Reducer extends Serializable {
	public void reduce(FormatReader reader, FormatWriter writer);
}
