import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Observable;
import java.util.Set;

/**
 * L'ensemble de plats dans la commande du client
 *
 * @author Issam HABIBI
 */
public class Choix extends Observable {

    //public String payement;
    public Map<String, ArrayList<PlatResto>> map;

    /**
     * Constructeur des choix
     */
    public Choix() {
        this.map = new HashMap<>();
    }

    /**
     * Le prix total de la commande du client
     *
     * @return le prix total
     */
    public double getPrixTotal() {
        double prix = 0;
        Set<Entry<String, ArrayList<PlatResto>>> mapSet = map.entrySet();
        for (Entry<String, ArrayList<PlatResto>> entry : mapSet) {
            ArrayList<PlatResto> listPlats = entry.getValue();
            for (Plat plat : listPlats) {
                prix = prix + plat.getPrixPlat();
            }
        }
        return prix;
    }

    public String conversion(String str, String nomPlat) {
        int indice = str.indexOf(nomPlat) - 3;
        String valeurString = str.substring(indice - 1, indice + 1);
        if (!java.lang.Character.isDigit((valeurString.charAt(0)))) {
            int valeur = (int) (valeurString.charAt(1) - '0') + 1;
            if (valeur != 10) {
                char rep = (char) (valeur + '0');
                str = str.substring(0, indice) + rep + str.substring(indice + 1);
            } else {
                str = str.substring(0, indice) + '1' + str.substring(indice + 1);
                str = str.substring(0, indice + 1) + '0' + ' ' + str.substring(indice + 2);
            }
        } else {
            int valeur = Integer.parseInt(valeurString) + 1;
            char rep2 = Integer.toString(valeur).charAt(1);
            char rep1 = Integer.toString(valeur).charAt(0);
            str = str.substring(0, indice) + rep2 + str.substring(indice + 1);
            str = str.substring(0, indice - 1) + rep1 + str.substring(indice);
        }
        return str;
    }

    /**
     * Version string de la commande choisie
     *
     * @return la commande
     */
    public String toStringCommande() {
        String str = "<html>";
        Set<Entry<String, ArrayList<PlatResto>>> mapSet = map.entrySet();
        for (Entry<String, ArrayList<PlatResto>> entry : mapSet) {
            ArrayList<PlatResto> listPlats = entry.getValue();
            for (PlatResto plat : listPlats) {
                String nomPlat = plat.getNomPlat();
                if (str.contains(String.valueOf(((nomPlat))))) {
                    str = conversion(str, nomPlat);
                } else {
                    str = str + "<br/>    <br/> &emsp x1  " + plat.getNomPlat();
                }
            }
        }
        return str;
    }

    /**
     * @return
     * @author Younes Saoudi
     */
    public String toStringCommandePAY() {
        String str = "";
        Set<Entry<String, ArrayList<PlatResto>>> mapSet = map.entrySet();
        for (Entry<String, ArrayList<PlatResto>> entry : mapSet) {
            ArrayList<PlatResto> listPlats = entry.getValue();
            for (PlatResto plat : listPlats) {
                String nomPlat = plat.getNomPlat();
                if (str.contains(String.valueOf(((nomPlat))))) {
                    str = conversion(str, nomPlat);
                } else {
                    str = str + " x1  " + plat.getNomPlat();
                }
            }
        }
        return str;
    }


    /**
     * Version String des entr�es choisies
     * par l'utilisateur
     *
     * @return les entr�es
     */
    public String toStringEntree() {
        String str = "";
        Set<Entry<String, ArrayList<PlatResto>>> mapSet = map.entrySet();
        for (Entry<String, ArrayList<PlatResto>> entry : mapSet) {
            if (entry.getKey() == "Entree") {
                ArrayList<PlatResto> listPlats = entry.getValue();
                for (PlatResto plat : listPlats) {
                    String nomPlat = plat.getNomPlat();
                    if (str.contains(String.valueOf(((nomPlat))))) {
                        str = conversion(str, nomPlat);
                    } else {
                        str = str + "<br/>    <br/> &emsp x1  " + plat.getNomPlat();
                    }
                }
            }
        }
        return str;
    }

    /**
     * Version String des plats principaux choisis
     * par l'utilisateur
     *
     * @return les plats principaux
     */
    public String toStringPlatPrincipal() {
        String str = "";
        Set<Entry<String, ArrayList<PlatResto>>> mapSet = map.entrySet();
        for (Entry<String, ArrayList<PlatResto>> entry : mapSet) {
            if (entry.getKey() == "Plat Principal") {
                ArrayList<PlatResto> listPlats = entry.getValue();
                for (Plat plat : listPlats) {
                    String nomPlat = plat.getNomPlat();
                    if (str.contains(String.valueOf(((nomPlat))))) {
                        str = conversion(str, nomPlat);
                    } else {
                        str = str + "<br/>    <br/> &emsp x1  " + plat.getNomPlat();
                    }
                }
            }
        }
        return str;
    }

    /**
     * Version String des desserts choisies
     * par l'utilisateur
     *
     * @return les desserts
     */
    public String toStringDessert() {
        String str = "";
        Set<Entry<String, ArrayList<PlatResto>>> mapSet = map.entrySet();
        for (Entry<String, ArrayList<PlatResto>> entry : mapSet) {
            if (entry.getKey() == "Dessert") {
                ArrayList<PlatResto> listPlats = entry.getValue();
                for (Plat plat : listPlats) {
                    String nomPlat = plat.getNomPlat();
                    if (str.contains(String.valueOf(((nomPlat))))) {
                        str = conversion(str, nomPlat);
                    } else {
                        str = str + "<br/>    <br/> &emsp x1  " + plat.getNomPlat();
                    }
                }
            }
        }
        return str;
    }


    /**
     * Ajouter une entr�e � l'ensemble au commande
     *
     * @param lesEntrees les entr�es
     */
    public void ajouterEntree(ArrayList<PlatResto> lesEntrees) {
        this.map.put("Entree", lesEntrees);
        this.setChanged();
        this.notifyObservers();
    }

    /**
     * Ajouter des plats principaux au commande
     *
     * @param lesPlatsP les plat principaux
     */
    public void ajouterPlatPrincipal(ArrayList<PlatResto> lesPlatsP) {
        this.map.put("Plat Principal", lesPlatsP);
        this.setChanged();
        this.notifyObservers();
    }

    /**
     * Ajouter des desserts au commande
     *
     * @param lesDesserts les desserts
     */
    public void ajouterDessert(ArrayList<PlatResto> lesDesserts) {
        this.map.put("Dessert", lesDesserts);
        this.setChanged();
        this.notifyObservers();
    }

    /**
     * Cancel the order
     */
    public void clearMap() {
        this.map.clear();
        this.setChanged();
        this.notifyObservers();
    }

}
