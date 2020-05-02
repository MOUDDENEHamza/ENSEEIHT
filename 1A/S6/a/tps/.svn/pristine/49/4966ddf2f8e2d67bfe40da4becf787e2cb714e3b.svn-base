import java.awt.Color;
import java.lang.reflect.*;
import org.junit.*;
import static org.junit.Assert.*;
import java.util.*;

/**
  * L'objectif de cette classe est de vérifier que la classe Cercle a été
  * correctement programmée.
  *
  * @author	Xavier Crégut
  * @version	$Revision$
  */

public class FormeCercleTest {

	// précision pour les comparaisons réelle
	public final static double EPSILON = 0.001;

	final static private Class<Cercle> cercle = Cercle.class;

	private static Method getMethode(Class<?> c, String name, Class<?>... types)
		throws NoSuchMethodException
	{
		Method resultat = c.getMethod(name, types);
		assertNotNull("méthode " + name + "(" + types + ") non déclarée !", resultat);
		return resultat;
	}

	private void verifierTypeRetour(Method m, Class<?> expected)
	{
		// TODO : définir une méthode signatureToString() pour construire la
		// signature de la méthode plutôt que d'utiliser getName
		assertEquals("Erreur sur le type de retour de " + m.getName() + ".",
				expected, m.getReturnType());
	}

	private static Field getAttribut(Class c, String name)
		throws NoSuchFieldException
	{
		try {
			return c.getDeclaredField(name);
		} catch (NoSuchFieldException e) {
			fail("attribut non déclaré : " + name);
			return null;	// jamais atteint
		}
	}

	private static List<Field> getAttributsInstance(Class c) {
		ArrayList<Field> result = new ArrayList<Field>(5);
		for (Field f : c.getDeclaredFields()) {
			if (! Modifier.isStatic(f.getModifiers())) {
				result.add(f);
			}
		}
		return result;
	}

	private static void verifierConstanteClasse(Class c, String name)
		throws NoSuchFieldException
	{
		Field attr = getAttribut(c, name);
		assertTrue(name + " : devrait être une constante !",
				Modifier.isFinal(attr.getModifiers()));
		assertTrue(name + " : doit être une constante de *classe* !",
				Modifier.isStatic(attr.getModifiers()));
		assertTrue(name + " : Pourquoi pas public ?",
				Modifier.isPublic(attr.getModifiers()));
	}

	@Test public void testerE5() throws NoSuchMethodException {
			// TODO : Il faudrait que getMethode signale le problème !
			// On peut en effet construire le message à partir des paramètres reçus
		Method contient = getMethode(cercle, "contient", Point.class);
		verifierTypeRetour(contient, boolean.class);
	}

	@Test public void testerC12() throws Exception {
		verifierConstanteClasse(cercle, "PI");
	}

	@Test public void testerC12ValeurPI() throws Exception {
		Field pi = getAttribut(cercle, "PI");
		pi.setAccessible(true);
		assertTrue("Le type de PI doit être double",
				double.class.equals(pi.getType()));
		if (Modifier.isStatic(pi.getModifiers())) {
			assertEquals("Pas d'utilisation de Math.PI pour initialiser PI ?",
					Math.PI, pi.getDouble(null), 0.0);
		} else {
			Cercle c = new Cercle(new Point(1, 2), 10);
			assertEquals("Pas d'utilisation de Math.PI pour initialiser PI ?",
					Math.PI, pi.getDouble(c), 0.0);

		}
	}

	@Test public void testerNombreAttributs() throws Exception {
		int attendu = 3;	// nombre d'attributs d'instance attendus
		int nbReel = getAttributsInstance(cercle).size();
		assertFalse("Trop d'attributs d'instance : " + nbReel
				+ " au lieu de " + attendu + " !", nbReel > attendu);
		assertFalse("Pas assez d'attributs d'instance : " + nbReel
				+ " au lieu de " + attendu + " !", nbReel < attendu);
	}

	@Test public void testAttributsPrives() throws Exception {
		for (Field f : cercle.getDeclaredFields()) {
			if (! Modifier.isFinal(f.getModifiers())) {
				if (! Modifier.isFinal(f.getModifiers())) {
					assertFalse("L'attribut " + f.getName() + " ne devrait pas être public !",
							Modifier.isPublic(f.getModifiers()));
					assertFalse("Attribut " + f + " : Pourquoi protected ?",
							Modifier.isPublic(f.getModifiers()));
					assertTrue("Attribut " + f + " : Droit d'accès oublié ?",
							Modifier.isPrivate(f.getModifiers()));
				}
			}
		}
	}

	@Test public void testAttributsNomsAssezLongs() throws Exception {
		for (Field f : cercle.getDeclaredFields()) {
			String nom = f.getName();
			assertTrue("C3: Nom trop court pour l'attribut " + nom, nom.length() > 1);
		}
	}

	private final static Set<String> nomsPeuSiginificatifs;
	static {
		nomsPeuSiginificatifs = new TreeSet<String>();
		Collections.addAll(nomsPeuSiginificatifs, "p1", "p2", "a", "b",
				"point1", "point2", "c", "r", "c_aux");
	}

	@Test public void testAttributsNomsPeuSignificatifs() throws Exception {
		for (Field f : cercle.getDeclaredFields()) {
			String nom = f.getName();
			assertFalse("C3: Nom pas assez significatif pour l'attribut " + nom,
					nomsPeuSiginificatifs.contains(nom.toLowerCase()));
		}
	}


	@Test public void testerE6() {
		assertTrue("Cercle devrait être un Mesurable2D !",
				Mesurable2D.class.isAssignableFrom(cercle));
	}

	@Test public void testerE6bis() {
		boolean trouve = false;
		for (Class<?> i : cercle.getInterfaces()) {
			trouve = trouve || i == Mesurable2D.class;
		}
		assertTrue("Cercle doit directement réaliser Mesurable2D !", trouve);
	}

	@Test public void testerNbConstructeurs() {
		int nbAttendu = 3;
		int nbConstructeurs = cercle.getConstructors().length;
		assertFalse("Trop de constructeurs : " + nbConstructeurs,
				nbConstructeurs > nbAttendu);
		assertFalse("Pas assez de constructeurs : " + nbConstructeurs,
				nbConstructeurs < nbAttendu);
	}

	@Test public void testerE14() throws Exception {
		Method creerCercle = null;
		try {
			creerCercle = getMethode(cercle, "creerCercle", Point.class,
					Point.class);
		} catch (NoSuchMethodException e) {
			fail("La méthode creerCercle(Point, Point) n'existe pas !");
		}
		int modifieurs = creerCercle.getModifiers();
		assertTrue("creerCercle devrait être publique !",
				Modifier.isPublic(modifieurs));
		assertTrue("creerCercle doit être une méthode de classe !",
				Modifier.isStatic(modifieurs));
	}

	@Test public void testerContructeurDefaut() {
		try {
			Constructor<Cercle> defaut = cercle.getConstructor();
			fail("Pourquoi définir un constructeur par défaut sur Cercle ?");
		} catch (NoSuchMethodException e) {
			// OK
		}
	}

}
