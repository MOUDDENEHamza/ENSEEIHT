/**
 * 
 */
package fr.n7.stl.block.ast.expression.allocation;

import fr.n7.stl.block.ast.SemanticsUndefinedException;
import fr.n7.stl.block.ast.expression.Expression;
import fr.n7.stl.block.ast.scope.Declaration;
import fr.n7.stl.block.ast.scope.HierarchicalScope;
import fr.n7.stl.block.ast.type.PointerType;
import fr.n7.stl.block.ast.type.Type;
import fr.n7.stl.tam.ast.Fragment;
import fr.n7.stl.tam.ast.TAMFactory;

/**
 * @author Marc Pantel
 *
 */
public class PointerAllocation implements Expression {

	protected Type element;

	public PointerAllocation(Type _element) {
		this.element = _element;
	}
	
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "new " + this.element; 
	}
	
	/* (non-Javadoc)
     * @see fr.n7.stl.block.ast.expression.Expression#collect(fr.n7.stl.block.ast.scope.Scope)
     */
    @Override
    public boolean collectAndBackwardResolve(HierarchicalScope<Declaration> _scope) {
        //throw new SemanticsUndefinedException( "Semantics collect is undefined in PointerAllocation.");
        return true;
    }

    /* (non-Javadoc)
     * @see fr.n7.stl.block.ast.expression.Expression#resolve(fr.n7.stl.block.ast.scope.Scope)
     */
    @Override
    public boolean fullResolve(HierarchicalScope<Declaration> _scope) {
        //throw new SemanticsUndefinedException( "Semantics resolve is undefined in PointerAllocation.");
        return this.element.resolve(_scope);
    }

    /* (non-Javadoc)
     * @see fr.n7.stl.block.ast.Expression#getType()
     */
    @Override
    public Type getType() {
        return new PointerType(element);
    }

	/* (non-Javadoc)
	 * @see fr.n7.stl.block.ast.Expression#getCode(fr.n7.stl.tam.ast.TAMFactory)
	 */
	@Override
	public Fragment getCode(TAMFactory _factory) {
		Fragment _result = _factory.createFragment();
        _result.add(_factory.createLoadL(this.element.length()));
        _result.add(TAMFactory.createMalloc());
        return _result;
	}

}
