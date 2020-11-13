package TP1;

/**
  * Visiteur sur une expression arithmétique.
  *
  * @author	Xavier Crégut
  * @version	$Revision$
  */
public interface VisiteurExpression<R> {

	/** Visiter un accès à une variable.
	  * @param v l'accès à une variable à visiter
	  */
	R visiterAccesVariable(AccesVariable v);

	/** Visiter une constante.
	  * @param c la constante à visiter
	  */
	R visiterConstante(Constante c);

	/** Visiter une expression binaire.
	  * @param e l'expression binaire à visiter
	  */
	R visiterExpressionBinaire(ExpressionBinaire e);

	/** Visiter l'opérateur binaire addition.
	  * @param a l'opérateur à visiter
	  */
	R visiterAddition(Addition a);

	/** Visiter l'opérateur binaire multiplication.
	  * @param m l'opérateur à visiter
	  */
	R visiterMultiplication(Multiplication m);

	/** Visiter une expression unaire.
	  * @param v l'expression unaire à visiter
	  */
	R visiterExpressionUnaire(ExpressionUnaire e);

	/** Visiter un opérateur unaire négation.
	  * @param n l'opérateur unaire à visiter
	  */
	R visiterNegation(Negation n);

}
