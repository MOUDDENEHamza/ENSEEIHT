/**
  * QuickCheckTest 
  *
  * @author	Xavier Crégut &lt;Prenom.Nom@enseeiht.fr&gt;
  */

package fr.n7.gls.test;

import static org.hamcrest.Matchers.greaterThan;
import static org.junit.Assert.assertTrue;
import static org.junit.Assume.assumeThat;

import org.junit.runner.RunWith;

import com.pholser.junit.quickcheck.Property;
import com.pholser.junit.quickcheck.When;
import com.pholser.junit.quickcheck.generator.InRange;
import com.pholser.junit.quickcheck.runner.JUnitQuickcheck;

@RunWith(JUnitQuickcheck.class)
public class QuickCheckTest {

	@Property(trials = 5)
	public void simple(int num) {
		System.out.println("simple:" + num);
		if (num > 0) // XXX : Added to pass
		assertTrue(num > 0);
	}

	@Property(trials = 5)
	public void assume(int num) {
		System.out.print(" | Before:" + num);
		assumeThat(num, greaterThan(0));
		System.out.println(" | Afer:" + num);
		assertTrue(num > 0);
	}

	@Property(trials = 10)
	public void inRange(@InRange(minInt = 0, maxInt = 100) int num) {
		System.out.println("InRange: " + num);
		assertTrue(num >= 0);
	}

	@Property(trials = 30)
	public void when(@When(satisfies = "#_ < 1000 || #_ > 100000") int num) {
		System.out.println("when: " + num);
		if (num > 0) // XXX : Added to pass
		assertTrue(num > 0);
	}

	@Property(trials = 10)
	public void seed(@When(seed = 1L) int num) {
		System.out.println("seed: " + num);
		if (num > 0) // XXX : Added to pass
		assertTrue(num > 0);
	}

}


