import org.junit.*;
import static org.junit.Assert.*;

/**
  * Vérifier que les exceptions sont correctement définies.
  *
  * @author	Xavier Crégut <Prenom.Nom@enseeiht.fr>
  */
public class ExceptionsTest {

	public static boolean isUncheckedException(Class<?> classe) {
		return Error.class.isAssignableFrom(classe)
			|| RuntimeException.class.isAssignableFrom(classe);
	}

	public static boolean isCheckedException(Class<?> classe) {
		return Throwable.class.isAssignableFrom(classe)
			&& ! isUncheckedException(classe);
	}

	public void verifierEstRuntimeException(Class<?> classe) {
		assertTrue(classe.getName() + " doit être une exception !",
				Throwable.class.isAssignableFrom(classe));
		assertTrue(classe.getName() + " doit être non vérifiée !",
				isUncheckedException(classe));
		assertFalse(classe.getName() + " : pourquoi en faire une Error ?",
				Error.class.isAssignableFrom(classe));
	}

	public void verifierIsCheckedException(Class<?> classe) {
		assertTrue(classe.getName() + " doit être une exception !",
				Throwable.class.isAssignableFrom(classe));
		assertTrue(classe.getName() + " doit être vérifiée !",
				isCheckedException(classe));
	}


	@Test
	public void testerExceptions() {
		verifierEstRuntimeException(CreneauInvalideException.class);
		verifierIsCheckedException(LibreException.class);
		verifierIsCheckedException(OccupeException.class);
	}

	

}
