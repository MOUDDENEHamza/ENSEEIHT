package TP1;

/** Afficheur infixe, complètement parenthésé, d'une expression arithmétique.
  *
  * @author	Xavier Crégut
  * @version	$Revision$
  */
public class AfficheurInfixe implements VisiteurExpression<String> {

	public String visiterAccesVariable(AccesVariable v) {
		return "(" + v.getNom() + ")";
	}

	public String visiterConstante(Constante c) {
		return "(" + String.valueOf(c.getValeur()) + ")";
	}

	public String visiterExpressionBinaire(ExpressionBinaire e) {
		return "(" + e.getOperandeGauche().accepter(this)
			+ " " + e.getOperateur().accepter(this)
			+ " " + e.getOperandeDroite().accepter(this)
			+ ")" ;
	}

	public String visiterAddition(Addition a) {
		return "+";
	}

	public String visiterMultiplication(Multiplication m) {
		return "*";
	}

	public String visiterExpressionUnaire(ExpressionUnaire e) {
		return "(" + e.getOperateur().accepter(this)
			+ " " + e.getOperande().accepter(this) + ")";
	}

	public String visiterNegation(Negation n) {
		return "-";
	}

	@Override
	public String visiterSoustraction(ExpressionBinaire e) {
		return "(" + e.getOperandeGauche().accepter(this)
				+ " " + e.getOperateur().accepter(this)
				+ " " + e.getOperandeDroite().accepter(this)
				+ ")" ;
	}

	@Override
	public String visiterLetIn(LetIn e) {
		return "(let " + e.getIdent() + " = " + e.getEEval().accepter(this) + " in " +
				e.getEFinal().accepter(this) + ")";
	}

}
