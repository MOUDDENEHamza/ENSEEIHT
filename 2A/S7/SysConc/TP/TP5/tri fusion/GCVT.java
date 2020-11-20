//v0.1  15/11/20 (PM) (0.1 :clarification du message d'erreur principal)

import java.io.ObjectOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.FileNotFoundException;
import java.nio.file.Paths;
import java.nio.file.Files;
import java.nio.file.LinkOption;
import java.io.ObjectOutputStream;
import java.io.FileOutputStream;
import java.io.FileInputStream;
import java.io.ObjectInputStream;
import java.util.Random;

class TableauxDisque {
    static boolean générer(String chemin, int taille, int max) throws IOException, FileNotFoundException {
    /* génère un tableau de dimension taille, contenant des entiers aléatoires, compris entre 0 et max,
       et enregistre ce tableau dans le fichier dont le chemin est fourni en argument */
        Random rdm = new Random();
        int [] tableau;
        if ((taille < 1)||(max < 1)) {
            System.err.println("Générer : paramètres inattendus (taille ou max < 1)");
            return false;
        } else {
            tableau = new int[taille];
            for (int i=0; i<taille; i++) {
                tableau[i]=(Math.abs(rdm.nextInt()%max));
            }
            ObjectOutputStream flot = new ObjectOutputStream(new FileOutputStream(chemin));
            flot.writeObject (tableau);
            flot.close();
            return true;
        }
    }

    static int [] charger(String chemin) throws IOException, FileNotFoundException {
    /* retourne le tableau contenu dans le fichier dont le chemin est fourni en argument */
        int [] tableau;
        if (!Files.isRegularFile(Paths.get(chemin), LinkOption.NOFOLLOW_LINKS)) {
            System.err.println("Charger : erreur chemin/fichier ("+chemin+")");
            return null;
        } else {
            ObjectInputStream flot = new ObjectInputStream(new FileInputStream(chemin));
            try { tableau=(int[])flot.readObject(); }
            catch (ClassNotFoundException cnfe) {
                System.err.println("charger : "+cnfe);
                tableau=null;
            }
            flot.close();
            return tableau;
        }
    }

    static boolean comparer(String chemin, String chemin2, int début)
    throws IOException, FileNotFoundException {
        int [] t1;
        int [] t2;
        int i = 0;
        boolean résultat;

        if (!Files.isRegularFile(Paths.get(chemin), LinkOption.NOFOLLOW_LINKS) ||
        !Files.isRegularFile(Paths.get(chemin2), LinkOption.NOFOLLOW_LINKS)) {
            System.err.println("Comparer : erreur chemin/fichier ("+chemin+"|"+chemin2+")");
            return false;
        } else {
            t1 = charger(chemin);
            t2 = charger(chemin2);

            résultat = (t1.length==t2.length);
            while (résultat && (i<t1.length)) {
                résultat = (t1[i] == t2[i]);
                i++;
            }
            return résultat;
        }
    }

    static void sauver(String chemin, int [] tableau) throws IOException, FileNotFoundException {
    /* enregistre le tableau en argument dans le fichier dont le chemin est fourni en argument */
        ObjectOutputStream flot = new ObjectOutputStream(new FileOutputStream(chemin));
        flot.writeObject (tableau);
        flot.close();
    }

    static boolean visualiser(String chemin, int début, int fin)
    throws IOException, FileNotFoundException {
    /* visualise les élements début à fin 
       du tableau contenu dans le fichier dont le chemin est fourni en argument */
        Random rdm = new Random();
        int [] tableau;
        if ((début < 0)||(fin < début) ||
        !Files.isRegularFile(Paths.get(chemin), LinkOption.NOFOLLOW_LINKS)) {
            System.err.println("Visualiser : paramètres inattendus");
            return false;

        } else {
            ObjectInputStream flot = new ObjectInputStream(new FileInputStream(chemin));
            try { tableau=(int[])flot.readObject(); }
            catch (ClassNotFoundException cnfe) {
                System.err.println("visualiser : "+cnfe);
                tableau=null;
            }
            flot.close();
            System.out.println("--------------------");
            for (int i=début; i<=Math.min((tableau.length-1),fin); i++) {
                System.out.println(i+":"+tableau[i]);
            }
            System.out.println("--------------------");
            return true;
        }
    }
}

public class GCVT {

    public static void main(String[] args) throws IOException, FileNotFoundException {
        Random rdm = new Random();
        int [] tableau;
        int taille=0;
        int max=0;
        String chemin="";
        String chemin2="";
        String option="-X";

        if (args.length == 4) { //analyse des paramètres
            option = args[0];
            chemin = args[1];
            try {
                if (option.equals("-c")) {
                    chemin2 = args[2];
                } else {
                    taille = Integer.parseInt (args[2]);
                }
                max= Integer.parseInt (args[3]);
            }
            catch (NumberFormatException nfx) {
                option="-X";
            }
        }
        if ((taille < 0) || (max<0)) option="-X";

        switch (option) {
        case "-g":
            TableauxDisque.générer(chemin, taille, max);
            break;
        case "-c":
            System.out.println("Identiques : " + TableauxDisque.comparer(chemin, chemin2, max));
            break;
        case "-v":
            TableauxDisque.visualiser(chemin, taille, max);
            break;
        case "-t": //juste un test
            TableauxDisque.générer(chemin, taille, max);
            TableauxDisque.visualiser(chemin, 0, 20);
            tableau=TableauxDisque.charger(chemin);
            System.out.println("Chargé : ");
            for (int i=0; i<tableau.length; i++) {
                System.out.println(i+"->"+tableau[i]);
            }
            TableauxDisque.sauver(chemin,tableau);
            System.out.println("Sauvé : ");
            TableauxDisque.visualiser(chemin, 0, tableau.length);
            break;
        default:
            throw new IllegalArgumentException(
            	"\nUsage : GCVT -g <fichier> <taille> <valeur max> (pour générer un tableau"
            	                    +" de <taille> entiers inférieurs à <valeur max>)\n"
              + "     ou GCVT -c <fichier1> <fichier2> <début> (pour comparer le contenu"
                                  + " de 2 fichiers à partir de la position <début>)\n" 
              + "     ou GCVT -v <fichier> <début> <fin> (pour visualiser le contenu d'un"
                                  + " fichier entre les positions <début> et <fin>)\n"
              + "Note : <fichier> est un chemin, qui peut être relatif. Exemple ../data/t1000\n");
        }
    }
}