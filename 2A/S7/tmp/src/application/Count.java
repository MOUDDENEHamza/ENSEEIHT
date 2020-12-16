package application;
/* Note : pour pouvoir fonctionner sans modifications, cette application suppose
 * l'existence d'un attribut statique PATH d'une classe Projet située dans le répertoire
 * hidoop/src/config. Cet attribut est supposé contenir le chemin d'accès au répertoire
 * hidoop (celui qui contient le répertoire applications contenant le présent fichier)
 */

import java.io.BufferedWriter;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.io.LineNumberReader;
import java.io.OutputStreamWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.StringTokenizer;

import config.Project;
import formats.KV;

public class Count {

    public static void main(String[] args) {

        try {
            long t1 = System.currentTimeMillis();

            HashMap<String,Integer> hm = new HashMap<String,Integer>();
            LineNumberReader lnr = new LineNumberReader(new InputStreamReader(new FileInputStream(args[0])));
            while (true) {
                String l = lnr.readLine();
                if (l == null) break;
                String tokens[] = l.split(" ");
                for (String tok : tokens) {
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