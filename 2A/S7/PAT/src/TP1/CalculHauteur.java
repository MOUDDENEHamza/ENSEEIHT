package TP1;

public class CalculHauteur implements VisiteurExpression<Integer> {


    @Override
    public Integer visiterAccesVariable(AccesVariable v) {
        return 1;
    }

    @Override
    public Integer visiterConstante(Constante c) {
        return 1;
    }

    @Override
    public Integer visiterExpressionBinaire(ExpressionBinaire e) {
        return 1 + Math.max(e.getOperandeGauche().accepter(this), e.getOperandeDroite().accepter(this));
    }

    @Override
    public Integer visiterAddition(Addition a) {
        return 1;
    }

    @Override
    public Integer visiterMultiplication(Multiplication m) {
        return 1;
    }

    @Override
    public Integer visiterExpressionUnaire(ExpressionUnaire e) {
        return  1 + e.getOperande().accepter(this);
    }

    @Override
    public Integer visiterNegation(Negation n) {
        return 1 + n.accepter(this);
    }

    @Override
    public Integer visiterSoustraction(ExpressionBinaire e) {
        return 1 + Math.max(e.getOperandeGauche().accepter(this), e.getOperandeDroite().accepter(this));
    }

    @Override
    public Integer visiterLetIn(LetIn e) {
        return 1 + Math.max(e.getEEval().accepter(this), e.getEFinal().accepter(this));
    }
}
