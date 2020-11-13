package TP1;

/**
  * Opérateur unaire correspondant à la négation.
  *
  * @author	Xavier Crégut
  * @version	$Revision$
  */

public class Negation implements OperateurUnaire {

	public <R> R accepter(VisiteurExpression<R> visiteur) {
		return visiteur.visiterNegation(this);
	}

}
