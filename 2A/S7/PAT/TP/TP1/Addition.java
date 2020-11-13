package TP1;

/**
  * Opérateur binaire d'addition.
  *
  * @author	Xavier Crégut
  * @version	$Revision$
  */
public class Addition implements OperateurBinaire {

	public <R> R accepter(VisiteurExpression<R> visiteur) {
		return visiteur.visiterAddition(this);
	}

}
