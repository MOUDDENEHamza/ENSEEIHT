package map;

import java.io.Serializable;

import formats.FormatReader;
import formats.FormatWriter;

public interface Mapper extends Serializable {
	public void map(FormatReader reader, FormatWriter writer);
}
