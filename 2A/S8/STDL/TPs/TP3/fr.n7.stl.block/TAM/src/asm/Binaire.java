package asm;

import java.io.ByteArrayOutputStream;
import java.io.DataOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Map;
import java.util.Set;

public class Binaire {

	private int[] bin;

	private int adresse;

	public int get_adresse() {
		return adresse;
	}

	public Binaire(int x) {
		bin = new int[x];
		adresse = 0;
	}

	public void sauver(String n, TDS table) throws Exception {
		DataOutputStream f;
		String nom = n;
		f = new DataOutputStream(new FileOutputStream(nom));
		writeHeader(f, table);
		writeLabels(f, table);
		writeStrs(f, table);
		writeInsts(f);
		f.close();

	}

	public ByteArrayOutputStream sauver(TDS table) throws Exception {
		ByteArrayOutputStream byteOut = new ByteArrayOutputStream();
		DataOutputStream f = new DataOutputStream(byteOut);
		writeHeader(f, table);
		writeLabels(f, table);
		writeStrs(f, table);
		writeInsts(f);
		f.close();
		return byteOut;

	}

	private void writeHeader(DataOutputStream f, TDS table) {
		try {
			f.writeBytes("TAMX");
			int nbloc = table.getNbloc();
			f.writeInt(nbloc);
			// f.writeBytes(" ");
			int nbch = table.getStrings().size();
			f.writeInt(nbch);
			// f.writeBytes(" ");
			f.writeInt(adresse);
			// f.writeBytes("\n");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	private void writeLabels(DataOutputStream f, TDS table) {
		try {
			Set<Map.Entry<String, Info>> s = table.entrySet();
			for (Map.Entry<String, Info> e : s) {
				Info i = e.getValue();
				if (i.getSorte() != Info.Sorte.LAB)
					continue;
				f.write(e.getKey().length());
				f.writeBytes(e.getKey());
				// f.writeBytes("\n");
				f.writeInt(i.getLabel().getDep());
				// f.writeBytes("\n");
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void writeStrs(DataOutputStream f, TDS table) {
		try {
			for (String i : table.getStrings()) {
				// f.write(i.length());
				// f.writeBytes(i);
				f.writeInt(i.length());
				f.writeUTF(i);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void writeInsts(DataOutputStream f) {
		try {
			for (int i = 0; i < adresse; i++) {
				f.writeInt(bin[i]);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public int coder(int op, int r, int n, int d) {
		int res;
		res = 0;
		if ((op & 0x08) != 0)
			res |= 0x80000000L;
		op = (op << 28);
		r = (r << 24);
		n = (n << 16);
		op &= 0xF0000000L;
		r &= 0x0F000000L;
		n &= 0x00FF0000L;
		d &= 0x0000FFFFL;
		res |= op;
		res |= r;
		res |= n;
		res |= d;
		return res;
	}

	public void ajouter(int op, int r, int n, int d) {
		int v1;
		v1 = coder(op, r, n, d);
		bin[adresse] = v1;
		adresse++;
	}

	public void maj_refs(Etiquette e) {
		for (int i : e.getRefs()) {
			changer_rd(i, e.getReg(), e.getDep());
		}
	}

	public String toString() {
		StringBuffer res = new StringBuffer(40);
		for (int i = 0; i < adresse; i++) {
			res.append(i + ": " + bin[i] + "\n");
		}
		return res.toString();
	}

	public void afficher() {
		System.out.println(this);
	}

	public void changer_rd(int i, int r, int d) {
		int aux;
		aux = bin[i];
		aux &= 0xF0FF0000;
		d &= 0x0000FFFF;
		r = (r << 24);
		r &= 0x0F000000;
		aux |= r;
		aux |= d;
		bin[i] = aux;
	}

}
