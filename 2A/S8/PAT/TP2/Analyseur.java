import java.io.*;
import java.util.*;

/** Analyser des donnÃ©es d'un fichier, une donnÃ©e par ligne avec 4 informations
 * sÃ©parÃ©es par des blancs : x, y, ordre (ignorÃ©e), valeur.
 */
public class Analyseur {
	/** Conserve la somme des valeurs associÃ©es Ã  une position. */
	private Map<Position, Double> cumuls;

	/** Construire un analyseur vide. */
	public Analyseur() {
		cumuls = new HashMap<>();
	}

	public void update(Map<Position, Double> tmp) {
		tmp.forEach((key, value) -> {
			cumuls.put(key, valeur(key) + value);
		});

	}

	/** Charger l'analyseur avec les donnÃ©es du fichier "donnees.java". */
	public void charger(String filename) throws MalformedFileException {
		try (BufferedReader in = new BufferedReader(new FileReader(filename))) {
			String ligne = null;
			Map<Position, Double> tmp = new HashMap<>();
			while ((ligne = in.readLine()) != null) {
				String[] mots;
				if (filename.contains("csv")) {
					mots = ligne.split(",(?=(?:[^\"]*\"[^\"]*\")*[^\"]*$)", -1);
				} else {
					mots = ligne.split("\\s+");
				}
				assert mots.length == 4;	// 4 mots sur chaque ligne
				int x = Integer.parseInt(mots[0]);
				int y = Integer.parseInt(mots[1]);
				if (x < 0 || y < 0) {
					tmp = new HashMap<>();
					throw new MalformedFileException(filename);
				}
				Position p = new Position(x, y);
				double valeur;
				if (filename.contains("-f2.txt") || filename.contains("-f2.csv")) {
					valeur = Double.parseDouble(mots[4]);
				} else {
					valeur = Double.parseDouble(mots[3]);
				}
				tmp.put(p, valeur(p) + valeur);
				// p.setY(p.getY() + 1);	//  p.y += 1;
			}
			update(tmp);
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
	}

	/** Obtenir la valeur associÃ©e Ã  une position. */
	public double valeur(Position position) {
		Double valeur = cumuls.get(position);
		return valeur == null ? 0.0 : valeur;
	}

	/** Obtenir toutes les donnÃ©es. */
	public Map<Position, Double> donnees() {
		return Collections.unmodifiableMap(this.cumuls);
	}

	/** Affichier les donnÃ©es. */
	public static void main(String[] args) {
		try { 
			int i;
			Analyseur a = new Analyseur();
			if (args.length == 0) {
				System.out.println("Usage: Analyseur filename..*");
				System.exit(1);
			}
			for (i = 0 ; i < args.length ; i++) {
				a.charger(args[i]);
			}
			System.out.println(a.donnees());
			System.out.println("Nombres de positions : " + a.donnees().size());
		} catch (MalformedFileException e ) { }
	}

}

