/**
 * StatistiquesTest, classe de test de Statistiques.
 *
 * @author	Xavier Crégut &lt;Prenom.Nom@enseeiht.fr&gt;
 */

package fr.n7.gls.test;

import org.junit.*;
import static org.junit.Assert.*;

import java.util.*;

public class StatistiquesTest {

	@Test
	public void testStatistiquesNominal() {
		List<Integer> l = new ArrayList<>();
		Collections.addAll(l, 1, 3, 11, 5, 7);
		Statistiques.Resultat<Integer> r = new Statistiques().statistiques(l);
		assertEquals(Integer.valueOf(1), r.min);
		assertEquals(Integer.valueOf(11), r.max);
		assertEquals(1, r.nbMin);
		assertEquals(1, r.nbMax);
	}

	@Test
	public void testStatistiquesNominal1() {
		List<Integer> l = new ArrayList<>();
		Collections.addAll(l, 9, 3, 11, 5, 7);
		Statistiques.Resultat<Integer> r = new Statistiques().statistiques(l);
		assertEquals(Integer.valueOf(3), r.min);
		assertEquals(Integer.valueOf(11), r.max);
		assertEquals(1, r.nbMin);
		assertEquals(1, r.nbMax);
	}

	@Test
	public void testStatistiquesNominal2() {
		List<Integer> l = new ArrayList<>();
		Collections.addAll(l, 30, 3, 11, 5, 79, -50, 79, -300, -300);
		Statistiques.Resultat<Integer> r = new Statistiques().statistiques(l);
		assertEquals(Integer.valueOf(-300), r.min);
		assertEquals(Integer.valueOf(79), r.max);
		assertEquals(2, r.nbMin);
		assertEquals(2, r.nbMax);
	}

	@Test
	public void testStatistiquesNominal3() {
		List<Integer> l = new ArrayList<>();
		Collections.addAll(l, 3, 2, 3, 2, 3, 2);
		Statistiques.Resultat<Integer> r = new Statistiques().statistiques(l);
		assertEquals(Integer.valueOf(2), r.min);
		assertNotEquals(Integer.valueOf(67), r.min);
		assertEquals(Integer.valueOf(3), r.max);
		assertNotEquals(Integer.valueOf(13), r.max);
		assertEquals(3, r.nbMin);
		assertNotEquals(34, r.nbMin);
		assertEquals(3, r.nbMax);
		assertNotEquals(99, r.nbMax);
	}

	@Test(expected = NullPointerException.class)
	public void testStatistiquesLimites1() {
		List<Integer> l = new ArrayList<>();
		Collections.addAll(l, 1, 2, (Integer) null, 3);
		Statistiques.Resultat<Integer> r = new Statistiques().statistiques(l);
		assertEquals(null, r.min);
		assertEquals(null, r.max);
		assertEquals(0, r.nbMin);
		assertEquals(0, r.nbMax);
	}

	@Test(expected = AssertionError.class)
	public void testStatistiquesLimites2() {
		List<Integer> l = new ArrayList<>();
		Collections.addAll(l, (Integer) null);
		Statistiques.Resultat<Integer> r = new Statistiques().statistiques(l);
		assertEquals(null, r.min);
		assertEquals(null, r.max);
		assertEquals(0, r.nbMin);
		assertEquals(0, r.nbMax);
	}


}
