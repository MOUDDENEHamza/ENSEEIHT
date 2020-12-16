// v0.1 (PM,11/20) kv attribut -> variable

package formats;
import java.io.BufferedWriter;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.LineNumberReader;
import java.io.OutputStreamWriter;


public class LineFormatS implements Format {
    private static final long serialVersionUID = 1L;

    private String fname;

    private transient LineNumberReader lnr;
    private transient BufferedWriter bw;
    private transient long index = 0;
    private transient Format.OpenMode mode;

    public LineFormatS(String fname) {
        this.fname = fname;
    }

    public void open(Format.OpenMode mode) {
        try {
            this.mode = mode;
            switch (mode) {
            case R:
                lnr = new LineNumberReader(new InputStreamReader(new FileInputStream(fname)));
                break;
            case W:
                bw = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(fname)));
                break;
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void close() {
        try {
            switch (mode) {
            case R:
                lnr.close();
                break;
            case W:
                bw.close();
                break;
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    public KV read() {
        KV kv = new KV();
        try {
            kv.k = Integer.toString(lnr.getLineNumber());
            kv.v = lnr.readLine();
            if (kv.v == null) return null;
            index += kv.v.length();
            return kv;
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }

    public void write(KV record) {
        KV kv = new KV();
        try {
            bw.write(record.v, 0, record.v.length());
            bw.newLine();
            index += record.v.length();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public long getIndex() {
        return index;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }
}
