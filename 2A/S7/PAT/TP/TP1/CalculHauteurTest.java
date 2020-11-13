package TP1;

/** Tester CalculHauteur.
  * @author	Xavier Crégut
  * @version	$Revision$
  */
public class CalculHauteurTest extends ExpressionTestSetup {

	private void verifierHauteur(int hauteurAttentdue, Expression e) {
		CalculHauteur v = new CalculHauteur();
		verifierHauteur(hauteurAttentdue, e, v);
	}

	private void verifierHauteur(int hauteurAttentdue, Expression e,
			CalculHauteur v) {
		int hauteur = e.accepter(v);
		assertEquals(hauteurAttentdue, hauteur);
	}

	public void testerConstante() {
		verifierHauteur(1, cte);
	}

	public void testerAccesVariable() {
		verifierHauteur(1, av);
	}

	public void testerE1() {
		verifierHauteur(2, e1);
	}

	public void testerE2() {
		verifierHauteur(3, e2);
	}

	public void testerE3() {
		verifierHauteur(3, e3);
	}

	public void testerE4() {
		verifierHauteur(3, e4);
	}

	public void testerE5() {
		verifierHauteur(3, e5);
	}

	public void testerE6() {
		verifierHauteur(4, e6);
	}

	public void testerReutilisationVisiteur() {
		CalculHauteur v = new CalculHauteur();
		verifierHauteur(1, cte, v);
		verifierHauteur(3, e3, v);
		verifierHauteur(3, e4, v);
		verifierHauteur(3, e4, v);
		verifierHauteur(3, e5, v);
		verifierHauteur(4, e6, v);
	}


	public static void main(String[] args) {
		junit.textui.TestRunner.run(
				new junit.framework.TestSuite(CalculHauteurTest.class));
	}

}
