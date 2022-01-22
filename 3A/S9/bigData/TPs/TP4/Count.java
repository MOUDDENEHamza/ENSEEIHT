
import java.io.BufferedWriter;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.io.LineNumberReader;
import java.io.OutputStreamWriter;
import java.util.HashMap;
import java.util.StringTokenizer;

public class Count {

	public static void main(String[] args) {

		try {
			long t1 = System.currentTimeMillis();

			HashMap<String,Integer> hm = new HashMap<String,Integer>();
			LineNumberReader lnr = new LineNumberReader(new InputStreamReader(new FileInputStream(args[0])));
			int line = 0;
			int million=0;
			while (true) {
				String l = lnr.readLine();
				line++;
				if (line == 1000000) {
				  	million++;
					System.out.println(million+" millions of lines");
					line=0;
				}
				if (l == null) break;
				StringTokenizer st = new StringTokenizer(l);
				while (st.hasMoreTokens()) {
					String tok = st.nextToken();
					if (hm.containsKey(tok)) hm.put(tok, hm.get(tok).intValue()+1);
					else hm.put(tok, 1);
				}
			}
			BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream("count-res")));
			for (String k : hm.keySet()) {
				writer.write(k+"<->"+hm.get(k).toString());
				writer.newLine();
			}
			writer.close();
			lnr.close();
			long t2 = System.currentTimeMillis();
			System.out.println("time in ms ="+(t2-t1));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
