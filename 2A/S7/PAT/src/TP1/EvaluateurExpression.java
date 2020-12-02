package TP1;

import java.util.HashMap;

public class EvaluateurExpression implements VisiteurExpression<Integer> {

    private HashMap<String, Integer> map;
    private Integer gauche, droite;

    public EvaluateurExpression(HashMap<String, Integer> environnement) {
        this.map = environnement;
    }

    @Override
    public Integer visiterAccesVariable(AccesVariable v) {
        return this.map.get(v.getNom());
    }

    @Override
    public Integer visiterConstante(Constante c) {
        return this.map.get(c.getValeur());
    }

    @Override
    public Integer visiterExpressionBinaire(ExpressionBinaire e) {
        Integer tmp = e.getOperandeGauche().accepter(this);
        droite = e.getOperandeDroite().accepter(this);
        gauche = tmp;
        return e.getOperateur().accepter(this);
    }

    @Override
    public Integer visiterAddition(Addition a) {
        return gauche + droite;
    }

    @Override
    public Integer visiterMultiplication(Multiplication m) {
        return gauche * droite;
    }

    @Override
    public Integer visiterExpressionUnaire(ExpressionUnaire e) {
        gauche = e.getOperande().accepter(this);
        return e.getOperateur().accepter(this);
    }

    @Override
    public Integer visiterNegation(Negation n) {
        return - gauche;
    }

    @Override
    public Integer visiterSoustraction(ExpressionBinaire e) {
        return gauche - droite;
    }

    @Override
    public Integer visiterLetIn(LetIn e) {
        String ident = new String(e.getIdent());
        this.map.put(ident, e.getEEval().accepter(this));
        int tmp = e.getEFinal().accepter(this);
        return tmp;
    }

}
