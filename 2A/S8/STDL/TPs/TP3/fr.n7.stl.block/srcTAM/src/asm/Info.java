package asm;

/**
 * cette classe (un peu 'sac') décrit les différentes informations sémantiques
 * que l'on désire associer aux différents identificateurs (différenciés par le
 * champ 'sorte')
 */
public class Info {
  /**
   * Le type d'information : étiquette locale, nom de subr, nom de registre, nom
   * de variable chaîne
   */
  public enum Sorte {
    REG, LAB, STR, SUB
  }

  private Sorte sorte;

  private Etiquette label;

  private int val;

  private String str;

  public int getVal() {
    return val;
  }

  public Sorte getSorte() {
    return sorte;
  }

  public String getStr() {
    return str;
  }

  public Etiquette getLabel() {
    return label;
  }

  public Info(Sorte s) {
    sorte = s;
    label = new Etiquette();
    val = -1;
    str = null;

  }

  public Info(Sorte s, int v) {
    sorte = s;
    val = v;
    str = null;
    label = null;
  }

  // public Info(Sorte s, String n, int v) {
  // sorte = s;
  // val = v;
  // str = analyser(n);
  // label = null;
  // }

  public String toString() {
    StringBuffer res = new StringBuffer(40);
    switch (sorte) {
      case LAB:
        res.append(";locale : " + "= " + label);
        break;
      case SUB:
        res.append(";subr : " + ", " + val);
        break;
      case REG:
        res.append(";registre : " + ", " + val);
        break;
      case STR:
        res.append(";chaine : " + ", " + val);
        break;
      default:
        System.err.println("INFO inconnue !");
        break;
    }
    return res.toString();
  }

  public boolean estEtiquette() {
    return sorte == Sorte.LAB;
  }
}
