/**
 * 
 */
package fr.n7.stl.block.ast.type;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import fr.n7.stl.block.ast.SemanticsUndefinedException;
import fr.n7.stl.block.ast.scope.Declaration;
import fr.n7.stl.block.ast.scope.HierarchicalScope;
import fr.n7.stl.util.Logger;

/**
 * Implementation of the Abstract Syntax Tree node for a function type.
 * @author Marc Pantel
 *
 */
public class FunctionType implements Type {

	private Type result;
	private List<Type> parameters;

	public FunctionType(Type _result, Iterable<Type> _parameters) {
		this.result = _result;
		this.parameters = new LinkedList<Type>();
		for (Type _type : _parameters) {
			this.parameters.add(_type);
		}
	}

	/* (non-Javadoc)
	 * @see fr.n7.stl.block.ast.Type#equalsTo(fr.n7.stl.block.ast.Type)
	 */
	@Override
	public boolean equalsTo(Type _other) {
		boolean _result = true;
		if (_other instanceof FunctionType) {
			if (((FunctionType) _other).result.equalsTo(this.result)) {
				if (((FunctionType) _other).parameters.size() == this.parameters.size()) {
					for (int i = 0; i < this.parameters.size(); i++) {
						_result = _result && this.parameters.get(i).equalsTo(((FunctionType) _other).parameters.get(i));
					}
				} else {
					Logger.error(((FunctionType)_other).parameters + " has not the same size of FunctionType parameters.");
					_result = false;
				}
			} else {
				Logger.error(((FunctionType)_other) + " has not the same result of FunctionType.");
				_result = false;
			}
		} else {
			Logger.error(_other + " is not instance of FunctionType.");
			_result = false;
		}
		return _result;
	}

	/* (non-Javadoc)
	 * @see fr.n7.stl.block.ast.Type#compatibleWith(fr.n7.stl.block.ast.Type)
	 */
	@Override
	public boolean compatibleWith(Type _other) {
		boolean _result = true;
		if (((FunctionType) _other).result.compatibleWith(this.result)) {
			if (((FunctionType) _other).parameters.size() == this.parameters.size()) {
				for (int i = 0; i < this.parameters.size(); i++) {
					_result = _result && this.parameters.get(i).compatibleWith(((FunctionType) _other).parameters.get(i));
				}
			} else {
				Logger.error(((FunctionType)_other).parameters + " has not the same size of FunctionType parameters.");
				_result = false;
			}
		} else {
			Logger.error(((FunctionType)_other).result + " is not compatible with result of FunctionType.");
			_result = false;
		}
		return _result;
	}

	/* (non-Javadoc)
	 * @see fr.n7.stl.block.ast.Type#merge(fr.n7.stl.block.ast.Type)
	 */
	@Override
	public Type merge(Type _other) {
		Type _result;
		if (_other instanceof FunctionType) {
			_result = this;
		} else {
			Logger.error(_other + " has not the same type of " + this + ".");
			_result =  AtomicType.ErrorType;
		}
		return _result;
	}

	/* (non-Javadoc)
	 * @see fr.n7.stl.block.ast.Type#length(int)
	 */
	@Override
	public int length() {
		return this.result.length();
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		String _result = "(";
		Iterator<Type> _iter = this.parameters.iterator();
		if (_iter.hasNext()) {
			_result += _iter.next();
			while (_iter.hasNext()) {
				_result += " ," + _iter.next();
			}
		}
		return _result + ") -> " + this.result;
	}
	
	/* (non-Javadoc)
	 * @see fr.n7.stl.block.ast.type.Type#resolve(fr.n7.stl.block.ast.scope.Scope)
	 */
	@Override
	public boolean resolve(HierarchicalScope<Declaration> _scope) {
		boolean _result = this.result.resolve(_scope);
		for (Type _parameter : this.parameters) {
			_result = _result && _parameter.resolve(_scope);
		}
		return _result;
	}

}
