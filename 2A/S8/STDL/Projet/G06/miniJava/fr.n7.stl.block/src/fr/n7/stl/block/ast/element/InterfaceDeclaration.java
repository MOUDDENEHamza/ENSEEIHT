package fr.n7.stl.block.ast.element;

import fr.n7.stl.block.ast.scope.Declaration;
import fr.n7.stl.block.ast.scope.HierarchicalScope;
import fr.n7.stl.tam.ast.Fragment;
import fr.n7.stl.tam.ast.Register;
import fr.n7.stl.tam.ast.TAMFactory;

public class InterfaceDeclaration implements Element {

    @Override
    public boolean collect(HierarchicalScope<Declaration> _scope) {
        // TODO Auto-generated method stub
        return false;
    }

    @Override
    public boolean resolve(HierarchicalScope<Declaration> _scope) {
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
