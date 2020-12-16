package formats;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;

public class KVFormat implements Format {
	private static final long serialVersionUID = 1L;

	private String fname;
	private KV kv;
	
	private transient BufferedReader br;
	private transient BufferedWriter bw;
	private transient long index = 0;
	private transient Format.OpenMode mode;

		
	public KVFormat(String fname) {
		this.fname = fname;
	}
	
	public void open(OpenMode mode) {
		try {
			this.mode = mode;
			this.kv = new KV();
                        switch (mode) {
                          case R:
                            br = new BufferedReader(new InputStreamReader(new FileInputStream(fname)));
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
                        br.close();
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
		try {
			while (true) {
				String l = br.readLine();
				if (l == null) return null;
				index += l.length();
                                String[] tokens = l.split(KV.SEPARATOR);
				if (tokens.length != 2) continue;
				kv.k = tokens[0];
				kv.v = tokens[1];
				return kv;
			}
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public void write(KV record) {
		try {
			String s = record.k+KV.SEPARATOR+record.v;
			bw.write(s, 0, s.length());
			bw.newLine();
			bw.flush();
			index += s.length();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public long getIndex() {
		return index;
	}

	public String getFname() {return fname;}
	
	public void setFname(String fname) {this.fname = fname;}
}
