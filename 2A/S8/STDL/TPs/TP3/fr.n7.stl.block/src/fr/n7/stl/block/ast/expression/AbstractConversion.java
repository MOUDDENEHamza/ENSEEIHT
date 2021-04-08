/**
 * 
 */
package fr.n7.stl.block.ast.expression;

import fr.n7.stl.block.ast.instruction.declaration.TypeDeclaration;
import fr.n7.stl.block.ast.scope.Declaration;
import fr.n7.stl.block.ast.scope.HierarchicalScope;
import fr.n7.stl.block.ast.type.AtomicType;
import fr.n7.stl.block.ast.type.NamedType;
import fr.n7.stl.block.ast.type.Type;
import fr.n7.stl.tam.ast.Fragment;
import fr.n7.stl.tam.ast.TAMFactory;
import fr.n7.stl.util.Logger;

/**
 * Common elements between left (Assignable) and right (Expression) end sides of assignments. These elements
 * share attributes, toString and getType methods.
 * @author Marc Pantel
 *
 */
public abstract class AbstractConversion<TargetType> implements Expression {

	protected TargetType target;
	protected Type type;
	protected String name;

	public AbstractConversion(TargetType _target, String _type) {
		this.target = _target;
		this.name = _type;
		this.type = null;
	}
	
	public AbstractConversion(TargetType _target, Type _type) {
		this.target = _target;
		this.name = null;
		this.type = _type;
	}
	
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	public String toString() {
		if (this.type == null) {
			return "(" + this.name + ") " + this.target;
		} else {
			return "(" + this.type + ") " + this.target;
		}
	}

	/* (non-Javadoc)
	 * @see fr.n7.stl.block.ast.Expression#getType()
	 */
	@Override
	public Type getType() {
		Type _result;
		if (this.type.compatibleWith(((Expression) this.target).getType())) {
			_result = this.type.merge(((Expression) this.target).getType());
		} else {
			Logger.error(((Expression) this.target).getType().toString() + " is not compatible with " + this.type.toString());
			_result = AtomicType.ErrorType;
		}
		return _result;
	}
	
	/* (non-Javadoc)
	 * @see fr.n7.stl.block.ast.expression.Expression#collect(fr.n7.stl.block.ast.scope.Scope)
	 */
	@Override
	public boolean collectAndBackwardResolve(HierarchicalScope<Declaration> _scope) {
		boolean _result = true;
		if (((Expression) this.target).collectAndBackwardResolve(_scope)) {
			if (this.type == null && _scope.get(this.name) instanceof TypeDeclaration 
					&& ((TypeDeclaration) _scope.get(this.name)).getType() instanceof NamedType) {
			this.type = (NamedType) ((TypeDeclaration) _scope.get(this.name)).getType();
				_result = true;
			} else {
				_result = false;
			}
		} else {
			_result = false;
		}
		return _result;
	}

	/* (non-Javadoc)
	 * @see fr.n7.stl.block.ast.expression.Expression#resolve(fr.n7.stl.block.ast.scope.Scope)
	 */
	@Override
	public boolean fullResolve(HierarchicalScope<Declaration> _scope) {
		boolean _result = true;
		if (((Expression) this.target).fullResolve(_scope)) {
			if (this.type == null && _scope.get(this.name) instanceof TypeDeclaration 
					&& ((TypeDeclaration) _scope.get(this.name)).getType() instanceof NamedType) {
			this.type = (NamedType) ((TypeDeclaration) _scope.get(this.name)).getType();
				_result = true;
			} else {
				_result = false;
			}
		} else {
			_result = false;
		}
		return _result;
	}

	/* (non-Javadoc)
	 * @see fr.n7.stl.block.ast.Expression#getCode(fr.n7.stl.tam.ast.TAMFactory)
	 */
	@Override
	public Fragment getCode(TAMFactory _factory) {
		Fragment _result = _factory.createFragment();
		_result.append(((Expression) this.target).getCode(_factory));
		return _result;
	}

}
