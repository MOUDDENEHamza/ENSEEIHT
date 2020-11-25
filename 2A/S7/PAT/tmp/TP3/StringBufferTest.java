import org.junit.*;
import static org.junit.Assert.*;

public class StringBufferTest {
	private StringBuffer s1;

	@Before public void initialiser() {
		s1 = new StringBuffer("Le texte");
	}

	@Test public void testReverse() {
		s1.reverse();
		assertEquals("etxet eL", s1.toString());
	}

	@Test public void testDelete() {
		s1.delete(2, 7);
		assertEquals("Lee", s1.toString());
	}

	@Test(expected=IndexOutOfBoundsException.class)
	public void erreurSurIndice() {
		assertEquals('e', s1.charAt(-1));
	}

	@Test public void initiale() {
		assertEquals('L', s1.charAt(1));
	}
}
