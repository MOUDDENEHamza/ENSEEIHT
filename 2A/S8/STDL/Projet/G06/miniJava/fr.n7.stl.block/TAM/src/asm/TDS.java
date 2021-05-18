package asm;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.Vector;

public class TDS extends HashMap<String, Info> {
    private int nbloc;

    public int getNbloc() {
        return nbloc;
    }

    private Vector<String> strings;

    public Vector<String> getStrings() {
        return strings;
    }

    private static final long serialVersionUID = 1L;

    private TDS parente;

    public TDS() {
        this(null);
    }

    public TDS(TDS p) {
        super();
        parente = p;
        nbloc = 0;
        strings = new Vector<String>();
        // declarer_regs();
        // declarer_subrs();
    }

    public Info chercherLocalement(String n) {
        return get(n);
    }

    public Info chercherGlobalement(String n) {
        Info i = chercherLocalement(n);
        if (i == null)
            if (parente != null)
                return parente.chercherGlobalement(n);
        return i;
    }

    public void inserer(String n, Info i) {
        put(n, i);
    }

    public String toString() {
        StringBuffer sb = new StringBuffer();
        Set<Map.Entry<String, Info>> s = entrySet();
        Iterator<Map.Entry<String, Info>> it = s.iterator();
        while (it.hasNext()) {
            Map.Entry<String, Info> e = it.next();
            sb.append(e.getKey() + " : " + e.getValue() + '\n');
        }
        return sb.toString();
    }

    private final static String regs[] = { "cb", "ct", "pb", "pt", "sb", "st", "hb", "ht", "lb", "l1", "l2", "l3", "l4",
            "l5", "l6", "cp" };

    public void declarer_regs() {
        int nr = 0;
        for (String r : regs) {
            inserer(r, new Info(Info.Sorte.REG, nr++));
        }
    }

    public boolean containsregistre(String s) {
        boolean existe = false;
        for (String r : regs) {
            if (s.equals(r)) {
                existe = true;
                break;
            }
        }
        return existe;
    }

    private final static String subrs[] = { "bneg", "bor", "band", "bout", "bin", "b2c", "b2i", "b2s", "cout", "cin",
            "c2b", "c2i", "c2s", "ineg", "iadd", "isub", "imul", "idiv", "imod", "ieq", "ineq", "ilss", "ileq", "igtr",
            "igeq", "iout", "iin", "i2b", "i2c", "i2s", "mvoid", "malloc", "mfree", "mcompare", "mcopy", "salloc",
            "sfree", "scopy", "sconcat", "sout", "sin", "s2b", "s2c", "s2i" };

    public void declarer_subrs() {
        int ns = 0;
        for (String s : subrs) {
            inserer(s, new Info(Info.Sorte.SUB, ns++));
        }
    }

    public boolean containssubr(String s) {
        boolean existe = false;
        for (String r : subrs) {
            if (s.equals(r)) {
                existe = true;
                break;
            }
        }
        return existe;
    }

    public int to_char(String c) {
        return (int) (analyser(c)).charAt(0);
    }

    public int ref_reg(String aux) {
        int res = -1;
        Info inf;
        inf = chercherLocalement(aux.toLowerCase());
        if (inf != null) {
            res = inf.getVal();
        }
        return res;
    }

    public int ref_subr(String aux) {
        int res = -1;
        Info inf;
        // inf = chercherLocalement(aux.toLowerCase());
        inf = chercherLocalement(aux.toLowerCase());
        if (inf != null) {
            res = inf.getVal();
        }
        return res;
    }

    public Etiquette declarerEtiquette(String aux) {
        Etiquette res;
        Info inf;
        String n;
        n = aux.toLowerCase();
        inf = new Info(Info.Sorte.LAB);
        inserer(n, inf);
        nbloc++;
        res = inf.getLabel();
        return res;
    }

    protected String analyser(String s) {
        StringBuffer res = new StringBuffer(40);
        int i;
        char c, aux;
        for (i = 0; i < s.length(); i++) {
            aux = s.charAt(i);
            if (aux == '\\') {
                i++;
                if (s.length() > 1) {
                    switch (s.charAt(i)) {
                        case 'n':
                            c = '\n';
                            break;
                        case 'r':
                            c = '\r';
                            break;
                        case 't':
                            c = '\t';
                            break;
                        default:
                            c = s.charAt(i);
                            break;
                    }
                } else {
                    c = s.charAt(i - 1);
                }

            } else {
                c = aux;
            }
            res.append(c);
        }
        return res.toString();
    }

    public int declarer_chaine(String n) {
        int ns = strings.size();
        strings.add(analyser(n));
        return ns;
    }

    /** Vérifie que toutes les étiquettes sont déclarées quelque part. */
    public void verifier_etiquettes() throws SemanticError {
        for (String key : keySet()) {
            Info info = get(key);
            if (info.estEtiquette()) {
                Etiquette l = info.getLabel();
                if (l.getDep() == -1) {
                    throw new SemanticError("L'étiquette '" + key + "' n'est pas définie.");
                }
            }
        }
    }
}
