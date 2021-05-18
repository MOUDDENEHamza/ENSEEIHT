/**
 * 
 */
package fr.n7.stl.block.ast.expression;

import fr.n7.stl.block.ast.SemanticsUndefinedException;
import fr.n7.stl.block.ast.scope.Declaration;
import fr.n7.stl.block.ast.scope.HierarchicalScope;
import fr.n7.stl.block.ast.type.AtomicType;
import fr.n7.stl.block.ast.type.CoupleType;
import fr.n7.stl.block.ast.type.Type;
import fr.n7.stl.tam.ast.Fragment;
import fr.n7.stl.tam.ast.TAMFactory;
import fr.n7.stl.util.Logger;

/**
 * Implementation of the Abstract Syntax Tree node  for an expression extracting the second component in a couple.
 * @author Marc Pantel
 *
 */
public class Second implements Expression {

	/**
	 * AST node for the expression whose value must whose second element is extracted by the expression.
	 */
	private Expression target;
	
	/**
	 * Builds an Abstract Syntax Tree node for an expression extracting the second component of a couple.
	 * @param _target : AST node for the expression whose value must whose second element is extracted by the expression.
	 */
	public Second(Expression _target) {
		this.target = _target;
	}
	
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	public String toString() {
		return "(snd" + this.target + ")";
	}

	/* (non-Javadoc)
	 * @see fr.n7.stl.block.ast.Expression#getType()
	 */
	@Override
	public Type getType() {
		if (this.target.getType() instanceof CoupleType) {
			CoupleType type = (CoupleType)this.target.getType();
			return type.getSecond();
		} else {
			Logger.error(this.target + "is not of Couple Type.");
			return AtomicType.ErrorType;
		}
	}
	
	/* (non-Javadoc)
	 * @see fr.n7.stl.block.ast.expression.Expression#collect(fr.n7.stl.block.ast.scope.Scope)
	 */
	@Override
	public boolean collectAndBackwardResolve(HierarchicalScope<Declaration> _scope) {
		return this.target.collectAndBackwardResolve(_scope);

	}

	/* (non-Javadoc)
	 * @see fr.n7.stl.block.ast.expression.Expression#resolve(fr.n7.stl.block.ast.scope.Scope)
	 */
	@Override
	public boolean fullResolve(HierarchicalScope<Declaration> _scope) {
		return this.target.fullResolve(_scope);
	}

	/* (non-Javadoc)
	 * @see fr.n7.stl.block.ast.Expression#getCode(fr.n7.stl.tam.ast.TAMFactory)
	 */
	@Override
	public Fragment getCode(TAMFactory _factory) {
		Fragment _result = _factory.createFragment();
		CoupleType couple_type = (CoupleType)this.target.getType();
		//LOAD (2) 0[SB], copie du contenue du couple
		_result.append(this.target.getCode(_factory));
		//POP le first
		_result.add(_factory.createPop(0, couple_type.getFirst().length()));
		return _result;
	}

}
