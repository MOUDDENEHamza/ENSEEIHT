package TP1;

/**
  * ExpressionTest :
  *
  * @author	Xavier Crégut
  * @version	$Revision$
  */

public abstract class ExpressionTestSetup extends junit.framework.TestCase {

	protected Constante cte;
	protected AccesVariable av;
	protected Expression e1, e2, e3;	// Expressions du sujet
	protected Expression e4, e5, e6;

	protected void setUp() {
		// 10
		this.cte = new Constante(10);
		// x
		this.av = new AccesVariable("x") ;

		// 2 + x
		this.e1 = new ExpressionBinaire(new Addition(),
				new Constante(2),
				av);

		// (2 + x) * 3
		this.e2	= new ExpressionBinaire(new Multiplication(),
				this.e1,
				new Constante(3));

		// 7 * (2 + x)
		this.e3 = new ExpressionBinaire(new Multiplication(),
				new Constante(7),
				this.e1) ;

		// (x + y) + z
		this.e4 = new ExpressionBinaire(new Addition(),
				new ExpressionBinaire(new Addition(),
					new AccesVariable("x"), new AccesVariable("y")),
				new AccesVariable("z"));

		// x + (y + z)
		this.e5 = new ExpressionBinaire(new Addition(),
				new AccesVariable("x"),
				new ExpressionBinaire(new Addition(),
					new AccesVariable("y"), new AccesVariable("z")));

		// - - (2 + x)
		this.e6 = new ExpressionUnaire(new Negation(),
				new ExpressionUnaire(new Negation(),
					this.e1));
	}

}

