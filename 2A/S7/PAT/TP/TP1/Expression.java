package TP1;

/**
  * Expression entière.
  *
  * @author	Xavier Crégut
  * @version	$Revision$
  */

public interface Expression {

	/** Accepter un visiteur.
	 * @param visiteur le visiteur accepté
	 */
	<R> R accepter(VisiteurExpression<R> visiteur);

}
