package asm;

import java.util.*;

/**
 */
public class Etiquette {

    private int reg;

    private int dep;

    private List<Integer> refs;

    public int getReg() {
        return reg;
    }

    public int getDep() {
        return dep;
    }

    public List<Integer> getRefs() {
        return refs;
    }

    public Etiquette() {
        refs = new ArrayList<Integer>();
        reg = 0;
        dep = -1;
    }

    public void ajouterRef(int x) {
        refs.add(x);
    }

    public String refsToString() {
        StringBuffer res = new StringBuffer(40);
        for (int i : refs) {
            res.append(i);
            res.append('/');
        }
        return res.toString();
    }

    public void afficherRefs() {
        System.out.println(refsToString());
    }

    public String toString() {
        return dep + "[reg#" + reg + "]";
    }

    public void updateDep(int v) {
        dep = v;
    }

}
