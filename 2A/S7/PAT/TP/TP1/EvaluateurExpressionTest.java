package TP1;

import java.util.HashMap;

/** Tester EvaluateurExpression.
  * @author	Xavier Crégut
  * @version	$Revision$
  */
public class EvaluateurExpressionTest extends ExpressionTestSetup {

	protected HashMap<String, Integer> environnement;

	protected void setUp() {
		super.setUp();
		this.environnement = new HashMap<String, Integer>();
		this.environnement.put("x", 5);
		this.environnement.put("y", 7);
		this.environnement.put("z", 2);
	}

	private void verifierValeur(int valeurAttendue, Expression e) {
		EvaluateurExpression v = new EvaluateurExpression(this.environnement);
		assertEquals(valeurAttendue, e.accepter(v).intValue());
	}

	public void testerConstante() {
		verifierValeur(10, cte);
	}

	public void testerAccesVariable1() {
		verifierValeur(5, av);
	}

	public void testerAccesVariable2() {
		verifierValeur(7, new AccesVariable("y"));
	}

	public void testerAccesVariableNonDefinie() {
		try {
			verifierValeur(5, new AccesVariable("t"));
			fail();
		} catch (RuntimeException e) {
			// OK.
		}
	}

	public void testerE1() {
		verifierValeur(7, e1);
	}

	public void testerE2() {
		verifierValeur(21, e2);
	}

	public void testerE3() {
		verifierValeur(49, e3);
	}

	public void testerE4() {
		verifierValeur(14, e4);
	}

	public void testerE5() {
		verifierValeur(14, e5);
	}

	public void testerE6() {
		verifierValeur(7, e6);
	}

	public static void main(String[] args) {
		junit.textui.TestRunner.run(
				new junit.framework.TestSuite(EvaluateurExpressionTest.class));
	}

}
