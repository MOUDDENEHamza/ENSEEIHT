package formats;

import java.io.Serializable;

// To create a new file format, each value must change at each new line.
public interface Format extends FormatReader, FormatWriter, Serializable {
    public enum Type { LINE, KV };
    public enum OpenMode { R, W };

	public void open(OpenMode mode);
	public void close();
	public long getIndex();
	public String getFname();
	public void setFname(String fname);

}
