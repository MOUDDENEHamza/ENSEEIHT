package TP1;

/**
  * AfficheurInfixeTest :
  *
  * @author	Xavier Crégut
  * @version	$Revision$
  */

public class AfficheurInfixeTest extends ExpressionTestSetup {


	private void verifier(String valeurAttendue, Expression e) {
		AfficheurInfixe affInfixe = new AfficheurInfixe();
		String resultat = e.accepter(affInfixe);
		assertEquals(valeurAttendue, resultat.replaceAll("\\s+", " "));
	}

	public void testerConstante() {
		verifier("(10)", cte);
	}

	public void testerAccesVariable1() {
		verifier("(x)", av);
	}

	public void testerE1() {
		verifier("((2) + (x))", e1);
	}

	public void testerE2() {
		verifier("(((2) + (x)) * (3))", e2);
	}

	public void testerE3() {
		verifier("((7) * ((2) + (x)))", e3);
	}

	public void testerE4() {
		verifier("(((x) + (y)) + (z))", e4);
	}

	public void testerE5() {
		verifier("((x) + ((y) + (z)))", e5);
	}

	public void testerE6() {
		verifier("(- (- ((2) + (x))))", e6);
	}

	public static void main(String[] args) {
		junit.textui.TestRunner.run(
				new junit.framework.TestSuite(AfficheurInfixeTest.class));
	}

}
