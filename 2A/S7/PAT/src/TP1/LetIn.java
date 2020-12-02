package TP1;

public class LetIn implements Expression {

    private String ident;
    private Expression eEval;
    private Expression eFinal;

    public LetIn(String ident, Expression eEval, Expression eFinal) {
        this.ident = ident;
        this.eEval = eEval;
        this.eFinal = eFinal;
    }

    public String getIdent() {
        return this.ident;
    }

    public Expression getEEval() {
        return this.eEval;
    }

    public Expression getEFinal() {
        return this.eFinal;
    }

    public <R> R accepter(VisiteurExpression<R> visiteur) {
        return visiteur.visiterLetIn(this);
    }

}
