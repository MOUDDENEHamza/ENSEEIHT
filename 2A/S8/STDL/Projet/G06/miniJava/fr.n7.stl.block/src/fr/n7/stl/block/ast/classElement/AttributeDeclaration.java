package fr.n7.stl.block.ast.classElement;

import fr.n7.stl.block.ast.expression.Expression;
import fr.n7.stl.block.ast.scope.Declaration;
import fr.n7.stl.block.ast.scope.HierarchicalScope;
import fr.n7.stl.block.ast.type.PartialType;
import fr.n7.stl.block.ast.type.Type;
import fr.n7.stl.tam.ast.Fragment;
import fr.n7.stl.tam.ast.Register;
import fr.n7.stl.tam.ast.TAMFactory;
import fr.n7.stl.util.Pair;

public class AttributeDeclaration implements ClassElement {

    protected AccessRight accessRight;

    protected String state; 

    protected Type type;
    
    protected Pair<String,PartialType> identifiant;

    protected Expression valeur;

    public AttributeDeclaration(AccessRight _accessRight, String _state, Type _type, Pair<String,PartialType> _identifiant, Expression _valeur) {
        this.accessRight = _accessRight;
        this.state = _state;
        this.type = _type;
        this.identifiant = _identifiant;
        this.valeur = _valeur;
    }

    public AttributeDeclaration(Type _type) {
        this.type = _type;
    }

    public String toString() {
        String _result = /*this.accessRight.toString() this.state +*/ this.type.toString() /*this.identifiant*/;
        if (this.valeur != null) {
            _result += this.valeur.toString();
        }
        return _result + ";";
    }
    
    @Override
    public boolean collectAndBackwardResolve(HierarchicalScope<Declaration> _scope) {
        // TODO Auto-generated method stub
        return false;
    }

    @Override
    public boolean fullResolve(HierarchicalScope<Declaration> _scope) {
        // TODO Auto-generated method stub
        return false;
    }

    @Override
    public boolean checkType() {
        // TODO Auto-generated method stub
        return false;
    }

    @Override
    public int allocateMemory(Register _register, int _offset) {
        // TODO Auto-generated method stub
        return 0;
    }

    @Override
    public Fragment getCode(TAMFactory _factory) {
        // TODO Auto-generated method stub
        return null;
    }
    
}
