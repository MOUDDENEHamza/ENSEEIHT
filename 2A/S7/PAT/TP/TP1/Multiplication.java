package TP1;

/**
  * Opérateur binaire de multiplication.
  *
  * @author	Xavier Crégut
  * @version	$Revision$
  */
public class Multiplication implements OperateurBinaire {

	public <R> R accepter(VisiteurExpression<R> visiteur) {
		return visiteur.visiterMultiplication(this);
	}

}
