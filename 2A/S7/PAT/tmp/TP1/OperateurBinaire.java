package TP1;

/**
  * Opérateur binaire.
  *
  * @author	Xavier Crégut
  * @version	$Revision$
  */
public interface OperateurBinaire {

	<R> R accepter(VisiteurExpression<R> visiteur);

}
