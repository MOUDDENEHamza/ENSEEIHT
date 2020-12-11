/**
 * SommeTest, classe de test de Somme.
 *
 * @author Xavier Crégut &lt;Prenom.Nom@enseeiht.fr&gt;
 */

package fr.n7.gls.test;

import java.io.*;

import org.junit.*;

import static org.junit.Assert.*;

import org.mockito.*;
import org.mockito.junit.*;

import static org.mockito.Mockito.*;

public class SommeTest {

    @Rule
    public MockitoRule mockito = MockitoJUnit.rule();

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
            assertNotEquals(60 - 1, somme.somme(br));
            assertNotEquals(60 + 1, somme.somme(br));
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

    @Test(expected = NumberFormatException.class)
    public void testerSommeAvecUneDoublure1() throws Exception {
        BufferedReader mockedBufferedReader = Mockito.mock(BufferedReader.class);
        when(mockedBufferedReader.readLine()).thenReturn("1", "-5", "2", "xxx", "4", null);

        assertEquals(7, somme.somme(mockedBufferedReader, Mockito.mock(Erreurs.class)));
    }

    @Test(expected = NumberFormatException.class)
    public void testerSommeAvecUneDoublure2() throws Exception {
        BufferedReader mockedBufferedReader = Mockito.mock(BufferedReader.class);
        when(mockedBufferedReader.readLine()).thenReturn("1", "-1", "2", "trois", "10", "20", null);

        assertEquals(33, somme.somme(mockedBufferedReader));
    }

    @Test(expected = NumberFormatException.class)
    public void testerSommeAvecUneDoublure3() throws Exception {
        BufferedReader mockedBufferedReader = Mockito.mock(BufferedReader.class);
        when(mockedBufferedReader.readLine()).thenReturn("1", "-5", "2", "xxx", "4", null);

        assertEquals(7, somme.somme(mockedBufferedReader));
    }

    @Test(expected = FileNotFoundException.class)
    public void testerSommeMain() throws Exception {
        // Créer le fichier pour le test
        File fichier = File.createTempFile("tmp", ".txt");
        try (PrintWriter bw = new PrintWriter(new FileWriter(fichier))) {
            bw.println("10");
            bw.println("30");
            bw.println("20");
        }

        String[] args = {"tmp"};
        assertEquals(60, somme.main(args));

        // Effacer le fichier
        fichier.delete();

    }

    @Test(expected = FileNotFoundException.class)
    public void testerSommeMain3() throws Exception {
        String[] args = {"tmp1"};
        assertEquals(60, somme.main(args));
    }

    @Test
    public void testerSommeMain1() throws Exception {
        String[] args = {"tmp.txt"};
        assertEquals(60, somme.main(args));
    }

    @Test(expected = AssertionError.class)
    public void testerSommeMain2() throws Exception {
        String[] args = {};
        assertEquals(60, somme.main(args));
    }
}
