package util;

import java.io.*;

/** Quelques méthodes pour lire des entiers et des réels.
  * @author	Xavier Crégut (très largement inspiré par Cay Horstmann)
  * @version	$Revision: 1.2 $
  */
public class Console
{
	/** Afficher un prompt à l'écran (sans passage à la ligne)
	  * @param prompt	texte à afficher à l'écran
	  */
	public static void printPrompt(String prompt) {
		System.out.print(prompt + " ");
		System.out.flush();	// forcer l'écriture en l'absence de '\n'
	}
   
   /** Lire une chaîne de caractères à partir du clavier.  La chaîne de
	 * caractères est terminée par un retour à la ligne (qui ne fait pas partie
	 * du résultat).  (cf corejava)
	 *
	 * @return la ligne lue à partir du clavier (sans le retour à la ligne)
	 */
	public static String readLine() {
		int ch;
		String r = "";
		boolean done = false;
		while (!done) {
			try {
				ch = System.in.read();
				if (ch < 0 || (char) ch == '\n') {
					done = true;
				} else if ((char) ch != '\r') {
							// weird--it used to do \r\n translation
					r = r + (char) ch;
				}
			} catch (java.io.IOException e) {
				done = true;
			}
		}
		return r;
	}

	public static String readString() {
		return readLine();
	}

   /** Même méthode que readLine avec en plus l'affichage d'une invite.
	 * @param invite	texte à afficher à l'écran
	 * @return la ligne lue à partir du clavier (sans le retour à la ligne)
	 */
	public static String readLine(String invite) {
		printPrompt(invite);
		return readLine();
	}

   /** Lire un caractère après avoir affiché une invite.  Tous les caractères
	* suivants, jusqu'au retour à la ligne sont considérés consommés.
	* @param invite	texte à afficher à l'écran
	* @return le caractère lu au clavier.
	*/
	public static char readChar(String invite) {
		printPrompt(invite);
		String line = readLine();
		return line.length() > 0 ? line.charAt(0) : '\n';
	}

	public static char readChar() {
		return readChar("");
	}

   /** Lire un entier à partir du clavier après avoir affiché une invite.
	 * Resaisie dans le cas d'une erreur de l'utilisateur.
	 * @return l'entier lu
	 */
	public static int readInt(String invite) {
		int resultat = 0;
		boolean saisieOK = false;
		while(! saisieOK) {
			printPrompt(invite);
			try {
				String s = readLine().trim();
				resultat = Integer.parseInt(s);
				saisieOK = true;
			} catch (NumberFormatException e) {
				System.out.println ("Ce n'est pas un entier. Recommencez !");
			}
		}
		return resultat;
	}

	public static int readInt() {
		return readInt("");
	}

   /** Lire un réel à partir du clavier après avoir affiché une invite.
	 * Resaisie dans le cas d'une erreur de l'utilisateur.
	 * @return le réel lu
	 */
	public static double readDouble(String invite) {
		double resultat = 0;
		boolean saisieOK = false;
		while(! saisieOK) {
			printPrompt(invite);
			try {
				String s = readLine().trim();
				resultat = Double.parseDouble(s);
				saisieOK = true;
			} catch (NumberFormatException e) {
				System.out.println ("Ce n'est pas un réel. Recommencez !");
			}
		}
		return resultat;
	}

	public static double readDouble() {
		return readDouble("");
	}

   /** Lire un entier à partir du << flot >> d'entrée après avoir affiché une invite.
	 * Resaisie dans le cas d'une erreur de l'utilisateur.
	 * @return l'entier lu
	 */
   public static int readInt(BufferedReader in, String invite) throws IOException {
		int resultat = 0;
		boolean saisieOK = false;
		while(! saisieOK) {
			printPrompt(invite);
			try {
				String s = in.readLine().trim();
				resultat = Integer.parseInt(s);
				saisieOK = true;
			} catch (NumberFormatException e) {
				System.out.println ("Ce n'est pas un entier. Recommencez !");
			}
		}
		return resultat;
	}

}
