/**
 * SommeTest, classe de test de Somme.
 *
 * @author	Xavier Crégut &lt;Prenom.Nom@enseeiht.fr&gt;
 */

package fr.n7.gls.test;

import java.io.*;

import org.junit.*;
import static org.junit.Assert.*;

import org.mockito.*;
import org.mockito.junit.*;
import static org.mockito.Mockito.*;

public class SommeTest {

	@Rule public MockitoRule mockito = MockitoJUnit.rule();

	public Somme somme;

	@Before
	public void setUp() {
		this.somme = new Somme();
	}

	@Test
	public void testerSommeAvecUnVraiFichier() throws Exception {

		// Créer le fichier pour le test
		File fichier = File.createTempFile("tmp", ".txt");
		try (PrintWriter bw = new PrintWriter(new FileWriter(fichier))) {
			bw.println("10");
			bw.println("30");
			bw.println("20");
		}

		// L'utiliser pour le test
		try (BufferedReader br = new BufferedReader(new FileReader(fichier))) {
			assertEquals(60, somme.somme(br));
		}

		// Effacer le fichier
		fichier.delete();

	}

	@Test
	public void testerSommeAvecUneDoublure() throws Exception {
		BufferedReader mockedBufferedReader = Mockito.mock(BufferedReader.class);
		when(mockedBufferedReader.readLine()).thenReturn("10", "30", "20", null);

		assertEquals(60, somme.somme(mockedBufferedReader));
	}

}
