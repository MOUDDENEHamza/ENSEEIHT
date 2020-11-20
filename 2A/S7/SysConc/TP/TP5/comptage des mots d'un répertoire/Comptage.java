/* v0.0 9/10/16 (PM).
 * Comptage <répertoire> <mot>
 * Compte le nombre d'occurrences de <mot> dans l'ensemble des documents
 * appartenant à la sous arborescence dont <répertoire> est racine.
 * Les liens ne sont pas suivis.
 */
import java.nio.file.Paths;
import java.nio.file.Path;
import java.nio.file.DirectoryStream;
import java.nio.file.Files;
import java.nio.file.LinkOption;
import java.io.IOException;
import java.io.BufferedReader;
import java.io.InputStreamReader;

import java.util.concurrent.RecursiveTask;
import java.util.concurrent.ForkJoinPool;

import java.util.List;
import java.util.LinkedList;

import java.util.Scanner;
import java.util.regex.Pattern;
import java.util.regex.Matcher;
import java.util.NoSuchElementException;

class CompterMots extends RecursiveTask<Long> {
    private  Path racine;
    private  String mot;

    CompterMots(Path p, String m) {
        racine = p;
        mot = m;
    }

    @Override
    protected Long compute() {
        long cpt = 0L;
        List<RecursiveTask<Long>> filles = new LinkedList<>();
        DirectoryStream<Path> ls = null;
// ********* A compléter
        return cpt;
    }
}

public class Comptage {

    static Long nbOccurrences(Path p, String mot) {
        long cpt = 0;
        Scanner s = null;
        Pattern ptn = Pattern.compile(mot);
        Matcher m = null;

        try {
            s = new Scanner(new InputStreamReader(Files.newInputStream(p)));
        }
        catch (IOException iox) {
            System.err.println("(nbOccurrences)"+iox);
        }

        while(s.hasNextLine()) {
            m =  ptn.matcher(s.nextLine());
            while(m.find()) cpt++;
        }
        s.close();
        return cpt;
    }

    static Long comptageMono(Path p, String mot) {
        long cpt = 0L;
        DirectoryStream<Path> ls = null;

        if (Files.isRegularFile(p, LinkOption.NOFOLLOW_LINKS)) {
            cpt = Comptage.nbOccurrences(p, mot) ;
        } else if (Files.isDirectory(p, LinkOption.NOFOLLOW_LINKS)) {
            try {
                ls = Files.newDirectoryStream(p);
            }
            catch (IOException iox) {
                System.err.println("(mono)"+iox);
            }
            for (Path f : ls) {
                cpt = cpt + comptageMono(f, mot);
            }
        }// Sinon (lien, fichier non régulier), on ne fait rien (cpt=0)
        return cpt;
    }

    static Long comptageFJ(ForkJoinPool f, Path p, String mot) {
        Long cpt = 0L; // ********* A corriger

        return cpt;
    }

    public static void main(String[] args) throws IOException {

        int nbEssais = 0;
        long résultat = 0L;
        long départ, fin;
        String chemin = "";
        String motif = "";

        long[] tempsMono, tempsForkJoin;

        if (args.length == 3) { //analyse des paramètres
            chemin = args[0];
            motif = args[1];
            try {
                nbEssais = Integer.parseInt (args[2]);
            }
            catch (NumberFormatException nfx) {
                throw new IllegalArgumentException("Usage : Comptage <répertoire> <mot> <nb essais>");
            }
        }
        if ((nbEssais<1) ||(!Files.isDirectory(Paths.get(chemin), LinkOption.NOFOLLOW_LINKS)
                            && !Files.isRegularFile(Paths.get(chemin), LinkOption.NOFOLLOW_LINKS)))
            throw new IllegalArgumentException("Usage : Comptage <répertoire> <mot> <nb essais>");

        //appel correct
        tempsMono = new long[nbEssais];
        tempsForkJoin = new long[nbEssais];

        //créer un pool ForkJoin
        ForkJoinPool fjp = new ForkJoinPool();

        for (int i = 0; i < nbEssais; i++) {
            départ = System.nanoTime();
            résultat = comptageMono(Paths.get(chemin), motif);
            fin = System.nanoTime();
            tempsMono[i] = (fin - départ);
            System.out.println("Essai ["+i+"] : "+ résultat +" occurrences de " + motif +
                               ", durée (mono) " + tempsMono[i]/1_000+"µs");
        }
        System.out.println("--------------------");

        for (int i = 0; i < nbEssais; i++) {
            départ = System.nanoTime();
            résultat = comptageFJ(fjp,Paths.get(chemin), motif);
            fin = System.nanoTime();
            tempsForkJoin[i] = (fin - départ);
            System.out.println("Essai ["+i+"] : "+ résultat +" occurrences de " + motif +
                               ", durée (FJ) " + tempsForkJoin[i]/1_000+"µs");
        }
        System.out.println("--------------------");
    }
}