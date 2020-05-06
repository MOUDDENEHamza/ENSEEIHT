import org.junit.*;
import static org.junit.Assert.*;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.awt.Color;

/**
 * Programme de test pour vérifier la bonne mise en oeuvre de la généralisation.
 *
 * @author	Xavier Crégut <Prenom.Nom@enseeiht.fr>
 */

public class GeneralisationTest {

	private Method getDeclaredMethod(Class<?> classe, String name, Class<?>... args) {
		try {
			return classe.getDeclaredMethod(name, args);
		}
		catch (NoSuchMethodException e) {
			return null;
		}
	}

	private Constructor<?> getDeclaredConstructor(Class<?> classe, Class<?>... args) {
		try {
			return classe.getDeclaredConstructor(args);
		}
		catch (NoSuchMethodException e) {
			return null;
		}
	}

	private Field getDeclaredField(Class<?> classe, String name) {
		try {
			return classe.getDeclaredField(name);
		}
		catch (NoSuchFieldException e) {
			return null;
		}
	}

	private void verifierLaSuperClasse(Class<?> superClasse) {
		Method getCouleurMethod = getDeclaredMethod(superClasse, "getCouleur");
		assertTrue("Pourquoi ne pas factoriser getCouleur() dans "
				+ superClasse.getName() + " ?",
				getCouleurMethod != null);

		Method setCouleurMethod = getDeclaredMethod(superClasse, "setCouleur", Color.class);
		assertTrue("Pourquoi ne pas factoriser setCouleur() dans "
				+ superClasse.getName() + " ?",
				setCouleurMethod != null);

		Field couleurField = getDeclaredField(superClasse, "couleur");
		assertTrue("Pourquoi ne pas factoriser l'attribut 'couleur' dans "
				+ superClasse.getName() + " ?",
				couleurField != null);
		assertTrue("L'attribut 'couleur' devrait être privé !",
				Modifier.isPrivate(couleurField.getModifiers()));
		assertFalse("Pourquoi ne pas définir getCouleur() dans "
				+ superClasse.getName() + " ?",
				Modifier.isAbstract(getCouleurMethod.getModifiers()));
		assertFalse("Pourquoi ne pas définir setCouleur() dans "
				+ superClasse.getName() + " ?",
				Modifier.isAbstract(setCouleurMethod.getModifiers()));

		Constructor<?> constructeur = getDeclaredConstructor(superClasse, Color.class);
		assertTrue("Pourquoi ne pas définir un constructeur pour initialiser"
				+ " la couleur dans " + superClasse.getName() + " ?",
				constructeur != null);
	}

	private void verifierGestionCouleur(Class<?> uneClasse) {
		Class<?> superClasse = uneClasse.getSuperclass();
		assertFalse("Il faut d'abord faire marcher ExempleSchemaTab !",
				Object.class.equals(superClasse));

		// Vérifier la super-classe
		verifierLaSuperClasse(superClasse);

		assertTrue("Pourquoi redéfinir la méthode getCouleur() dans "
				+ uneClasse.getName() + " ?",
				null == getDeclaredMethod(uneClasse, "getCouleur"));
		assertTrue("Pourquoi redéfinir la méthode setCouleur() dans "
				+ uneClasse.getName() + " ?",
				null == getDeclaredMethod(uneClasse, "setCouleur", Color.class));
		assertTrue("Pourquoi ne pas supprimer l'attribut 'couleur' de "
				+ uneClasse.getName() + " ?",
				null == getDeclaredField(uneClasse, "couleur"));
	}

	@Test
	public void testerGeneralisation() {
		verifierGestionCouleur(Point.class);
		verifierGestionCouleur(Segment.class);
	}

}
