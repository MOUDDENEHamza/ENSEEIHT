/**
 * 
 */
package fr.n7.stl.block.ast.type;

import java.util.Iterator;
import java.util.List;

import fr.n7.stl.block.ast.scope.Declaration;
import fr.n7.stl.block.ast.scope.HierarchicalScope;
import fr.n7.stl.block.ast.type.declaration.LabelDeclaration;
import fr.n7.stl.util.Logger;

/**
 * @author Marc Pantel
 *
 */
public class EnumerationType implements Type, Declaration {
	
	private String name;
	
	private List<LabelDeclaration> labels;

	/**
	 * 
	 */
	public EnumerationType(String _name, List<LabelDeclaration> _labels) {
		this.name = _name;
		this.labels = _labels;
	}
	
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		String _result = "enum" + this.name + " { ";
		Iterator<LabelDeclaration> _iter = this.labels.iterator();
		if (_iter.hasNext()) {
			_result += _iter.next();
			while (_iter.hasNext()) {
				_result += " ," + _iter.next();
			}
		}
		return _result + " }";
	}

	/* (non-Javadoc)
	 * @see fr.n7.stl.block.ast.type.Type#equalsTo(fr.n7.stl.block.ast.type.Type)
	 */
	@Override
	public boolean equalsTo(Type _other) {
		boolean _result = true;
		if (_other instanceof EnumerationType) {
			EnumerationType _local = (EnumerationType) _other;
			if (this.getName().equals(_local.getName()) && this.labels.size() == _local.labels.size()) {
				for (int i = 0; i < this.labels.size(); i++) {
					if (!this.labels.get(i).getName().equals(_local.labels.get(i).getName()) 
					|| !this.labels.get(i).getType().equals(_local.labels.get(i).getType())) {
						Logger.error(_other + " has not the same labes of " + this + ".");
						_result = false;
						break;
					}
				}
			} else {
				Logger.error(_other + " has not the same name of " + this + ".");
				_result = false;	
			}
		} else {
			Logger.error(_other + " is not an instance of EnumerationType.");
			_result = false;
		}
		return _result;
	}

	/* (non-Javadoc)
	 * @see fr.n7.stl.block.ast.type.Type#compatibleWith(fr.n7.stl.block.ast.type.Type)
	 */
	@Override
	public boolean compatibleWith(Type _other) {
		boolean _result;
		_result = _other instanceof EnumerationType;
		return _result;
	}

	/* (non-Javadoc)
	 * @see fr.n7.stl.block.ast.type.Type#merge(fr.n7.stl.block.ast.type.Type)
	 */
	@Override
	public Type merge(Type _other) {
		Type _result;
		if (_other instanceof EnumerationType) {
			_result = this;
		} else {
			Logger.error(_other + " has not the same type of " + this + ".");
			_result =  AtomicType.ErrorType;
		}
		return _result;
	}

	/* (non-Javadoc)
	 * @see fr.n7.stl.block.ast.type.Type#length()
	 */
	@Override
	public int length() {
		return 0;
	}
	
	/* (non-Javadoc)
	 * @see fr.n7.stl.block.ast.type.Type#resolve(fr.n7.stl.block.ast.scope.Scope)
	 */
	@Override
	public boolean resolve(HierarchicalScope<Declaration> _scope) {
		boolean _result = true;
		return _result;
	}

	/* (non-Javadoc)
	 * @see fr.n7.stl.block.ast.scope.Declaration#getName()
	 */
	@Override
	public String getName() {
		return this.name;
	}

	/* (non-Javadoc)
	 * @see fr.n7.stl.block.ast.scope.Declaration#getType()
	 */
	@Override
	public Type getType() {
		return this;
	}

}
