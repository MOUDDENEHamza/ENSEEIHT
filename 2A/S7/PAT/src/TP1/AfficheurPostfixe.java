package TP1;

public class AfficheurPostfixe implements VisiteurExpression<String> {

    public String visiterAccesVariable(AccesVariable v) {
        return "(" + v.getNom() + ")";
    }

    public String visiterConstante(Constante c) {
        return "(" + String.valueOf(c.getValeur()) + ")";
    }

    public String visiterExpressionBinaire(ExpressionBinaire e) {
        return "(" + e.getOperandeGauche().accepter(this) + " " + e.getOperandeDroite().accepter(this)
                + " " + e.getOperateur().accepter(this) + ")";
    }

    public String visiterAddition(Addition a) {
        return "+";
    }

    public String visiterMultiplication(Multiplication m) {
        return "*";
    }

    public String visiterExpressionUnaire(ExpressionUnaire e) {
        return "("  + e.getOperande().accepter(this) + " " + e.getOperateur().accepter(this) + ")";
    }

    public String visiterNegation(Negation n) {
        return "-";
    }

    @Override
    public String visiterSoustraction(ExpressionBinaire e) {
        return "(" + e.getOperandeGauche().accepter(this) + " " + e.getOperandeDroite().accepter(this)
                + " " + e.getOperateur().accepter(this) + ")";
    }

    @Override
    public String visiterLetIn(LetIn e) {
        return "(" + e.getEEval() + " " + e.getIdent() + " ni " + e.getEFinal().accepter(this) + " tel )";
    }
}
