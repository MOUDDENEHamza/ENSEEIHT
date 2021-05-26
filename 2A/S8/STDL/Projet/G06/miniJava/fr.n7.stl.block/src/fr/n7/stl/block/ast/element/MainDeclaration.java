package fr.n7.stl.block.ast.element;

import fr.n7.stl.block.ast.Block;
import fr.n7.stl.block.ast.instruction.declaration.ParameterDeclaration;
import fr.n7.stl.block.ast.scope.Declaration;
import fr.n7.stl.block.ast.scope.HierarchicalScope;
import fr.n7.stl.tam.ast.Fragment;
import fr.n7.stl.tam.ast.Register;
import fr.n7.stl.tam.ast.TAMFactory;
import java.util.List;

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

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		String _result = "public class Main {\npublic static void main(";
		for (ParameterDeclaration _parameter : this.parameters) {
			_result += _parameter;
		}
		return _result + ") {\n" + block + "}\n}\n" ;
	}	

	@Override
	public boolean collect(HierarchicalScope<Declaration> _scope) {
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
