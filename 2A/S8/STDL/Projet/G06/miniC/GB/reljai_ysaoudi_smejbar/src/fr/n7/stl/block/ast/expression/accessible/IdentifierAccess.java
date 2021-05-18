/**
 * 
 */
package fr.n7.stl.block.ast.expression.accessible;

import fr.n7.stl.block.ast.expression.AbstractIdentifier;
import fr.n7.stl.block.ast.SemanticsUndefinedException;
import fr.n7.stl.block.ast.expression.AbstractAccess;
import fr.n7.stl.block.ast.instruction.declaration.ConstantDeclaration;
import fr.n7.stl.block.ast.instruction.declaration.ParameterDeclaration;
import fr.n7.stl.block.ast.instruction.declaration.VariableDeclaration;
import fr.n7.stl.block.ast.scope.Declaration;
import fr.n7.stl.block.ast.scope.HierarchicalScope;
import fr.n7.stl.block.ast.type.Type;
import fr.n7.stl.tam.ast.Fragment;
import fr.n7.stl.tam.ast.TAMFactory;
import fr.n7.stl.util.Logger;

/**
 * Implementation of the Abstract Syntax Tree node for an identifier access expression (can be a variable,
 * a parameter, a constant, a function, ...).
 * Will be connected to an appropriate object after resolving the identifier to know to which kind of element
 * it is associated (variable, parameter, constant, function, ...).
 * @author Marc Pantel
 * TODO : Should also hold a function and not only a variable.
 */
public class IdentifierAccess extends AbstractIdentifier implements AccessibleExpression {
	
	protected AbstractAccess expression;
	
	/**
	 * Creates a variable use expression Abstract Syntax Tree node.
	 * @param _name Name of the used variable.
	 */
	public IdentifierAccess(String _name) {
		super(_name);
	}
	
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override 
	public String toString() {
		return this.name;
	}
	
	/* (non-Javadoc)
	 * @see fr.n7.stl.block.ast.expression.Expression#collect(fr.n7.stl.block.ast.scope.HierarchicalScope)
	 */
	@Override
	public boolean collectAndBackwardResolve(HierarchicalScope<Declaration> _scope) {
		/* This is the backward resolve part. */
		if (((HierarchicalScope<Declaration>)_scope).knows(this.name)) {
			Declaration _declaration = _scope.get(this.name);
			/* These kinds are handled by partial resolve. */
			if (_declaration instanceof VariableDeclaration) {
				this.expression = new VariableAccess((VariableDeclaration) _declaration);
			}
		}
		return true;
	}
	
	/* (non-Javadoc)
	 * @see fr.n7.stl.block.ast.expression.Expression#resolve(fr.n7.stl.block.ast.scope.HierarchicalScope)
	 */
	@Override
	public boolean fullResolve(HierarchicalScope<Declaration> _scope) {
		/* This is the full resolve part that complements the backward resolve. */
		/* If the resolution has not been done by the backward resolve */
		if  (this.expression == null) {
			if (((HierarchicalScope<Declaration>)_scope).knows(this.name)) {
				Declaration _declaration = _scope.get(this.name);
				/* This kind should have been handled by partial resolve. */
				if (_declaration instanceof VariableDeclaration) {
					this.expression = new VariableAccess((VariableDeclaration) _declaration);
					return true;
				} else {
					/* These kinds are handled by full resolve. */
					if (_declaration instanceof ConstantDeclaration) {
						// TODO : refactor the management of Constants
						this.expression = new ConstantAccess((ConstantDeclaration) _declaration);
						return true;
					} else if (_declaration instanceof ParameterDeclaration) {
						this.expression = new ParameterAccess((ParameterDeclaration) _declaration);
						return true;
					} else {
						Logger.error("The declaration for " + this.name + " is of the wrong kind.");
						return false;
					}
				}
			} else {
				Logger.error("The identifier " + this.name + " has not been found.");
				return false;	
			}
		} else {  /* The resolution has been done previously */
			return true;
		}
	}
	
	/* (non-Javadoc)
	 * @see fr.n7.stl.block.ast.Expression#getType()
	 */
	@Override
	public Type getType() {
		if (this.expression != null) {
			return this.expression.getType();
		} else {
			throw new SemanticsUndefinedException( "Collect and Resolve have probably not been implemented correctly. The identifier " + this.name + " has not been resolved.");
		}
	}

	/* (non-Javadoc)
	 * @see fr.n7.stl.block.ast.Expression#getCode(fr.n7.stl.tam.ast.TAMFactory)
	 */
	@Override
	public Fragment getCode(TAMFactory _factory) {
		return this.expression.getCode(_factory);
	}

}