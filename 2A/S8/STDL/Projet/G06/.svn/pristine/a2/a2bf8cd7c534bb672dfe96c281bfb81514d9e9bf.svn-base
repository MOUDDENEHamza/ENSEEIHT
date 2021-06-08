package fr.n7.stl.block.ast.element;

import fr.n7.stl.block.ast.Block;
import fr.n7.stl.block.ast.instruction.declaration.ParameterDeclaration;
import fr.n7.stl.block.ast.scope.Declaration;
import fr.n7.stl.block.ast.scope.HierarchicalScope;
import fr.n7.stl.block.ast.scope.SymbolTable;
import fr.n7.stl.block.ast.type.AtomicType;
import fr.n7.stl.tam.ast.Fragment;
import fr.n7.stl.tam.ast.Register;
import fr.n7.stl.tam.ast.TAMFactory;
import fr.n7.stl.util.Logger;

import java.util.List;

import java.util.Iterator;

public class MainDeclaration implements Element {

	protected List<ParameterDeclaration> parameters;

	protected Block block;

	/**
	 * Constructor for a Main.
	 */
	public MainDeclaration(List<ParameterDeclaration> _parameters, Block _block) {
		this.parameters = _parameters;
		this.block = _block;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		String _result = "public class Main {\npublic static void main(";
		Iterator<ParameterDeclaration> _iter = this.parameters.iterator();
		if (_iter.hasNext()) {
			_result += _iter.next();
			while (_iter.hasNext()) {
				_result += " ," + _iter.next();
			}
		}
		return _result + " )" + this.block + "}";
	}

	@Override
	public boolean collect(HierarchicalScope<Declaration> _scope) {
		SymbolTable.classDeclaration = null;
		boolean _result;
		for (ParameterDeclaration d : this.parameters) {
			_scope.register(d);
		}
		_result = this.block.collect(_scope);
		return _result;
	}

	@Override
	public boolean resolve(HierarchicalScope<Declaration> _scope) {
		boolean _result = this.block.resolve(_scope);
		return _result;
	}

	@Override
	public boolean checkType() {
		boolean _result = true;
		SymbolTable.classDeclaration = null;
        if (this.parameters != null) {
            for(ParameterDeclaration parameterDeclaration : this.parameters) {
                if (parameterDeclaration.getType().equalsTo(AtomicType.ErrorType)) {
                    Logger.error(parameterDeclaration + " is not compatible with parameters type.");
                    _result = false;
                }
            }
        }
		_result = _result && this.block.checkType();
        return _result;
	}

	@Override
	public int allocateMemory(Register _register, int _offset) {
		int _result = 0;
		this.block.allocateMemory(_register, _offset);
		return _result;
	}

	@Override
	public Fragment getCode(TAMFactory _factory) {
		Fragment _result = _factory.createFragment();
		boolean _added = false;

		for (ParameterDeclaration p : this.parameters) {
			_result.add(_factory.createPush(p.getType().length()));
			if (!_added) {
				_added = true;
				_result.addPrefix("BEGIN:MAIN");
			}
		}
		_result.append(this.block.getCode(_factory));
		_result.add(_factory.createHalt());
		_result.addSuffix("END:MAIN");
		return _result;
	}

}
