/**
  * Expression unaire avec un opérateur unaire appliqué sur un opérande.
  *
  * @author	Xavier Crégut
  * @version	$Revision$
  * @composed 1 "" "operateur" OperateurUnaire
  * @has 1 "" "operande" Expression
  */
public class ExpressionUnaire implements Expression {

	private Expression operande;
	private OperateurUnaire operateur;

	public ExpressionUnaire(OperateurUnaire operateur, Expression operande)
	{
		this.operande = operande;
		this.operateur = operateur;
	}

	public Expression getOperande() {
		return this.operande;
	}

	public OperateurUnaire getOperateur() {
		return this.operateur;
	}


}
