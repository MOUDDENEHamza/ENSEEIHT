/**
  * Expression binaire avec donc deux opérandes droit et gauche et un opérateur
  * binaire.
  *
  * @author	Xavier Crégut
  * @version	$Revision$
  * @composed 1 "" "operateur" OperateurBinaire
  * @has 1 - "gauche" Expression
  * @has 1 - "droite" Expression
  */
public class ExpressionBinaire implements Expression {

	private Expression operandegauche;
	private Expression operandedroite;
	private OperateurBinaire operateur;

	public ExpressionBinaire(OperateurBinaire op, Expression gauche, Expression droite)
	{
		this.operateur = op;
		this.operandegauche = gauche;
		this.operandedroite = droite;
	}

	public Expression getOperandeGauche() {
		return this.operandegauche;
	}

	public Expression getOperandeDroite() {
		return this.operandedroite;
	}

	public OperateurBinaire getOperateur() {
		return this.operateur;
	}


}
