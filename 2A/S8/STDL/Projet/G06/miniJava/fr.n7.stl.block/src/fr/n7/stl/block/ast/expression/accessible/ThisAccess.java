package fr.n7.stl.block.ast.expression.accessible;

import fr.n7.stl.block.ast.SemanticsUndefinedException;
import fr.n7.stl.block.ast.element.ClassDeclaration;
import fr.n7.stl.block.ast.expression.AbstractAccess;
import fr.n7.stl.block.ast.scope.Declaration;
import fr.n7.stl.tam.ast.Fragment;
import fr.n7.stl.tam.ast.TAMFactory;

public class ThisAccess extends AbstractAccess {

    protected ClassDeclaration declaration;

    public ThisAccess(ClassDeclaration _declaration) {
        this.declaration = _declaration;
    }

    @Override
    protected Declaration getDeclaration() {
        return this.declaration;
    }

    public ClassDeclaration getClassDeclaration() {
        return this.declaration;
    }

    @Override
    public Fragment getCode(TAMFactory _factory) {
        throw new SemanticsUndefinedException("getCode thisAccess");
    }

}
