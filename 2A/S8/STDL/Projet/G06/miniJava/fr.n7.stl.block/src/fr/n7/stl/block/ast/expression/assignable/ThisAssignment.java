package fr.n7.stl.block.ast.expression.assignable;

import fr.n7.stl.block.ast.SemanticsUndefinedException;
import fr.n7.stl.block.ast.element.ClassDeclaration;
import fr.n7.stl.block.ast.expression.AbstractIdentifier;
import fr.n7.stl.block.ast.scope.Declaration;
import fr.n7.stl.block.ast.scope.HierarchicalScope;
import fr.n7.stl.block.ast.scope.SymbolTable;
import fr.n7.stl.block.ast.type.Instance;
import fr.n7.stl.block.ast.type.Type;
import fr.n7.stl.tam.ast.Fragment;
import fr.n7.stl.tam.ast.TAMFactory;
import fr.n7.stl.util.Logger;

public class ThisAssignment extends AbstractIdentifier implements AssignableExpression {

    protected ClassDeclaration declaration;

    public ThisAssignment(String _name) {
        super(_name);
    }

    @Override
    public boolean collectAndBackwardResolve(HierarchicalScope<Declaration> _scope) {
        return true;
    }

    @Override
    public boolean fullResolve(HierarchicalScope<Declaration> _scope) {
        if (SymbolTable.classDeclaration != null) {
            this.declaration = SymbolTable.classDeclaration;
            return true;
        } else {
            Logger.error("The identifier this isn't defined");
            return false;
        }
    }

    @Override
    public Type getType() {
        return new Instance(this.name);
    }

    @Override
    public Fragment getCode(TAMFactory _factory) {
        Fragment _result = _factory.createFragment();
		return _result;
    }

}
