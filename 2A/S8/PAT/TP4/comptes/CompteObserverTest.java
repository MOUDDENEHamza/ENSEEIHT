import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Observable;
import java.util.Observer;

import org.junit.Before;
import org.junit.Test;

public class CompteObserverTest {
	
	static public class MonObservateur implements Observer {
		List<Double> donnees = new ArrayList<>();
		List<Observable> observers = new ArrayList<>();
		
		public int size() {
			return donnees.size();
		}

		public Double getDonnee(int i) {
			if (i < 0) {
				return donnees.get(donnees.size() + i);
			} else {
				return donnees.get(i);
			}
		}


		public Observable getObserver(int i) {
			if (i < 0) {
				return observers.get(observers.size() + i);
			} else {
				return observers.get(i);
			}
		}

		@Override
		public void update(Observable o, Object arg) {
			donnees.add((Double) arg);
			observers.add(o);
		}
	
	}
	
	protected MonObservateur observer;
	protected CompteSimple cs1, cs2;
	
	@Before
	public void setUp() {
		observer = new MonObservateur();
		cs1 = new CompteSimple(new Personne("x", "y", true));
		cs1.addObserver(observer);
		cs2 = new CompteSimple(new Personne("x", "y", true));
		cs2.addObserver(observer);
	}

	@Test
	public void testCrediter() {
		cs1.crediter(100);
		assertEquals(100, cs1.getSolde(), 0.0);
		assertEquals(1, observer.size());
		assertEquals(100, observer.getDonnee(-1), 0.0);
		assertEquals(cs1, observer.getObserver(-1));
	}


	@Test
	public void testDediter() {
		cs1.debiter(200);
		assertEquals(-200, observer.getDonnee(-1), 0.0);
		assertEquals(cs1, observer.getObserver(-1));
	}

	@Test
	public void testDeuxComptes() {
		cs1.debiter(300);
		cs2.crediter(50);
		assertEquals(50, observer.getDonnee(-1), 0.0);
		assertEquals(cs2, observer.getObserver(-1));
		assertEquals(-300, observer.getDonnee(-2), 0.0);
		assertEquals(cs1, observer.getObserver(-2));
	}
	
	@Test
	public void testCompteCourant() {
		CompteCourant cc1 = new CompteCourant(new Personne("", "y", true));
		cc1.addObserver(observer);
		cc1.crediter(10);
		assertEquals(1, observer.size());
		assertEquals(10, observer.getDonnee(-1), 0.0);
		assertEquals(cc1, observer.getObserver(-1));
		// assertEquals(10, observer.getDonnee(-2), 0.0);
		// assertEquals(cc1, observer.getObserver(-2));
	}

}
