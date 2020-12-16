package formats;

import java.io.Serializable;

public interface Format extends FormatReader, FormatWriter, Serializable {
    public enum Type { LINE, KV };
    public enum OpenMode { R, W };

	public void open(OpenMode mode);
	public void close();
	public long getIndex();
	public String getFname();
	public void setFname(String fname);

}
