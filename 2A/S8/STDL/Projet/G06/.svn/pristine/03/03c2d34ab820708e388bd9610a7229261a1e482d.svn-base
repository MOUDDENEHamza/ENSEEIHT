/**
 * 
 */
package fr.n7.stl.block.ast.expression.assignable;

import fr.n7.stl.block.ast.expression.AbstractIdentifier;
import fr.n7.stl.block.ast.instruction.declaration.VariableDeclaration;
import fr.n7.stl.block.ast.scope.Declaration;
import fr.n7.stl.block.ast.scope.HierarchicalScope;
import fr.n7.stl.block.ast.type.Type;
import fr.n7.stl.tam.ast.Fragment;
import fr.n7.stl.tam.ast.TAMFactory;
import fr.n7.stl.util.Logger;

/**
 * Abstract Syntax Tree node for an expression whose computation assigns a
 * variable.
 * 
 * @author Marc Pantel
 *
 */
public class VariableAssignment extends AbstractIdentifier implements AssignableExpression {

	protected VariableDeclaration declaration;

	/**
	 * Creates a variable assignment expression Abstract Syntax Tree node.
	 * 
	 * @param _name Name of the assigned variable.
	 */
	public VariableAssignment(String _name) {
		super(_name);
	}

	public VariableDeclaration getDeclaration() {
		return this.declaration;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * fr.n7.stl.block.ast.expression.AbstractIdentifier#collect(fr.n7.stl.block.ast
	 * .scope.HierarchicalScope)
	 */
	@Override
	public boolean collectAndBackwardResolve(HierarchicalScope<Declaration> _scope) {
		return true;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * fr.n7.stl.block.ast.expression.AbstractIdentifier#resolve(fr.n7.stl.block.ast
	 * .scope.HierarchicalScope)
	 */
	@Override
	public boolean fullResolve(HierarchicalScope<Declaration> _scope) {
		if (((HierarchicalScope<Declaration>) _scope).knows(this.name)) {
			Declaration _declaration = _scope.get(this.name);
			if (_declaration instanceof VariableDeclaration) {
				this.declaration = ((VariableDeclaration) _declaration);
				return true;
			} else {
				Logger.error("The declaration for " + this.name + " is of the wrong kind.");
				return false;
			}
		} else {
			Logger.error("The identifier " + this.name + " has not been found.");
			return false;
		}
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see fr.n7.stl.block.ast.impl.VariableUseImpl#getType()
	 */
	@Override
	public Type getType() {
		return this.declaration.getType();
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see fr.n7.stl.block.ast.impl.VariableUseImpl#getCode(fr.n7.stl.tam.ast.
	 * TAMFactory)
	 */
	@Override
	public Fragment getCode(TAMFactory _factory) {
		Fragment _result = _factory.createFragment();
		_result.add(_factory.createStore(this.declaration.getRegister(), this.declaration.getOffset(),
				this.getType().length()));
		return _result;
	}

}
